package com.rpgGame.netData.player.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 个人属性项
	 */
	public class PlayerAttributeItem extends Bean {
	
		//属性类型(1等级,2真气,3金钱,4元宝,5当前生命,更多请查看AttriTypeConst)
		private var _type: int;
		
		//属性值
		private var _value: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//属性类型(1等级,2真气,3金钱,4元宝,5当前生命,更多请查看AttriTypeConst)
			writeByte(_type);
			//属性值
			writeInt(_value);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//属性类型(1等级,2真气,3金钱,4元宝,5当前生命,更多请查看AttriTypeConst)
			_type = readByte();
			//属性值
			_value = readInt();
			return true;
		}
		
		/**
		 * get 属性类型(1等级,2真气,3金钱,4元宝,5当前生命,更多请查看AttriTypeConst)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 属性类型(1等级,2真气,3金钱,4元宝,5当前生命,更多请查看AttriTypeConst)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 属性值
		 * @return 
		 */
		public function get value(): int{
			return _value;
		}
		
		/**
		 * set 属性值
		 */
		public function set value(value: int): void{
			this._value = value;
		}
		
	}
}