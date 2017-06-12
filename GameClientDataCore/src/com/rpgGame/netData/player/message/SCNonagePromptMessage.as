package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 防沉迷提示信息
	 */
	public class SCNonagePromptMessage extends Message {
	
		//提示类型(1.未满1小时,2.在线1小时)
		private var _type: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//提示类型(1.未满1小时,2.在线1小时)
			writeByte(_type);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//提示类型(1.未满1小时,2.在线1小时)
			_type = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103117;
		}
		
		/**
		 * get 提示类型(1.未满1小时,2.在线1小时)
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 提示类型(1.未满1小时,2.在线1小时)
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
	}
}