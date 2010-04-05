package flashx.funk.util {
  import flashx.funk.error.AbstractMethodError

  public function isAbstract(): * {
    throw new AbstractMethodError()
  }
}