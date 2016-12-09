package com.rpgGame.netData.zone.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 返回绝校场结算信息
	 */
	public class ResJiaoChangResultInfoMessage extends Message {
	
		//本次总分
		private var _totalScore: int;
		
		//最大连击
		private var _mostHit: int;
		
		//玩家历史总得分(竞争排名)
		private var _totalHistoryScore: int;
		
		//奖励物品列表
		private var _itemInfoList: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//本次总分
			writeInt(_totalScore);
			//最大连击
			writeInt(_mostHit);
			//玩家历史总得分(竞争排名)
			writeInt(_totalHistoryScore);
			//奖励物品列表
			writeShort(_itemInfoList.length);
			for (i = 0; i < _itemInfoList.length; i++) {
				writeBean(_itemInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//本次总分
			_totalScore = readInt();
			//最大连击
			_mostHit = readInt();
			//玩家历史总得分(竞争排名)
			_totalHistoryScore = readInt();
			//奖励物品列表
			var itemInfoList_length : int = readShort();
			for (i = 0; i < itemInfoList_length; i++) {
				_itemInfoList[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 155112;
		}
		
		/**
		 * get 本次总分
		 * @return 
		 */
		public function get totalScore(): int{
			return _totalScore;
		}
		
		/**
		 * set 本次总分
		 */
		public function set totalScore(value: int): void{
			this._totalScore = value;
		}
		
		/**
		 * get 最大连击
		 * @return 
		 */
		public function get mostHit(): int{
			return _mostHit;
		}
		
		/**
		 * set 最大连击
		 */
		public function set mostHit(value: int): void{
			this._mostHit = value;
		}
		
		/**
		 * get 玩家历史总得分(竞争排名)
		 * @return 
		 */
		public function get totalHistoryScore(): int{
			return _totalHistoryScore;
		}
		
		/**
		 * set 玩家历史总得分(竞争排名)
		 */
		public function set totalHistoryScore(value: int): void{
			this._totalHistoryScore = value;
		}
		
		/**
		 * get 奖励物品列表
		 * @return 
		 */
		public function get itemInfoList(): Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>{
			return _itemInfoList;
		}
		
		/**
		 * set 奖励物品列表
		 */
		public function set itemInfoList(value: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>): void{
			this._itemInfoList = value;
		}
		
	}
}