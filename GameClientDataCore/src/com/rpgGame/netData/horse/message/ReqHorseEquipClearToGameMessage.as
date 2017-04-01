package com.rpgGame.netData.horse.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 卸下坐骑装备
	 */
	public class ReqHorseEquipClearToGameMessage extends Message {
	
		//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
		private var _pos: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
			writeByte(_pos);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//位置(21到24  21鞍具，22缰绳，23蹬具，24蹄铁)
			_pos = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 144205;
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
		
	}
}