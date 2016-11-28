package com.rpgGame.netData.top.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 前端请求搜索玩家排行
	 */
	public class ReqTopSearchToGameMessage extends Message {
	
		//排行榜类型
		private var _toptype: int;
		
		//玩家名字
		private var _name: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//排行榜类型
			writeInt(_toptype);
			//玩家名字
			writeString(_name);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//排行榜类型
			_toptype = readInt();
			//玩家名字
			_name = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 141203;
		}
		
		/**
		 * get 排行榜类型
		 * @return 
		 */
		public function get toptype(): int{
			return _toptype;
		}
		
		/**
		 * set 排行榜类型
		 */
		public function set toptype(value: int): void{
			this._toptype = value;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
	}
}