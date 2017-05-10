package  com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.team.bean.TeamInfo;
	

	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.mainui.duiwu.DuiWu_Skin;
	
	import starling.events.Event;
	
	public class TeamLeftFixedBar extends SkinUI
	{
		private var _skin:DuiWu_Skin;
		private var _curState:Boolean=true;
		public function TeamLeftFixedBar()
		{
			_skin=new DuiWu_Skin();
			super(_skin);
			
			
			
			
			
			var list:List=_skin.list_head;
			list.itemRendererFactory = createStoneCell;
			//list.touchAcross=true;
			list.clipContent = true;
			list.scrollBarDisplayMode = "fixed";
			list.verticalScrollBarPosition = "right";
			list.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			list.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			list.padding=2;
			registerListener();
			this.visible=false;
		}
		private function registerListener():void
		{
			_skin.btn_up.addEventListener(Event.TRIGGERED,onHideList);
			_skin.btn_down.addEventListener(Event.TRIGGERED,onShowList);
			_skin.btnExit.addEventListener(Event.TRIGGERED,onExit);
			Mgr.teamMgr.addEventListener(TeamEvent.GET_TEAM_INFO,updateTeam);
			
		}
		
		
		private function onExit(eve:Event):void
		{
			// TODO Auto Generated method stub
			TeamSender.ReqLeaveTeam(1);
		}
		
		private function createStoneCell():TeamBarListItemRender
		{
			// TODO Auto Generated method stub
			return new TeamBarListItemRender();
		}
		public function resize(w : int, h : int) : void 
		{
			this.y = 0.5*(h-this.height);
			this.x = 0;
		}
		private function onHideList(eve:Event):void
		{
			// TODO Auto Generated method stub
			showHideList(false);
		}
		
		private function onShowList(eve:Event):void
		{
			// TODO Auto Generated method stub
			showHideList(true);
		}
		private function showHideList(bShow:Boolean):void
		{
			_curState=bShow;
			this._skin.btn_up.visible=bShow;
			this._skin.btn_down.visible=!bShow;
			this._skin.list_head.visible=bShow;
		}
		override protected function onShow():void
		{
			super.onShow();
			
		}
		protected function updateTeam(event:TeamEvent):void
		{
			// TODO Auto-generated method stub
			//解散了
			if (event.isDismissTeam) 
			{
				this.visible=false;
				return;
			}
			if (event.isCreateTeam) 
			{
				showHideList(true);
			}
			this.visible=true;
			var teamInfo:TeamInfo=event.data as TeamInfo;
			if (teamInfo) 
			{
				this._skin.list_head.dataProvider=new ListCollection(teamInfo.memberinfo);
				this._skin.lbNum.text=teamInfo.memberinfo.length+"/"+TeamManager.MAXMEMBER;
			}
			
		}
		override protected function onHide():void
		{
			super.onHide();
		}
	}
}