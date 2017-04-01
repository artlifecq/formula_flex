package com.rpgGame.netData.fight.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 战斗失败广播
	 */
	public class ResFightFailedBroadcastMessage extends Message {
	
		//攻击类型
		private var _fightType: int;
		
		//失败类型
		private var _failType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//攻击类型
			writeInt(_fightType);
			//失败类型
			writeByte(_failType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//攻击类型
			_fightType = readInt();
			//失败类型
			_failType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 102105;
		}
		
		/**
		 * get 攻击类型
		 * @return 
		 */
		public function get fightType(): int{
			return _fightType;
		}
		
		/**
		 * set 攻击类型
		 */
		public function set fightType(value: int): void{
			this._fightType = value;
		}
		
		/**
		 * get 失败类型
		 * @return 
		 */
		public function get failType(): int{
			return _failType;
		}
		
		/**
		 * set 失败类型
		 */
		public function set failType(value: int): void{
			this._failType = value;
		}
		
	}
}