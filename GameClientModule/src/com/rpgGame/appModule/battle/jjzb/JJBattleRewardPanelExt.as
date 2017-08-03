package com.rpgGame.appModule.battle.jjzb
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.ItemActionManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.core.utils.MCUtil;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJiChan3;
	
	public class JJBattleRewardPanelExt extends SkinUI
	{
		private var _skin:JingJiChan3;
		private var rewards:Array;
		private var _gReward:RewardGroup;
		private var _initWinStr:String;
		private var _initLoseStr:String;
		private var _initPointStr:String;
		public function JJBattleRewardPanelExt()
		{
			_skin=new JingJiChan3();
			super(_skin);
			init();
		}
		private function init():void
		{
			var list:List=_skin.ListItem;
			list.itemRendererFactory = createStoneCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_ALWAYS_VISIBLE;
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=4;
			
			_gReward=new RewardGroup(IcoSizeEnum.ICON_64,_skin.icon1,RewardGroup.ALIN_LEFT,10,10);
			var rewardNum:int=GlobalSheetData.getIntValue(800);
			rewards=[];
			var tmp:Object;
			for (var i:int = 0; i <rewardNum; i++) 
			{
				tmp=JSONUtil.decode(GlobalSheetData.getStrValue(801+i));
				rewards.push(tmp);
			}
			
			_skin.btnBack.addEventListener(Event.TRIGGERED,onClose);
			_skin.btnOK.addEventListener(Event.TRIGGERED,onGetReward);
			
			_initWinStr=_skin.lbHuosheng.text;
			_initLoseStr=_skin.lbShibai.text;
			_initPointStr=_skin.lbRongyu.text;
			
		}
		
		private function onGetReward(eve:Event):void
		{
			// TODO Auto Generated method stub
			Mgr.jjBattleMgr.reqGetReward();
		}
		
		private function onClose(eve:Event):void
		{
			// TODO Auto Generated method stub
			MCUtil.removeSelf(this);
		}
		private function getRankReward(rank:int):Object
		{
			var len:int=rewards.length;
			var rankA:Array;
			for (var i:int = 0; i < len; i++) 
			{
				rankA=rewards[i][0].rank;
				if (rankA[0]<=rank&&rankA[1]>=rank) 
				{
					return rewards[i];
				}
			}
			return null;
		}
		private function createStoneCell():JJBattleRewardRender
		{
			// TODO Auto Generated method stub
			return new JJBattleRewardRender();
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(JJBattleEvent.GET_REWARD_PANEL_DATA,onGetData);
			EventManager.addEvent(JJBattleEvent.GET_REWARD_RESULT,onGetRewardResult);
			Mgr.jjBattleMgr.reqRewardPanelData();
			setConfigData();
		}
		
		private function onGetRewardResult(...arg):void
		{
			// TODO Auto Generated method stub
			if (arg[0]==1) 
			{
				var items:Vector.<ClientItemInfo>=_gReward.data;
				
				if (items) 
				{
					var arr:Array=[];
					for each (var tmp:ClientItemInfo in items) 
					{
						arr.push(tmp.cfgId);
					}
					ItemActionManager.flyItemsToBag(arr);
				}
			}
			checkBtnState();
		}
		
		private function onGetData(...arg):void
		{
			// TODO Auto Generated method stub
			var rank:int=Mgr.jjBattleMgr.data.rank;
			_skin.lbHuosheng.text=LanguageConfig.replaceStr(_initWinStr,[arg[0]]);
			_skin.lbShibai.text=LanguageConfig.replaceStr(_initLoseStr,[arg[1]]);
			_skin.lbRongyu.text=LanguageConfig.replaceStr(_initPointStr,[arg[2]]);
			var myRewad:Object=getRankReward(rank);
			var items:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			if (myRewad) 
			{
				var len:int=myRewad[0].reward.length;
				var tmp:ClientItemInfo;
				var tobj:Object;
				for (var i:int = 0; i < len; i++) 
				{
					tobj=myRewad[0].reward[i];
					tmp=new ClientItemInfo(tobj.mod);
					tmp.count=tobj.num;
					
					items.push(tmp);
				}
				_gReward.setReward(items);
			}
			var max:int=Mgr.jjBattleMgr.getMaxRankLv();
			_skin.imgYiwai.visible=rank>max;
			_skin.numZhanli.label=Math.min(max,rank)+"";
			_skin.imgMing.x=_skin.numZhanli.x+_skin.numZhanli.width;
			_skin.imgYiwai.x=_skin.imgMing.x+_skin.imgMing.width;
			checkBtnState();
		}
		private function checkBtnState():void
		{
			var hasReward:Boolean=Mgr.jjBattleMgr.data.drawAward==0;
			var str:String;
			if (hasReward) 
			{
				str=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_GREEN,NotifyCfgData.getNotifyTextByID(61038));
				TouchableUtil.ungray(_skin.btnOK);
			}
			else
			{
				str=HtmlTextUtil.getTextColor(GameColorUtil.COLOR_RED,NotifyCfgData.getNotifyTextByID(61039));
				TouchableUtil.gray(_skin.btnOK);
			}
			_skin.labReward.htmlText=str;
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(JJBattleEvent.GET_REWARD_PANEL_DATA,onGetData);
			EventManager.removeEvent(JJBattleEvent.GET_REWARD_RESULT,onGetRewardResult);
			clearData();
		}
		private function clearData():void
		{
			this._skin.ListItem.dataProvider=new ListCollection();
		}
		private function setConfigData():void
		{
		
			this._skin.ListItem.dataProvider=new ListCollection(rewards);
		}
	}
}