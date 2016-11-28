package com.rpgGame.netData.chat.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 修改聊天消息状态为已读
	 */
	public class ReqExchangeReadTypeChatMessage extends Message {
	
		//对象id
		private var _targetId: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//对象id
			writeLong(_targetId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//对象id
			_targetId = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 112204;
		}
		
		/**
		 * get 对象id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 对象id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
	}
}