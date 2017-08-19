package com.rpgGame.app.manager.trade
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.GoodsContainerMamager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.sender.TradeSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.TradeEvent;
	import com.rpgGame.coreData.cfg.item.ItemContainerID;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.GridInfo;
	import com.rpgGame.coreData.info.trade.TradeData;
	import com.rpgGame.coreData.info.trade.TradeTargetData;
	import com.rpgGame.coreData.lang.LangTrade;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import utils.TimerServer;

	public class TradeManager
	{
		public function TradeManager()
		{
		}
		/**邀请和其他玩家交易的CD**/
		private static const INVITE_TIME_CD : Number = 30000;
		/**收到其他玩家的交易请求，如果超10s没有回复，那就拒绝掉**/
		private static const INVITE_TIME_OUT : Number = 20000;
		
		/**邀请交易的目标**/
		private static var _inviteTarget:Number;
		private static var _tradeMine : TradeTargetData;
		private static var _tradeTarget : TradeTargetData;
		private static var _mineTrade : TradeData;
		private static var _targetTrade : TradeData;
		
		/**开始交易，初始化一些对面玩家的数据**/
		public static function startTrading(player:Number,playerName:String,level:int):void
		{
			//测试数据
			_targetTrade = new TradeData(ItemContainerID.TRADE_TARGET);
			_mineTrade = new TradeData(ItemContainerID.TRADE);
			
			_tradeTarget = new TradeTargetData();
			_tradeTarget.level = level;
			_tradeTarget.playerId = player;
			_tradeTarget.playerName = playerName;
			
			_tradeMine = new TradeTargetData();
			_tradeMine.level = MainRoleManager.actorInfo.totalStat.level;
			_tradeMine.playerId = MainRoleManager.actorID;
			_tradeMine.playerName = MainRoleManager.actorInfo.name;
			//预留打开交易面板的操作
			AppManager.showAppNoHide(AppConstant.TRADE_PANEL);
			AppManager.showAppNoHide(AppConstant.BACK_PACK_PANEL);
			AppManager.hideApp(AppConstant.TRADE_BEEN_INVITE_PANEL)
			replayAllInvite();
			TimerServer.remove(showInviteTimeOut);
			GoodsContainerMamager.setIsShowBindLock(ItemContainerID.BackPack,true);
		}
		
		public static function endTrade(itemsIndex:Array):void
		{
			NoticeManager.showNotify("交易已经结束了");
			AppManager.hideApp(AppConstant.TRADE_PANEL);
			var mineItems : Array = _mineTrade.getAllItems();
			var item :ClientItemInfo;
			for (var i:int = 0 ; i < mineItems.length;i++)
			{
				item = (mineItems[i] as GridInfo).data as ClientItemInfo;
				if(!item)
					continue;
				GoodsContainerMamager.setItemInfo(ItemContainerID.BackPack,item.index,null);
			}
			if(!itemsIndex || itemsIndex.length == 0)
			{
				clearTrade();
				return;
			}
			var targetItems : Array = _targetTrade.getAllItems();
			if(targetItems.length == 0)
			{
				clearTrade();
				return;
			}
			var itemLen : int = Math.max(itemsIndex.length,targetItems.length);
			var index:int;
			for(i=0;i<itemLen;i++)
			{
				if(targetItems[i] is GridInfo)
				{
					item = (targetItems[i] as GridInfo).data as ClientItemInfo;
					if(!item)
						continue;
					index = itemsIndex[i];
					item.setIndex(index);
					item.setContainerId(ItemContainerID.BackPack);
					GoodsContainerMamager.setItemInfo(ItemContainerID.BackPack,index,item);
				}
			}
			clearTrade();
		}
		/**清除所有的交易信息**/
		public static function clearTrade():void
		{
			_tradeTarget = null;
			_targetTrade = null;
			_tradeMine = null;
			_mineTrade = null;
			_inviteTarget = 0;
			GoodsContainerMamager.setIsShowBindLock(ItemContainerID.BackPack,false);
		}
		/**设置银两**/
		public static function setMoney(money:int):void
		{
			_mineTrade.setWaitMoney(money);
			TradeSender.setMoney(money);
		}
		/**目标玩家的银两改变了**/
		public static function targetMoneyChange(money:int):void
		{
			_targetTrade.money = money;
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_TARGET_MONEY_CHANGE);
		}
		/**设置银两成功了**/
		public static function setMoneyComplete():void
		{
			_mineTrade.setMoneyComplete();
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_MINE_MONEY_CHANGE);
		}
		
		/**交易取消了，或者关闭了**/
		public static function cancelTrade():void
		{
			clearTrade();
			NoticeManager.showNotify("交易已经取消了");
			if( AppManager.isAppInScene( AppConstant.TRADE_PANEL ) )
				AppManager.hideApp(AppConstant.TRADE_PANEL);
			
			if( AppManager.isAppInScene( AppConstant.TRADE_SILVER_PANEL ) )
				AppManager.hideApp(AppConstant.TRADE_SILVER_PANEL);
		}
		
		/**目标玩家确认了**/
		public static function targetSure():void
		{
			_tradeTarget.isSure = true;
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_TARGET_SURE);
		}
		
		/**我自己确认了**/
		public static function mineSure():void
		{
			_tradeMine.isSure = true;
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_MINE_SURE);
		}
		
		public static function sendMineSure():void
		{
			if(!_tradeTarget.isLock)
			{
				NoticeManager.showNotify(LangTrade.targetDontLock);
				trace("目标没有锁定，你确认不了");
				return;
			}
			
			if(!_tradeMine.isLock)
			{
				NoticeManager.showNotify(LangTrade.youNeedLock);
				trace("你自己都没有锁定，你确认不了");
				return;
			}
			
			if(_tradeMine.isSure)
			{
				NoticeManager.showNotify(LangTrade.youAreSure);
				trace("你已经确认了，别再发了");
				return;
			}
			
			TradeSender.mineSure();
		}
		
		/**目标玩家锁定了**/
		public static function targetLock():void
		{
			_tradeTarget.isLock = true;
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_TARGET_LOCK);
		}
		/**我自己锁定了**/
		public static function mineLock():void
		{
			_tradeMine.isLock = true;
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_MINE_LOCK);
		}
		/**交易目标移除了一个物品**/
		public static function targetRemoveGoods(index:int):void
		{
			if(_tradeMine.isLock)
			{
				TradeSender.cancelTrade();
				NoticeManager.showNotify("锁定后对方拿下了物品，交易取消");
				return;
			}
			_targetTrade.removeItemsByIndes(index);
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_OTHER_GOODS_COMPLETE);
		}
		/**交易的目标设置了物品**/
		public static function targetSetGoods(item:GridInfo):void
		{
			if(_tradeMine.isLock)
			{
				TradeSender.cancelTrade();
				NoticeManager.showNotify("锁定后对方又放置了物品，交易取消");
				return;
			}
			_targetTrade.setItem(item);
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_OTHER_GOODS_COMPLETE);
		}
		/**移除物品失败了，那就把哪个INDEX给删除掉**/		
		public static function mineRemoveGoodsFail():void
		{
			_mineTrade.removeWaitIndex();
		}
		/**
		 * 服务器返回这个物品已经移除成功了 
		 */		
		public static function mineRemoveGoodsComplete():void
		{
			if(_mineTrade.getWaitRemoveIndex() != -1)
			{
				var itemInfo : ClientItemInfo = _mineTrade.getItemInfoByIndex(_mineTrade.getWaitRemoveIndex());
				if(itemInfo)
					GoodsContainerMamager.removeLockAssetByIndex(ItemContainerID.BackPack,itemInfo.index);
			}
			_mineTrade.setWiteRemoveIndexComplete();
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_MINE_GOODS_COMPLETE);
		}
		/**移除一个已经放上去的物品**/
		public static function mineRemoveGoods(index:int):void
		{
			if(!_mineTrade.indexHasItem(index))
			{
				trace("怎么会想要移除一个压根就没有物品的格子？");
				return;
			}
			_mineTrade.setWaitRemoveIndex(index);
//			mineRemoveGoodsComplete();
			TradeSender.removeGoodsByIndex(index);
		}
		/**设置物品失败了，那就把那个正在等待的物品删除掉**/
		public static function setMineGoodsFail():void
		{
			_mineTrade.removeWaitItem();
		}
		
		/**服务器返回设置物品成功了，把刚才那个物品设置到指定的地方去**/
		public static function setMineGoodsComplete():void
		{
			if(_mineTrade.hasWaitItem())
			{
				var item : ClientItemInfo = _mineTrade.getWaitItemInfo();
				if(item)
					GoodsContainerMamager.setShowLockAssetIndex(ItemContainerID.BackPack,item.index);
			}
			_mineTrade.setWaitItemToItems();
			EventManager.dispatchEvent(TradeEvent.TRADE_SET_MINE_GOODS_COMPLETE);
		}
		
		/**设置一个物品到我的物品列表上**/
		public static function setMineGoods(tradeitem:GridInfo):void
		{
			if(!tradeitem || !tradeitem.data)
			{
				trace("给了一个交易数据，结果没有物品？有点扯淡啊。");
				return;
			}
			if(_mineTrade.hasWaitItem())
			{
				NoticeManager.showNotify(LangTrade.waitSetItem);
				trace("需要等待上一次操作完成，才能继续操作");
				return;
			}
			var item : ClientItemInfo = tradeitem.data as ClientItemInfo;
			if(!item)
			{
				trace("放上来的物品有误");
				return;
			}
			if(item.binded)
			{
				NoticeManager.showNotify(LangTrade.itemIsLock);
				trace("绑定物品无法交易");
				return;
			}
			var itemInfo : ClientItemInfo = _mineTrade.getItemInfoByIndex(tradeitem.index);
			if(itemInfo)
			{
				//如果之前是有物品的，那就把这个物品从背包里面解锁
				GoodsContainerMamager.removeLockAssetByIndex(ItemContainerID.BackPack,itemInfo.index);
			}
			_mineTrade.setWaitItem(tradeitem);
//			setMineGoodsComplete();		
			TradeSender.tradeSetGoods(tradeitem.index,(tradeitem.data as ClientItemInfo).index,(tradeitem.data as ClientItemInfo).cfgId);
		}
		
		/**清除我邀请交易的目标ID**/
		public static function unLockInvitePlayer(id:Number):void
		{
			if(_inviteTarget != id)
				trace("邀请的人居然和正在交易的人不一样？不科学啊！");
//			_inviteTarget = 0;
			NoticeManager.showNotify("对方拒绝了你的交易请求");
		}
		
		/** 邀请列表**/
		private static var _beenInvites : HashMap;
		/**收到别人的邀请了，之后是需要重新做的**/
		public static function receiveInviteTrade(beenInvite : TradeTargetData):void
		{
			if(!_beenInvites)
				_beenInvites = new HashMap();
			NoticeManager.showNotify(LangTrade.receiveInviteTrade,beenInvite.playerName);
			_beenInvites.add(beenInvite.playerId,beenInvite);
			beenInvite.timeOut = SystemTimeManager.curtTm + INVITE_TIME_OUT;
			TimerServer.addLoop(clearOneBeenInvite,100);
			if(AppManager.isAppInScene(AppConstant.TRADE_BEEN_INVITE_PANEL))
			{
				EventManager.dispatchEvent(TradeEvent.TRADE_BEEN_INVITE);
			}else
			{
				EventManager.dispatchEvent(
				FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE,
				EnumFunctionMessageBarIcoType.TRADE_TYPE,
				_beenInvites.length
				);
			}
		}
		
		private static function clearOneBeenInvite():void
		{
			if(_beenInvites.length == 0)
			{
				TimerServer.remove(clearOneBeenInvite);
				return;
			}
			for each(var beenInvite : TradeTargetData in _beenInvites.getValues())
			{
				if(!beenInvite)
					continue;
				trace(beenInvite.playerName);
				if(SystemTimeManager.curtTm > beenInvite.timeOut)
					replayInvite(beenInvite.playerId,false);
			}
		}
		
		public static function replayAllInvite():void
		{
			if(!_beenInvites)
				return;
			for each(var target : TradeTargetData in _beenInvites.getValues())
			{
				if(!target)
					continue;
				TradeSender.replyTradeInvite(target.playerId,false);
			}
		}
		
		/**邀请目标进行交易**/
		public static function invitePlayerTrade(target:Number):void
		{
//			trace("邀请了一个目标来交易");
			if(_tradeTarget)
			{  
				NoticeManager.showNotify("正在交易中");
				return;
			}
			if(_inviteTarget)
			{
				NoticeManager.showNotify(LangTrade.inviteCd);
				return;
			}
			_inviteTarget = target;
			TradeSender.tradeInvite(target);
		}
		/**邀请目标进行交易成功，然后开始倒计时**/
		public static function invitePlayerSuccess():void
		{
			NoticeManager.showNotify("邀请交易成功");
			TimerServer.add(showInviteTimeOut,INVITE_TIME_CD);
		}
		/**请求交易超过$时间对方没有回应**/
		private static function showInviteTimeOut():void
		{
			_inviteTarget = 0;
			trace("请求交易超时");
		}
		
		public static function replayInvite(player:Number,isAgree:Boolean):void
		{
//			if(ReqLockUtil.isReqLocked(TradeModuleMessages.C2S_REPLY_TRADE_INVITE))
//			{
//				trace("刚刚回复了交易请求，必须等待服务器返回");
//				return;
//			}
			if(!_beenInvites)
				return;
			_beenInvites.remove(player);
			if(_beenInvites.length)
				EventManager.dispatchEvent(TradeEvent.TRADE_BEEN_INVITE);
			else
			{
				AppManager.hideApp(AppConstant.TRADE_BEEN_INVITE_PANEL)
				EventManager.dispatchEvent(
					FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE,
					EnumFunctionMessageBarIcoType.TRADE_TYPE
				);
			}
//			ReqLockUtil.lockReq(TradeModuleMessages.C2S_REPLY_TRADE_INVITE)
			TradeSender.replyTradeInvite(player,isAgree);
		}
		
		public static function unlockReplayInvite():void
		{
//			ReqLockUtil.unlockReq(TradeModuleMessages.C2S_REPLY_TRADE_INVITE)
		}
		
		/**是否正在交易中，通过判断是否有目标来判断这个**/
		public static function get isTrading():Boolean
		{
			return _tradeTarget != null;
		}

		/**自己的交易信息，名字等级锁定状态等**/
		public static function get tradeMine():TradeTargetData
		{
			return _tradeMine;
		}

		/**正在交易的目标**/
		public static function get tradeTarget():TradeTargetData
		{
			return _tradeTarget;
		}

		/**我提交的交易数据**/
		public static function get mineTrade():TradeData
		{
			return _mineTrade;
		}

		/**目标提交的交易数据**/
		public static function get targetTrade():TradeData
		{
			return _targetTrade;
		}
		/** 邀请我交易的列表 **/
		public static function get beenInvites():Array
		{
			return _beenInvites?_beenInvites.getValues():null;
		}
	}
}