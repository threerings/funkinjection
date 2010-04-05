package flashx.funk.tuple {
  import flashx.funk.Product;
  import flashx.funk.collections.IList;
  import flashx.funk.error.IndexOutOfBoundsError;

  internal final class Tuple1Impl extends Product implements ITuple1 {
    private var __1: *

    public function Tuple1Impl(_1: *) {
      __1 = _1
    }

    public function get _1():* { return __1 }

    override public function get productArity(): int {
      return 1
    }

    override public function productElement(i: int): * {
      switch(i) {
        case 0: return __1
        default: throw new IndexOutOfBoundsError()
      }
    }
  }
}