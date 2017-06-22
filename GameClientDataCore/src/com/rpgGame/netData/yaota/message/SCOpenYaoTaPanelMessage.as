package com.rpgGame.netData.yaota.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 打开面板
	 */
	public class SCOpenYaoTaPanelMessage extends Message {
	
		//是否开启  0 未开启  1 开启
		private var _type: int;
		
		//声望
		private var _reputation: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否开启  0 未开启  1 开启
			writeInt(_type);
			//声望
			writeInt(_reputation);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否开启  0 未开启  1 开启
			_type = readInt();
			//声望
			_reputation = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 129112;
		}
		
		/**
		 * get 是否开启  0 未开启  1 开启
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 是否开启  0 未开启  1 开启
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 声望
		 * @return 
		 */
		public function get reputation(): int{
			return _reputation;
		}
		
		/**
		 * set 声望
		 */
		public function set reputation(value: int): void{
			this._reputation = value;
		}
		
	}
}