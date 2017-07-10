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
	 * 被求婚者的操作
	 */
	public class CSTargetProposalResultMessage extends Message {
	
		//求婚玩家的Id
		private var _targetId: long;
		
		//0 拒绝  1 同意
		private var _result: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//求婚玩家的Id
			writeLong(_targetId);
			//0 拒绝  1 同意
			writeInt(_result);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//求婚玩家的Id
			_targetId = readLong();
			//0 拒绝  1 同意
			_result = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 150103;
		}
		
		/**
		 * get 求婚玩家的Id
		 * @return 
		 */
		public function get targetId(): long{
			return _targetId;
		}
		
		/**
		 * set 求婚玩家的Id
		 */
		public function set targetId(value: long): void{
			this._targetId = value;
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