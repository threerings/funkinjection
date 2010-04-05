package flashx.funk.$ {
  import flashx.funk.util.eq

  public function $equals(value: *): Function {
    return function(x: *): Boolean {
      return eq(x, value)
    }
  }
}