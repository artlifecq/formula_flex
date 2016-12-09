package com.rpgGame.netData.stall.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 摊位搜索
	 */
	public class ReqStallSearchMessage extends Message {
	
		//道具名称
		private var _goodsName: String;
		
		//是否是打开面板首次默认搜索 1是0不是
		private var _isDefaultSearch: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//道具名称
			writeString(_goodsName);
			//是否是打开面板首次默认搜索 1是0不是
			writeByte(_isDefaultSearch);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//道具名称
			_goodsName = readString();
			//是否是打开面板首次默认搜索 1是0不是
			_isDefaultSearch = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 142208;
		}
		
		/**
		 * get 道具名称
		 * @return 
		 */
		public function get goodsName(): String{
			return _goodsName;
		}
		
		/**
		 * set 道具名称
		 */
		public function set goodsName(value: String): void{
			this._goodsName = value;
		}
		
		/**
		 * get 是否是打开面板首次默认搜索 1是0不是
		 * @return 
		 */
		public function get isDefaultSearch(): int{
			return _isDefaultSearch;
		}
		
		/**
		 * set 是否是打开面板首次默认搜索 1是0不是
		 */
		public function set isDefaultSearch(value: int): void{
			this._isDefaultSearch = value;
		}
		
	}
}