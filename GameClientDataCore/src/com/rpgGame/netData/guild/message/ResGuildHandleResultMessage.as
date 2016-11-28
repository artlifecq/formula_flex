package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 帮会操作结果反馈
	 */
	public class ResGuildHandleResultMessage extends Message {
	
		//操作类型(0创建 1帮会没得了)
		private var _handleType: int;
		
		//其他参数
		private var _other: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作类型(0创建 1帮会没得了)
			writeByte(_handleType);
			//其他参数
			writeString(_other);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作类型(0创建 1帮会没得了)
			_handleType = readByte();
			//其他参数
			_other = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111108;
		}
		
		/**
		 * get 操作类型(0创建 1帮会没得了)
		 * @return 
		 */
		public function get handleType(): int{
			return _handleType;
		}
		
		/**
		 * set 操作类型(0创建 1帮会没得了)
		 */
		public function set handleType(value: int): void{
			this._handleType = value;
		}
		
		/**
		 * get 其他参数
		 * @return 
		 */
		public function get other(): String{
			return _other;
		}
		
		/**
		 * set 其他参数
		 */
		public function set other(value: String): void{
			this._other = value;
		}
		
	}
}