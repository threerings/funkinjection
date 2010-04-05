package flashx.funk {
  import flashx.funk.error.IndexOutOfBoundsError
  import flashx.funk.test.assertThrows

  import flexunit.framework.TestCase

  public class TestLazy extends TestCase {
    public function testLazy(): void {
      var n: int = 0
      const value: ILazy = lazy(function(): Boolean {
        n++
        return true
      })

      assertEquals(0, n)
      assertTrue(value.get)
      assertEquals(1, n)
      assertTrue(value.get)
      assertEquals(1, n)
    }

    public function testProductArity(): void {
      assertEquals(1, lazy(identity).productArity)
    }

		public function testProductElement(): void {
      const value: Object = {}
      const l: ILazy = lazy(function(): Object {
        return value
      })

      assertStrictlyEquals(value, l.productElement(0))
      assertThrows(closure(l.productElement, 1), IndexOutOfBoundsError)
      assertThrows(closure(l.productElement, -1), IndexOutOfBoundsError)
    }

		public function testProductPrefix(): void {
      assertEquals("", lazy(identity).productPrefix)
    }

    public function testMkString(): void {
      const value: Object = {}
      assertEquals(value.toString(), lazy(function(): Object { return value }).get.toString())
    }

    public function testEquals(): void {
      const value: Object = {}
      assertTrue(lazy(function(): Object { return value }).equals(lazy(function(): Object { return value })))
    }
  }
}