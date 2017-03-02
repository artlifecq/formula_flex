package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.mount.MountEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.ui.alert.AutoDressAlert;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.cfg.item.StaticItem;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.upgrade.AmountInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangBackPack;
	import com.rpgGame.coreData.utils.MoneyUtil;
	
	import app.message.AmountType;
	import app.message.GoodsType;
	import app.message.Config.AllGoodsContainerUnlockProto;
	import app.message.NormalUsableDataProto.NormalEfficacy;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 * 背包物品管理
	 * @author wewell
	 */
	public class BackPackManager extends GoodsContainerMamager
	{
		/****/
		public var unlockSilver : int;
		public var unlockBindSilver : int;
		public var isAlertChangeBind : Boolean = false;
		/**背包切换其它标签页需要设置格子锁定*/
		public var isBackpackLock : Boolean = false;
		/**tabbar当前选中的索引*/
		public var tabbarIndex : int = 0;

		public function BackPackManager()
		{
			super(ItemContainerID.BackPack)
			EventManager.addEvent(ItemEvent.ITEM_GETED_NEW_ITEM, onGetedNewItem);
			EventManager.addEvent(ItemEvent.ITEM_DROPED,deleteItemByDrop);
		}
		
		
		private function deleteItemByDrop(src : GridInfo, target : GridInfo) : void
		{
			if (!src || src.containerID != containerId || target != null)
				return;
			if (src.data is ClientItemInfo)
			{
				dropItem(src.data as ClientItemInfo);
			}
		}

		override public function unLockGrid() : void
		{
			if (curUnlockIndex >= Max_Grid_Count)
			{
				NoticeManager.showNotify("您已经解锁了全部的格子");
				return;
			}
			var useSilver : Number = unlockSilver>0?unlockSilver:unlockBindSilver;
			GameAlert.showAlertUtil(LangBackPack.UNLOCK_GRID, unLockGridClick, MoneyUtil.getHtmlMoneyString(unlockBindSilver), ItemConfig.getItemName(StaticItem.UNLOCK_BACKPACK));
		}

		private function unLockGridClick(gameAlert : GameAlert) : void
		{
			switch (gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					useItemUnlockGrid();
					break;
			}
		}

		public function useItemUnlockGrid() : void
		{
			var amount : AmountInfo = MainRoleManager.actorInfo.amountInfo;
			var temp : int = amount.getAmountByType(AmountType.BAND_MONEY);
			if (temp < unlockBindSilver)
			{
				GameAlert.showAlertUtil(LangAlertInfo.UNLOCK_GRID_BIND_SILVER, null, MoneyUtil.getHtmlMoneyString(unlockBindSilver));
				return;
			}
			temp = amount.getAmountByType(AmountType.MONEY);
			if (temp < unlockSilver)
			{
				GameAlert.showAlertUtil(LangAlertInfo.UNLOCK_GRID_SILVER, null, MoneyUtil.getHtmlMoneyString(unlockSilver));
				return;
			}
			var item : ClientItemInfo = getItemInfoByUsabelEfficacy(NormalEfficacy.OPEN_DEPOT_GRID);
			if (!item)
			{
				GameAlert.showAlertUtil(LangAlertInfo.UNLOCK_GRID_ITEM, null, ItemConfig.getItemName(StaticItem.UNLOCK_BACKPACK));
				return;
			}
//			ItemSender.reqUseGoods(item.index, 1);
		}

		public function setUnlockData(data : AllGoodsContainerUnlockProto) : void
		{
			unlockSilver = data.depotUnlockMoneyCost;
			unlockBindSilver = data.depotUnlockBandMoneyCost;
		}

		private static var _ins : BackPackManager;

		public static function get instance() : BackPackManager
		{
			if (_ins == null)
			{
				_ins = new BackPackManager();
			}
			return _ins;
		}
		
		public function setUnusableGrid(isLock:Boolean):void
		{
			var curShowNum:int = getAllItem().length;
//			setIsShowBindLock(isLock);
			isBackpackLock = isLock;
			showLockAssetIndex = [];
			if(isLock)
			{
				var useLen:int = useGridLen();
				var lockNum:int = useLen - curShowNum;//需要锁定的格子个数
				for (var i:int = 0; i < hasOpenCount; i++) 
				{
					if(i+lockNum >= hasOpenCount)
					{
						showLockAssetIndex.push(i);
//						setShowLockAssetIndex(i);
					}
				}
			}
		}
		
		override public function getIsShowLockAsset(index:int):Boolean
		{
			if(isBackpackLock && showLockAssetIndex && showLockAssetIndex.indexOf(index) != -1)
			{
				return true;
			}
			var item : ClientItemInfo = getCurItemInfoByIndex(index);
			if(isShowBindLock && item && item.binded)
			{
				return true;
			}
			return false;
		}
		

		/**
		 * 使用某个物品
		 * @param cfgId
		 * @param count
		 *
		 */
		public function useItem(cfgId : int, bind:Boolean,count : int = 1) : void
		{
			var itemInfo : ClientItemInfo = getFirstCanUseItemByCfgIdAndBind(cfgId,bind);
			if (itemInfo == null)
				return;

			ItemUseManager.useItemByIndex(itemInfo.index, count);
		}

		/**
		 *获取一件新物品
		 * @param info
		 *
		 */
		public function onGetedNewItem(info : ClientItemInfo) : void
		{
			switch (info.type)
			{
				case GoodsType.EQUIPMENT:
					var equip : EquipInfo = info as EquipInfo;
					/*var dressEquips:Array = GoodsContainerMamager.getMrg(ItemContainerID.Role).getItemsByType(equip.equipType);
					var i:int = dressEquips ? dressEquips.length : 0;
					var old:EquipInfo;
					var tip:Boolean = i > 0 ? false : true;
					while(i > 0)
					{
						old = dressEquips[i - 1]
						if(equip.evaluate > old.evaluate)
						{
							tip = true;
							break;
						}
						i--;
					}*/
					if (RoleEquipmentManager.instance.isBetterEquip(equip) || MountEquipmentManager.instance.isBetterEquip(equip)) //人物装备、坐骑装备
					{
						AutoDressAlert.show(equip, autoDressEquip);
					}
					break;
				case GoodsType.MEDICINE:
					//第一次自动放入快捷栏
					/*if(ItemCfgData.isAddHpItem(info.cfgId))
					{
						EventManager.dispatchEvent( ItemEvent.ITEM_INPUT_SHORTCUT, 18, info.cfgId);
					}else if(ItemCfgData.isAddMpItem(info.cfgId))
					{
						EventManager.dispatchEvent( ItemEvent.ITEM_INPUT_SHORTCUT, 19, info.cfgId);
					}*/
					break;
			}
		}

		private function autoDressEquip(equip : EquipInfo) : void
		{
			ItemUseManager.useItem(equip);
		}
	}
}
