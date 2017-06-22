package com.rpgGame.netData.daysdowngold.message{
	import com.rpgGame.netData.daysdowngold.bean.RankInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 发送排名消息
	 */
	public class SCRankInfoMessage extends Message {
	
		//礼金排名榜
		private var _RankInfoList: Vector.<RankInfo> = new Vector.<RankInfo>();
		//当前玩家获得的礼金
		private var _playerCashGiftNum: int;
		
		//当前玩家排名
		private var _playerRankLevel: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//礼金排名榜
			writeShort(_RankInfoList.length);
			for (i = 0; i < _RankInfoList.length; i++) {
				writeBean(_RankInfoList[i]);
			}
			//当前玩家获得的礼金
			writeInt(_playerCashGiftNum);
			//当前玩家排名
			writeInt(_playerRankLevel);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//礼金排名榜
			var RankInfoList_length : int = readShort();
			for (i = 0; i < RankInfoList_length; i++) {
				_RankInfoList[i] = readBean(RankInfo) as RankInfo;
			}
			//当前玩家获得的礼金
			_playerCashGiftNum = readInt();
			//当前玩家排名
			_playerRankLevel = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 130101;
		}
		
		/**
		 * get 礼金排名榜
		 * @return 
		 */
		public function get RankInfoList(): Vector.<RankInfo>{
			return _RankInfoList;
		}
		
		/**
		 * set 礼金排名榜
		 */
		public function set RankInfoList(value: Vector.<RankInfo>): void{
			this._RankInfoList = value;
		}
		
		/**
		 * get 当前玩家获得的礼金
		 * @return 
		 */
		public function get playerCashGiftNum(): int{
			return _playerCashGiftNum;
		}
		
		/**
		 * set 当前玩家获得的礼金
		 */
		public function set playerCashGiftNum(value: int): void{
			this._playerCashGiftNum = value;
		}
		
		/**
		 * get 当前玩家排名
		 * @return 
		 */
		public function get playerRankLevel(): int{
			return _playerRankLevel;
		}
		
		/**
		 * set 当前玩家排名
		 */
		public function set playerRankLevel(value: int): void{
			this._playerRankLevel = value;
		}
		
	}
}