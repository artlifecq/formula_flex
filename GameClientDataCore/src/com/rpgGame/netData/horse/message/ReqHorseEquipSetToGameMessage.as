package com.rpgGame.netData.horse.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 穿戴装备
	 */
	public class ReqHorseEquipSetToGameMessage extends Message {
	
		//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		private var _pos: int;
		
		//要穿戴的装备唯一ID
		private var _itemmodelid: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
			writeByte(_pos);
			//要穿戴的装备唯一ID
			writeLong(_itemmodelid);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
			_pos = readByte();
			//要穿戴的装备唯一ID
			_itemmodelid = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144204;
		}
		
		/**
		 * get 位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		 * @return 
		 */
		public function get pos(): int{
			return _pos;
		}
		
		/**
		 * set 位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		 */
		public function set pos(value: int): void{
			this._pos = value;
		}
		
		/**
		 * get 要穿戴的装备唯一ID
		 * @return 
		 */
		public function get itemmodelid(): long{
			return _itemmodelid;
		}
		
		/**
		 * set 要穿戴的装备唯一ID
		 */
		public function set itemmodelid(value: long): void{
			this._itemmodelid = value;
		}
		
	}
}