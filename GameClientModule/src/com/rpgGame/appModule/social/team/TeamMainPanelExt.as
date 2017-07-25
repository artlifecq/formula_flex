package  com.rpgGame.appModule.social.team
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.TabBarPanel;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.shejiao.zudui.ZuiDuiSkin;
	
	import starling.display.DisplayObject;
	

	public class TeamMainPanelExt extends ViewUI
	{
		public static const SUB_MY_TEAM:String="team_sub_myteam";
		public static const SUB_NEAR_TEAM:String="team_sub_nearteam";
		public static const SUB_NEAR_PLAYER:String="team_sub_nearplayer";
		private var _skin:ZuiDuiSkin;
		private var _subMyTeam:MyTeamPanelExt;
		private var _teamList:TeamListPanelExt;
		private var _playerList:TeamPlayerListPanelExt;
		
		private var _curSub:SkinUI;
		private var subTypeArr:Array=[SUB_MY_TEAM,SUB_NEAR_TEAM,SUB_NEAR_PLAYER];
		public function TeamMainPanelExt()
		{
			_skin=new ZuiDuiSkin();
			super(_skin);
			_skin.tab_duiwu.touchGroup=false;
			_skin.tab_duiwu.touchable=true;
			initEvent();
		}
		private function initEvent():void
		{
			_skin.tab_duiwu.addEventListener(Event.CHANGE, onTab);
		}
		private function onTab(e:Event):void
		{
			var index:int = this._skin.tab_duiwu.selectedIndex;
			var sub:SkinUI;
			switch(index)
			{
				case 0:
				{
					sub=subMyTeam;
					break;
				}
				case 1:
				{
					sub=teamList;
					break;
				}
				case 2:
				{
					sub=playerList;
					break;
				}
				default:
				{
					sub=subMyTeam;
					break;
				}
			}
			if (sub==null||sub==_curSub) 
			{
				return;
			}
			if (_curSub) 
			{
				MCUtil.removeSelf(_curSub as DisplayObject);
			}
			_curSub=sub;
			(_curSub as DisplayObject).x=24;
			(_curSub as DisplayObject).y=87;
			this.addChild(_curSub);
		}
		private function showSubPanelIndex(panelIndex:int):void
		{
			if (panelIndex<0||panelIndex>subTypeArr.length-1) 
			{
				return;
			}
			_skin.tab_duiwu.selectedIndex=panelIndex;
		}
		public function showSubPanel(subType:String):void
		{
			showSubPanelIndex(subTypeArr.indexOf(subType));
		}

		/** 组队面板		 */
		public function get subMyTeam():MyTeamPanelExt
		{
			if(_subMyTeam == null)
				_subMyTeam = new MyTeamPanelExt();
			return _subMyTeam;
		}
		override protected function onShow():void
		{
			super.onShow();
			if (_curSub==null) 
			{
				onTab(null);
			}
			Mgr.teamMgr.addEventListener(TeamEvent.GET_TEAM_INFO,onGetTeamInfo);
		}
		override protected function onHide():void
		{
			super.onHide();
			Mgr.teamMgr.removeEventListener(TeamEvent.GET_TEAM_INFO,onGetTeamInfo);
		}
		protected function onGetTeamInfo(event:TeamEvent):void
		{
			// TODO Auto-generated method stub
			if (event.isCreateTeam) 
			{
				if (_skin.tab_duiwu.selectedIndex!=0) 
				{
					_skin.tab_duiwu.selectedIndex=0;
				}
			}
		}
		
		/** 队伍列表		 */
		public function get teamList():TeamListPanelExt
		{
			if(_teamList == null)
				_teamList = new TeamListPanelExt();
			return _teamList;
		}
		/** 玩家列表		 */
		public function get playerList():TeamPlayerListPanelExt
		{
			if(_playerList == null)
				_playerList = new TeamPlayerListPanelExt();
			return _playerList;
		}		
	}
}