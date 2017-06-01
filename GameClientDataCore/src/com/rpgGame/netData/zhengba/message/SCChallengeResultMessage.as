package com.rpgGame.netData.zhengba.message{
	import com.rpgGame.netData.zhengba.bean.AwardItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 争霸结果
	 */
	public class SCChallengeResultMessage extends Message {
	
		//0 失败  1 成功
		private var _result: int;
		
		//回合次数
		private var _roundNumber: int;
		
		//当前排名
		private var _rank: int;
		
		//奖励列表
		private var _awardItemInfos: Vector.<AwardItemInfo> = new Vector.<AwardItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//0 失败  1 成功
			writeByte(_result);
			//回合次数
			writeInt(_roundNumber);
			//当前排名
			writeInt(_rank);
			//奖励列表
			writeShort(_awardItemInfos.length);
			for (i = 0; i < _awardItemInfos.length; i++) {
				writeBean(_awardItemInfos[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//0 失败  1 成功
			_result = readByte();
			//回合次数
			_roundNumber = readInt();
			//当前排名
			_rank = readInt();
			//奖励列表
			var awardItemInfos_length : int = readShort();
			for (i = 0; i < awardItemInfos_length; i++) {
				_awardItemInfos[i] = readBean(AwardItemInfo) as AwardItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 127104;
		}
		
		/**
		 * get 0 失败  1 成功
		 * @return 
		 */
		public function get result(): int{
			return _result;
		}
		
		/**
		 * set 0 失败  1 成功
		 */
		public function set result(value: int): void{
			this._result = value;
		}
		
		/**
		 * get 回合次数
		 * @return 
		 */
		public function get roundNumber(): int{
			return _roundNumber;
		}
		
		/**
		 * set 回合次数
		 */
		public function set roundNumber(value: int): void{
			this._roundNumber = value;
		}
		
		/**
		 * get 当前排名
		 * @return 
		 */
		public function get rank(): int{
			return _rank;
		}
		
		/**
		 * set 当前排名
		 */
		public function set rank(value: int): void{
			this._rank = value;
		}
		
		/**
		 * get 奖励列表
		 * @return 
		 */
		public function get awardItemInfos(): Vector.<AwardItemInfo>{
			return _awardItemInfos;
		}
		
		/**
		 * set 奖励列表
		 */
		public function set awardItemInfos(value: Vector.<AwardItemInfo>): void{
			this._awardItemInfos = value;
		}
		
	}
}