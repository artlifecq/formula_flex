package com.rpgGame.netData.marriage.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 求婚反馈
	 */
	public class SCProposalResultMessage extends Message {
	
		//被求婚玩家的名字
		private var _targetName: String;
		
		//0 拒绝  1 同意
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//被求婚玩家的名字
			writeString(_targetName);
			//0 拒绝  1 同意
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//被求婚玩家的名字
			_targetName = readString();
			//0 拒绝  1 同意
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150104;
		}
		
		/**
		 * get 被求婚玩家的名字
		 * @return 
		 */
		public function get targetName(): String{
			return _targetName;
		}
		
		/**
		 * set 被求婚玩家的名字
		 */
		public function set targetName(value: String): void{
			this._targetName = value;
		}
		
		/**
		 * get 0 拒绝  1 同意
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0 拒绝  1 同意
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
	}
}