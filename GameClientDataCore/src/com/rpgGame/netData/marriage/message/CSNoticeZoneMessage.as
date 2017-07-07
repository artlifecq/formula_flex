package com.rpgGame.netData.marriage.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 提示方的操作
	 */
	public class CSNoticeZoneMessage extends Message {
	
		//挑战的副本id
		private var _zoneId: long;
		
		//操作结果  1 进入  0 不进入
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//挑战的副本id
			writeLong(_zoneId);
			//操作结果  1 进入  0 不进入
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//挑战的副本id
			_zoneId = readLong();
			//操作结果  1 进入  0 不进入
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150117;
		}
		
		/**
		 * get 挑战的副本id
		 * @return 
		 */
		public function get zoneId(): long{
			return _zoneId;
		}
		
		/**
		 * set 挑战的副本id
		 */
		public function set zoneId(value: long): void{
			this._zoneId = value;
		}
		
		/**
		 * get 操作结果  1 进入  0 不进入
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 操作结果  1 进入  0 不进入
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}