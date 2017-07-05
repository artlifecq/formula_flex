package com.rpgGame.netData.marriage.message{
	import org.game.netCore.data.long;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 被求婚对象提示
	 */
	public class SCTargetProposalMessage extends Message {
	
		//求婚玩家Id
		private var _targetId: long;
		
		//求婚人的姓名
		private var _targetName: String;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//求婚玩家Id
			writeLong(_targetId);
			//求婚人的姓名
			writeString(_targetName);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//求婚玩家Id
			_targetId = readLong();
			//求婚人的姓名
			_targetName = readString();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150102;
		}
		
		/**
		 * get 求婚玩家Id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 求婚玩家Id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
		}
		
		/**
		 * get 求婚人的姓名
		 * @return 
		 */
		public function get targetName(): String{
			return _targetName;
		}
		
		/**
		 * set 求婚人的姓名
		 */
		public function set targetName(value: String): void{
			this._targetName = value;
		}
		
	}
}