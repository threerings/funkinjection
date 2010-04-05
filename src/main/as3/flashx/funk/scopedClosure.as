package flashx.funk {
  import flash.utils.describeType

  public function scopedClosure(f: Function, thisArg: * = null, ... rest): Function {
    return function(... appliedRest): * {
      return appliedRest.length == 0 ? f.apply(thisArg, rest) : f.apply(thisArg, appliedRest)
    }
  }
}