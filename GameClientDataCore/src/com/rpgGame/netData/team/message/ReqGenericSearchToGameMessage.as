package com.rpgGame.netData.team.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 全服搜索玩家
	 */
	public class ReqGenericSearchToGameMessage extends Message {
	
		//搜索内容,空就展示本地图的玩家
		private var _searchcontent: String;
		
		//搜索类型 1 好友 2组队
		private var _searType: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//搜索内容,空就展示本地图的玩家
			writeString(_searchcontent);
			//搜索类型 1 好友 2组队
			writeByte(_searType);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//搜索内容,空就展示本地图的玩家
			_searchcontent = readString();
			//搜索类型 1 好友 2组队
			_searType = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 109214;
		}
		
		/**
		 * get 搜索内容,空就展示本地图的玩家
		 * @return 
		 */
		public function get searchcontent(): String{
			return _searchcontent;
		}
		
		/**
		 * set 搜索内容,空就展示本地图的玩家
		 */
		public function set searchcontent(value: String): void{
			this._searchcontent = value;
		}
		
		/**
		 * get 搜索类型 1 好友 2组队
		 * @return 
		 */
		public function get searType(): int{
			return _searType;
		}
		
		/**
		 * set 搜索类型 1 好友 2组队
		 */
		public function set searType(value: int): void{
			this._searType = value;
		}
		
	}
}