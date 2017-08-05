package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复邀请操作
	 */
	public class ReplyGuildInviteOperationMessage extends Message {
	
		//操作邀请Id
		private var _operationInviteId: int;
		
		//是否拒绝,1:是,0:同意
		private var _isReject: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//操作邀请Id
			writeInt(_operationInviteId);
			//是否拒绝,1:是,0:同意
			writeByte(_isReject);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//操作邀请Id
			_operationInviteId = readInt();
			//是否拒绝,1:是,0:同意
			_isReject = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111111;
		}
		
		/**
		 * get 操作邀请Id
		 * @return 
		 */
		public function get operationInviteId(): int{
			return _operationInviteId;
		}
		
		/**
		 * set 操作邀请Id
		 */
		public function set operationInviteId(value: int): void{
			this._operationInviteId = value;
		}
		
		/**
		 * get 是否拒绝,1:是,0:同意
		 * @return 
		 */
		public function get isReject(): int{
			return _isReject;
		}
		
		/**
		 * set 是否拒绝,1:是,0:同意
		 */
		public function set isReject(value: int): void{
			this._isReject = value;
		}
		
	}
}