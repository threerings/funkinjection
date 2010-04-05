package flashx.funk {
  /**
   * f(g(x))
   * @param f
   * @param g
   */
  public function compose(f: Function, g: Function): Function {
    return function(... rest): * {
      return f(g.apply(null, rest))
    }
  }
}