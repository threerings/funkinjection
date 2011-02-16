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
import flash.events.Event;
import flash.display.Sprite

import flashx.funk.test.assert;
import flashx.funk.test.assertEquals;
import flashx.funk.test.assertNotEquals;
import flashx.funk.ioc.error.BindingError

[SWF(width='50', height='50')]
public final class TestIOC extends Sprite{
    public function TestIOC()
    {
        trace("Starting tests");
        run("basic", basicTest);
        run("transitive", transitiveTest);
        run("alias", aliasTest);
        run("order", orderTest);

        trace("Tests finished!\n");
    }

    protected function run (name :String, test :Function) :void
    {
        SingletonInstance.numInstances = 0;
        try {
            test();
            trace("Passed " + name);
        } catch (e :Error) {
            trace("Failed " + name);
            trace(e.getStackTrace());
        }
    }

    public function basicTest () :void
    {
      const module: IModule = new MockModule
      const mockObject: MockObject = module.getInstance(MockObject)

      assertEquals("Test", mockObject.byInstance)
      assert(mockObject.byProvider is ProvidedObject)
      assert(mockObject.byObject is AnotherObject)
      assertEquals(1, SingletonInstance.numInstances)

      const mockObject2: MockObject = module.getInstance(MockObject)

      assertEquals("Test", mockObject2.byInstance)
      assert(mockObject2.byProvider is ProvidedObject)
      assert(mockObject2.byObject is AnotherObject)
      assertEquals(1, SingletonInstance.numInstances)

      assertNotEquals(mockObject.byProvider, mockObject2.byProvider)
      assertNotEquals(mockObject.byObject, mockObject2.byObject)
    }

    public function transitiveTest () :void
    {
        var module :IModule = new SingletonModule();
        assert(module.getInstance(SingletonInstance) is SubSingletonInstance);
        assertEquals(module.getInstance(SingletonInstance),
            module.getInstance(SubSingletonInstance));
        assertEquals(1, SingletonInstance.numInstances);

        assertEquals(0, new IntHolder().val);
        assert(module.getInstance(IntHolder) is SubIntHolder);
        assertEquals(7, module.getInstance(IntHolder).val);
        assertEquals(7, module.getInstance(SubIntHolder).val);
    }

    public function aliasTest () :void
    {
        var module :IModule = new AliasModule();
        assertNotEquals(module.getInstance(IntHolder), module.getInstance(IntHolder));
        assert(module.getInstance(IntHolder).val < module.getInstance(IntHolder).val);
        assert(module.getInstance(IntHolder) is SubSubIntHolder);
        assert(module.getInstance(SubIntHolder) is SubSubIntHolder);
        assert(module.getInstance(SubSubIntHolder) is SubSubIntHolder);
    }

    public function orderTest () :void
    {
        var module :IModule = new OrderingModule();
        var order :OrderObject = module.getInstance(OrderObject);
        assert(order.beforeConstructor.val < order.afterConstructor.val);
        assert(order.afterConstructor.val < order.inConstructor.val);
    }
}
}


