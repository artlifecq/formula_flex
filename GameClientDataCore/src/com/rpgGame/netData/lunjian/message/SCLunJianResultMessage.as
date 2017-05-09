package com.rpgGame.netData.lunjian.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 论剑挑战结果
	 */
	public class SCLunJianResultMessage extends Message {
	
		//论剑ID
		private var _ljId: int;
		
		//挑战是否成功(0否1是)
		private var _success: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//论剑ID
			writeShort(_ljId);
			//挑战是否成功(0否1是)
			writeByte(_success);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//论剑ID
			_ljId = readShort();
			//挑战是否成功(0否1是)
			_success = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 227503;
		}
		
		/**
		 * get 论剑ID
		 * @return 
		 */
		public function get ljId(): int{
			return _ljId;
		}
		
		/**
		 * set 论剑ID
		 */
		public function set ljId(value: int): void{
			this._ljId = value;
		}
		
		/**
		 * get 挑战是否成功(0否1是)
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 挑战是否成功(0否1是)
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
	}
}