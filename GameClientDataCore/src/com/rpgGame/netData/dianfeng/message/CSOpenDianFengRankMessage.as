package com.rpgGame.netData.dianfeng.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 打开巅峰排名
	 */
	public class CSOpenDianFengRankMessage extends Message {
	
		//页数azz
		private var _page: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//页数
			writeInt(_page);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//页数
			_page = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 128110;
		}
		
		/**
		 * get 页数
		 * @return 
		 */
		public function get page(): int{
			return _page;
		}
		
		/**
		 * set 页数
		 */
		public function set page(value: int): void{
			this._page = value;
		}
		
	}
}