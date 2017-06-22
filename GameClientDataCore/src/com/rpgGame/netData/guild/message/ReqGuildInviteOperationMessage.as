package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 对邀请操作
	 */
	public class ReqGuildInviteOperationMessage extends Message {
	
		//1:同意,0:拒绝
		private var _flag: int;
		
		//邀请id
		private var _inviteId: int;
		
		//本次操作标识
		private var _opaque: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1:同意,0:拒绝
			writeByte(_flag);
			//邀请id
			writeInt(_inviteId);
			//本次操作标识
			writeInt(_opaque);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1:同意,0:拒绝
			_flag = readByte();
			//邀请id
			_inviteId = readInt();
			//本次操作标识
			_opaque = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111209;
		}
		
		/**
		 * get 1:同意,0:拒绝
		 * @return 
		 */
		public function get flag(): int{
			return _flag;
		}
		
		/**
		 * set 1:同意,0:拒绝
		 */
		public function set flag(value: int): void{
			this._flag = value;
		}
		
		/**
		 * get 邀请id
		 * @return 
		 */
		public function get inviteId(): int{
			return _inviteId;
		}
		
		/**
		 * set 邀请id
		 */
		public function set inviteId(value: int): void{
			this._inviteId = value;
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