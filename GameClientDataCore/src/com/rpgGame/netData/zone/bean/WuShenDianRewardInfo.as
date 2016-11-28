package com.rpgGame.netData.zone.bean{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
	
	import org.game.netCore.net.Bean;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 武神殿奖励信息
	 */
	public class WuShenDianRewardInfo extends Bean {
	
		//玩家名字
		private var _playerName: String;
		
		//伤害输出
		private var _damage: int;
		
		//奖励物品列表
		private var _itemInfoList: Vector.<com.rpgGame.netData.backpack.bean.ItemInfo> = new Vector.<com.rpgGame.netData.backpack.bean.ItemInfo>();
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//玩家名字
			writeString(_playerName);
			//伤害输出
			writeInt(_damage);
			//奖励物品列表
			writeShort(_itemInfoList.length);
			for (var i: int = 0; i < _itemInfoList.length; i++) {
				writeBean(_itemInfoList[i]);
			}
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//玩家名字
			_playerName = readString();
			//伤害输出
			_damage = readInt();
			//奖励物品列表
			var itemInfoList_length : int = readShort();
			for (var i: int = 0; i < itemInfoList_length; i++) {
				_itemInfoList[i] = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			}
			return true;
		}
		
		/**
		 * get 玩家名字
		 * @return 
		 */
		public function get playerName(): String{
			return _playerName;
		}
		
		/**
		 * set 玩家名字
		 */
		public function set playerName(value: String): void{
			this._playerName = value;
		}
		
		/**
		 * get 伤害输出
		 * @return 
		 */
		public function get damage(): int{
			return _damage;
		}
		
		/**
		 * set 伤害输出
		 */
		public function set damage(value: int): void{
			this._damage = value;
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