package com.rpgGame.netData.task.message{
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 宝箱任务相关奖励
	 */
	public class ResTreasureBoxRewardListMessage extends Message {
	
		//这次的军功宝箱奖励
		private var _curRewardList1: Vector.<int> = new Vector.<int>();
		//下次的军功宝箱奖励
		private var _nextRewardList1: Vector.<int> = new Vector.<int>();
		//这次的道具宝箱奖励
		private var _curRewardList2: Vector.<int> = new Vector.<int>();
		//下次的道具宝箱奖励
		private var _nextRewardList2: Vector.<int> = new Vector.<int>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//这次的军功宝箱奖励
			writeShort(_curRewardList1.length);
			for (i = 0; i < _curRewardList1.length; i++) {
				writeInt(_curRewardList1[i]);
			}
			//下次的军功宝箱奖励
			writeShort(_nextRewardList1.length);
			for (i = 0; i < _nextRewardList1.length; i++) {
				writeInt(_nextRewardList1[i]);
			}
			//这次的道具宝箱奖励
			writeShort(_curRewardList2.length);
			for (i = 0; i < _curRewardList2.length; i++) {
				writeInt(_curRewardList2[i]);
			}
			//下次的道具宝箱奖励
			writeShort(_nextRewardList2.length);
			for (i = 0; i < _nextRewardList2.length; i++) {
				writeInt(_nextRewardList2[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//这次的军功宝箱奖励
			var curRewardList1_length : int = readShort();
			for (i = 0; i < curRewardList1_length; i++) {
				_curRewardList1[i] = readInt();
			}
			//下次的军功宝箱奖励
			var nextRewardList1_length : int = readShort();
			for (i = 0; i < nextRewardList1_length; i++) {
				_nextRewardList1[i] = readInt();
			}
			//这次的道具宝箱奖励
			var curRewardList2_length : int = readShort();
			for (i = 0; i < curRewardList2_length; i++) {
				_curRewardList2[i] = readInt();
			}
			//下次的道具宝箱奖励
			var nextRewardList2_length : int = readShort();
			for (i = 0; i < nextRewardList2_length; i++) {
				_nextRewardList2[i] = readInt();
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 124106;
		}
		
		/**
		 * get 这次的军功宝箱奖励
		 * @return 
		 */
		public function get curRewardList1(): Vector.<int>{
			return _curRewardList1;
		}
		
		/**
		 * set 这次的军功宝箱奖励
		 */
		public function set curRewardList1(value: Vector.<int>): void{
			this._curRewardList1 = value;
		}
		
		/**
		 * get 下次的军功宝箱奖励
		 * @return 
		 */
		public function get nextRewardList1(): Vector.<int>{
			return _nextRewardList1;
		}
		
		/**
		 * set 下次的军功宝箱奖励
		 */
		public function set nextRewardList1(value: Vector.<int>): void{
			this._nextRewardList1 = value;
		}
		
		/**
		 * get 这次的道具宝箱奖励
		 * @return 
		 */
		public function get curRewardList2(): Vector.<int>{
			return _curRewardList2;
		}
		
		/**
		 * set 这次的道具宝箱奖励
		 */
		public function set curRewardList2(value: Vector.<int>): void{
			this._curRewardList2 = value;
		}
		
		/**
		 * get 下次的道具宝箱奖励
		 * @return 
		 */
		public function get nextRewardList2(): Vector.<int>{
			return _nextRewardList2;
		}
		
		/**
		 * set 下次的道具宝箱奖励
		 */
		public function set nextRewardList2(value: Vector.<int>): void{
			this._nextRewardList2 = value;
		}
		
	}
}