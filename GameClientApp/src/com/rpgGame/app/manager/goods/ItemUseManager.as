package com.rpgGame.app.manager.goods
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.mount.MountEquipmentManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.ChatCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ComboItemInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.role.HeroData;
	
	import app.message.GoodsType;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 物品使用
	 * @author
	 *
	 */
	public class ItemUseManager
	{
		private static var _dailyUseGoodHash : HashMap;
		/** 人物装备 **/
		private static var _equip : ClientItemInfo;
		/** 坐骑装备 **/
		private static var _mountEquip : ClientItemInfo;

		public function ItemUseManager()
		{
		}

		public static function setDailyUseGoodData(idArr : Array, times : Array) : void
		{
			if (_dailyUseGoodHash == null)
			{
				_dailyUseGoodHash = new HashMap();
			}
			var len : int = idArr.length;
			for (var i : int = 0; i < len; i++)
			{
				_dailyUseGoodHash.add(idArr[i], times[i]);
			}
		}

		public static function getdailyUseGoodHash(key : int) : int
		{
			return _dailyUseGoodHash.getValue(key);
		}

		public static function setDailyUseGoodTimes(id : int, num : int) : void
		{
			if (_dailyUseGoodHash == null)
			{
				_dailyUseGoodHash = new HashMap();
			}
			if (_dailyUseGoodHash.containsKey(id))
			{
				_dailyUseGoodHash.add(id, _dailyUseGoodHash.getValue(id) + num);
			}
			else
			{
				_dailyUseGoodHash.add(id, num);
			}
		}

		/**
		 * 使用物品是否受限制
		 * @param key
		 * @return
		 *
		 */
		public static function isXianZhiGood(key : int) : Boolean
		{
			if (_dailyUseGoodHash == null)
			{
				return false;
			}
			if (_dailyUseGoodHash.containsKey(key))
			{
				return true;
			}
			return false;
		}

		/**
		 * 通过物品id使用物品
		 * @param id 物品id
		 * @param count 使用数量
		 *
		 */
		public static function useItemById(id : int, count : int) : void
		{
			var item : ClientItemInfo = BackPackManager.instance.getFirstCanUseItemByCfgId(id);
			useItem(item, count);
		}

		/**
		 * 通过容器格子index使用物品
		 * @param index 容器格子index
		 * @param count 使用数量
		 *
		 */
		public static function useItemByIndex(index : int, count : int) : void
		{
			var item : ClientItemInfo = BackPackManager.instance.getItemInfoByIndex(index);
			useItem(item, count);
		}

		/**
		 * 穿戴装备
		 * @param item
		 *
		 */
		private static function useEquip(item : ClientItemInfo) : void
		{
			var dstPos : int;

			if(item.type == GoodsType.EQUIPMENT)//人物面板在舞台，并且类型是装备
			{
				if(item.qItem.q_job!=MainRoleManager.actorInfo.job){
					NoticeManager.showNotifyById(12009);
					return;
				}
				
				dstPos = RoleEquipmentManager.instance.getEquipPos(item);
				if(dstPos != -1)
				{
					if(RoleEquipmentManager.canPutOnEquipAt(item,dstPos))
					{
						ItemSender.wearEquip(item.itemInfo.itemId);
					}
				}
				return;
			}
			if (AppManager.isAppInScene(AppConstant.STORAGE_PANEL)) //放入仓库
			{
				var emptyIndex : int = StorageManager.instance.getFirstEmptyIndex();
				if (emptyIndex != -1)
				{
//					ItemSender.reqMoveGoods(item.containerID, ItemContainerID.Storage, item.index, emptyIndex);
				}
				return;
			}
			else if (item.type == GoodsType.EQUIPMENT) //是装备类型
			{
				//坐骑装备
				if (MountEquipmentManager.instance.isMountEquipType(item))
				{
					dstPos = MountEquipmentManager.instance.getEquipPos(item);
					if (dstPos != -1)
					{
						if (MountEquipmentManager.instance.canPutOnEquipAt(item, dstPos))
						{
							//绑定提示
							if (item && !item.binded)
							{
								_mountEquip = item;
								GameAlert.showAlertUtil(LangAlertInfo.EQUIPMENT_BIND_TIP,onMountEquipBindClick);
								return;
							}
//							ItemSender.reqMoveGoods(item.containerID, ItemContainerID.Mount, item.index, dstPos, MountManager.curSelectIdx);
						}
					}
				}
				else
				{
					//人物装备 
					//策划说穿装备不需要打开角色面板2016年5月12日18:41:59
					dstPos = RoleEquipmentManager.instance.getEquipPos(item);
					if (dstPos != -1)
					{
						if (RoleEquipmentManager.canPutOnEquipAt(item, dstPos))
						{
							//绑定提示
							if (item && !item.binded)
							{
								_equip = item;
								GameAlert.showAlertUtil(LangAlertInfo.EQUIPMENT_BIND_TIP,onRoleEquipBindClick);
								return;
							}
//							ItemSender.reqMoveGoods(item.containerID, ItemContainerID.Role, item.index, dstPos);
						}
					}
				}
			}
		}
		
		private static function onRoleEquipBindClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onConfirmBind();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					onCancelBind();
					break;
			}		
		}
		
		private static function onMountEquipBindClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onMountEquipConfirmBind();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					onMountEquipCancelBind();
					break;
			}
		}
		
		/**\
		 * 绑定提示
		 *
		 */
		private static function onConfirmBind() : void
		{
			if (!_equip)
				return;
			var dstPos : int = RoleEquipmentManager.instance.getEquipPos(_equip);
//			ItemSender.reqMoveGoods(_equip.containerID, ItemContainerID.Role, _equip.index, dstPos);
			_equip = null;
		}

		/**
		 * 穿戴
		 *
		 */
		private static function onCancelBind() : void
		{
			_equip = null;
		}

		/**
		 * 绑定提示
		 *
		 */
		private static function onMountEquipConfirmBind() : void
		{
			if (!_mountEquip)
				return;

			var dstPos : int = MountEquipmentManager.instance.getEquipPos(_mountEquip);
//			ItemSender.reqMoveGoods(_mountEquip.containerID, ItemContainerID.Mount, _mountEquip.index, dstPos, MountManager.curSelectIdx);
			_mountEquip = null;
		}

		/**
		 * 穿戴
		 *
		 */
		private static function onMountEquipCancelBind() : void
		{
			_mountEquip = null;
		}

		/**
		 * 使用当前物品,使用物品最终一定是从背包中使用
		 * @param item
		 * @param count
		 * @param isShowEquipFly
		 *
		 */
		public static function useItem(item : ClientItemInfo, count : int = 1, isShowEquipFly : Boolean = true) : void
		{
			if (item == null)
			{
				return;
			}
			
//			//满足此条件则为卖出
//			if (AppManager.isAppInScene(AppConstant.SHOP_PANEL) && Mouse.cursor == MouseCursorEnum.SELL)
//			{
//				//SmallShopItemManager.reqSellGoods(item);
//				return;
//			}
			
			if (!canUse(item))
			{
				return;
			}

			switch (item.type)
			{
				case GoodsType.EQUIPMENT:
				case GoodsType.EQUIPMENT1:
				case GoodsType.EQUIPMENT2:
					useEquip(item);
					return;
				case GoodsType.MATERIAL_ADVANCE://进阶材料
				{
					AppManager.showApp(AppConstant.MOUNT_PANEL);
					break;
				}
				case GoodsType.MATERIAL_COMBO://合成材料
				{
					var info:ComboItemInfo=new ComboItemInfo();
					info.sourceId=item.cfgId;
					AppManager.showAppNoHide(AppConstant.EQUIP_PANL,{tab:4,data:info});
					return;
				}
				case GoodsType.CHAT:
					return;
				case GoodsType.TRANSFER:
					return;
				case GoodsType.TASK:
					return;
				case GoodsType.BUFF:
					return;
				case GoodsType.NAMES:
					return;
				case GoodsType.STRENGTH:
					return;
				case GoodsType.MOUNT:
					return;
				case GoodsType.MERIDIANSTONE:
					return;
			}
			
			/*switch(item.getNormalUsableType)
			{
				case NormalEfficacy.OPEN_DEPOT_GRID:
					BackPackManager.instance.unLockGrid();
					return;
			}*/
			ItemSender.useItem(item,count);
		}

		/** 使用普通物品 **/
		private static function useNormalItem(item : ClientItemInfo, count : int = 1) : void
		{
			if (item.cfgId == ChatCfgData.paidChatGoodsID)
			{
				AppManager.showApp(AppConstant.LABA_PANEL);
				return;
			}
		/*	switch (item.getNormalUsableType)
			{
				case NormalEfficacy.OPEN_DEPOT_GRID:
					BackPackManager.instance.unLockGrid();
					return;
			}*/
//			ItemSender.reqUseGoods(item.index, count);
		}

		private static function openPanel(cfgId : int) : void
		{

		}



		/**
		 *  使用传送卷轴
		 * //读条5秒后,未打断情况下再执行请求使用物品-->因为有5秒读条时间，
		 * 不直接请求使用物品，已在TransferMgr中处理。
		 */
		private static function useTransBook(item : ClientItemInfo) : void
		{
			/*if(TransferManager.isOnUseTransferRoll)
			{
				return;
			}
			if(!MainManager.actor.isLiving)
			{
				NoticeManager.addConfigNotice(EnumLang_NoticeInfo.ItemUseManager_3);
				return;
			}
			if(!MapDataManager.isNormalScene(MapManager.curtMapID))
			{
				NoticeManager.notify(NoticeManager.CENTER_BOTTOM,EnumLang_Text.IN_DUNGOEN_CAN_NOT_USE_TRANS_BOOK);
				return;
			}
			if(MainCharManager.isPK)
			{
				NoticeManager.addConfigNotice(EnumLang_NoticeInfo.ItemUseManager_5);
				return;
			}*/

			onUseTransBook(item);
		}

		private static function onUseTransBook(itemInfo : ClientItemInfo) : void
		{
//			ItemSender.reqUseGoods(itemInfo.index, 1);
		}

		/**
		 * 判断是否可以使用
		 * 1.物品是否处于冷却时间
		 * 2.物品锁定状态下 不能使用
		 * 3.物品是否过期
		 * 4.物品能否直接使用
		 * 5.玩家等级是否达到该物品的需求等级
		 * @param item
		 * @return
		 * @return 返回布尔值
		 */
		public static function canUse(item : ClientItemInfo) : Boolean
		{
			var userInfo : HeroData = MainRoleManager.actorInfo;
			var requireLevel : int = ItemConfig.getItemRequireLevel(item.cfgId);
			var roleLvl : int = MainRoleManager.actorInfo.totalStat.level;
			if (roleLvl < requireLevel)
			{
				NoticeManager.showHint(EnumHintInfo.CHAT_WORLD_CHAT_FAIL1);
				return false;
			}
			if( BackPackManager.instance.checkItemExpireTime(item.expireTime) == false )
			{
				return false;
			}
			return true;
		}

	}
}
