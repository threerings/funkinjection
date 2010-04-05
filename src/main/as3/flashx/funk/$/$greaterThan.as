package flashx.funk.$ {
  import flashx.funk.util.eq

  public function $greaterThan(value: *): Function {
    return function(x: *): Boolean {
      return x > value
    }
  }
}