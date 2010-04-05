package flashx.funk.$ {
  import flashx.funk.util.eq

  public function $lessThan(value: *): Function {
    return function(x: *): Boolean {
      return x < value
    }
  }
}