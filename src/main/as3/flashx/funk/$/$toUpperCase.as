package flashx.funk.$ {
  public const $toUpperCase: Function = function(x: *): String {
    return x is String ? String(x).toUpperCase() : ("" + x).toUpperCase()
  }
}