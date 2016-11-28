package com.rpgGame.netData.chat.message{
	import com.rpgGame.netData.chat.bean.ChatRecordInfo;
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送聊天记录
	 */
	public class ResChatRecordMessage extends Message {
	
		//发送者或接受者的id
		private var _playerId: long;
		
		//聊天记录列表
		private var _chatRecordList: Vector.<ChatRecordInfo> = new Vector.<ChatRecordInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//发送者或接受者的id
			writeLong(_playerId);
			//聊天记录列表
			writeShort(_chatRecordList.length);
			for (i = 0; i < _chatRecordList.length; i++) {
				writeBean(_chatRecordList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//发送者或接受者的id
			_playerId = readLong();
			//聊天记录列表
			var chatRecordList_length : int = readShort();
			for (i = 0; i < chatRecordList_length; i++) {
				_chatRecordList[i] = readBean(ChatRecordInfo) as ChatRecordInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 112102;
		}
		
		/**
		 * get 发送者或接受者的id
		 * @return 
		 */
		public function get playerId(): long{
			return _playerId;
		}
		
		/**
		 * set 发送者或接受者的id
		 */
		public function set playerId(value: long): void{
			this._playerId = value;
		}
		
		/**
		 * get 聊天记录列表
		 * @return 
		 */
		public function get chatRecordList(): Vector.<ChatRecordInfo>{
			return _chatRecordList;
		}
		
		/**
		 * set 聊天记录列表
		 */
		public function set chatRecordList(value: Vector.<ChatRecordInfo>): void{
			this._chatRecordList = value;
		}
		
	}
}