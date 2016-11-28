package com.rpgGame.netData.guild.message{
	import com.rpgGame.netData.guild.bean.EventInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 获取帮会事件列表返回
	 */
	public class ResGuildGetEventListMessage extends Message {
	
		//帮会事件列表
		private var _eventList: Vector.<EventInfo> = new Vector.<EventInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//帮会事件列表
			writeShort(_eventList.length);
			for (i = 0; i < _eventList.length; i++) {
				writeBean(_eventList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//帮会事件列表
			var eventList_length : int = readShort();
			for (i = 0; i < eventList_length; i++) {
				_eventList[i] = readBean(EventInfo) as EventInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111105;
		}
		
		/**
		 * get 帮会事件列表
		 * @return 
		 */
		public function get eventList(): Vector.<EventInfo>{
			return _eventList;
		}
		
		/**
		 * set 帮会事件列表
		 */
		public function set eventList(value: Vector.<EventInfo>): void{
			this._eventList = value;
		}
		
	}
}