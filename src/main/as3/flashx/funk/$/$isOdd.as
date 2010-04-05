package flashx.funk.$ {
  import flashx.funk.util.ne

  public const $isOdd: Function = function(x: Number): Boolean {
    const asInt: int = int(x)

    if(0 != (x - asInt)) {
      return false
    }

    return (asInt & 1) != 0
  }
}