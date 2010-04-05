package flashx.funk {
  public function lazy(f: Function, thisArg: * = null, argArray: Array = null): ILazy {
    return new LazyImpl(f, thisArg, argArray)
  }
}