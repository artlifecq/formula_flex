package com.rpgGame.netData.chat.bean{
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 超链接信息
	 */
	public class HyperInfo extends Bean {
	
		//超链接类型
		private var _hyperType: int;
		
		//序号
		private var _index: int;
		
		//前端用的类容
		private var _clientUseText: String;
		
		//附加参数
		private var _params: String;
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//超链接类型
			writeByte(_hyperType);
			//序号
			writeInt(_index);
			//前端用的类容
			writeString(_clientUseText);
			//附加参数
			writeString(_params);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//超链接类型
			_hyperType = readByte();
			//序号
			_index = readInt();
			//前端用的类容
			_clientUseText = readString();
			//附加参数
			_params = readString();
			return true;
		}
		
		/**
		 * get 超链接类型
		 * @return 
		 */
		public function get hyperType(): int{
			return _hyperType;
		}
		
		/**
		 * set 超链接类型
		 */
		public function set hyperType(value: int): void{
			this._hyperType = value;
		}
		
		/**
		 * get 序号
		 * @return 
		 */
		public function get index(): int{
			return _index;
		}
		
		/**
		 * set 序号
		 */
		public function set index(value: int): void{
			this._index = value;
		}
		
		/**
		 * get 前端用的类容
		 * @return 
		 */
		public function get clientUseText(): String{
			return _clientUseText;
		}
		
		/**
		 * set 前端用的类容
		 */
		public function set clientUseText(value: String): void{
			this._clientUseText = value;
		}
		
		/**
		 * get 附加参数
		 * @return 
		 */
		public function get params(): String{
			return _params;
		}
		
		/**
		 * set 附加参数
		 */
		public function set params(value: String): void{
			this._params = value;
		}
		
	}
}