package com.rpgGame.netData.chat.message{
	import com.rpgGame.netData.chat.bean.ExtraReqInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 聊天消息
	 */
	public class ReqChatMessage extends Message {
	
		//聊天类型
		private var _type: int;
		
		//聊天内容
		private var _chatText: String;
		
		//发送聊天的其余数据
		private var _extraReqInfo: ExtraReqInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//聊天类型
			writeByte(_type);
			//聊天内容
			writeString(_chatText);
			//发送聊天的其余数据
			writeBean(_extraReqInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//聊天类型
			_type = readByte();
			//聊天内容
			_chatText = readString();
			//发送聊天的其余数据
			_extraReqInfo = readBean(ExtraReqInfo) as ExtraReqInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 112201;
		}
		
		/**
		 * get 聊天类型
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 聊天类型
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 聊天内容
		 * @return 
		 */
		public function get chatText(): String{
			return _chatText;
		}
		
		/**
		 * set 聊天内容
		 */
		public function set chatText(value: String): void{
			this._chatText = value;
		}
		
		/**
		 * get 发送聊天的其余数据
		 * @return 
		 */
		public function get extraReqInfo(): ExtraReqInfo{
			return _extraReqInfo;
		}
		
		/**
		 * set 发送聊天的其余数据
		 */
		public function set extraReqInfo(value: ExtraReqInfo): void{
			this._extraReqInfo = value;
		}
		
	}
}