/*
 * This file is part of funk-as3.
 *
 * funk-as3 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * funk-as3 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Apparat. If not, see <http://www.gnu.org/licenses/>.
 *
 * Copyright (C) 2010 Joa Ebert
 * http://www.joa-ebert.com/
 */

package flashx.funk.collections {
  import flashx.funk.IProduct;
  import flashx.funk.option.IOption;
  import flashx.funk.tuple.ITuple2;

  public interface IList extends IProduct, ICollection {
    function contains(value: *): Boolean

    /**
     *
     * @param f A => Boolean
     * @return int
     */
    function count(f: Function): int

    function get notEmpty(): Boolean

    function drop(n: int): IList

    function dropRight(n: int): IList

    /**
     *
     * @param f A => Boolean
     * @return IList.<A>
     */
    function dropWhile(f: Function): IList

    /**
     *
     * @param f A => Boolean
     * @return <code>true</code> if any element fulfills the predicate <code>f</code>; <code>false</code> otherwise.
     */
    function exists(f: Function): Boolean

    /**
     *
     * @param f A => Boolean
     * @return A list of all elements that fulfill the predicate <code>f</code>
     */
    function filter(f: Function): IList

    function filterNot(f: Function): IList

    /**
     *
     * @param f A => Boolean
     * @return IOption.<A>
     */
    function find(f: Function): IOption

    /**
     *
     * @param f A => Boolean
     * @return int
     */
    function findIndexOf(f: Function): int

    /**
     *
     * @param f A => IList.<A>
     * @return IList.<A>
     */
    function flatMap(f: Function): IList

    function get flatten(): IList

    /**
     *
     * @param x B
     * @param f (A, A) => B
     * @return B
     */
    function foldLeft(x: *, f: Function): *

    /**
     *
     * @param x B
     * @param f (A, A) => B
     * @return B
     */
    function foldRight(x: *, f: Function): *

    /**
     *
     * @param f A => Boolean
     * @return <code>true</code> if all element fulfill the predicate <code>f</code>; <code>false</code> otherwise.
     */
    function forall(f: Function): Boolean

    /**
     *
     * @param f A => void
     */
    function foreach(f: Function): void

    function get(index: int): *
    
    function get head(): *

    function get headOption(): IOption

    function indexOf(value: *): int
    
    function get indices(): IList

    function get init(): IList

    function get isEmpty(): Boolean

    function get last(): *

    /**
     *
     * @param f A => B
     */
    function map(f: Function): IList

    function partition(f: Function): ITuple2

    function prepend(value: *): IList

    function prependAll(value: IList): IList

    /**
     *
     * @param f (A, A) => B
     * @return B
     */
    function reduceLeft(f: Function): *

    /**
     *
     * @param f (A, A) => B
     * @return B
     */
    function reduceRight(f: Function): *

    function get reverse(): IList

    function get tail(): IList

    function get tailOption(): IOption

    function take(n: int): IList

    function takeRight(n: int): IList

    /**
     *
     * @param f A => Boolean
     * @return list.<A>
     */
    function takeWhile(f: Function): IList

    function zip(that: IList): IList

    function get zipWithIndex(): IList
  }
}