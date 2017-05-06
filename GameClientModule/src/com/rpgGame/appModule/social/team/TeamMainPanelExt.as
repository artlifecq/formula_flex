package  com.rpgGame.appModule.social.team
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.mokylin.skin.app.shejiao.zudui.ZuiDuiSkin;
	
	import starling.display.DisplayObject;
	

	
	public class TeamMainPanelExt extends SkinUI
	{
		public static const SUB_MY_TEAM:String="team_sub_myteam";
		public static const SUB_NEAR_TEAM:String="team_sub_nearteam";
		public static const SUB_NEAR_PLAYER:String="team_sub_nearplayer";
		private var _skin:ZuiDuiSkin;
		private var _subMyTeam:MyTeamPanelExt;
//		private var _teamList:TeamListPanelExt;
//		private var _playerList:PlayerListPanelExt;
		
		private var _curSub:SkinUI;
		
		public function TeamMainPanelExt()
		{
			_skin=new ZuiDuiSkin();
			super(_skin);
			x = 10;
			y = 48;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
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
//				case SUB_FRIEND:
//				{
//					sub=subFriend;
//					break;
//				}
//				case SUB_TEAM:
//				{
//					sub=subTeam;
//					break;
//				}
			}
			if (sub==_curSub) 
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
			this.addChildAt(_curSub as DisplayObject,1);
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
//		public function get teamList():TeamListPanelExt
//		{
//			if(_teamList == null)
//				_teamList = new TeamListPanelExt();
//			return _teamList;
//		}
//		/** 玩家列表		 */
//		public function get playerList():PlayerListPanelExt
//		{
//			if(_playerList == null)
//				_playerList = new PlayerListPanelExt();
//			return _playerList;
//		}		
	}
}