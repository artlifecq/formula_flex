package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 超级vip的信息
	 */
	public class SCSuperVipMessage extends Message {
	
		//showgirl 图片地址
		private var _img: String;
		
		//showgirl qq号码
		private var _qq: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//showgirl 图片地址
			writeString(_img);
			//showgirl qq号码
			writeString(_qq);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//showgirl 图片地址
			_img = readString();
			//showgirl qq号码
			_qq = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103133;
		}
		
		/**
		 * get showgirl 图片地址
		 * @return 
		 */
		public function get img(): String{
			return _img;
		}
		
		/**
		 * set showgirl 图片地址
		 */
		public function set img(value: String): void{
			this._img = value;
		}
		
		/**
		 * get showgirl qq号码
		 * @return 
		 */
		public function get qq(): String{
			return _qq;
		}
		
		/**
		 * set showgirl qq号码
		 */
		public function set qq(value: String): void{
			this._qq = value;
		}
		
	}
}