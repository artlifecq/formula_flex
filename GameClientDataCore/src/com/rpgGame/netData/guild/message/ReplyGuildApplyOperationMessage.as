package com.rpgGame.netData.guild.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 回复玩家对申请者操作
	 */
	public class ReplyGuildApplyOperationMessage extends Message {
	
		//1:同意,0:拒绝
		private var _flag: int;
		
		//申请id,-1:标识全部操作
		private var _applyId: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//1:同意,0:拒绝
			writeByte(_flag);
			//申请id,-1:标识全部操作
			writeInt(_applyId);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//1:同意,0:拒绝
			_flag = readByte();
			//申请id,-1:标识全部操作
			_applyId = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 111115;
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
		 * get 申请id,-1:标识全部操作
		 * @return 
		 */
		public function get applyId(): int{
			return _applyId;
		}
		
		/**
		 * set 申请id,-1:标识全部操作
		 */
		public function set applyId(value: int): void{
			this._applyId = value;
		}
		
	}
}