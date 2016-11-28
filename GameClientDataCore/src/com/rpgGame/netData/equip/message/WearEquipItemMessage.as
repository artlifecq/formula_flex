package com.rpgGame.netData.equip.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 穿着装备信息
	 */
	public class WearEquipItemMessage extends Message {
	
		//装备信息
		private var _equip: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//装备信息
			writeBean(_equip);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//装备信息
			_equip = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 107101;
		}
		
		/**
		 * get 装备信息
		 * @return 
		 */
		public function get equip(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _equip;
		}
		
		/**
		 * set 装备信息
		 */
		public function set equip(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._equip = value;
		}
		
	}
}