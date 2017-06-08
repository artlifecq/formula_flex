package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求设置自动通过玩家申请模式
	 */
	public class ReqGuildSetAutoAcceptMessage extends Message {
	
		//是否自动通过,1:是,0:否
		private var _type: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//是否自动通过,1:是,0:否
			writeByte(_type);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//是否自动通过,1:是,0:否
			_type = readByte();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111206;
		}
		
		/**
		 * get 是否自动通过,1:是,0:否
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 是否自动通过,1:是,0:否
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 本次操作标识
		 * @return 
		 */
		public function get opaque(): int{
			return _opaque;
		}
		
		/**
		 * set 本次操作标识
		 */
		public function set opaque(value: int): void{
			this._opaque = value;
		}
		
	}
}