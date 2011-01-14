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

public class AbstractModule implements IModule {
    private static const _scopes: Array = [];
    internal const _map: Dictionary = new Dictionary;

    module_internal static function get currentScope(): IModule
    {
        return _scopes[_scopes.length - 1];
    }

    protected function bind (klass: Class): Binding
    {
        return new Binding(klass, this);
    }

    internal function getInstantiator (klass :Class) :Instantiator
    {
        var inst :Instantiator = _map[klass];
        if (inst == null) {
            return new Instantiator(this, klass);
        }
        return inst;
    }
    
    internal function alias (fromKlass :Class, toKlass :Class) :void
    {
        var fromInst :Instantiator = _map[fromKlass];
        var toInst :Instantiator = _map[toKlass];
        if (toInst == null) {
            toInst = new Instantiator(this, toKlass);
            _map[toKlass] = toInst;
        }
        if (fromInst != null) {
            if (fromInst._singleton) {
                toInst.asSingleton();
            }
            if (fromInst._provider != null) {
                toInst.setProvider(fromInst._provider);
            }
            if (fromInst._evaluated) {
                toInst.setInstance(fromInst._value);
            }
        }
        toInst._for.push(fromKlass);
        _map[fromKlass] = toInst;
    }

    public function getInstance(klass: Class): *
    {
        const instantiator: Instantiator = _map[klass];

        try {
            _scopes.push(this);
            return (null == instantiator) ? new klass : instantiator.getInstance();
        } finally {
            _scopes.pop();
        }
    }

    public function binds(klass: Class): Boolean {
        return _map[klass] != null;
    }
}
}
