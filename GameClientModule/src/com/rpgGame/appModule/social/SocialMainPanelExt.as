package  com.rpgGame.appModule.social
{
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.social.team.TeamMainPanelExt;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.MCUtil;
	
	import org.mokylin.skin.app.shejiao.Shejiao_Daohang;
	import org.mokylin.skin.app.shejiao.Shejiao_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	
	
	/**
	 *社交面板 
	 * @author dik
	 * 
	 */
	public class SocialMainPanelExt extends SkinUIPanel
	{
		public static const SUB_GUILD:String="social_guild_panel";
		public static const SUB_TEAM:String="social_team_panel";
		public static const SUB_FRIEND:String="social_friend_panel";
	
		protected var _skin : Shejiao_Skin;
		
		
		private var _subGuild:*;
		private var _subTeam:TeamMainPanelExt;
		private var _subFriend:*;
		private var _curSub:SkinUI;
		
		public function SocialMainPanelExt()
		{
			this._skin = new Shejiao_Skin();
			super(_skin);
		
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void 
		{
			super.show(data, openTable, parentContiner);
			var sub:String=openTable;
			if (sub==""&&_curSub==null) 
			{
				sub=SUB_TEAM;
				showSubPanel(sub);
			}
			
		}
		public function showSubPanel(subType:String):void
		{
			var sub:SkinUI;
			switch(subType)
			{
				case SUB_GUILD:
				{
					sub=_subGuild;
					break;
				}
				case SUB_FRIEND:
				{
					sub=subFriend;
					break;
				}
				case SUB_TEAM:
				{
					sub=subTeam;
					break;
				}
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
			(_curSub as DisplayObject).x=0;
			(_curSub as DisplayObject).y=0;
			this.addChild(_curSub);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if ( target==(_skin.daohang.skin as Shejiao_Daohang).btn_zudui) 
			{
				showSubPanel(SUB_TEAM);
			}
		}
		
		
		/**
		 * 当舞台尺寸变化后
		 * @param sw 舞台宽
		 * @param sh 舞台高
		 *
		 */
		override protected function onStageResize(sw : int, sh : int) : void
		{
			super.onStageResize(sw,sh);
		}
		
		override public function hide():void
		{
			super.hide();
		}
		override protected function onShow():void
		{
			super.onShow();
		}
		override protected function onHide():void
		{
			super.onHide();
			
		}

		public function get subGuild():*
		{
			return _subGuild;
		}

		public function get subTeam():TeamMainPanelExt
		{
			if (!_subTeam) 
			{
				_subTeam=new TeamMainPanelExt();
			}
			return _subTeam;
		}

		public function get subFriend():*
		{
			return _subFriend;
		}


	}
}


