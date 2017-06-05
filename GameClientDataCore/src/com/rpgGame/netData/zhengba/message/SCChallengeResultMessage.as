package com.rpgGame.netData.zhengba.message{
	import com.rpgGame.netData.zhengba.bean.AwardItemInfo;
	import com.rpgGame.netData.zhengba.bean.ZhengBaBriefInfo;
	import org.game.netCore.data.long;
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
	
		//玩家血量
		private var _plaeyrHp_1: int;
		
		//玩家血量
		private var _playerHp_2: int;
		
		//胜利者id
		private var _victoryId: long;
		
		//回合次数
		private var _roundNumber: int;
		
		//当前排名
		private var _rank: int;
		
		//胜利者
		private var _victoryInfo: ZhengBaBriefInfo;
		
		//失败者
		private var _failureInfo: ZhengBaBriefInfo;
		
		//奖励列表
		private var _awardItemInfos: Vector.<AwardItemInfo> = new Vector.<AwardItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//玩家血量
			writeInt(_plaeyrHp_1);
			//玩家血量
			writeInt(_playerHp_2);
			//胜利者id
			writeLong(_victoryId);
			//回合次数
			writeInt(_roundNumber);
			//当前排名
			writeInt(_rank);
			//胜利者
			writeBean(_victoryInfo);
			//失败者
			writeBean(_failureInfo);
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
			//玩家血量
			_plaeyrHp_1 = readInt();
			//玩家血量
			_playerHp_2 = readInt();
			//胜利者id
			_victoryId = readLong();
			//回合次数
			_roundNumber = readInt();
			//当前排名
			_rank = readInt();
			//胜利者
			_victoryInfo = readBean(ZhengBaBriefInfo) as ZhengBaBriefInfo;
			//失败者
			_failureInfo = readBean(ZhengBaBriefInfo) as ZhengBaBriefInfo;
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
		 * get 玩家血量
		 * @return 
		 */
		public function get plaeyrHp_1(): int{
			return _plaeyrHp_1;
		}
		
		/**
		 * set 玩家血量
		 */
		public function set plaeyrHp_1(value: int): void{
			this._plaeyrHp_1 = value;
		}
		
		/**
		 * get 玩家血量
		 * @return 
		 */
		public function get playerHp_2(): int{
			return _playerHp_2;
		}
		
		/**
		 * set 玩家血量
		 */
		public function set playerHp_2(value: int): void{
			this._playerHp_2 = value;
		}
		
		/**
		 * get 胜利者id
		 * @return 
		 */
		public function get victoryId(): long{
			return _victoryId;
		}
		
		/**
		 * set 胜利者id
		 */
		public function set victoryId(value: long): void{
			this._victoryId = value;
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
		 * get 胜利者
		 * @return 
		 */
		public function get victoryInfo(): ZhengBaBriefInfo{
			return _victoryInfo;
		}
		
		/**
		 * set 胜利者
		 */
		public function set victoryInfo(value: ZhengBaBriefInfo): void{
			this._victoryInfo = value;
		}
		
		/**
		 * get 失败者
		 * @return 
		 */
		public function get failureInfo(): ZhengBaBriefInfo{
			return _failureInfo;
		}
		
		/**
		 * set 失败者
		 */
		public function set failureInfo(value: ZhengBaBriefInfo): void{
			this._failureInfo = value;
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