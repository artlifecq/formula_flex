package com.rpgGame.netData.buff.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 移除Buff
	 */
	public class ResRemoveBuffMessage extends Message {
	
		//角色Id
		private var _personId: int;
		
		//战斗状态
		private var _fightState: int;
		
		//buff Id
		private var _buffId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//角色Id
			writeShort(_personId);
			//战斗状态
			writeInt(_fightState);
			//buff Id
			writeLong(_buffId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//角色Id
			_personId = readShort();
			//战斗状态
			_fightState = readInt();
			//buff Id
			_buffId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 121103;
		}
		
		/**
		 * get 角色Id
		 * @return 
		 */
		public function get personId(): int{
			return _personId;
		}
		
		/**
		 * set 角色Id
		 */
		public function set personId(value: int): void{
			this._personId = value;
		}
		
		/**
		 * get 战斗状态
		 * @return 
		 */
		public function get fightState(): int{
			return _fightState;
		}
		
		/**
		 * set 战斗状态
		 */
		public function set fightState(value: int): void{
			this._fightState = value;
		}
		
		/**
		 * get buff Id
		 * @return 
		 */
		public function get buffId(): long{
			return _buffId;
		}
		
		/**
		 * set buff Id
		 */
		public function set buffId(value: long): void{
			this._buffId = value;
		}
		
	}
}