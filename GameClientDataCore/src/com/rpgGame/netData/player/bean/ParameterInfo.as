package com.rpgGame.netData.player.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	import org.game.netCore.data.long;
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 动态参数 
	 */
	public class ParameterInfo extends Bean {
	
		//参数1
		private var _id: long;
		
		//参数2
		private var _mod: int;
		
		//参数3
		private var _name: String;
		
		//坐标点
		private var _x: int;
		
		//坐标点
		private var _y: int;
		
//		//用于发送道具的具体信息，包括强化等级  等
//		private var _itemInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//参数1
			writeLong(_id);
			//参数2
			writeInt(_mod);
			//参数3
			writeString(_name);
			//坐标点
			writeInt(_x);
			//坐标点
			writeInt(_y);
//			//用于发送道具的具体信息，包括强化等级  等
//			writeBean(_itemInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//参数1
			_id = readLong();
			//参数2
			_mod = readInt();
			//参数3
			_name = readString();
			//坐标点
			_x = readInt();
			//坐标点
			_y = readInt();
//			//用于发送道具的具体信息，包括强化等级  等
//			_itemInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get 参数1
		 * @return 
		 */
		public function get id(): long{
			return _id;
		}
		
		/**
		 * set 参数1
		 */
		public function set id(value: long): void{
			this._id = value;
		}
		
		/**
		 * get 参数2
		 * @return 
		 */
		public function get mod(): int{
			return _mod;
		}
		
		/**
		 * set 参数2
		 */
		public function set mod(value: int): void{
			this._mod = value;
		}
		
		/**
		 * get 参数3
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 参数3
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
		/**
		 * get 坐标点
		 * @return 
		 */
		public function get x(): int{
			return _x;
		}
		
		/**
		 * set 坐标点
		 */
		public function set x(value: int): void{
			this._x = value;
		}
		
		/**
		 * get 坐标点
		 * @return 
		 */
		public function get y(): int{
			return _y;
		}
		
		/**
		 * set 坐标点
		 */
		public function set y(value: int): void{
			this._y = value;
		}
		
//		/**
//		 * get 用于发送道具的具体信息，包括强化等级  等
//		 * @return 
//		 */
//		public function get itemInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
//			return _itemInfo;
//		}
//		
//		/**
//		 * set 用于发送道具的具体信息，包括强化等级  等
//		 */
//		public function set itemInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
//			this._itemInfo = value;
//		}
		
	}
}