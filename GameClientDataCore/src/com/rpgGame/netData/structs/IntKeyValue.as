package com.rpgGame.netData.structs{
	import org.game.netCore.net.Bean;

	/**
	 * @author Commuication Auto Maker
	 *
	 * @version 1.0.0
	 *
	 * @since 2011-5-8
	 *
	 * 键值对
	 */
	public class IntKeyValue extends Bean {

		private var _key: int;

		private var _value: int;

		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			writeInt(this._key);
			writeInt(this._value);
			return true;
		}

		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			this._key = readInt();
			this._value = readInt();
			return true;
		}

		/**
		 * get key
		 * @return
		 */
		public function get key(): int{
			return _key;
		}

		/**
		 * set key
		 */
		public function set key(value: int): void{
			this._key = value;
		}

		/**
		 * get value
		 * @return
		 */
		public function get value(): int{
			return _value;
		}

		/**
		 * set value
		 */
		public function set value(value: int): void{
			this._value = value;
		}
	}
}
