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
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.ItemSender;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.view.icon.DragDropItem;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.GridOpenCfg;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.clientConfig.Q_backpack_grid;
	import com.rpgGame.coreData.clientConfig.Q_global;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.enum.item.ItemChangeType;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.item.ItemGridUnlockInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.info.item.UpgradeItemData;
	import com.rpgGame.coreData.info.item.UpgradeItemInfo;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.info.upgrade.UpgradeGoodsInfo;
	import com.rpgGame.coreData.info.upgrade.UpgradeProtoInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.backpack.message.ResChangeBindItemMessage;
	import com.rpgGame.netData.backpack.message.ResChangeLimitItemMessage;
	
	import flash.utils.Dictionary;
	
	import app.message.GoodsType;
	
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;
	
	/**
	 * 物品容器管理器
	 * @author wewell@163.com
	 */
	public class GoodsContainerMamager
	{
		protected var containerId:int;
		
		/** 已经开启个数 */
		public var hasOpenCount:int;
		public var Max_Grid_Count:int = 126;
		
		/** 解锁位置*/
		public var curUnlockIndex:int;
		/**当前待解锁的开格时间*/
		public var unlockTime : int;
		
		/**此处type为背包或者仓库table栏的分类  非物品type*/
		protected var CUR_TYPE:uint;
		protected var isSellItem:Boolean = false;//是否在出售
		/** 与当前等级最接近的药 **/
		//	private var _drugShopInfo:ShopItemData = null;
		/** 所有药品id **/
		private var _drugList:Array = [];
		
		protected var _goodsList:Array;
		
		/**用于背包这样当前显示的标签页物品list*/
		private var _curShowList:Array;
		
		/** 物品是否可用[index-->enable] **/
		private var goodsEnableDict:Dictionary;
		/** 是否显示绑定物品的锁定图片**/
		public var isShowBindLock : Boolean = false;
		private var _showLockAssetIndex : Array;
		//---------------用于赛选物品的数据
		private var _checkGroup : Array;
		private var _checkType : Array;
		private var _checkQuality : Array;
		/** 区分装备类型（人物装备还是坐骑装备） **/
		private var _checkEquipType:Array;
		
		private var _gridInfoDatas:ListCollection;
		
		public function GoodsContainerMamager(containerID:int)
		{
			this.containerId = containerID;
			
			_goodsList = [];
			goodsEnableDict = new Dictionary();
			var id:int;
			switch(this.containerId){
				case ItemContainerID.BackPack:
					id=18;
					break;
				case ItemContainerID.Storage:
					id=20;
					break;
			}
			var global:Q_global=GlobalSheetData.getSettingInfo(id);
			if(global){
				Max_Grid_Count=global.q_int_value;
			}
		}
		
		public function isEquip(cfg:Q_item):Boolean
		{
			if(cfg.q_type==GoodsType.EQUIPMENT||cfg.q_type==GoodsType.EQUIPMENT1||cfg.q_type==GoodsType.EQUIPMENT2){
				return true;
			}
			return false;
		}
		
		/**
		 *背包格子数据集 
		 * @return 
		 * 
		 */
		public function get gridInfoDatas():ListCollection
		{
			if(!_gridInfoDatas){
				_gridInfoDatas=new ListCollection();
			}
			return _gridInfoDatas;
		}
		
		/**
		 *设置背包格子数
		 * @param num
		 * 
		 */
		public function setGridNum(num:int):void
		{
			if(!_gridInfoDatas){
				_gridInfoDatas=new ListCollection();
			}
			var currentNum:int=_gridInfoDatas.length;
			if(currentNum>=num){
				return;
			}
			var createNum:int=num-currentNum;
			for(var i:int=0;i<createNum;i++){
				var gridInfo:GridInfo = new GridInfo(containerId, i);
				_gridInfoDatas.push(gridInfo);
			}
		}
		
		public function set showLockAssetIndex(value:Array):void
		{
			_showLockAssetIndex = value;
		}
		
		/** 额外的需要显示红色锁定的物品的下标**/
		public function get showLockAssetIndex():Array
		{
			return _showLockAssetIndex;
		}
		
		public function get checkType():Array
		{
			return _checkType;
		}
		
		public function setIsShowBindLock(value:Boolean,lockUseMove:Boolean = true):void
		{
			if(value == isShowBindLock)
				return;
			isShowBindLock = value;
			if(!_showLockAssetIndex)
				_showLockAssetIndex = [];
			else
				_showLockAssetIndex.length = 0;
			EventManager.dispatchEvent(ItemEvent.ITEM_CONTAINER_REFLESH, containerId);
		}
		
		public function getIsShowBindLock():Boolean
		{
			return isShowBindLock;
		}
		
		public function setShowLockAssetIndex(index:int):void
		{
			if(!_showLockAssetIndex || !isShowBindLock)
				return;
			if(_showLockAssetIndex.indexOf(index) != -1)
				return;
			_showLockAssetIndex.push(index);
			EventManager.dispatchEvent(ItemEvent.ITEM_CHANG, getItemInfoByIndex(index));
		}
		
		public function getIsShowLockAsset(index:int):Boolean
		{
			if(!isShowBindLock)
				return false;
			if(_showLockAssetIndex && _showLockAssetIndex.indexOf(index) != -1)
			{
				return true;
			}
			var item : ClientItemInfo = getItemInfoByIndex(index);
			if(item && item.binded)
			{
				return true;
			}
			return false;
		}
		
		public function removeLockAssetByIndex(index:int):void
		{
			if(!_showLockAssetIndex || !isShowBindLock)
				return;
			if(_showLockAssetIndex.indexOf(index) == -1)
				return;
			_showLockAssetIndex.splice(_showLockAssetIndex.indexOf(index),1);
			EventManager.dispatchEvent(ItemEvent.ITEM_CHANG, getItemInfoByIndex(index));
		}
		
		/**
		 * 初始化物品容器信息 
		 * @param cellnum
		 * @param items
		 * 
		 */
		public function setItemsInfo(cellnum:int,items:Vector.<ItemInfo>):void
		{
			hasOpenCount = cellnum;
//			curUnlockIndex = hasOpenCount;
			
			_goodsList=[];
			for(var i:int=0; i<items.length; i++)
			{
				var info:ClientItemInfo =  ItemUtil.convertClientItemInfo(items[i]);
				info.setContainerId(containerId);
				_goodsList[info.index] =  info;
			}
			setEnabledAll(true);
			EventManager.dispatchEvent(ItemEvent.ITEM_INIT,containerId);
			switch(containerId){
				case ItemContainerID.BackPack:
					ItemSender.isReqPack=true;
					checkBackGrdi();
					break;
				case ItemContainerID.Storage:
					ItemSender.isReqStorage=true;
					break;
				case ItemContainerID.Role:
					ItemSender.isReqRole=true;
					break;
			}
		}
		
		private function checkBackGrdi():void
		{
			if(containerId!=ItemContainerID.BackPack){//只检测背包的
				return;
			}
			var leftGrid:int=hasOpenCount-useGridLen();
			EventManager.dispatchEvent(ItemEvent.LEFT_GRID_CHANG,leftGrid);
		}
		
		/**
		 *改变物品 
		 * @param msg
		 * 
		 */
		public function removeItem(gridId:Number):void
		{
			removeItemByIndex(gridId);
		}
		
		public function removeItems(grids:Vector.<int>):void
		{
			var removeList:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			for(var i:int=0;i<grids.length;i++){
				removeList.push(removeItemByIndex(grids[i]));
			}
			EventManager.dispatchEvent(ItemEvent.ITEM_REMOVE_LIST,removeList);
		}
		
		/**
		 *改变物品 
		 * @param msg
		 * 
		 */
		public function changItem(item:ItemInfo,type:int=4):void
		{
			var info:ClientItemInfo=ItemUtil.convertClientItemInfo(item);
			info.setContainerId(containerId);
			
			switch(type){
				//?为毛之前要走添加？
				case ItemChangeType.ADD_ITEM:
					//addItemInfo(info);
					_goodsList[info.index] = info;
					EventManager.dispatchEvent(ItemEvent.ITEM_CHANG,info);
					break;
				case ItemChangeType.MOVE_ITEM:
					_goodsList[info.index] = info;
					EventManager.dispatchEvent(ItemEvent.ITEM_CHANG,info);
					break;
				case ItemChangeType.DELETE_ITEM:
					_goodsList[info.index] = info;
					EventManager.dispatchEvent(ItemEvent.ITEM_CHANG,info);
					break;
				case ItemChangeType.CHANGE_ITEM:
					_goodsList[info.index] = info;
					EventManager.dispatchEvent(ItemEvent.ITEM_CHANG,info);
					break;
			}
			
			checkBackGrdi();
		}
		
		
		/**
		 *改变限制 
		 * @param msg
		 * 
		 */
		public function changItemLimit(msg:ResChangeLimitItemMessage):void
		{
			var all:Array=getAllItem();
			for each( var info:ClientItemInfo in all){
				if(msg.itemModelId==info.qItem.q_id){//将id一样的物品全部替换
					info.itemInfo.limitType=msg.limitType;
					info.itemInfo.limitNum=msg.limitNum;
					info.itemInfo.limitValue=msg.limitValue;
				}
			}
		}
		
		
		/**
		 *改变绑定 
		 * @param gridId
		 * @param isbind
		 * 
		 */
		public function changItemBind(msg:ResChangeBindItemMessage):void
		{
			var info:ClientItemInfo=_goodsList[msg.itemGridId];
			if(info){
				info.itemInfo.isbind=msg.isBind;
			}
		}
		
		/**
		 * 添加物品
		 * @param data
		 * 
		 */
		public function addItem(item:ItemInfo):void
		{
			var info:ClientItemInfo=ItemUtil.convertClientItemInfo(item);
			info.setContainerId(containerId);
			addItemInfo(info);
		}
		
		public function addItemInfo(info:ClientItemInfo):void
		{
			_goodsList[info.index] = info;
			EventManager.dispatchEvent(ItemEvent.ITEM_ADD,info);
			checkBackGrdi();
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
		
		
		public function setItemByIndex(index:int, info:ClientItemInfo):void
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
				addItemInfo(info);
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
			for each(var info:ClientItemInfo in _goodsList)
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
			{
				_curShowList = goods;
				return goods;//并没有赛选
			}
			var result : Array = [];
			for each(var item:ClientItemInfo in goods)
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
			
			_curShowList = result;
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
		
		public function getEmptyGridNum():int
		{
			var len:int = _goodsList.length;
			var num:int=0;
			for(var i:int=0; i<hasOpenCount; i++)
			{
				if(!_goodsList[i])
				{
					num++;
				}
			}
			return num;
		}
		
		/**
		 * 是不是还有空的格子 
		 * @return 
		 * 
		 */		
		public function haveEmptyGrid():Boolean
		{
			return getFirstEmptyIndex() != -1;
		}
		
		
		public function removeItemByIndex(index:int):ClientItemInfo
		{
			var info:ClientItemInfo = getItemInfoByIndex(index);
			if(!info){
				return null;
			}
			_goodsList[index] = null;
			if(info.containerID==ItemContainerID.Role){
				EventManager.dispatchEvent(ItemEvent.UNWEAR_EQUIPITEM,info);//卸载装备
			}else{
				EventManager.dispatchEvent(ItemEvent.ITEM_REMOVE,info);			
			}
			checkBackGrdi();
			return info;
		}
		
		
		/**
		 * 通过容器格子index获取对应的物品数据
		 * 如果没有的话则会返回null
		 * */
		public function getItemInfoByIndex(index:int):ClientItemInfo
		{
			return index <_goodsList.length ? _goodsList[index] : null;
		}
		
		public function getCurItemInfoByIndex(index:int):ClientItemInfo
		{
			return index <_curShowList.length ? _curShowList[index] : null;
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
		public function getBagItemsByID(itemID:uint):Vector.<ClientItemInfo>
		{
			var items:Vector.<ClientItemInfo> = new Vector.<ClientItemInfo>();
			for each(var info:ClientItemInfo in _goodsList)
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
			for each(var info:ClientItemInfo in _goodsList)
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
			for each(var info:ClientItemInfo in _goodsList)
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
		public function getFirstCanUseItemByCfgId(cfgId:uint):ClientItemInfo
		{
			var itemValues:Array = _goodsList;
			for each(var info:ClientItemInfo in itemValues)
			{
				if(info && info.cfgId == cfgId && (info.expireTime == 0 || isCanUse(info)))
				{
					return info;
				}
			}
			return null;
		}
		
		public function getFirstCanUseItemByCfgIdAndBind(cfgId:uint,bind:Boolean):ClientItemInfo
		{
			var itemValues:Array = _goodsList;
			for each(var info:ClientItemInfo in itemValues)
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
			for each(var info:ClientItemInfo in _goodsList)
			{
				if(info && info.cfgId == itemID && !isExpirt(info.expireTime))
				{
					countNum += info.count;
				}
			}
			return countNum;
		}
		/**
		 * 通过物品类型拿到第一个物品的位置 
		 * 
		 */		
		public function getItemIndexByType(type:int):int
		{
			var items:Array = [];
			for each (var itemInfo:ClientItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.type == type)
					return itemInfo.index;
			}
			return -1;
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
			for each (var itemInfo:ClientItemInfo in _goodsList) 
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
			for each (var itemInfo:ClientItemInfo in _goodsList) 
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
			for each (var itemInfo:ClientItemInfo in _goodsList) 
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
			for each (var itemInfo:ClientItemInfo in _goodsList) 
			{
				if(itemInfo && itemInfo.group == group)
					result += itemInfo.count;
			}
			return result;
		}
		
		//---------------排序-------------------
		
		protected function compareItemInfoSort(itemInfo1:ClientItemInfo,itemInfo2:ClientItemInfo):int
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
			var info:ClientItemInfo = getNearExpirtimeItemInfo(cfgID);
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
		private function getNearExpirtimeItemInfo(cfgID:int):ClientItemInfo
		{
			var info:ClientItemInfo = null;
			var itemList:Vector.<ClientItemInfo> = getBagItemsByID(cfgID);
			for each(var itemInfo:ClientItemInfo in itemList)
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
			var itemValues:Vector.<ClientItemInfo> = new Vector.<ClientItemInfo>();
			if( substituteGoods != null )
			{
				for each (var subCfgId:int in substituteGoods) 
				{
					var tmpVec:Vector.<ClientItemInfo> = getBagItemsByID(subCfgId);
					tmpVec = tmpVec.sort(sortItemByExpireTime);
					itemValues = itemValues.concat(tmpVec);
				}
			}
			
			tmpVec = getBagItemsByID(upgradeItemId);
			tmpVec = tmpVec.sort( sortItemByExpireTime );
			itemValues = itemValues.concat(tmpVec);
			for each(var info:ClientItemInfo in itemValues)
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
		
		private function sortItemByExpireTime(itemInfo1:ClientItemInfo, itemInfo2:ClientItemInfo):int
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
			for each(var info:ClientItemInfo in _goodsList)
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
		/*private function searchSuitDrugItem( isAutoBuy:Boolean ):ClientItemInfo
		{
		var itemInfoList:Array = _goodsList;
		var returnItem:ClientItemInfo;
		if( isAutoBuy )
		{
		for each(var item:ClientItemInfo in itemInfoList)
		{
		var cfgId:int = item.cfgId;
		var requireLevel:int = ItemConfig.getItemRequireLevel( cfgId ) ;
		var quality:int = ItemConfig.getItemQuality( cfgId );
		var cfgId1:int;
		var requireLevel1:int;
		var quality1:int;
		
		if(ItemConfig.isAddHpItem(cfgId) && MainRoleManager.actorInfo.totalStat.level >= requireLevel)
		{
		if( returnItem )
		{
		cfgId1 = returnItem.cfgId;
		requireLevel1 = ItemConfig.getItemRequireLevel( cfgId1 ) ;
		}
		else
		{
		cfgId1 = _drugShopInfo.itemInfo.cfgId;
		requireLevel1 = ItemConfig.getItemRequireLevel( cfgId1 ) - 1 ;
		}
		quality1 = ItemConfig.getItemQuality( cfgId1 );
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
		requireLevel = ItemConfig.getItemRequireLevel( cfgId ) ;
		
		if(ItemConfig.isAddHpItem(cfgId) && MainRoleManager.actorInfo.totalStat.level >= requireLevel)
		{
		quality = ItemConfig.getItemQuality( cfgId );
		if( returnItem )
		{
		requireLevel1 = ItemConfig.getItemRequireLevel( returnItem.cfgId );
		quality1 = ItemConfig.getItemQuality( returnItem.cfgId );
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
		public function isCanUse($info:ClientItemInfo):Boolean
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
		
		public function setCheckType(value:Array):void
		{
			_checkType = value;
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
			if(containerId==ItemContainerID.BackPack||containerId==ItemContainerID.Storage)
				return index > hasOpenCount-1;
			return false;
		}
		
		public function setUnlocked(index:int):void
		{
			hasOpenCount = index;
			//						unlockData.setUnlockedSize(hasOpenCount-initOpenCount);
			EventManager.dispatchEvent(ItemEvent.ITEM_GRID_UNLOCK, containerId,index-1);
		}
		
		/**如果是需要解锁格子的容器，需要重写这个方法**/
		public function unLockGrid(index:int):void
		{
			
		}
		/** 获取指定使用效果的物品 **/
		public function getItemInfoByUsabelEfficacy(type:int):ClientItemInfo
		{
			for each(var item : ClientItemInfo in _goodsList)
			{
				if(!item)
					continue;
				/*	if(item.getNormalUsableType == type)
				return item;*/
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
					//				case ItemContainerID.MOUNT_AUTHENTICATE:
					//					return MountAuthenticateManager.instance;
					//				case ItemContainerID.MOUNT_BEAST_CARD:
					//					return MountChangeManeger.instance;
			}
			return null;
		}
		
		public static function addItem(containerId:int,info:ClientItemInfo):void
		{
			return getMrg(containerId).addItemInfo(info);
		}
		
		public static function getItemInfo(containerId:int, index:int):ClientItemInfo
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
		public static function setItemInfo( containerId:int, index:int, item:ClientItemInfo=null):void
		{
			return getMrg(containerId).setItemByIndex(index, item);
		}
		
		public static function setAllItem(containerId:int, items:Array):void
		{
			return getMrg(containerId).setAllItem(items);
		}
		
		public static function dropItem(item:ClientItemInfo):void
		{
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
			EventManager.dispatchEvent(ItemEvent.ITEM_DISCARDED, item);
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
			if(!getMrg(container)){
				return false;
			}
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
		public static function setUnlockDataConfig(info:GridInfo):GridInfo
		{
			//			BackPackManager.instance.setUnlockData(allUnlockData);
			//			StorageManager.instance.setUnlockData(allUnlockData.storageDatas);
			switch(info.containerID)
			{
				case ItemContainerID.BackPack:
				{
					if(info.index>GoodsContainerMamager.getMrg(info.containerID).hasOpenCount-1&&info.index<=GoodsContainerMamager.getMrg(info.containerID).curUnlockIndex)
					{
						var id:String=getGridType(ItemContainerID.BackPack).toString()+"_"+(info.index+1);
						info.unlockInfo=setUnlockData(ItemContainerID.BackPack,id);
					}
					else
					{
						info.unlockInfo=null;
					}
					break;
				}
				case ItemContainerID.Storage:
				{
					if(info.index>GoodsContainerMamager.getMrg(info.containerID).hasOpenCount-1&&info.index<=GoodsContainerMamager.getMrg(info.containerID).curUnlockIndex)
					{
						id=getGridType(ItemContainerID.Storage).toString()+"_"+(info.index+1);
						info.unlockInfo=setUnlockData(ItemContainerID.Storage,id);
					}
					else
					{
						info.unlockInfo=null;
					}
					break;
				}
			}
			return info;
		}
		
		/**设置待解锁格子数据*/
		private static function setUnlockData(containerId:int,id:String):ItemGridUnlockInfo
		{
			var unlockInfo:ItemGridUnlockInfo=new ItemGridUnlockInfo();
			unlockInfo.setdate(containerId,id);
			return unlockInfo;
		}
		
		public static function setUnlocked(containerID:int, index:int):void
		{
			getMrg(containerID).setUnlocked(index);
			setItemInfo(containerID, index-1, null);
		}
		
		/**获取格子类型
		 * @param 1_背包 2_仓库 3_寻宝仓库（暂时没得）
		 * */
		public static function getGoodsType(type:int):int
		{
			switch(type){
				case 1: return ItemContainerID.BackPack;
				case 2: return ItemContainerID.Storage;
			}		
			return ItemContainerID.BackPack;
		}
		
		/**依据格子类型获取类型
		 * @param 1_背包 2_仓库 3_寻宝仓库（暂时没得）
		 * */
		public static function getGridType(containerID:int):int
		{
			switch(containerID){
				case ItemContainerID.BackPack: return 1;
				case ItemContainerID.Storage: return 2;
			}		
			return 1;
		}
		
		/**
		 * 计算开格需要的钱
		 * */
		public static function getOpenGridMoney(containerID:int, index:int):int
		{
			var pice:int=0;
			var type:int=getGridType(containerID);
			var starindex:int=getMrg(containerID).curUnlockIndex+1;
			for(var i:int=starindex;i<=index;i++)
			{
				var id:String=type+"_"+i;
				var cfg:Q_backpack_grid=GridOpenCfg.getCfgById(id);
				if(cfg){
					pice+=cfg.q_cost;
				}
			}
			return pice;
		}
		
		/**设置待开启格子*/
		public function setGridUnLuck(index:int,tiem:int):void
		{
			curUnlockIndex=index-1;
			unlockTime=tiem;
			updateTime();
			if(curUnlockIndex>hasOpenCount-1){
				AppManager.showAppNoHide(AppConstant.GRID_OPEM);
			}
			EventManager.dispatchEvent(ItemEvent.ITEM_GRID_ONLOCK,this.containerId);
			TimerServer.addLoop(updateTime,1000);
		}
		
		private function updateTime():void
		{
			unlockTime--;
			if(unlockTime<=0)	{
				TimerServer.remove(updateTime);
				unlockTime=0;
				//				AppManager.showAppNoHide(AppConstant.GRID_OPEM);
			}
		}	
	}	
}


