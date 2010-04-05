package flashx.funk.option {
  import flashx.funk.IFunkObject
	import flashx.funk.IProduct;

	public interface IOption extends IProduct {
    function get get(): *

    /**
     *
     * @param f => A
     * @return A
     */
    function getOrElse(f: Function): *
    
    function get isDefined(): Boolean

    function get isEmpty(): Boolean

    /**
     *
     * @param f A => Boolean
     * @return Option.<A>
     */
    function filter(f: Function): IOption

    /**
     *
     * @param f A => void
     */
    function foreach(f: Function): void

    /**
     *
     * @param f A => Option.<B>
     * @return Option.<B>
     */
    function flatMap(f: Function): IOption
    
    /**
     *
     * @param f A => B
     * @return Option.<B>
     */
    function map(f: Function): IOption

    /**
     *
     * @param f => Option.<A>
     * @return Option.<A>
     */
    function orElse(f: Function): IOption
  }
}