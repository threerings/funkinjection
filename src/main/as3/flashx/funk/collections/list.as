package flashx.funk.collections {
  import flashx.funk.collections.immutable.List;

  public function list(... rest): IList {
    var result: IList = nil
    var n: int = rest.length

    while(--n > -1) {
      result = result.prepend(rest[n])
    }

    return result
  }
}