package flashx.funk.collections {
  public interface ICollection extends IIterable {
    /**
     * The length of the collection.
     */
    [Deprecated(replacement="size", since="0.1")]
    function get length(): int

    /**
     * The total number of elements in the collection.
     */
    function get size(): int

    /**
     * Whether or not the size of the collection is known.
     */
    function get hasDefinedSize(): Boolean

    /**
     * The elements of the collection stored in an array.
     */
    function get toArray(): Array

    /**
     * The elements of the collection stored in a vector.
     */
    function get toVector(): Vector.<*>

    /**
     * The elements of the collection stored in a fixed vector.
     */
    function get toFixedVector(): Vector.<*>
  }
}