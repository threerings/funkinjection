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

package flashx.funk {
	import flash.utils.setTimeout

	/**
	 * @author Joa Ebert
	 */
	internal final class ForkImpl implements IComposeable {
		private var _f: Function
		private var _thisArg: *
		private var _argArray: Array
		private var _force: Boolean

		public function ForkImpl(f: Function, thisArg: * = null, argArray: Array = null, force: Boolean = false) {
			_f = f
			_thisArg = thisArg
			_argArray = argArray
			_force = force
		}

		/**
		 * Generates and returns the string representation
		 * of the current object.
		 *
		 * @return The string representation of the current object.
		 */
		public function toString():String
		{
			return '[ForkImpl]';
		}

		public function andThen(f: Function, thisArg: * = null, argArray: Array = null): Function {
			if(_force) {
				return function(): void {
					setTimeout(
							function(): void {
								_f.apply(_thisArg, _argArray)
								f.apply(thisArg, argArray)
							}, 0)
				}
			} else {
				return function(): void {
					_f.apply(_thisArg, _argArray)
					f.apply(thisArg, argArray)
				}
			}
		}

		public function andContinue(f: Function): Function {
			if(_force) {
				return function(): void {
					setTimeout(
							function(): void {
								f.apply(_thisArg, [_f.apply(_thisArg, _argArray)])
							}, 0)
				}
			} else {
				return function(): void {
					f.apply(_thisArg, [_f.apply(_thisArg, _argArray)])
				}
			}
		}

		public function equals(that:IFunkObject):Boolean {
			return this == that
		}
	}
}