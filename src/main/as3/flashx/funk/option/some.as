package flashx.funk.option {
  public function some(value: *): IOption {
    return new SomeImpl(value)
  }
}