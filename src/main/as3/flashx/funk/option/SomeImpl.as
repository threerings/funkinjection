package flashx.funk.option {
  import flashx.funk.IFunkObject
  import flashx.funk.Product;
  import flashx.funk.error.IndexOutOfBoundsError;
  import flashx.funk.util.eq
  import flashx.funk.util.verifiedType;

  internal final class SomeImpl extends Product implements IOption {
    private var _value: *

    public function SomeImpl(value: *) {
      _value = value
    }

    public function get get(): * {
      return _value
    }

    public function getOrElse(f: Function): * {
      return _value
    }

    public function get isDefined(): Boolean {
      return true
    }

    public function get isEmpty(): Boolean {
      return false
    }

    override public function equals(that: IFunkObject): Boolean {
      if(that is IOption) {
        const thatOption: IOption = IOption(that)

        if(thatOption.isDefined) {
          return eq(get, thatOption.get)
        }
      }

      return false
    }

    override public function get productArity(): int {
      return 1;
    }

    override public function productElement(i: int): * {
      if(i == 0)
        return get
      throw new IndexOutOfBoundsError()
    }

    override public function get productPrefix(): String {
      return "Some";
    }

    public function filter(f: Function): IOption {
      return f(get) === true ? this : none;
    }

    public function foreach(f: Function): void {
      f(get)
    }

    public function flatMap(f: Function): IOption {
      return verifiedType(f(get), IOption)
    }

    public function map(f: Function): IOption {
      return some(f(get))
    }

    public function orElse(f: Function): IOption {
      return this
    }
  }
}