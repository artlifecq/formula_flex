package com.rpgGame.netData.equip.message{
	import flash.utils.ByteArray;
	
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 装备琢磨
	 */
	public class ReqEquipPolishMessage extends Message {
	
		//操作Id
		private var _opaque: int;
		
		//琢磨装备Id
		private var _equipId: long;
		
		//琢磨装备来源,0:装备仓库,1:背包
		private var _type: int;
		
		//被使用的装备
		private var _useItemIds: Vector.<long> = new Vector.<long>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//操作Id
			writeInt(_opaque);
			//琢磨装备Id
			writeLong(_equipId);
			//琢磨装备来源,0:装备仓库,1:背包
			writeByte(_type);
			//被使用的装备
			writeShort(_useItemIds.length);
			for (i = 0; i < _useItemIds.length; i++) {
				writeLong(_useItemIds[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//操作Id
			_opaque = readInt();
			//琢磨装备Id
			_equipId = readLong();
			//琢磨装备来源,0:装备仓库,1:背包
			_type = readByte();
			//被使用的装备
			var useItemIds_length : int = readShort();
			for (i = 0; i < useItemIds_length; i++) {
				_useItemIds[i] = readLong();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107204;
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
		 * get 琢磨装备Id
		 * @return 
		 */
		public function get equipId(): long{
			return _equipId;
		}
		
		/**
		 * set 琢磨装备Id
		 */
		public function set equipId(value: long): void{
			this._equipId = value;
		}
		
		/**
		 * get 琢磨装备来源,0:装备仓库,1:背包
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 琢磨装备来源,0:装备仓库,1:背包
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 被使用的装备
		 * @return 
		 */
		public function get useItemIds(): Vector.<long>{
			return _useItemIds;
		}
		
		/**
		 * set 被使用的装备
		 */
		public function set useItemIds(value: Vector.<long>): void{
			this._useItemIds = value;
		}
		
	}
}