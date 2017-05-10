package  com.rpgGame.appModule.social.team
{
	import com.rpgGame.app.ctrl.ControlCoolDown;
	import com.rpgGame.app.ctrl.EnumCustomCoolDown;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.appModule.social.TimeCountUtil;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.team.bean.MapTeamInfo;
	
	import flash.utils.setTimeout;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.shejiao.zudui.Zudui_fujin;
	
	import starling.events.Event;

	
	
	/**
	 * 队伍列表
	 */	
	public class TeamListPanelExt extends SkinUI
	{
	
		
	
		private var _skin:Zudui_fujin;
		public function TeamListPanelExt()
		{
			_skin=new Zudui_fujin();
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
		}
		
		private function createStoneCell():TeamListItemRender
		{
			// TODO Auto Generated method stub
			return new TeamListItemRender();
		}
		private function update():void
		{
			if(ControlCoolDown.IsCustomCoolDown( EnumCustomCoolDown.TEAM_SEARCH_TEAM))
			{
				doRefresh();
			}else
			{
				setTimeout(doRefresh ,
					ControlCoolDown.GetCustomCooldownTime( EnumCustomCoolDown.TEAM_SEARCH_TEAM )+100);
			}
		}
		 override protected function onShow():void
		 {
			 super.onShow();
			 update();
		 }
		private function registerListeners():void
		{
			_skin.btn_shuaixin.addEventListener( Event.TRIGGERED , OnSearchTeam);
			_skin.btn_chakan.addEventListener(Event.TRIGGERED , OnViewPlayer);
			_skin.btn_tianjia.addEventListener(Event.TRIGGERED , OnAddFriend);
			_skin.btn_shenqing.addEventListener(Event.TRIGGERED , OnApplyJoinTeam);
			
			Mgr.teamMgr.addEventListener(TeamEvent.GET_MAP_TEAMS , OnGetTeams);
		}
		private function OnViewPlayer(event:Event):void
		{
			if(TeamListItemExt.curItem != null)
			{
				//Mgr.playerMgr.ReqOthersPlayerInfo( current.Data.captainid );
			}
			else
			{
				NoticeManager.mouseFollowNotify("请先选中一位队长" );
			}
		}
		private function OnAddFriend(event:Event):void
		{
			if(TeamListItemExt.curItem != null)
			{
				//Mgr.friendMgr.AddFriend( current.Data.captainid );
			}
			else
			{
				NoticeManager.mouseFollowNotify("请先选中一位队长");
			}
		}
		private function OnSearchTeam(event:Event):void
		{
		
			if(ControlCoolDown.IsCustomCoolDown( EnumCustomCoolDown.TEAM_SEARCH_TEAM))
			{
				doRefresh();
			}else
			{
				NoticeManager.mouseFollowNotify( "您的刷新太频繁了，请稍等一下" );
			}
		}
		private function doRefresh():void
		{
			TeamSender.ReqSearchNearTeam("");
			TimeCountUtil.ins.addButtonTimeCountDown(_skin.btn_shuaixin,"刷新列表",20);
		}
		private function OnApplyJoinTeam(event:Event):void
		{
			if(TeamListItemExt.curItem != null)
			{
				//TeamSender.ReqApplyJoinTeam( TeamListItemExt.curItem.data.teamid );\
				Mgr.teamMgr.reqJoinToTeam(TeamListItemExt.curItem.data.teamid );
			}
			else
			{
				NoticeManager.mouseFollowNotify("请先选中一位队长");
			}
		}
		
		private var teamList:Vector.<MapTeamInfo>;
		
		private function OnGetTeams( event:TeamEvent ):void
		{
			teamList = event.data as Vector.<MapTeamInfo>;
			RefreshTeamList();
		}
		
		private function RefreshTeamList():void
		{
		
			teamList.sort(SortList);
			_skin.Duiwu_list.dataProvider=new ListCollection(teamList);
			TeamListItemExt.curItem=null;
		}
		/**
		 * 未满员的队伍排在满员的队伍之前，人数越少越靠前；<br>
		同是未满员的队伍则队长等级高的排在之前；<br>
		队长等级相同则平均战力最高的队伍排在之前；<br>
		若以上相同则队伍编号小的排在之前；<br>
		同是满员的队伍的排序规则与未满员的队伍排序规则相同。
		 * */
		private function SortList(a:MapTeamInfo , b:MapTeamInfo):int
		{
			var ret:int=sortSub(a.teamnum,b.teamnum,-1);
			if (ret!=0) 
			{
				return ret;
			}
			ret=sortSub(a.captainlv,b.captainlv,1);
			if (ret!=0) 
			{
				return ret;
			}
			ret=sortSub(a.averagelv,b.averagelv,1);
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