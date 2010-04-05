package flashx.funk.$ {
  import flashx.funk.util.eq

  public function $greaterOrEqual(value: *): Function {
    return function(x: *): Boolean {
      return x >= value
    }
  }
}