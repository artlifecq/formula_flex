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
	 * 装备洗炼
	 */
	public class ReqEquipWashMessage extends Message {
	
		//操作Id
		private var _opaque: int;
		
		//洗炼装备Id
		private var _equipId: long;
		
		//洗炼装备来源,0:装备仓库,1:背包
		private var _type: int;
		
		//锁定索引,0:没有锁定,1:锁定第一个,2:锁定第二个
		private var _lockIndex: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作Id
			writeInt(_opaque);
			//洗炼装备Id
			writeLong(_equipId);
			//洗炼装备来源,0:装备仓库,1:背包
			writeByte(_type);
			//锁定索引,0:没有锁定,1:锁定第一个,2:锁定第二个
			writeByte(_lockIndex);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作Id
			_opaque = readInt();
			//洗炼装备Id
			_equipId = readLong();
			//洗炼装备来源,0:装备仓库,1:背包
			_type = readByte();
			//锁定索引,0:没有锁定,1:锁定第一个,2:锁定第二个
			_lockIndex = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107205;
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
		 * get 洗炼装备Id
		 * @return 
		 */
		public function get equipId(): long{
			return _equipId;
		}
		
		/**
		 * set 洗炼装备Id
		 */
		public function set equipId(value: long): void{
			this._equipId = value;
		}
		
		/**
		 * get 洗炼装备来源,0:装备仓库,1:背包
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 洗炼装备来源,0:装备仓库,1:背包
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 锁定索引,0:没有锁定,1:锁定第一个,2:锁定第二个
		 * @return 
		 */
		public function get lockIndex(): int{
			return _lockIndex;
		}
		
		/**
		 * set 锁定索引,0:没有锁定,1:锁定第一个,2:锁定第二个
		 */
		public function set lockIndex(value: int): void{
			this._lockIndex = value;
		}
		
	}
}