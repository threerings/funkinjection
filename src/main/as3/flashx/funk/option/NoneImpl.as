package flashx.funk.option {
  import flashx.funk.IFunkObject;
  import flashx.funk.Product;
  import flashx.funk.error.IndexOutOfBoundsError;
  import flashx.funk.error.NoSuchElementError;
  import flashx.funk.util.verifiedType;

  internal final class NoneImpl extends Product implements IOption {
    public function get get(): * {
      throw new NoSuchElementError()
    }

    public function getOrElse(f: Function): * {
      return f()
    }

    public function get isDefined(): Boolean {
      return false
    }

    public function get isEmpty(): Boolean {
      return true
    }

    override public function equals(that: IFunkObject): Boolean {
      if (that is IOption) {
        return !IOption(that).isDefined
      }

      return false
    }

    override public function get productArity(): int {
      return 0
    }

    override public function productElement(i: int): * {
      throw new IndexOutOfBoundsError()
    }

    override public function get productPrefix(): String {
      return "None"
    }

    public function filter(f: Function): IOption {
      return this
    }

    public function foreach(f: Function): void {
    }

    public function flatMap(f: Function): IOption {
      return this
    }
    
    public function map(f: Function): IOption {
      return this
    }

    public function orElse(f: Function): IOption {
      return verifiedType(f(), IOption)
    }
  }
}