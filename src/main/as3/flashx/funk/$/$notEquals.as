package flashx.funk.$ {
  import flashx.funk.util.ne

  public function $notEquals(value: *): Function {
    return function(x: *): Boolean {
      return ne(x, value)
    }
  }
}