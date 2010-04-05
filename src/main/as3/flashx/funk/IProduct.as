package flashx.funk {
	public interface IProduct extends IImmutable, IFunkObject {
		function get productArity(): int

		function productElement(i: int): *

		function get productPrefix(): String

    function mkString(separator: String): String
	}
}