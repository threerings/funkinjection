package flashx.funk.util {
  import flash.utils.getQualifiedClassName;

  import flashx.funk.option.IOption;

  public function verifiedType(value: *, type: Class): * {
    if(value is type) {
      return value
    }
    
    throw new TypeError("Expected: "+getQualifiedClassName(type)
        +", Actual: "+getQualifiedClassName(value))
  }
}