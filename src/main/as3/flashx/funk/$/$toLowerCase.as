package flashx.funk.$ {
  public const $toLowerCase: Function = function(x: *): String {
    return x is String ? String(x).toLowerCase() : ("" + x).toLowerCase()
  }
}