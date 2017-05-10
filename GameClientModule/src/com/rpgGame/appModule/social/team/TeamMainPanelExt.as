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
			(_curSub as DisplayObject).x=20;
			(_curSub as DisplayObject).y=74;
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