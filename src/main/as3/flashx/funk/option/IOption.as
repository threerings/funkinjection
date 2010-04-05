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