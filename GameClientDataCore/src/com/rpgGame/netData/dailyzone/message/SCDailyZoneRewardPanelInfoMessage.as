package com.rpgGame.netData.dailyzone.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 副本结算面板
	 */
	public class SCDailyZoneRewardPanelInfoMessage extends Message {
	
		//奖励物品列表
		private var _itemInfoList: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		//经验
		private var _exp: int;
		
		//银两
		private var _money: int;
		
		//0失败,1成功
		private var _success: int;
		
		//获得星数
		private var _star: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			var i: int = 0;
			//奖励物品列表
			writeShort(_itemInfoList.length);
			for (i = 0; i < _itemInfoList.length; i++) {
				writeBean(_itemInfoList[i]);
			}
			//经验
			writeInt(_exp);
			//银两
			writeInt(_money);
			//0失败,1成功
			writeByte(_success);
			//获得星数
			writeByte(_star);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			var i: int = 0;
			//奖励物品列表
			var itemInfoList_length : int = readShort();
			for (i = 0; i < itemInfoList_length; i++) {
				_itemInfoList[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			//经验
			_exp = readInt();
			//银两
			_money = readInt();
			//0失败,1成功
			_success = readByte();
			//获得星数
			_star = readByte();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 400104;
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
		
		/**
		 * get 经验
		 * @return 
		 */
		public function get exp(): int{
			return _exp;
		}
		
		/**
		 * set 经验
		 */
		public function set exp(value: int): void{
			this._exp = value;
		}
		
		/**
		 * get 银两
		 * @return 
		 */
		public function get money(): int{
			return _money;
		}
		
		/**
		 * set 银两
		 */
		public function set money(value: int): void{
			this._money = value;
		}
		
		/**
		 * get 0失败,1成功
		 * @return 
		 */
		public function get success(): int{
			return _success;
		}
		
		/**
		 * set 0失败,1成功
		 */
		public function set success(value: int): void{
			this._success = value;
		}
		
		/**
		 * get 获得星数
		 * @return 
		 */
		public function get star(): int{
			return _star;
		}
		
		/**
		 * set 获得星数
		 */
		public function set star(value: int): void{
			this._star = value;
		}
		
	}
}