package com.rpgGame.netData.equip.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 装备继承
	 */
	public class ReqEquipInheritMessage extends Message {
	
		//操作Id
		private var _opaque: int;
		
		//源装备Id
		private var _fromEquipId: long;
		
		//目标装备Id
		private var _toEquipId: long;
		
		//目标装备来源,0:装备仓库,1:背包
		private var _toType: int;
		
		//继承索引,第一位为继承强化,第二位为继承琢磨,第三位为继承洗炼
		private var _index: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作Id
			writeInt(_opaque);
			//源装备Id
			writeLong(_fromEquipId);
			//目标装备Id
			writeLong(_toEquipId);
			//目标装备来源,0:装备仓库,1:背包
			writeByte(_toType);
			//继承索引,第一位为继承强化,第二位为继承琢磨,第三位为继承洗炼
			writeByte(_index);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作Id
			_opaque = readInt();
			//源装备Id
			_fromEquipId = readLong();
			//目标装备Id
			_toEquipId = readLong();
			//目标装备来源,0:装备仓库,1:背包
			_toType = readByte();
			//继承索引,第一位为继承强化,第二位为继承琢磨,第三位为继承洗炼
			_index = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107206;
		}
		
		/**
		 * get 操作Id
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 操作Id
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
		/**
		 * get 源装备Id
		 * @return 
		 */
		public function get fromEquipId(): long{
			return _fromEquipId;
		}
		
		/**
		 * set 源装备Id
		 */
		public function set fromEquipId(value: long): void{
			this._fromEquipId = value;
		}
		
		/**
		 * get 目标装备Id
		 * @return 
		 */
		public function get toEquipId(): long{
			return _toEquipId;
		}
		
		/**
		 * set 目标装备Id
		 */
		public function set toEquipId(value: long): void{
			this._toEquipId = value;
		}
		
		/**
		 * get 目标装备来源,0:装备仓库,1:背包
		 * @return 
		 */
		public function get toType(): int{
			return _toType;
		}
		
		/**
		 * set 目标装备来源,0:装备仓库,1:背包
		 */
		public function set toType(value: int): void{
			this._toType = value;
		}
		
		/**
		 * get 继承索引,第一位为继承强化,第二位为继承琢磨,第三位为继承洗炼
		 * @return 
		 */
		public function get index(): int{
			return _index;
		}
		
		/**
		 * set 继承索引,第一位为继承强化,第二位为继承琢磨,第三位为继承洗炼
		 */
		public function set index(value: int): void{
			this._index = value;
		}
		
	}
}