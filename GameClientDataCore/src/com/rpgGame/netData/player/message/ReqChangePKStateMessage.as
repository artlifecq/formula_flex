package com.rpgGame.netData.player.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 请求更改pk状态
	 */
	public class ReqChangePKStateMessage extends Message {
	
		//pk状态
		private var _pkState: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//pk状态
			writeByte(_pkState);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//pk状态
			_pkState = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 103203;
		}
		
		/**
		 * get pk状态
		 * @return 
		 */
		public function get pkState(): int{
			return _pkState;
		}
		
		/**
		 * set pk状态
		 */
		public function set pkState(value: int): void{
			this._pkState = value;
		}
		
	}
}