package com.rpgGame.netData.crossdatasync.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 坐骑装备数据同步(覆盖到跨服)
	 */
	public class ReqHorseEquipSyncGameToFightMessage extends Message {
	
		//0穿1脱
		private var _type: int;
		
		//物品信息
		private var _itemInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		//装备位置
		private var _equipLocation: int;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0穿1脱
			writeByte(_type);
			//物品信息
			writeBean(_itemInfo);
			//装备位置
			writeInt(_equipLocation);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0穿1脱
			_type = readByte();
			//物品信息
			_itemInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			//装备位置
			_equipLocation = readInt();
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 251268;
		}
		
		/**
		 * get 0穿1脱
		 * @return 
		 */
		public function get type(): int{
			return _type;
		}
		
		/**
		 * set 0穿1脱
		 */
		public function set type(value: int): void{
			this._type = value;
		}
		
		/**
		 * get 物品信息
		 * @return 
		 */
		public function get itemInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _itemInfo;
		}
		
		/**
		 * set 物品信息
		 */
		public function set itemInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._itemInfo = value;
		}
		
		/**
		 * get 装备位置
		 * @return 
		 */
		public function get equipLocation(): int{
			return _equipLocation;
		}
		
		/**
		 * set 装备位置
		 */
		public function set equipLocation(value: int): void{
			this._equipLocation = value;
		}
		
	}
}