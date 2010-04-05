package flashx.funk.$ {
  import flashx.funk.util.ne

  public function $incrementBy(value: Number): Function {
    return function(x: Number): Number {
      return x + value
    }
  }
}