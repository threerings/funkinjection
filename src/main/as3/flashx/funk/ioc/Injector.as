/*
 * This file is part of funk-as3.
 *
 * funk-as3 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * funk-as3 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Apparat. If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright (C) 2010 Joa Ebert
 * http://www.joa-ebert.com/
 */

package flashx.funk.ioc {
  import flash.utils.Dictionary

  import flashx.funk.ioc.error.BindingError
  import flashx.funk.util.isAbstract

  public final class Injector {
    private static const _map: Dictionary = new Dictionary
    private static var _scopes: Array = []
    private static var _modules: Array = []
    private static var _currentScope: IModule

    public static function initialize(module: IModule): IModule {
      module.initialize()
      _modules.splice(0, 0, module)
      return module
    }
    
    module_internal static function pushScope(module: IModule): void {
      _currentScope = module
      _scopes.splice(0, 0, module)
    }

    module_internal static function popScope(): void {
      _scopes.shift()
      _currentScope = _scopes.length == 0 ? IModule(_scopes[0]) : null
    }

    module_internal static function get currentScope(): IModule {
      return _currentScope
    }

    module_internal static function scopeOf(klass: Class): IModule {
      var result: IModule = null
      var module: IModule = null
      var modules: Array = _modules.concat()

      while(modules.length > 0) {
        module = IModule(modules[0])

        if(module.binds(klass)) {
          if(null != result) {
            throw new BindingError("More than one module binds "+klass+".")
          }
          result = IModule(modules[0])
        }

        modules.shift()
      }

      if(null == result) {
        throw new BindingError("No binding for "+klass+" could be fond.")
      }
      
      return result
    }

    module_internal static function moduleOf(klass: Class): IModule {
      const possibleResult: IModule = _map[klass]

      if(null != possibleResult) {
        return possibleResult
      }

      var module: IModule = null
      var modules: Array = _modules.concat()

      while(modules.length > 0) {
        module = IModule(modules[0])

        if(module is klass) {
          _map[klass] = module
          return module
        }

        modules.shift()
      }

      throw new BindingError("No module for "+klass+" could be found.")
    }

    [Abstract] public function Injector() { isAbstract() }
  }
}
