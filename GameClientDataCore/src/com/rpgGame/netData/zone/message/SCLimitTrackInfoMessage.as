package com.rpgGame.netData.zone.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 极限活动追踪信息
	 */
	public class SCLimitTrackInfoMessage extends Message {
	
		//BOSS模板ID
		private var _monsterModelId: int;
		
		//BOSS状态(0未击杀，1击杀)
		private var _bossState: int;
		
		//剩余时间(毫秒)
		private var _remainTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//BOSS模板ID
			writeInt(_monsterModelId);
			//BOSS状态(0未击杀，1击杀)
			writeByte(_bossState);
			//剩余时间(毫秒)
			writeInt(_remainTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//BOSS模板ID
			_monsterModelId = readInt();
			//BOSS状态(0未击杀，1击杀)
			_bossState = readByte();
			//剩余时间(毫秒)
			_remainTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155148;
		}
		
		/**
		 * get BOSS模板ID
		 * @return 
		 */
		public function get monsterModelId(): int{
			return _monsterModelId;
		}
		
		/**
		 * set BOSS模板ID
		 */
		public function set monsterModelId(value: int): void{
			this._monsterModelId = value;
		}
		
		/**
		 * get BOSS状态(0未击杀，1击杀)
		 * @return 
		 */
		public function get bossState(): int{
			return _bossState;
		}
		
		/**
		 * set BOSS状态(0未击杀，1击杀)
		 */
		public function set bossState(value: int): void{
			this._bossState = value;
		}
		
		/**
		 * get 剩余时间(毫秒)
		 * @return 
		 */
		public function get remainTime(): int{
			return _remainTime;
		}
		
		/**
		 * set 剩余时间(毫秒)
		 */
		public function set remainTime(value: int): void{
			this._remainTime = value;
		}
		
	}
}