package flashx.funk.util {
  import flashx.funk.error.IndexOutOfBoundsError;

  public function requireRange(i: int, end: int, start: int = 0): void {
    if(i < start || i >= end) {
      throw new IndexOutOfBoundsError()
    }
  }
}