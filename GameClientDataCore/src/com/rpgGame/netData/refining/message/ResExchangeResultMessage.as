package com.rpgGame.netData.refining.message{
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import org.game.netCore.net.Message;
	
	/** 
	 * @author Commuication Auto Maker
	 * 
	 * @version 1.0.0
	 * 
	 * @since 2011-5-8
	 * 
	 * 继承装备结果
	 */
	public class ResExchangeResultMessage extends Message {
	
		//0不成功 1成功
		private var _suc: int;
		
		//主装备信息
		private var _itemInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		//副装备信息(锻造转移装备)
		private var _dzItemInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		//副装备信息(极品转移装备)
		private var _jpItemInfo: com.rpgGame.netData.backpack.bean.ItemInfo;
		
		
		/**
		 * 写入字节缓存
		 */
		override protected function writing(): Boolean{
			//0不成功 1成功
			writeByte(_suc);
			//主装备信息
			writeBean(_itemInfo);
			//副装备信息(锻造转移装备)
			writeBean(_dzItemInfo);
			//副装备信息(极品转移装备)
			writeBean(_jpItemInfo);
			return true;
		}
		
		/**
		 * 读取字节缓存
		 */
		override protected function reading(): Boolean{
			//0不成功 1成功
			_suc = readByte();
			//主装备信息
			_itemInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			//副装备信息(锻造转移装备)
			_dzItemInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			//副装备信息(极品转移装备)
			_jpItemInfo = readBean(com.rpgGame.netData.backpack.bean.ItemInfo) as com.rpgGame.netData.backpack.bean.ItemInfo;
			return true;
		}
		
		/**
		 * get id
		 * @return 
		 */
		override public function getId(): int {
			return 204104;
		}
		
		/**
		 * get 0不成功 1成功
		 * @return 
		 */
		public function get suc(): int{
			return _suc;
		}
		
		/**
		 * set 0不成功 1成功
		 */
		public function set suc(value: int): void{
			this._suc = value;
		}
		
		/**
		 * get 主装备信息
		 * @return 
		 */
		public function get itemInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _itemInfo;
		}
		
		/**
		 * set 主装备信息
		 */
		public function set itemInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._itemInfo = value;
		}
		
		/**
		 * get 副装备信息(锻造转移装备)
		 * @return 
		 */
		public function get dzItemInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _dzItemInfo;
		}
		
		/**
		 * set 副装备信息(锻造转移装备)
		 */
		public function set dzItemInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._dzItemInfo = value;
		}
		
		/**
		 * get 副装备信息(极品转移装备)
		 * @return 
		 */
		public function get jpItemInfo(): com.rpgGame.netData.backpack.bean.ItemInfo{
			return _jpItemInfo;
		}
		
		/**
		 * set 副装备信息(极品转移装备)
		 */
		public function set jpItemInfo(value: com.rpgGame.netData.backpack.bean.ItemInfo): void{
			this._jpItemInfo = value;
		}
		
	}
}