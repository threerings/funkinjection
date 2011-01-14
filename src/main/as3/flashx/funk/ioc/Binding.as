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
import flashx.funk.error.IllegalByDefinitionError;

internal final class Binding implements IScope {
    private var _mod :AbstractModule;
    private var _for :Class;

    public function Binding (klass :Class, mod :AbstractModule)
    {
        _for = klass;
        _mod = mod;
    }

    public function to (klass: Class) :IScope
    {
        _mod.alias(_for, klass);
        return this;
    }

    public function toInstance(instance: *) :IScope
    {
        instantiator.setInstance(instance);
        return this;
    }

    public function toProvider(provider: Class) :IScope
    {
        instantiator.setProvider(provider);
        return this;
    }

    public function asSingleton(): void
    {
        instantiator.asSingleton();
    }

    private function get instantiator () :Instantiator
    {
        return _mod.getInstantiator(_for);
    }
}
}
