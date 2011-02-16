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

public class Scopes
{
    // return the current scope
    internal static function get currentScope () :IModule
    {
        if (_scopes.length == 0) {
            return null;
        }
        return _scopes[_scopes.length - 1];
    }

    // extend the scope with the given module and call the given function with the given klass
    internal static function pushScopeAndCreate (mod :IModule, klass :Class, create :Function) :*
    {
        try {
            _scopes.push(mod);
            return create(klass);

        } finally {
            _scopes.pop();
        }
    }

    private static const _scopes: Array = [];
}
}
