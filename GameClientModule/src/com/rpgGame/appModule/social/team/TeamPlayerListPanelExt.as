package  com.rpgGame.appModule.social.team
{
	import com.game.mainCore.core.timer.GameTimer;
	import com.rpgGame.app.ctrl.ControlCoolDown;
	import com.rpgGame.app.ctrl.EnumCustomCoolDown;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.appModule.social.TimeCountUtil;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.netData.team.bean.MapPlayerInfo;
	
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.shejiao.zudui.Zudui_wanjia;
	


	
	
	/**
	 * 附近玩家列表
	 */	
	public class TeamPlayerListPanelExt extends SkinUI
	{
		private var _skin:Zudui_wanjia;
		private var timer:GameTimer;
		private var lastAutoTime:int;
		public function TeamPlayerListPanelExt()
		{
			_skin=new Zudui_wanjia();
			super(_skin);
			
			var list:List=_skin.Duiwu_list;
			list.itemRendererFactory = createStoneCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			registerListeners();
			timer=new GameTimer("TeamPlayerListPanelExt_timer",1000,0,onTimer);
		}
		
		private function onTimer():void
		{
			// TODO Auto Generated method stub
			var now:int=getTimer();
			if (lastAutoTime==0||now-lastAutoTime>=30000) 
			{
				doRefresh(true);
				lastAutoTime=now;
			}
		}
		
		private function createStoneCell():TeamPlayerListItemRender
		{
			// TODO Auto Generated method stub
			return new TeamPlayerListItemRender();
		}
		
		private function update():void
		{
//			if(ControlCoolDown.IsCustomCoolDown( EnumCustomCoolDown.TEAM_SEARCH_PLAYER))
//			{
//				doRefresh();
//			}else
//			{
//				setTimeout(doRefresh,
//					ControlCoolDown.GetCustomCooldownTime( EnumCustomCoolDown.TEAM_SEARCH_PLAYER )+100);
//			}
		}
		override protected function onShow():void
		{
			super.onShow();
			update();
			timer.start();
			//onTimer();
			TeamSender.ReqSearchNearPlayer("",true);
			TeamSender.ReqOpenOrCloseTeamPanel(2,0);
		}
		override protected function onHide():void
		{
			super.onHide();
			timer.stop();
			TeamSender.ReqOpenOrCloseTeamPanel(2,1);
		}
		private function doRefresh(isAuto:Boolean):void
		{
			TeamSender.ReqSearchNearPlayer("",isAuto);
			if (!isAuto) 
			{
				TimeCountUtil.ins.addButtonTimeCountDown(_skin.btn_shuaixin,NotifyCfgData.getNotifyByID(13044).q_content,30);
			}
			
		}
		private function registerListeners():void
		{
			
			
			_skin.btn_shuaixin.addEventListener( Event.TRIGGERED , OnSearchPlayer);
			_skin.btn_chakan.addEventListener(Event.TRIGGERED , OnViewPlayer);
			/*_skin.btn_tianjia.addEventListener(Event.TRIGGERED , OnAddFriend);*/
			_skin.btn_yaoqing.addEventListener(Event.TRIGGERED , OnInviteJoinTeam);
			Mgr.teamMgr.addEventListener(TeamEvent.GET_MAP_PLAYERS , OnGetPlayers);

		}
		
		private function OnViewPlayer(event:Event):void
		{
			if( TeamPlayerListItemExt.curItem != null && TeamPlayerListItemExt.curItem.data != null)
			{
				LookSender.lookOtherPlayer( TeamPlayerListItemExt.curItem.data.playerid );
			}
			else	
			{
				//NoticeManager.mouseFollowNotify("请先选中一位玩家" );
				NoticeManager.showNotifyById(13007);
			}
		}
		private function OnAddFriend(event:Event):void
		{
			if( TeamPlayerListItemExt.curItem != null && TeamPlayerListItemExt.curItem.data != null)
			{
				//Mgr.friendMgr.AddFriend( TeamPlayerListItemExt.curItem.data.playerid );
			}
			else
			{
				//NoticeManager.mouseFollowNotify("请先选中一位玩家");
				NoticeManager.showNotifyById(13007);
			}
		}
		private function OnSearchPlayer(event:Event):void
		{
//			var searchStr:String = editSell.text;
//			if(searchStr == "输入玩家名可搜索，支持模糊搜索")
//				searchStr = "";
			
			if(ControlCoolDown.IsCustomCoolDown( EnumCustomCoolDown.TEAM_SEARCH_PLAYER))
			{
				doRefresh(false);
			}else
			{
				//NoticeManager.mouseFollowNotify( "CD中，稍后再试！" );
				NoticeManager.showNotifyById(13006);
			}
		}
		private function OnInviteJoinTeam(event:Event):void
		{
			if(TeamPlayerListItemExt.curItem != null && TeamPlayerListItemExt.curItem.data != null)
				Mgr.teamMgr.InvitePlayerJoinTeam( TeamPlayerListItemExt.curItem.data.playerid );
			else
			{
				//NoticeManager.mouseFollowNotify("请先选中一位玩家" );
				NoticeManager.showNotifyById(13007);
			}
		}
	
		private var playerList:Vector.<MapPlayerInfo>;
		private function OnGetPlayers(event:TeamEvent):void
		{
			
			playerList = event.data as Vector.<MapPlayerInfo>;
			if (playerList.length==0) 
			{
				//NoticeManager.mouseFollowNotify("很抱歉，当前地图没有查到玩家信息");
				NoticeManager.showNotifyById(13037);
			}
			RefreshPlayerList();
		}
		
		private function RefreshPlayerList(tween:Boolean=true):void
		{
			playerList.sort(SortList);
			_skin.Duiwu_list.dataProvider=new ListCollection(playerList);
			TeamPlayerListItemExt.curItem=null;
		}
		/**
		 *未组队的玩家排在已组队的玩家之前；
		同是未组队的玩家则等级高的排在之前；
		等级相同则未入帮的排在已入帮的之前；
		入帮状态相同则战力高的排在前；
		战力相同的玩家编号低的排在之前； 
		已组队的玩家的排序规则与未组队的玩家排序规则相同。 
		 * @param a
		 * @param b
		 * @return 
		 * 
		 */		
		private function SortList(a:MapPlayerInfo , b:MapPlayerInfo):int
		{
			var ret:int=sortSub(a.teamstate,b.teamstate,-1);
			if (ret!=0) 
			{
				return ret;
			}
			ret=sortSub(a.playerlv,b.playerlv,1);
			if (ret!=0) 
			{
				return ret;
			}
			//未入帮0，入帮1
			ret=sortSub(int(a.playername!=null&&a.playername!=""),int(b.playername!=null&&b.playername!=""),-1);
			if (ret!=0) 
			{
				return ret;
			}
			ret=sortSub(a.fightPower,b.fightPower,1);
			if (ret!=0) 
			{
				return ret;
			}
			return 0;
		}
		/**
		 *比较大小 
		 * @param aValue
		 * @param bValue
		 * @param lowerRet <0小的在前面》0大数在前面
		 * @return 
		 * 
		 */		
		private function sortSub(aValue:int,bValue:int,lowerRet:int):int
		{
			if (aValue<bValue) 
			{
				return lowerRet;
			}
			else if (aValue>bValue) 
			{
				return -lowerRet;
			}
			return 0;
		}	
	}
}