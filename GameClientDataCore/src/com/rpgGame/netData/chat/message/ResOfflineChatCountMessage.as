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
	 * 发送离线信息条数
	 */
	public class ResOfflineChatCountMessage extends Message {
	
		//来源者id
		private var _sourceId: long;
		
		//离线留言条数
		private var _count: int;
		
		//最后操作的时间(秒)
		private var _lasttime: long;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//来源者id
			writeLong(_sourceId);
			//离线留言条数
			writeInt(_count);
			//最后操作的时间(秒)
			writeLong(_lasttime);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//来源者id
			_sourceId = readLong();
			//离线留言条数
			_count = readInt();
			//最后操作的时间(秒)
			_lasttime = readLong();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 112103;
		}
		
		/**
		 * get 来源者id
		 * @return 
		 */
		public function get sourceId(): long{
			return _sourceId;
		}
		
		/**
		 * set 来源者id
		 */
		public function set sourceId(value: long): void{
			this._sourceId = value;
		}
		
		/**
		 * get 离线留言条数
		 * @return 
		 */
		public function get count(): int{
			return _count;
		}
		
		/**
		 * set 离线留言条数
		 */
		public function set count(value: int): void{
			this._count = value;
		}
		
		/**
		 * get 最后操作的时间(秒)
		 * @return 
		 */
		public function get lasttime(): long{
			return _lasttime;
		}
		
		/**
		 * set 最后操作的时间(秒)
		 */
		public function set lasttime(value: long): void{
			this._lasttime = value;
		}
		
	}
}