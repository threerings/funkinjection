package flashx.funk.$ {
  import flashx.funk.util.eq
  import flashx.funk.util.ne

  public class $op {
    public static const add: Function = function(a: *, b: *): * { return a + b }
    public static const subtract: Function = function(a: *, b: *): * { return a - b }
    public static const multiply: Function = function(a: *, b: *): * { return a * b }
    public static const divide: Function = function(a: *, b: *): * { return a / b }
    public static const modulo: Function = function(a: *, b: *): * { return a % b }
    public static const lessThan: Function = function(a: *, b: *): * { return a < b }
    public static const greaterThan: Function = function(a: *, b: *): * { return a > b }
    public static const greaterEqual: Function = function(a: *, b: *): * { return a >= b }
    public static const lessEqual: Function = function(a: *, b: *): * { return a <= b }
    public static const equal: Function = function(a: *, b: *): * { return eq(a, b) }
    public static const notEqual: Function = function(a: *, b: *): * { return ne(a, b)}
    public static const strictlyEqual: Function = function(a: *, b: *): * { return a == b }
    public static const strictlyNotEqual: Function = function(a: *, b: *): * { return a != b }
    public static const binaryAnd: Function = function(a: *, b: *): * { return a & b }
    public static const binaryOr: Function = function(a: *, b: *): * { return a | b }
    public static const binaryXor: Function = function(a: *, b: *): * { return a ^ b }
  }
}