package  com.rpgGame.appModule.social.team
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.mokylin.skin.app.shejiao.zudui.ZuiDuiSkin;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	

	
	public class TeamMainPanelExt extends SkinUI
	{
		public static const SUB_MY_TEAM:String="team_sub_myteam";
		public static const SUB_NEAR_TEAM:String="team_sub_nearteam";
		public static const SUB_NEAR_PLAYER:String="team_sub_nearplayer";
		private var _skin:ZuiDuiSkin;
		private var _subMyTeam:MyTeamPanelExt;
		private var _teamList:TeamListPanelExt;
		private var _playerList:TeamPlayerListPanelExt;
		
		private var _curSub:SkinUI;
		
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
			switch(index)
			{
				case 0:
				{
					showSubPanel(SUB_MY_TEAM);
					break;
				}
				case 1:
				{
					showSubPanel(SUB_NEAR_TEAM);
					break;
				}
				case 2:
				{
					showSubPanel(SUB_NEAR_PLAYER);
					break;
				}
				default:
				{
					showSubPanel(SUB_MY_TEAM);
					break;
				}
			}
		}
		public function showSubPanel(subType:String):void
		{
			var sub:SkinUI;
			switch(subType)
			{
				case SUB_MY_TEAM:
				{
					sub=subMyTeam;
					break;
				}
				case SUB_NEAR_TEAM:
				{
					sub=teamList;
					break;
				}
				case SUB_NEAR_PLAYER:
				{
					sub=playerList;
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
			(_curSub as DisplayObject).x=20;
			(_curSub as DisplayObject).y=74;
			this.addChild(_curSub);
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
				showSubPanel(SUB_MY_TEAM);
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