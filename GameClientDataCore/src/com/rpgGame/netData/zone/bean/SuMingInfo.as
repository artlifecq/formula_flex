package com.rpgGame.netData.zone.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 宿命挑战信息
	 */
	public class SuMingInfo extends Bean {
	
		//怪物ID
		private var _avatorId: int;
		
		//是否已挑战(0否1是)
		private var _state: int;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物ID
			writeInt(_avatorId);
			//是否已挑战(0否1是)
			writeByte(_state);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物ID
			_avatorId = readInt();
			//是否已挑战(0否1是)
			_state = readByte();
			return true;
		}
		
		/**
		 * get 怪物ID
		 * @return 
		 */
		public function get avatorId(): int{
			return _avatorId;
		}
		
		/**
		 * set 怪物ID
		 */
		public function set avatorId(value: int): void{
			this._avatorId = value;
		}
		
		/**
		 * get 是否已挑战(0否1是)
		 * @return 
		 */
		public function get state(): int{
			return _state;
		}
		
		/**
		 * set 是否已挑战(0否1是)
		 */
		public function set state(value: int): void{
			this._state = value;
		}
		
	}
}