package  com.rpgGame.app.ui.main.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.TeamSender;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.netData.team.bean.TeamInfo;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import away3d.events.Event;
	
	import feathers.controls.List;
	import feathers.controls.Scroller;
	import feathers.core.IFeathersControl;
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.mainui.duiwu.DuiWu_Skin;
	
	import starling.display.Sprite;
	
	public class TeamLeftFixedBar extends SkinUI
	{
		private var _skin:DuiWu_Skin;
		private var _curState:Boolean=true;
		private var cellList:Vector.<TeamBarListItemExt>=new Vector.<TeamBarListItemExt>();
		private var con:Sprite=new Sprite();
		public function TeamLeftFixedBar()
		{
			_skin=new DuiWu_Skin();
			super(_skin);
			
			
			this.addChild(con);
			con.x=6;
			con.y=42;
			var cell:TeamBarListItemExt;
			for (var i:int = 0; i < 5; i++) 
			{
				cell=new TeamBarListItemExt();
				cellList.push(cell);
				cell.x=0;
				cell.y=i*(cell.height+2);
				cell.visible=false;
				this.con.addChild(cell);
			}
			
			registerListener();
			this.visible=false;
		}
		private function registerListener():void
		{
			_skin.btn_close.addEventListener(Event.TRIGGERED,onHideList);
			_skin.btn_open.addEventListener(Event.TRIGGERED,onShowList);
			_skin.btnExit.addEventListener(Event.TRIGGERED,onExit);
			Mgr.teamMgr.addEventListener(TeamEvent.GET_TEAM_INFO,updateTeam);
			
		}
		
		
		private function onExit(eve:Event):void
		{
			// TODO Auto Generated method stub
			TeamSender.ReqLeaveTeam(1);
		}
		
		
		public function resize(w : int, h : int) : void 
		{
			this.y =200;
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
			this._skin.btn_close.visible=bShow;
			this._skin.btn_open.visible=!bShow;
			this.con.visible=bShow;
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
			
				var len:int=teamInfo.memberinfo.length;
				var arr:Array=[];
				for (var j:int = 0; j < len; j++) 
				{
					if (teamInfo.memberinfo[j].memberId.EqualTo(MainRoleManager.actorInfo.serverID)) 
					{
						arr.unshift(teamInfo.memberinfo[j]);
					}
					else
					{
						arr.push(teamInfo.memberinfo[j]);
					}
				}
				
				for (var i:int = 0; i < 5; i++) 
				{
					setCellData(cellList[i],(i<len)?arr[i]:null);
				}
				this._skin.lbNum.text=teamInfo.memberinfo.length+"/"+TeamManager.MAXMEMBER;
				//只有自己
			}
			
		}
		
		private function setCellData(cell:TeamBarListItemExt,data:TeamMemberInfo):void
		{
			if (data) 
			{
				cell.visible=true;
				cell.setData(data);
			}
			else
			{
				cell.visible=false;
				cell.clearData();
			}
		}
		override protected function onHide():void
		{
			super.onHide();
		}
	}
}