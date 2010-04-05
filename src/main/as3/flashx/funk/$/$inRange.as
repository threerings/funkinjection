package flashx.funk.$ {
  import flashx.funk.util.ne

  public function $inRange(minValue: Number, maxValue: Number): Function {
    return function(x: *): Boolean {
      return minValue <= x && x <= maxValue
    }
  }
}