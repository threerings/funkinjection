package flashx.funk.collections {
  public function toList(value: *): IList {
    var l: IList = nil
    var n: int

    if(value is IList) {
      return value
    } else if(value is Array) {
      var array: Array = value as Array
      n = array.length

      while(--n > -1) {
        l = l.prepend(array[n])
      }

      return l
    } else if(value is Vector) {
      var vector: Vector = value as Vector
      n = vector.length

      while(--n > -1) {
        l = l.prepend(vector[n])
      }

      return l
    } else if(value is String) {
      var string: String = String(value)
      n = string.length

      while(--n > -1) {
        l = l.prepend(string.substr(n, 1))
      }

      return l
    } else {
      return list(value)
    }
  }
}