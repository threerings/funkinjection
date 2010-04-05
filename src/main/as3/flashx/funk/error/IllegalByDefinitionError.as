package flashx.funk.error {
  public class IllegalByDefinitionError extends Error {
    public function IllegalByDefinitionError() {
      super("Code which is illegal by definition has been reached.")
    }
  }
}