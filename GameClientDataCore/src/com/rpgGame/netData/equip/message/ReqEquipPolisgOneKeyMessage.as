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
	 * 一键装备琢磨
	 */
	public class ReqEquipPolisgOneKeyMessage extends Message {
	
		//操作Id
		private var _opaque: int;
		
		//装备琢磨Id
		private var _equipId: long;
		
		//装备琢磨来源,0:装备仓库,1:背包
		private var _type: int;
		
		//装备阶数
		private var _order: int;
		
		//装备品质
		private var _quality: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作Id
			writeInt(_opaque);
			//装备琢磨Id
			writeLong(_equipId);
			//装备琢磨来源,0:装备仓库,1:背包
			writeByte(_type);
			//装备阶数
			writeByte(_order);
			//装备品质
			writeByte(_quality);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作Id
			_opaque = readInt();
			//装备琢磨Id
			_equipId = readLong();
			//装备琢磨来源,0:装备仓库,1:背包
			_type = readByte();
			//装备阶数
			_order = readByte();
			//装备品质
			_quality = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107209;
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
		 * get 装备琢磨Id
		 * @return 
		 */
		public function get equipId(): long{
			return _equipId;
		}
		
		/**
		 * set 装备琢磨Id
		 */
		public function set equipId(value: long): void{
			this._equipId = value;
		}
		
		/**
		 * get 装备琢磨来源,0:装备仓库,1:背包
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 装备琢磨来源,0:装备仓库,1:背包
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 装备阶数
		 * @return 
		 */
		public function get order(): int{
			return _order;
		}
		
		/**
		 * set 装备阶数
		 */
		public function set order(value: int): void{
			this._order = value;
		}
		
		/**
		 * get 装备品质
		 * @return 
		 */
		public function get quality(): int{
			return _quality;
		}
		
		/**
		 * set 装备品质
		 */
		public function set quality(value: int): void{
			this._quality = value;
		}
		
	}
}