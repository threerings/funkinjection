package flashx.funk {
  import flash.utils.describeType

  public function closure(f: Function, ... rest): Function {
    return function(... appliedRest): * {
      return appliedRest.length == 0 ? f.apply(null, rest) : f.apply(null, appliedRest)
    }
  }
}