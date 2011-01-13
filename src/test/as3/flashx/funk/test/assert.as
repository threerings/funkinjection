package flashx.funk.test {
    public function assert (condition :Boolean) :void {
        if (!condition) {
            throw Error("Assertion Failed!");
        }
    }
}
