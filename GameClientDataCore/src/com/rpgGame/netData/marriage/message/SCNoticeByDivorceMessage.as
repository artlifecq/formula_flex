package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 通知被离婚者
	 */
	public class SCNoticeByDivorceMessage extends Message {
	
		//离婚者的名字
		private var _name: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//离婚者的名字
			writeString(_name);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//离婚者的名字
			_name = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150121;
		}
		
		/**
		 * get 离婚者的名字
		 * @return 
		 */
		public function get name(): String{
			return _name;
		}
		
		/**
		 * set 离婚者的名字
		 */
		public function set name(value: String): void{
			this._name = value;
		}
		
	}
}