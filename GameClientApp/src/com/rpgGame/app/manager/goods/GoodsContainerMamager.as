package com.rpgGame.app.manager.goods
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.mount.MountEquipManager;
	import com.rpgGame.app.manager.mount.MountEquipmentManager;
	import com.rpgGame.app.manager.mount.MountFeedManager;
	import com.rpgGame.app.manager.mount.MountInheritManager;
	import com.rpgGame.app.manager.mount.MountIntensifyManager;
	import com.rpgGame.app.manager.mount.MountSlotManager;
	import com.rpgGame.app.manager.mount.MountSpellsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.item.ItemCfgData;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.item.UpgradeItemData;
	import com.rpgGame.coreData.info.item.UpgradeItemInfo;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.info.shop.ShopItemData;
	import com.rpgGame.coreData.info.upgrade.UpgradeGoodsInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	
	import flash.utils.Dictionary;
	
	import app.message.GoodsContainerProto;
	import app.message.GoodsType;
	import app.message.Config.AllGoodsContainerUnlockProto;
	
	import org.client.mainCore.manager.EventManager;
	
	/**
	 * 物品容器管理器
	 * @author wewell@163.com
	 */
	public class GoodsContainerMamager
	{
		protected var containerId:int;
		
		/**列数*/
		public var defaultCol:int = 8;
		/**行数*/
		public var defaultRow:int = 7;
		/** 默认开启个数 */
		protected var initOpenCount:int;
		/** 已经开启个数 */
		public var hasOpenCount:int;
		public const Max_Grid_Count:int = 126;
		public var hasOpenPage:int;
		
		/** 解锁位置*/
		public var curUnlockIndex:int;
		
		/**此处type为背包或者仓库table栏的分类  非物品type*/
		protected var CUR_TYPE:uint;
		protected var isSellItem:Boolean = false;//是否在出售
		/** 与当前等级最接近的药 **/
		private var _drugShopInfo:ShopItemData = null;
		/** 所有药品id **/
		private var _drugList:Array = [];
		
		private var _goodsList:Array;
		/** 物品是否可用[index-->enable] **/
		private var goodsEnableDict:Dictionary;
		/** 是否显示绑定物品的锁定图片**/
		private var isShowBindLock : Boolean = false;
		/** 额外的需要显示红色锁定的物品的下标**/
		private var _ShowLockAssetIndex : Array;
		//---------------用于赛选物品的数据
		private var _checkGroup : Array;
		private var _checkType : Array;
		private var _checkQuality : Array;
		/** 区分装备类型（人物装备还是坐骑装备） **/
		private var _checkEquipType:Array;
		
		
		public function GoodsContainerMamager(containerID:int)
		{
			this.containerId = containerID;
			
			_goodsList = [];
			goodsEnableDict = new Dictionary();
		}
		
		public function setIsShowBindLock(value:Boolean,lockUseMove:Boolean = true):void
		{
			if(value == isShowBindLock)
				return;
			isShowBindLock = value;
			if(!_ShowLockAssetIndex)
				_ShowLockAssetIndex = [];
			else
				_ShowLockAssetIndex.length = 0;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH, containerId);
		}
		
		public function getIsShowBindLock():Boolean
		{
			return isShowBindLock;
		}
		
		public function setShowLockAssetIndex(index:int):void
		{
			if(!_ShowLockAssetIndex || !isShowBindLock)
				return;
			if(_ShowLockAssetIndex.indexOf(index) != -1)
				return;
			_ShowLockAssetIndex.push(index);
			EventManager.dispatchEvent(ItemEvent.ITEM_CHANG, getItemInfoByIndex(index));
		}
		
		public function getIsShowLockAsset(index:int):Boolean
		{
			if(!isShowBindLock)
				return false;
			var item : ItemInfo = getItemInfoByIndex(index);
			if(item && _ShowLockAssetIndex)
			{
				if(item.binded)
					return true;
				if(_ShowLockAssetIndex.indexOf(index) != -1)
					return true;
			}
			return false;
		}
		
		public function removeLockAssetByIndex(index:int):void
		{
			if(!_ShowLockAssetIndex || !isShowBindLock)
				return;
			if(_ShowLockAssetIndex.indexOf(index) == -1)
				return;
			_ShowLockAssetIndex.splice(_ShowLockAssetIndex.indexOf(index),1);
			EventManager.dispatchEvent(ItemEvent.ITEM_CHANG, getItemInfoByIndex(index));
		}
		
		/**
		 *初始化物品容器信息 
		 * @param data
		 * 
		 */
		public function setGoodsInfo(data:GoodsContainerProto):void
		{
			initOpenCount = data.initCount;
			hasOpenCount = data.size;
			curUnlockIndex = hasOpenCount;
			if(containerId == ItemContainerID.BackPack)
			{
//				unlockData.setOffIndex(initOpenCount);
//				unlockData.setUnlockedSize(hasOpenCount-initOpenCount);
			}else if(containerId == ItemContainerID.Storage)
			{
				hasOpenPage = data.storage.unlockedPage;
//				unlockData.setOffIndex(initOpenCount);
//				unlockData.setUnlockedSize(hasOpenCount-initOpenCount);
			}
			
			var posArr:Array = data.posList;
			var goodsArr:Array = data.goodsList;
			for(var i:int=0; i<posArr.length; i++)
			{
				var info:ItemInfo = ItemUtil.convertGoodsProtoToItemInfo(goodsArr[i]);
				info.setContainerId( containerId );
				info.setIndex( posArr[i] );
				_goodsList[info.index] = info;
			}
			setEnabledAll(true);
		}
		
		/**
		 * 添加物品
		 * @param info
		 */
		public function addItem(info:ItemInfo):void
		{
			if(info)
			{
				_goodsList[info.index] = info;
				EventManager.dispatchEvent(ItemEvent.ITEM_ADD, info);
			}
		}
		/**
		 * 刷新指定物品下标的所有物品（防止有些操作可能会使物品下标和实际下标不相同，那就刷新一下这些下标的物品 
		 * @param container
		 * @param index
		 * 
		 */		
		public function refleshGridByItemIndex(container:int,index:int):void
		{
			if(container != containerId)return;
			EventManager.dispatchEvent(ItemEvent.ITEM_REFLESH_BY_ITEM_INDEX,index);
		}
		
		public function setItemByIndex(index:int, info:ItemInfo):void
		{
			if(!info)
			{
				removeItemByIndex(index);
				return;
			}
			
			if(index != info.index)
			{
				info.setIndex( index );
				GameLog.add("Warnig:Item index Maybe Wrong!");
			}
			
			if(!_goodsList[index])
			{
				addItem(info);
			}else
			{
				_goodsList[index] = info;
				EventManager.dispatchEvent(ItemEvent.ITEM_CHANG, info);
			}
		}
		
		public function hasItem(index:int):Boolean
		{
			return getItemInfoByIndex(index) != null;
		}
		
		public function setAllItem(itemInfoArr:Array):void
		{
			_goodsList.length = 0;
			_goodsList = itemInfoArr;
			//setEnabledAll(true);
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH, containerId);
		}
		
		public function useGridLen():int
		{
			var result : int = 0;
			for each(var info:ItemInfo in _goodsList)
			{
				if(info != null)
					result ++ ;
			}
			return result;
		}
		
		/**
		 * 获得所有物品
		 * @return 
		 */
		public function getAllItem():Array
		{
			var goods : Array = goodsList;
			if((!_checkQuality || _checkQuality.length == 0)
				&& (!_checkGroup || _checkGroup.length == 0) 
				&& (!_checkType || _checkType.length == 0))
				return goods;//并没有赛选
			var result : Array = [];
			for each(var item:ItemInfo in goods)
			{
				if(!item)
					continue;
				if(_checkQuality && _checkQuality.length != 0)
				{
					if(_checkQuality.indexOf(item.quality)!=-1)
						result.push(item);
					continue;
				}
				result.push(item);
			}
			goods = [];
			for each(item in result)
			{
				if(!item)
					continue;
				if(_checkType && _checkType.length != 0)
				{
					//筛选出装备类型（是人物装备、还是坐骑装备）
					if( _checkEquipType && _checkEquipType.length != 0 )
					{
						if( item is EquipInfo )//装备
						{
							var equip:EquipInfo = item as EquipInfo;
							if(_checkEquipType.indexOf(equip.equipType)!=-1)
								goods.push(item);
						}
					}
					else
					{
						if(_checkType.indexOf(item.type)!=-1)
							goods.push(item);
					}
				}else
					goods.push(item);
			}
			result = [];
			for each(item in goods)
			{
				if(!item)
					continue;
				if(_checkGroup && _checkGroup.length != 0)
				{
					if(_checkGroup.indexOf(item.group)!=-1)
						result.push(item);
				}else
					result.push(item);
			}
			result.sort(compareItemInfoSort);
			return result;
		}
		
		/**
		 * 获得物品列表的某一段[start, end];
		 * @return 
		 */
		public function getSliceItems(start:int, end:int):Array
		{
			return _goodsList.slice(start, end);
		}
		
		/**
		 *获取第一个空格子下标 
		 * @return 
		 * 
		 */		
		public function getFirstEmptyIndex():int
		{
			var len:int = _goodsList.length;
			for(var i:int=0; i<hasOpenCount; i++)
			{
				if( i >= len || !_goodsList[i])
				{
					return i;
				}
			}
			return -1;
		}
		
		public function getMaxRows():int
		{
			if(curUnlockIndex >= Max_Grid_Count)
				return Math.floor(Max_Grid_Count / defaultCol);
			else if(curUnlockIndex >= (Max_Grid_Count - defaultCol))
				return Math.floor(curUnlockIndex / defaultCol) + 1;
			else
				return Math.floor(curUnlockIndex / defaultCol) + 2;
		}
		
		public function removeItemByIndex(index:int):ItemInfo
		{
			var info:ItemInfo = getItemInfoByIndex(index);
			_goodsList[index] = null;
			if(info)EventManager.dispatchEvent(ItemEvent.ITEM_DELETE,info);
			return info;
		}
		
		
		/**
		 * 通过容器格子index获取对应的物品数据
		 * 如果没有的话则会返回null
		 * */
		public function getItemInfoByIndex(index:int):ItemInfo
		{
			return index <_goodsList.length ? _goodsList[index] : null;
		}
		
		/** 所有物品 **/
		public function get goodsList():Array
		{
			return _goodsList.concat();
		}
		/**
		 * 根据物品id获得物品内的所有物品集合
		 * @param itemID物品id
		 * */
		public function getBagItemsByID(itemID:uint):Vector.<ItemInfo>
		{
			var items:Vector.<ItemInfo> = new Vector.<ItemInfo>();
			for each(var info:ItemInfo in _goodsList)
			{
				if(info && info.cfgId == itemID)
				{
					items.push(info);
				}
			}
			return items;
		}
		/**
		 * 获取指定ID的堆叠数量(不区分是否绑定) 
		 * @param itemId
		 * @return 
		 * 
		 */		
		public function getBagItemsCountById(itemID:uint):int
		{
			var result : uint = 0;
			for each(var info:ItemInfo in _goodsList)
			{
				if(info && info.cfgId == itemID)
				{
					result += info.count;
				}
			}
			return result;
		}
		
		/**
		 * 获取绑定/非绑定物品的数量
		 * @param itemID 
		 * @param isBind 是否绑定，默认false
		 * @return 叠加数量
		 * 
		 */		
		public function getBagItemsCountByIdAndBind(itemID:uint,isBind:Boolean = false):int
		{
			var result : uint = 0;
			for each(var info:ItemInfo in _goodsList)
			{
				if(info && info.cfgId == itemID && info.binded == isBind)
				{
					result += info.count;
				}
			}
			return result;
		}
		
		/**
		 * 获得物品在背包中最前的物品信息
		 * @param cfgId
		 * @return 
		 * 
		 */
		public function getFirstCanUseItemByCfgId(cfgId:uint):ItemInfo
		{
			var itemValues:Array = _goodsList;
			for each(var info:ItemInfo in itemValues)
			{
				if(info && info.cfgId == cfgId && (info.expireTime == 0 || isCanUse(info)))
				{
					return info;
				}
			}
			return null;
		}
		
		public function getFirstCanUseItemByCfgIdAndBind(cfgId:uint,bind:Boolean):ItemInfo
		{
			var itemValues:Array = _goodsList;
			for each(var info:ItemInfo in itemValues)
			{
				if(info && info.cfgId == cfgId && (info.expireTime == 0 || isCanUse(info)) && info.binded == bind)
				{
					return info;
				}
			}
			return null;
		}
		
		/**
		 * 根据物品cfgId获得物品内的所有物品集合
		 * @param itemID物品id
		 * */
		public function getItemCount(itemID:uint):int
		{
			var countNum:int = 0;
			for each(var info:ItemInfo in _goodsList)
			{
				if(info && info.cfgId == itemID && !isExpirt(info.expireTime))
				{
					countNum += info.count;
				}
			}
			return countNum;
		}
		
		/**
		 * 通过物品类型查找；
		 * @param type
		 * @return 
		 * 
		 */
		public function getItemsByType(type:int):Array
		{
			var items:Array = [];
			for each (var itemInfo:ItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.type == type)
				{
					items.push(itemInfo);
				}
			}
			return items;
		}
		
		public function getItemsByItemId(id:int):Array
		{
			var items:Array = [];
			for each (var itemInfo:ItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.cfgId == id)
				{
					items.push(itemInfo);
				}
			}
			return items;
		}
		
		public function getEquipsByQuality(quality:int):Array
		{
			var items:Array = [];
			var goods : Array = getItemsByType(GoodsType.EQUIPMENT);
			for each (var itemInfo:EquipInfo in goods) 
			{
				if(itemInfo && itemInfo.quality == quality)
					items.push(itemInfo);
			}
			return items;
		}
		
		public function getItemsByGroup(group:int):Array
		{
			var items : Array = [];
			for each (var itemInfo:ItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.group == group)
				{
					items.push(itemInfo);
				}
			}
			return items;
		}
		
		public function getItemsCountByGroup(group:int):int
		{
			var result : int = 0;
			for each (var itemInfo:ItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.group == group)
					result += itemInfo.count;
			}
			return result;
		}
		
		public function getSummonTokenByType(type:int):Array
		{
			var items:Array = [];
			for each (var itemInfo:ItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.summonTokenType == type)
				{
					items.push(itemInfo);
				}
			}
			return items;
		}
		
		//---------------排序-------------------
		
		private function compareItemInfoSort(itemInfo1:ItemInfo,itemInfo2:ItemInfo):int
		{
			if(itemInfo1.cfgId == itemInfo2.cfgId)
			{
				if(itemInfo1.binded)
					return -1;
				else if(itemInfo2.binded)
					return 1;
				else return 0;
			}else if(itemInfo1.cfgId > itemInfo2.cfgId)
			{
				return 1;
			}
			else if(itemInfo1.cfgId < itemInfo2.cfgId)
			{
				return -1;	
			}
			else
			{
				if(itemInfo1.expireTime > itemInfo2.expireTime)
				{
					return 1;
				}
				else
				{
					return -1;
				}
			}
		}
		
		/**
		 * 返回当前物品id 的最近的过期时间
		 * (-1 为不存在)
		 * @param cfgID
		 * @return 
		 */
		public function getNearExpirtime(cfgID:int):int
		{
			var info:ItemInfo = getNearExpirtimeItemInfo(cfgID);
			if(info)
			{
				return info.expireTime;
			}
			
			return -1;
		}
		
		/**
		 * 返回当前物品id 的itemInfo
		 * (-1 为不存在)
		 * @param cfgID
		 * @return 
		 */
		private function getNearExpirtimeItemInfo(cfgID:int):ItemInfo
		{
			var info:ItemInfo = null;
			var itemList:Vector.<ItemInfo> = getBagItemsByID(cfgID);
			for each(var itemInfo:ItemInfo in itemList)
			{
				if(!isCanUse(itemInfo))
				{
					continue;
				}
				
				if(info && itemInfo.expireTime != 0)
				{
					if(info.expireTime == 0)
					{
						info = itemInfo;
					}
					else
					{
						if( info.expireTime > itemInfo.expireTime)
						{
							info = itemInfo;
						}
					}
				}
				else
				{
					info = itemInfo;
				}
			}
			return info;
		}
		
		/**
		 * 物品是否过期
		 * @return 
		 */
		public function isExpirt($expireTime:int):Boolean
		{
			if($expireTime == 0)
			{
				return false;
			}
			
			return ($expireTime - SystemTimeManager.curtTm/1000)>0?false:true;
		}
		
		
		/**
		 * 获取消耗物品信息 
		 * @param upgradeItemId	 需要扣的物品id
		 * @param needItemCount	 需要扣的物品数量
		 * @param substituteGoods 替代物品列表
		 * @param canUsePeriodGoods 	是否能使用有时限的物品
		 * @return 
		 */		
		private function priv_getUpgrade( upgradeItemId:int, needItemCount:int, substituteGoods:Array = null, canUsePeriodGoods:Boolean = true ):UpgradeItemData
		{
			if( upgradeItemId <= 0 )
				return null;
			
			var upgradeItemData:UpgradeItemData = new UpgradeItemData();
			var currentCount:int = 0;
			var itemValues:Vector.<ItemInfo> = new Vector.<ItemInfo>();
			if( substituteGoods != null )
			{
				for each (var subCfgId:int in substituteGoods) 
				{
					var tmpVec:Vector.<ItemInfo> = getBagItemsByID(subCfgId);
					tmpVec = tmpVec.sort(sortItemByExpireTime);
					itemValues = itemValues.concat(tmpVec);
				}
			}
			
			tmpVec = getBagItemsByID(upgradeItemId);
			tmpVec = tmpVec.sort( sortItemByExpireTime );
			itemValues = itemValues.concat(tmpVec);
			for each(var info:ItemInfo in itemValues)
			{
				if (!canUsePeriodGoods) 
				{
					/**<不能使用有时限的物品，此物品是过期物品，跳过>*/
					if (info.expireTime) 
					{
						continue;
					}
				}
				if(checkItemExpireTime(info.expireTime))
				{
					var costCount:int = 0;
					var addCount:int = currentCount + info.count;
					if(addCount >= needItemCount)
					{
						costCount = needItemCount - currentCount;
					}
					else
					{
						costCount = info.count;
					}
					var upgradeItemInfo:UpgradeItemInfo = new UpgradeItemInfo();
					upgradeItemInfo.cfgId = info.cfgId;
					upgradeItemInfo.expirtime = info.expireTime;
					upgradeItemInfo.index = info.index;
					upgradeItemInfo.costCount = costCount;
					currentCount += costCount;
					upgradeItemData.itemVec.push(upgradeItemInfo);
					if(currentCount >= needItemCount)
					{
						break;
					}
				}
			}
			
			upgradeItemData.itemId = upgradeItemId;
			upgradeItemData.needItemCount = needItemCount;
			upgradeItemData.itemTotalCount = currentCount;
			return upgradeItemData;
		}
		
		/**
		 * 获取进阶的材料
		 * @param  upgradeInfo     进阶需要用到的材料信息
		 */
		public function getUpgradeItemsByUpgradeProtoInfo( upgradeProtoInfo:UpgradeProtoInfo ):UpgradeItemListVo
		{
			var itemListVO:UpgradeItemListVo = new UpgradeItemListVo();
			if( upgradeProtoInfo == null )
				return itemListVO;
			
			var upgradeItemData:UpgradeItemData;
			var goodsInfo:UpgradeGoodsInfo;
			var goodsInfoVect:Vector.<UpgradeGoodsInfo> = upgradeProtoInfo.goodsInfoVect;
			var len:int = goodsInfoVect.length;
			for( var i:int = 0;i < len;i ++ ) 
			{
				goodsInfo = goodsInfoVect[i];
				upgradeItemData = priv_getUpgrade( goodsInfo.cfgId, goodsInfo.upgradeGoodsCount, goodsInfo.substituteGoods );
				itemListVO.addUpgradeInfo( upgradeItemData );
			}
			
			return itemListVO;
		}
		
		private function sortItemByExpireTime(itemInfo1:ItemInfo, itemInfo2:ItemInfo):int
		{
			if(itemInfo1.expireTime == 0)
			{
				return  2;
			}
			if(itemInfo2.expireTime == 0)
			{
				return  -2;
			}
			if(itemInfo1.expireTime > itemInfo2.expireTime)
			{
				return 1;
			}
			else
			{
				return -1;
			}
		}
		
		
		/**
		 * 获取进阶的材料
		 * @param  upgradeInfo     进阶需要用到的材料信息
		 */
		public function getCosetItems(cfgIdArr:Array,needCountArr:Array):Vector.<Vector.<UpgradeItemInfo>>
		{
			var itemVec:Vector.<Vector.<UpgradeItemInfo>> = new Vector.<Vector.<UpgradeItemInfo>>();
			var len:int = cfgIdArr.length;
			for (var i:int = 0; i < len; i++) 
			{
				var cfgId:int = cfgIdArr[i];
				var needCount:int = needCountArr[i];
				var vec:Vector.<UpgradeItemInfo> = getCosetItemVec(cfgId,needCount);
				itemVec.push(vec);
			}
			return itemVec;
		}
		
		/**
		 * 装备合成材料消耗 
		 * @param upgradeItemId
		 * @param needItemCount
		 * @return 
		 * 
		 */		
		public function getCosetItemVec(upgradeItemId:int,needItemCount:int):Vector.<UpgradeItemInfo>
		{
			var itemVec:Vector.<UpgradeItemInfo> = new Vector.<UpgradeItemInfo>();
			var currentCount:int;
			var itemDic:Dictionary = new Dictionary();
			for each(var info:ItemInfo in _goodsList)
			{
				if(info && info.cfgId == upgradeItemId)
				{
					var costCount:int = 0;
					var addCount:int = currentCount + info.count;
					if(addCount >= needItemCount)
					{
						costCount = needItemCount - currentCount;
					}else
					{
						costCount = info.count;
					}
					var upgradeItemInfo:UpgradeItemInfo = new UpgradeItemInfo();
					upgradeItemInfo.cfgId = info.cfgId;
					upgradeItemInfo.expirtime = info.expireTime;
					upgradeItemInfo.costCount = costCount;
					currentCount += costCount;
					itemVec.push(upgradeItemInfo);
					if(currentCount >= needItemCount)
					{
						break;
					}
				}
			}
			return itemVec
		}
		
		/** 查找当前背包中最合适的药品，品质优先，品质相同的等级优先 **/
		private function searchSuitDrugItem( isAutoBuy:Boolean ):ItemInfo
		{
			var itemInfoList:Array = _goodsList;
			var returnItem:ItemInfo;
			if( isAutoBuy )
			{
				for each(var item:ItemInfo in itemInfoList)
				{
					var cfgId:int = item.cfgId;
					var requireLevel:int = ItemCfgData.getItemRequireLevel( cfgId ) ;
					var quality:int = ItemCfgData.getItemQuality( cfgId );
					var cfgId1:int;
					var requireLevel1:int;
					var quality1:int;
					
					if(ItemCfgData.isAddHpItem(cfgId) && MainRoleManager.actorInfo.totalStat.level >= requireLevel)
					{
						if( returnItem )
						{
							cfgId1 = returnItem.cfgId;
							requireLevel1 = ItemCfgData.getItemRequireLevel( cfgId1 ) ;
						}
						else
						{
							cfgId1 = _drugShopInfo.itemInfo.cfgId;
							requireLevel1 = ItemCfgData.getItemRequireLevel( cfgId1 ) - 1 ;
						}
						quality1 = ItemCfgData.getItemQuality( cfgId1 );
						if( quality > quality1 )
						{
							returnItem = item;
						}
						else if( quality == quality1 )
						{
							if( requireLevel > requireLevel1)
							{
								returnItem = item;
							}
						}
					}
				}
			}
			else
			{
				for each(item in itemInfoList)
				{
					cfgId = item.cfgId;
					requireLevel = ItemCfgData.getItemRequireLevel( cfgId ) ;
					
					if(ItemCfgData.isAddHpItem(cfgId) && MainRoleManager.actorInfo.totalStat.level >= requireLevel)
					{
						quality = ItemCfgData.getItemQuality( cfgId );
						if( returnItem )
						{
							requireLevel1 = ItemCfgData.getItemRequireLevel( returnItem.cfgId );
							quality1 = ItemCfgData.getItemQuality( returnItem.cfgId );
							if( quality > quality1 )
							{
								returnItem = item;
							}
							else if( (quality == quality1) && (requireLevel > requireLevel1) )
							{
								returnItem = item;
							}
						}
						else
						{
							returnItem = item;
						}
					}
				}
			}
			return returnItem;
		}
		
		/**
		 * 根据iteminfo获得；
		 * 当前物品是否过期；(当前物品是否可用)
		 * true(可用) false(不可用)
		 */
		public function isCanUse($info:ItemInfo):Boolean
		{
			return checkItemExpireTime($info.expireTime);
		}
		
		/**
		 * 根据过期时间来获得；（true可用。false不可用）
		 * @param expireTime
		 * @return 
		 */
		public function checkItemExpireTime(expireTime:Number):Boolean
		{
			if(expireTime == 0)
			{
				return true;
			}
			else
			{
				return expireTime * 1000 > SystemTimeManager.curtTm;
			}
		}
		//==========================物品禁用与解禁  mask&unmask===================
		public function setEnabled(index:int, enable:Boolean):void
		{
			goodsEnableDict[index] = enable;
			EventManager.dispatchEvent(ItemEvent.ITEM_CHANG, getItemInfoByIndex(index));
		}
		
		public function setEnabledAll(enable:Boolean):void
		{
			if(enable)
			{
				for (var index:* in goodsEnableDict)
				{
					delete goodsEnableDict[index];
				}
			}else
			{
				var len:int = _goodsList ? _goodsList.length : 0;
				for (var i:int=0; i<len; i++)
				{
					if(_goodsList[i] != null)goodsEnableDict[i] = enable;
				}
			}
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH, containerId);
		}
		
		public function isEnabled(index:int):Boolean
		{
			if( goodsEnableDict.hasOwnProperty(index))
			{
				return goodsEnableDict[index] == true;
			}
			return true;
		}
		//-------------------设置赛选
		public function set checkGroup(value:Array):void
		{
			_checkGroup = value;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH,containerId);
		}
		
		/**
		 * 设置物品类型 
		 * @param value
		 * 
		 */		
		public function set checkType(value:Array):void
		{
			_checkType = value;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH,containerId);
		}

		/**
		 * 设置装备类型（区分是坐骑装备还是人物装备） 
		 * @param value
		 * 
		 */		
		public function set checkEquipType(value:Array):void
		{
			_checkEquipType = value;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH,containerId);
		}
		
		public function set checkQuality(value:Array):void
		{
			_checkQuality = value;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH,containerId);
		}
		
		//==========================格子解锁 unlock===============================	
		/**
		 * 是否为待解锁格 
		 * @param index
		 * 
		 */		
		public function isUnlock(index:int):Boolean
		{
			return index >= curUnlockIndex;
		}
		
		public function setUnlocked(index:int):void
		{
			curUnlockIndex = index+1;
			hasOpenCount = index+1;
			hasOpenPage = Math.ceil(hasOpenCount/(defaultCol*defaultRow));
//			unlockData.setUnlockedSize(hasOpenCount-initOpenCount);
			EventManager.dispatchEvent(ItemEvent.ITEM_GRID_UNLOCK, containerId,index);
		}
		
		/**如果是需要解锁格子的容器，需要重写这个方法**/
		public function unLockGrid():void
		{
			
		}
		/** 获取指定使用效果的物品 **/
		public function getItemInfoByUsabelEfficacy(type:int):ItemInfo
		{
			for each(var item : ItemInfo in _goodsList)
			{
				if(!item)
					continue;
				if(item.getNormalUsableType == type)
					return item;
			}
			return null;
		}
		
		//==========================Item Container common public static===================================
		//
		//
		public static function getMrg(containerId:int):GoodsContainerMamager
		{
			switch(containerId)
			{
				case ItemContainerID.BackPack:
					return BackPackManager.instance;
				case ItemContainerID.Storage:
					return StorageManager.instance;
				case ItemContainerID.Role:
					return RoleEquipmentManager.instance;
//				case ItemContainerID.EQUIP_MAKE:
//					return EquipMakeManager.instance;
//				case ItemContainerID.EQUIP_COMBINE:
//					return EquipCombineManager.instance;
//				case ItemContainerID.EQUIP_DESTORY:
//					return EquipDestoryManager.instance;
//				case ItemContainerID.EQUIP_REFINE:
//					return EquipRefineManager.instance;
//				case ItemContainerID.EQUIP_GENERAL:
//					return EquipGeneralChangeManager.instance;
				case ItemContainerID.Mount:
					return MountEquipmentManager.instance;
				case ItemContainerID.MOUNT_EQUIP:
					return MountEquipManager.instance;
				case ItemContainerID.MOUNT_FEED:
					return MountFeedManager.instance;
				case ItemContainerID.MOUNT_INTENSIFY:
					return MountIntensifyManager.instance;
				case ItemContainerID.MOUNT_SPELLS:
					return MountSpellsManager.instance;
				case ItemContainerID.MOUNT_SLOT:
					return MountSlotManager.instance;
				case ItemContainerID.MOUNT_INHERTIT:
					return MountInheritManager.instance;
			}
			return null;
		}
		
		public static function addItem(containerId:int,info:ItemInfo):void
		{
			return getMrg(containerId).addItem(info);
		}
		
		public static function getItemInfo(containerId:int, index:int):ItemInfo
		{
			return getMrg(containerId).getItemInfoByIndex(index);
		}
		
		public static function isUnlock(containerId:int, index:int):Boolean
		{
			return getMrg(containerId).isUnlock(index);
		}
		
		/**
		 * 设置格子物品数据 
		 * @param container			参考：ItemContainerID
		 * @param index
		 * @param item 为空时表示删除此格物品
		 * @return 
		 * 
		 */		
		public static function setItemInfo( containerId:int, index:int, item:ItemInfo=null):void
		{
			return getMrg(containerId).setItemByIndex(index, item);
		}
		
		public static function setAllItem(containerId:int, items:Array):void
		{
			return getMrg(containerId).setAllItem(items);
		}
		
		public static var waitingDropItem:ItemInfo;
		public static function dropItem(item:ItemInfo):void
		{
			if(waitingDropItem != null)
			{
				return;
			}
			if(!item.canDelete)
			{
				GameAlert.showAlertUtil(LangAlertInfo.ITEM_CANT_DELETE,null,item.name);
				return;
			}
			if(item.isPreciousItem)
			{
				GameAlert.showAlertUtil(LangAlertInfo.ITEM_IS_PRECIOUS,null,item.name);
				return;
			}
			if(getMrg(item.containerID).getIsShowBindLock() == true)
			{
//				GameAlert.debugShow("这个时候不能丢弃物品");
				return;
			}
			waitingDropItem = item;
			GameAlert.showAlertUtil(LangAlertInfo.DELETE_ITEM,onDeleteItemClick);
		}
		
		private static function onDeleteItemClick(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					onDeleteItem();
					break;
				case AlertClickTypeEnum.TYPE_CANCEL:
					onDeleteItemFail();
					break;
			}
		}
		
		private static function onDeleteItem():void
		{
			ItemSender.reqDropGoods(waitingDropItem.containerID,waitingDropItem.index, waitingDropItem.cfgId);
		}
		
		private static function onDeleteItemFail():void
		{
			waitingDropItem = null;
		}
		/**设置容器是否显示锁定**/
		public static function setShowLockAssetIndex(container:int,index:int):void
		{
			getMrg(container).setShowLockAssetIndex(index);
		}
		/**添加锁定**/
		public static function setIsShowBindLock(container:int,value:Boolean):void
		{
			getMrg(container).setIsShowBindLock(value);
		}
		/**获取锁定**/
		public static function getIsShowLockAsset(container:int,index:int):Boolean
		{
			return getMrg(container).getIsShowLockAsset(index);
		}
		/**取消锁定**/
		public static function removeLockAssetByIndex(container:int,index:int):void
		{
			getMrg(container).removeLockAssetByIndex(index);
		}
		
		/**
		 *刷新指定物品下标的所有物品（防止有些操作可能会使物品下标和实际下标不相同，那就刷新一下这些下标的物品 
		 * @param container
		 * @param index
		 * 
		 */		
		public static function refleshGridByItemIndex(container:int,index:int):void
		{
			GoodsContainerMamager.getMrg(container).refleshGridByItemIndex(container,index);
		}
		
		/**
		 * 解锁格子配置数据 
		 * @param allUnlockData
		 * 
		 */		
		public static function setUnlockDataConfig(allUnlockData:AllGoodsContainerUnlockProto):void
		{
			BackPackManager.instance.setUnlockData(allUnlockData);
//			StorageManager.instance.setUnlockData(allUnlockData.storageDatas);
		}
		
		public static function setUnlocked(containerID:int, index:int):void
		{
			getMrg(containerID).setUnlocked(index);
			setItemInfo(containerID, index, null);
		}

	}	
}


