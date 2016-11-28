package com.rpgGame.netData.isle.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回比武岛面板消息
	 */
	public class ResIslePanlMessage extends Message {
	
		//是否在活动中 0否 1是
		private var _openType: int;
		
		//下次比武岛开启时间串
		private var _nextTime: int;
		
		//如果活动中 发送结束时间串
		private var _endTime: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否在活动中 0否 1是
			writeByte(_openType);
			//下次比武岛开启时间串
			writeInt(_nextTime);
			//如果活动中 发送结束时间串
			writeInt(_endTime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否在活动中 0否 1是
			_openType = readByte();
			//下次比武岛开启时间串
			_nextTime = readInt();
			//如果活动中 发送结束时间串
			_endTime = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 216101;
		}
		
		/**
		 * get 是否在活动中 0否 1是
		 * @return 
		 */
		public function get openType(): int{
			return _openType;
		}
		
		/**
		 * set 是否在活动中 0否 1是
		 */
		public function set openType(value: int): void{
			this._openType = value;
		}
		
		/**
		 * get 下次比武岛开启时间串
		 * @return 
		 */
		public function get nextTime(): int{
			return _nextTime;
		}
		
		/**
		 * set 下次比武岛开启时间串
		 */
		public function set nextTime(value: int): void{
			this._nextTime = value;
		}
		
		/**
		 * get 如果活动中 发送结束时间串
		 * @return 
		 */
		public function get endTime(): int{
			return _endTime;
		}
		
		/**
		 * set 如果活动中 发送结束时间串
		 */
		public function set endTime(value: int): void{
			this._endTime = value;
		}
		
	}
}