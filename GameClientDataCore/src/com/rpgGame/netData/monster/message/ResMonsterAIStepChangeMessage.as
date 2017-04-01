package com.rpgGame.netData.monster.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 怪物AI阶段变化（boss进入某个阶段）
	 */
	public class ResMonsterAIStepChangeMessage extends Message {
	
		//怪物id
		private var _monsterId: long;
		
		//进入阶段
		private var _enterstep: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//怪物id
			writeLong(_monsterId);
			//进入阶段
			writeByte(_enterstep);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//怪物id
			_monsterId = readLong();
			//进入阶段
			_enterstep = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 114116;
		}
		
		/**
		 * get 怪物id
		 * @return 
		 */
		public function get monsterId(): long{
			return _monsterId;
		}
		
		/**
		 * set 怪物id
		 */
		public function set monsterId(value: long): void{
			this._monsterId = value;
		}
		
		/**
		 * get 进入阶段
		 * @return 
		 */
		public function get enterstep(): int{
			return _enterstep;
		}
		
		/**
		 * set 进入阶段
		 */
		public function set enterstep(value: int): void{
			this._enterstep = value;
		}
		
	}
}