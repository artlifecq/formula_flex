package com.rpgGame.appModule.battle.jjzb
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.common.RewardGroup;
	import com.rpgGame.appModule.social.team.TeamListItemRender;
	import com.rpgGame.core.events.JJBattleEvent;
	import com.rpgGame.coreData.cfg.GlobalSheetData;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.zhanchang.jingjichang.JingJiChan3;
	
	public class JJBattleRewardPanelExt extends SkinUIPanel
	{
		private var _skin:JingJiChan3;
		private var rewards:Array;
		private var _gReward:RewardGroup;
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
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=4;
			
			_gReward=new RewardGroup(_skin.icon1,RewardGroup.ALIN_LEFT,10,10);
			var rewardNum:int=GlobalSheetData.getIntValue(800);
			rewards=[];
			var tmp:Object;
			for (var i:int = 0; i <rewardNum; i++) 
			{
				tmp=JSONUtil.decode(GlobalSheetData.getStrValue(801+i));
				rewards.push(GlobalSheetData.getStrValue(801+i));
			}
		}
		private function getRankReward(rank:int):Object
		{
			var len:int=rewards.length;
			var rankA:Array;
			for (var i:int = 0; i < len; i++) 
			{
				rankA=rewards[i].rank;
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
			EventManager.addEvent(JJBattleEvent.GET_REWARD_DATA,onGetData);
			Mgr.jjBattleMgr.reqRewardPanelData();
			setConfigData();
		}
		
		private function onGetData(...arg):void
		{
			// TODO Auto Generated method stub
			var rank:int=1;
			var myRewad:Object=getRankReward(rank);
			var items:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			if (myRewad) 
			{
				var len:int=myRewad.rewards.length;
				var tmp:ClientItemInfo;
				var tobj:Object;
				for (var i:int = 0; i < len; i++) 
				{
					tobj=myRewad.rewards[i];
					tmp=new ClientItemInfo(tobj.mod);
					tmp.count=tobj.num;
					
					items.push(tmp);
				}
				_gReward.setReward(items);
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(JJBattleEvent.GET_REWARD_DATA,onGetData);
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