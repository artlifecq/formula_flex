package com.rpgGame.app.manager.stall
{
	import com.game.engine3D.vo.map.ClientMapAreaData;
	import com.game.engine3D.vo.map.ClientMapAreaGridData;
	import com.game.engine3D.vo.map.MapAreaTypeEnum;
	import com.netease.protobuf.Int64;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.StallSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.ui.alert.AlertText;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.StallEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StallCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.stall.StallBuyTreeItem;
	import com.rpgGame.coreData.info.stall.StallData;
	import com.rpgGame.coreData.info.stall.StallItemData;
	import com.rpgGame.coreData.info.stall.StallTypeData;
	import com.rpgGame.coreData.lang.LangStall;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.MoneyUtil;
	import com.rpgGame.coreData.utils.TreeUtils;
	
	import app.cmd.StallModuleMessages;
	import app.message.AmountType;
	import app.message.ChangeToBuyGoodsType;
	import app.message.ChangeToSellGoodsType;
	import app.message.StallBuyGoodsDataProto;
	import app.message.StallBuyGoodsProto;
	import app.message.StallDetailProto;
	import app.message.StallModuleObjProto;
	import app.message.StallSellGoodsProto;
	import app.message.StallTypeDataProto;
	
	import feathers.data.TreeNode;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;

	/**
	 * 摆摊管理
	 * @author mandragora
	 * 
	 */
	public class StallManager
	{
		public function StallManager()
		{
		}
		public static const MAX_STALL_GRID : int = 16;
		public static var selfStallData : StallData;
		public static var isOnStall : Boolean;
		public static var stallTypeDatas:HashMap;
		public static var stallEndTime : Number;
		private static var _seeStallPlayerId : Number;
		/**
		 * 用于记录广播过来的那些摆摊的人 
		 */		
		public static var stallHash : HashMap = new HashMap();;
		
		private static var stallInfo : Array = [];
		/**
		 * 准备摆摊的一些数据，并且打开摆摊面板 
		 * 
		 */		
		public static function readyStall():void
		{
			var clientMapdatas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getStallAreas();
			if(! clientMapdatas|| clientMapdatas.length == 0 )
			{
				NoticeManager.showNotify(LangStall.dontInStallMap);
				return;
			}
			if(AreaMapManager.getRoleInMapDataAreaType(MainRoleManager.actor)!=MapAreaTypeEnum.STALL)
			{
				GameAlert.showAlertUtil(LangStall.dontInStallArea,gotoStartStall);
				return;
			}
			var selfArea : ClientMapAreaData = AreaMapManager.getRoleInMapDataArea(MainRoleManager.actor);
			if(!selfArea)
				return;
			var clientMapAreaGrid : ClientMapAreaGridData = selfArea.getPosInGrid(MainRoleManager.actor.x,MainRoleManager.actor.z);
			if(!clientMapAreaGrid)
			{
				trace("当前格子不能摆摊。");
				return;
			}
			var selfGridStall : StallData = getStallDataByStallId(clientMapAreaGrid.id);
			if(selfGridStall && selfGridStall.playerId != MainRoleManager.actorID)
			{
				GameAlert.showAlertUtil(LangStall.cantStartStallChangeId,gotoStartStall);
				return;
			}
			if(!selfStallData)
			{
				selfStallData = getBaseStallData();
				var stallType : StallTypeDataProto = StallCfgData.getFristStallType();
				selfStallData.stallType = stallType?stallType.type:0;
				selfStallData.playerId = MainRoleManager.actorID;
				selfStallData.stallName = MainRoleManager.actorInfo.name+"的摊位";
			}
			if(!isOnStall)
				selfStallData.clearStall();
			selfStallData.stallId = clientMapAreaGrid.id;
			seeStallPlayerId = MainRoleManager.actorID;
			AppManager.showAppNoHide(AppConstant.STALL_PANEL);
		}
		
		public static function gotoStartStall(gameAlert:GameAlert):void
		{
			if(gameAlert.clickType != AlertClickTypeEnum.TYPE_SURE)
				return;
			var clientMapdatas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getStallAreas();
			if(!clientMapdatas || clientMapdatas.length == 0)
				return;
			var clientMapArea : ClientMapAreaData = clientMapdatas[0];
			if(!clientMapArea)
				return;
			gotoStallDontHavePlayer();
		}
		
		private static function gotoStallDontHavePlayer():void
		{
			var clientMapdatas : Vector.<ClientMapAreaData> = SceneManager.clientMapData.getStallAreas();
			if(!clientMapdatas || clientMapdatas.length == 0)
				return;
			var clientMapArea : ClientMapAreaData;
			var clientMapAreaGrid : ClientMapAreaGridData;
			for each(clientMapArea in clientMapdatas)
			{
				if(!clientMapArea)
					continue;
				for each(clientMapAreaGrid in clientMapArea.grids)
				{
					if(!getStallDataByStallId(clientMapAreaGrid.id))
					{
						RoleStateUtil.walk(MainRoleManager.actor,clientMapAreaGrid.gridX,clientMapAreaGrid.gridY);
						return;
					}
				}
			}
		}
		
		public static function reqStartStall():void
		{
			if(isOnStall)
			{
				StallSender.cancelStall();
				return;
			}
			var mapData : ClientMapAreaData = AreaMapManager.getRoleInMapDataArea(MainRoleManager.actor);
			if(!mapData)
			{
				return;
			}
			var clientMapAreaGrid : ClientMapAreaGridData = mapData.getPosInGrid(MainRoleManager.actor.x,MainRoleManager.actor.z);
			if(clientMapAreaGrid)
			{
				selfStallData.stallId = clientMapAreaGrid.id;
				//摆摊的时候发现脚下的格子里面已经有人摆摊了，那就提示重新寻路。
				var selfGridStall : StallData = getStallDataByStallId(clientMapAreaGrid.id);
				if(selfGridStall && selfGridStall.playerId != MainRoleManager.actorID)
				{
					GameAlert.showAlertUtil(LangStall.cantStartStallChangeId,gotoStartStall);
					return;
				}
			}
//			if(ReqLockUtil.isReqLocked(StallModuleMessages.C2S_STALL,true))
//				return;
//			ReqLockUtil.lockReq(StallModuleMessages.C2S_STALL,3000);
			StallSender.stall(selfStallData);
		}
		
		public static function startStall():void
		{
			if(!selfStallData)
			{
				trace("还没有初始数据，就申请摆摊了，有问题");
				return;
			}
			isOnStall = true;
			updateStallTime();
			if(tempAutoAd!="")
				onSetAutoAdComplete(tempAutoAd);
			stallInfo.length = 0;
			addStallInfo(LanguageConfig.getText(LangStall.infoStartStall,TimeUtil.getCurrentTimeFromt()));
			AppManager.hideApp(AppConstant.STALL_PANEL);
			AppManager.hideApp(AppConstant.BACK_PACK_PANEL);
		}
		
		private static function updateStallTime():void
		{
			if(!selfStallData)
				return;
			selfStallData.startStallTime = SystemTimeManager.curtTm;
			var stallTypeData : StallTypeData = stallTypeDatas.getValue(selfStallData.stallType);
			if(!stallTypeData)
				return;
			selfStallData.endStallTime = SystemTimeManager.curtTm + stallTypeData.leftTime;
		}
		
		public static function cancelStall():void
		{
			if(!selfStallData)
			{
				trace("还没有初始数据，有问题");
				return;
			}
			cancelStallBroadcast(MainRoleManager.actorID);
			isOnStall = false;
			selfStallData = null;
			AppManager.hideApp(AppConstant.STALL_PANEL);
		}
		
		public static var isAutoAd : Boolean;
		private static var autoAd : String = LanguageConfig.getText(LangStall.autoAdString);
		private static var tempAutoAd:String;
		private static var startAutoAdTime : Number = 0;
		private static var nextAutoAdTime : Number = 0;
		public static function setAutoAd():void
		{
			AlertText.showAlert("自动喊话",autoAd,onSetAutoAdComplete);
		}
		
		private static function onSetAutoAdComplete(str:String):void
		{
			if(str == LanguageConfig.getText(LangStall.autoAdString))
			{
				NoticeManager.showNotify(LangStall.setAutoAdFail);
				return;
			}
			tempAutoAd = str;
			if(isOnStall && str!=null )
				StallSender.setAutoAd(true,str);
		}
		
		public static function setAutoAdComplete():void
		{
			autoAd = tempAutoAd;
			tempAutoAd = "";
			NoticeManager.showNotify(LangStall.setAutoAdComplete);
			isAutoAd = true;
			EventManager.dispatchEvent(StallEvent.STALL_AUTO_AD_CHANGE);
			startAutoAdTime = SystemTimeManager.curtTm;
			nextAutoAdTime = startAutoAdTime + getAutoAdDuration();
		}
		
		public static function getNextAutoAdTime():Number
		{
			var systemTime : Number = SystemTimeManager.curtTm;
			var duration : Number = getAutoAdDuration();
			var i : int = 0;
			while(nextAutoAdTime<systemTime)
			{
				nextAutoAdTime = startAutoAdTime + i * duration;
				i++;
			}
			return nextAutoAdTime;
		}
		
		public static function cancelAutoAdComplete():void
		{
			isAutoAd = false;
			NoticeManager.showNotify(LangStall.cancelAutoComplete);
			EventManager.dispatchEvent(StallEvent.STALL_AUTO_AD_CHANGE);
		}
		
		public static function canAutoAd():Boolean
		{
			if(!selfStallData || !seeIsSelfStall())
				return false;
			var stallType : StallTypeDataProto = StallCfgData.getStallTypeData(selfStallData.stallType);
			if(!stallType)
				return false;
			return stallType.adMaxLength;
		}
		
		public static function getAutoAdDuration():Number
		{
			if(!selfStallData)
				return 0;
			var stallType : StallTypeDataProto = StallCfgData.getStallTypeData(selfStallData.stallType);
			if(!stallType)
				return 0;
			return stallType.broadcastAdDuration?stallType.broadcastAdDuration.toNumber():0;
		}
		
		//-----------------------------剩余时间的-------------------------------
		public static function setupStallModuleObj(proto:StallModuleObjProto):void
		{
			if(!proto || !proto.stallTypeLeftTime)
				return;
//			var stallType : StallTypeDataProto;
//			var stallTypeArray : Array = StallCfgData.typeHash.getValues();
			stallTypeDatas = new HashMap();
			for(var i : int = 0; i < proto.stallTypeLeftTime.length; i++)
			{
//				stallType = stallTypeArray[i];
				var stallTypeData : StallTypeData = new StallTypeData();
				stallTypeData.type = i;
				stallTypeData.leftTime = (proto.stallTypeLeftTime[i] as Int64)?(proto.stallTypeLeftTime[i] as Int64).toNumber():0;
				stallTypeDatas.add(i,stallTypeData);
			}
		}
		
		//-------------------------------出售物品部分的---------------------------
		public static function reqUpdateSellGoods(stallItem:StallItemData):void
		{
			if(isOnStall)
			{
				//已经摆摊了走协议，没有开始就是客户端自己处理
				StallSender.changeSellGoods(stallItem.index,ChangeToSellGoodsType.SELL_GOODS_CHANGE_COUNT_OR_PRICE,stallItem);
			}else
			{
				setSellGoods(stallItem);
			}
		}
		
		public static function reqSetSellGoods(stallItem:StallItemData):void
		{
			if(isOnStall)
			{
				//已经摆摊了走协议，没有开始就是客户端自己处理
				StallSender.changeSellGoods(stallItem.index,ChangeToSellGoodsType.SELL_GOODS_UP_NEW,stallItem);
			}else
			{
				setSellGoods(stallItem);
			}
		}
		
		public static function setSellGoods(stallItem : StallItemData):void
		{
			if(stallItem && selfStallData)
			{
				selfStallData.stallSellList[stallItem.index] = stallItem;
				EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
				if(stallItem.num>0)
					GoodsContainerMamager.setShowLockAssetIndex(ItemContainerID.BackPack,stallItem.bagIndex);
				else
					GoodsContainerMamager.removeLockAssetByIndex(ItemContainerID.BackPack,stallItem.bagIndex);
			}
		}
		
		public static function reqCloseSellGoods(index:int):void
		{
			if(isOnStall)
			{
				//已经摆摊了走协议，没有开始就是客户端自己处理
				StallSender.changeSellGoods(index,ChangeToSellGoodsType.SELL_GOODS_DOWN,null);
			}else
			{
				closeSellGoods(index);
			}
		}
		
		public static function closeSellGoods(index:int):void
		{
			if(index<selfStallData.stallSellList.length)
			{
				var stallItem : StallItemData = selfStallData.stallSellList[index];
				if(stallItem)
				{
					GoodsContainerMamager.removeLockAssetByIndex(ItemContainerID.BackPack,stallItem.bagIndex);
					stallItem.clear();
					EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
				}
			}
		}
		
		public static function updateStallSellItemByProto(index:int,proto:StallSellGoodsProto):void
		{
			if(index<selfStallData.stallSellList.length)
			{
				var stallItem : StallItemData = selfStallData.stallSellList[index];
				if(stallItem)
				{
					stallItem.setupSellProto(proto);
					EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
				}
			}
		}
		//---------------------------------收购物品------------------------------
		
		public static function reqSetBuyStallItem(stallItem : StallItemData):void
		{
			if(isOnStall)
			{
				StallSender.changeBuyGoods(stallItem.index,ChangeToBuyGoodsType.BUY_GOODS_UP_NEW,stallItem);
			}else
			{
				setBuyStallItem(stallItem);
			}
		}
		
		public static function setBuyStallItem(stallItem : StallItemData):void
		{
			if(stallItem)
			{
				if(stallItem.index<selfStallData.stallBuyList.length)
				{
					selfStallData.stallBuyList[stallItem.index] = stallItem;
					EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
				}
			}
		}
		
		public static function reqCloseBuyStallItem(index:int):void
		{
			if(isOnStall)
			{
				StallSender.changeBuyGoods(index,ChangeToBuyGoodsType.BUY_GOODS_DOWN,null);
			}else
			{
				closeBuyStallItem(index);
			}
		}
		
		public static function closeBuyStallItem(index:int):void
		{
			if(index<selfStallData.stallBuyList.length)
			{
				var stallItem : StallItemData = selfStallData.stallBuyList[index];
				if(stallItem)
				{
					stallItem.clear();
					EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
					
				}
			}
		}
		
		public static function reqUpdateBuyStallItem(stallItem : StallItemData):void
		{
			if(isOnStall)
			{
				StallSender.changeBuyGoods(stallItem.index,ChangeToBuyGoodsType.BUY_GOODS_CHANGE_COUNT_OR_PRICE_OR_GOODS,stallItem);
			}else
			{
				setBuyStallItem(stallItem);
			}
		}
		
		public static function updateStallBuyItemByProto(index:int,proto:StallBuyGoodsProto):void
		{
			if(index<selfStallData.stallSellList.length)
			{
				var stallItem : StallItemData = selfStallData.getStallBuyIndex(index);;
				if(stallItem)
				{
					stallItem.setupBuyProto(proto);
					EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
				}
			}
		}
		
		public static function buyItemComplete(index:int,itemId:int,haveItem:int,price:int):void
		{
			if(!selfStallData)
				return;
			var stallItem : StallItemData = selfStallData.getStallBuyIndex(index);
			if(stallItem&&stallItem.itemId==itemId)
			{
				var itemName : String = ItemConfig.getItemName(itemId);
				NoticeManager.showNotify(LangStall.buyStallItemComplete,itemName,haveItem);
				stallItem.num = stallItem.num - haveItem;
				stallItem.price = price;
				addStallInfo(LanguageConfig.getText(LangStall.infoBuyGoods,
					TimeUtil.getCurrentTimeFromt(),
					itemName,
					haveItem,
					MoneyUtil.getHtmlMoneyString(haveItem*price)));
				if(stallItem.num == 0)
				{
					stallItem.item = null;
					NoticeManager.showNotify(LangStall.buyStallItemComplete2,itemName);
				}
				
				EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
			}
		}
		
		//////------------------------------更改类型的---------------------------
		public static function reqChangeStallType(type:int):void
		{
			if(isOnStall)
			{
				StallSender.changeStallType(type);
			}else
			{
				changeStallType(type);
			}
		}
		
		public static function changeStallType(type:int):void
		{
			if(selfStallData)
			{
				selfStallData.stallType = type;
				AppManager.hideApp(AppConstant.STALL_CHANGE_TYPE_PANEL);
				EventManager.dispatchEvent(StallEvent.STALL_TYPE_CHANGE);
			}
		}
		
		//-------------------------购买摊位类型时间--------------------
		public static function buyStallType(type:int,time:Number):void
		{
			var stallType : StallTypeData = stallTypeDatas.getValue(type);
			if(!stallType)
				return;
			trace("购买时间成功了");
			if(isOnStall && selfStallData.stallType == type)
			{
				stallType.leftTime = time - (SystemTimeManager.curtTm - selfStallData.startStallTime);
				updateStallTime();
			}else
			{
				stallType.leftTime = time;
			}
			EventManager.dispatchEvent(StallEvent.STALL_TYPE_CHANGE);
		}
		
		//--------------------------广播类型的--------|---------
		public static function stallBroadcast(stallData:StallData):void
		{
			if(!stallData)
				return;
			//留一个创建摊位的,如果已经有摊位了，就更新一下这个摊位的外观之类的乱七八糟的数据
			SceneRoleManager.getInstance().createStall(stallData);
			setStallData(stallData);
			if(stallData.playerId == seeStallPlayerId)
			{
				updateStallTime();
				EventManager.dispatchEvent(StallEvent.STALL_TYPE_CHANGE);
			}
		}
		
		public static function cancelStallBroadcast(player:Number):void
		{
			var stallData : StallData = getStallDataByPlayerId(player);
			if(!stallData)
			{
				trace("没有这个玩家在摆摊啊，为什么要取消？");
				return;
			}
			if(seeStallPlayerId == player)
			{
				AppManager.hideApp(AppConstant.STALL_PANEL);
			}
			if(player == MainRoleManager.actorID)
			{
				isOnStall = false;
				selfStallData = null;
				addStallInfo(LanguageConfig.getText(LangStall.infoCancelStall,TimeUtil.getCurrentTimeFromt()));
			}
			var owner : SceneRole = SceneManager.getSceneObjByID(stallData.playerId) as SceneRole;
			if(owner)
				owner.setCamouflageEntity(null);
			SceneRoleManager.getInstance().removeSceneRoleByIdAndType(stallData.stallId, SceneCharType.STALL);
			removeStallData(player);
		}
		/**
		 * 更新一个摊位的数据 
		 * @param player
		 * @param stallId
		 * @param stallType
		 * @param stallName
		 * 
		 */		
		public static function updateStallBroadcast(player:Number,stallId:int,stallType:int,stallName:String):void
		{
			var stallData : StallData = getStallDataByPlayerId(player);
			if(!stallData)
			{
				//如果没有数据，那就是刚刚开始摆摊的，所以创建一份数据
				stallData = getBaseStallData();
				stallHash.add(player,stallData);
			}
			stallData.playerId = player;
			stallData.stallType = stallType;
			stallData.stallName = stallName;
			stallData.stallId = stallId;
			removeSeeStall(player);
			stallBroadcast(stallData);
		}
		//----------------------------查看别人的摊位-------------------------
		public static function getStallDetail(stall:StallDetailProto):void
		{
			var stallData : StallData = getStallDataByStallId(stall.stallId);
			if(!stallData)
				return;
			stallData.setup(stall);
			setStallData(stallData);
			EventManager.dispatchEvent(StallEvent.STALL_UPDATE);
		}
		
		public static function getSeeStallDetail():void
		{
			var stalldata : StallData = getSeeStallData();
			if(!stalldata || stalldata.playerId == MainRoleManager.actorID)
				return;
			StallSender.getStallDetail(stalldata.stallId,stalldata.version);
		}
		/**
		 * 从其他摊位购买物品 
		 * @param index
		 * @param num
		 * 
		 */		
		public static function buyGoodsFromStall(index:int,num:int):void
		{
			var stallData : StallData = getSeeStallData();
			if(!stallData)
				return;
			var stallItem : StallItemData = stallData.getStallSellItem(index);
			if(!stallItem)
				return;
			StallSender.buyStallGoods(stallData.stallId,index,stallItem.flag,num,stallItem.itemId,stallItem.price);
		}
		/**
		 * 从其他摊位购买物品成功 
		 * @param stall
		 * @param num
		 * 
		 */		
		public static function buyGoodsFromOtherStallComplete(stall:int,num:int):void
		{
			var stalldata : StallData = getSeeStallData();
			if(!stalldata)
				return;
			if(stalldata.stallId != stall)
			{
				trace("从其他摊位购买物品的时候发现和当前查看的id不是同一个id");
				return;
			}
			getSeeStallDetail();
			NoticeManager.showNotify(LangStall.buyGoodsFromStallComplete);
		}
		
		//-+--------------------------出售物品给摊位
		/**
		 * 已经有当前查看的摊位了，只需要知道是卖给第几个格子就好了 
		 * @param index
		 * 
		 */		
		public static function sellGoodsToStall(index:int,num:int):void
		{
			var seeStallData : StallData = getSeeStallData();
			if(!seeStallData)
				return;
			var stallItem : StallItemData = seeStallData.getStallBuyIndex(index);
			if(!stallItem)
				return;
			var count : int = BackPackManager.instance.getItemCount(stallItem.itemId);
			if(count == 0 || count<num)
			{
				NoticeManager.showNotify(LangStall.sellGoodsToStallFail1);
				return;
			}
			var nowMoney : Number = MainRoleManager.actorInfo.amountInfo.getAmountByType(AmountType.MONEY);
			if(nowMoney + stallItem.price + num > int.MAX_VALUE)
			{
				NoticeManager.showNotify(LangStall.sellGoodsToStallFail2);
				return;
			}
			var items : Array = BackPackManager.instance.getItemsByItemId(stallItem.itemId);
			var sellCount : int = 0;
			var bagIndexs:Array = [];
			for each(var itemInfo : ClientItemInfo in items)
			{
				if(itemInfo && itemInfo.count>0 && itemInfo.binded == false)
				{
					if(num>itemInfo.count)
					{
						sellCount = itemInfo.count;
						num=num-itemInfo.count;
						bagIndexs.push([itemInfo.index,sellCount]);
					}
					else
					{
						sellCount = num;
						bagIndexs.push([itemInfo.index,sellCount]);
						break;
					}
				}
			}
			StallSender.sellGoodsToStall(seeStallData.stallId,index,stallItem.flag,itemInfo.cfgId,stallItem.price,bagIndexs);
		}
		
		//-------------------------一些方法------------------------\\
		
		public static function setStallData(stall:StallData):void
		{
			if(stall.playerId == MainRoleManager.actorID)
			{
				selfStallData = stall;
			}else
			{
				stallHash.add(stall.playerId,stall);
			}
		}
		
		/**
		 * 是否在查看自己的摊位 
		 * @return 
		 * 
		 */		
		public static function seeIsSelfStall():Boolean
		{
			return seeStallPlayerId == MainRoleManager.actorID;
		}
		/**
		 * 拿到当时正在查看的摊位的数据，这个需要预设一下，比如从背包入口点开的时候，在场景上面点开的时候 
		 * @return 
		 * 
		 */		
		public static function getSeeStallData():StallData
		{
			return getStallDataByPlayerId(seeStallPlayerId);
		}
		/**
		 * 通过玩家id拿一个摊位，可能是空的，如果没有 
		 * @param id
		 * @return 
		 * 
		 */		
		public static function getStallDataByPlayerId(id:Number):StallData
		{
			if(id == MainRoleManager.actorID)
			{
				//如果是自己
				return selfStallData;
			}else
			{
				//不是自己，其他人从另一个地方拿数据
				return stallHash.getValue(id);
			}
		}
		
		public static function removeStallData(playerId:Number):void
		{
			if(playerId == MainRoleManager.actorID)
			{
				//如果是自己
				selfStallData = null;
			}else
			{
				//不是自己，其他人从另一个地方拿数据
				stallHash.remove(playerId);
			}
		}
		/**
		 * 通过stallId拿一个摊位数据
		 * @param stallId
		 * @return 
		 * 
		 */		
		public static function getStallDataByStallId(stallId:int):StallData
		{
			var stallData : StallData;
			for each(stallData in stallHash.getValues())
			{
				if(stallData && stallData.stallId == stallId)
					return stallData;
			}
			if(selfStallData&&stallId == selfStallData.stallId)
				return selfStallData;
			return null;
		}
		/**
		 * 初始化一个什么都没有的data，但是有格子之类的东西，这些东西是必须要有的。 
		 * 
		 */		
		public static function getBaseStallData():StallData
		{
			var stallData : StallData= new StallData();
			for(var i : int = 0 ; i < MAX_STALL_GRID;i++)
			{
				var buyList : StallItemData = new StallItemData();
				buyList.setIndex(i);
				stallData.stallBuyList[i]=buyList;
				
				var sellList : StallItemData = new StallItemData();
				sellList.setIndex(i);
				stallData.stallSellList[i]=sellList;
			}
			return stallData;
		}
		/**
		 * 获取收购物品能收购的物品树 
		 * @return 
		 *  * [[{name:"name"},HashMap],[{name:"name"},HashMap],[{name:"name"},Array]...]
		 * 				   HashMap=[data,data,data...]         			   Array=[data,data,data...]
		 */		
		public static function getStallBuyDatas(name:String=""):TreeNode
		{
			var stallBuyTreeNode : TreeNode= new TreeNode({name:"物品"});
			var datas : Array = StallCfgData.getStallBuyGoodsByName(name);
			if(!datas)
				return stallBuyTreeNode;
			var typeRoot : HashMap = new HashMap();//单个大类型
			var nextTypeRoot : HashMap;
			var tempTreeItem : StallBuyTreeItem;
			for each(var proto : StallBuyGoodsDataProto in datas)
			{
				var keyAndValue:Array = proto.name.split("#");
				if(keyAndValue.length!=2)
					continue;
				var root : String = keyAndValue[0];
				var nextRoot : String = keyAndValue[1];
				var rootArray : Array = typeRoot.getValue(root);
				if(!rootArray)
				{
					nextTypeRoot = new HashMap();
					tempTreeItem = new StallBuyTreeItem();
					tempTreeItem.typeName = root;
					rootArray = [tempTreeItem,nextTypeRoot];
					typeRoot.add(root,rootArray);
				}else
				{
					nextTypeRoot = rootArray[1];
				}
				var nextRootArray : Array = nextTypeRoot.getValue(nextRoot);
				if(!nextRootArray)
				{
					tempTreeItem = new StallBuyTreeItem();
					tempTreeItem.typeName = nextRoot;
					nextRootArray = [tempTreeItem]
					nextTypeRoot.add(nextRoot,nextRootArray);
				}
				for each(var itemId : int in proto.goodsId)
				{
					tempTreeItem = new StallBuyTreeItem();
					tempTreeItem.itemId = itemId;
					nextRootArray.push(tempTreeItem);
				}
			}
			stallBuyTreeNode = TreeUtils.setTreeNode(stallBuyTreeNode,typeRoot.getValues());
			return stallBuyTreeNode;
		}
		
		private static var seeStallArray : Array = [];
		public static function getStallColor(id:Number):uint
		{
			var stallData : StallData = getStallDataByPlayerId(id);
			if(!stallData)
				return StaticValue.YELLOW_TEXT;
			if(seeStallArray.indexOf(id)!=-1)
				return StaticValue.GRAY_TEXT;
			switch(stallData.stallType)
			{
				case 0:
					return StaticValue.GREEN_TEXT;
				case 1:
					return StaticValue.SKYBLUE_TEXT;
				case 2:
					return StaticValue.YELLOW_TEXT;
			}
			return StaticValue.YELLOW_TEXT;
			
		}

		/**
		 * 正在查看的摊位的id 
		 */
		public static function get seeStallPlayerId():Number
		{
			return _seeStallPlayerId;
		}

		public static function set seeStallPlayerId(value:Number):void
		{
			_seeStallPlayerId = value;
		}
		
		public static function setSeeStallPlayer(value:Number):void
		{
			if(seeStallArray.indexOf(value)<0)
			{
				seeStallArray.push(value);
			}
		}
		
		public static function removeSeeStall(player:Number):void
		{
			if(seeStallArray.indexOf(player)>=0)
			{
				seeStallArray.splice(seeStallArray.indexOf(player),1);
			}
		}
		
		public static function getIsSeeStall(player:Number):Boolean
		{
			return seeStallArray.indexOf(player)>=0;
		}
		
		//---------------------------详细信息-----------------------
		public static function addStallInfo(str:String):void
		{
			stallInfo.push({value:str});
		}
		
		public static function getStallInfo():Array
		{
			return stallInfo;
		}
		

	}
}