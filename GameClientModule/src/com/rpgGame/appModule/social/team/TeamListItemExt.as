package  com.rpgGame.appModule.social.team
{
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.GameColorUtil;
	import com.rpgGame.coreData.cfg.ClientSceneCfgData;
	import com.rpgGame.netData.team.bean.MapTeamInfo;
	
	import org.mokylin.skin.app.shejiao.zudui.DuiWu_Item;
	
	import starling.display.DisplayObject;


	
	public class TeamListItemExt extends SkinUI
	{
		public static var curItem:TeamListItemExt;
		private var _data:MapTeamInfo;
		private var _skin:DuiWu_Item;
		public function TeamListItemExt()
		{
			_skin=new DuiWu_Item();
			super(_skin);
		}	
		public function setData(team:*):void
		{
			this._data=team as MapTeamInfo;
			_skin.lbName.text=team.captainname;
			_skin.lbLevel.text=team.captainlv+"级";
			_skin.lbZhanli.text=team.avgFightPower+"";
			if (team.teamnum<TeamManager.MAXMEMBER) 
			{
				_skin.lbNum.text=team.teamnum+"/"+TeamManager.MAXMEMBER;
				_skin.lbNum.color=GameColorUtil.COLOR_GREEN;
			}
			else
			{
				_skin.lbNum.text="【已满员】";
				_skin.lbNum.color=GameColorUtil.COLOR_RED;
			}
			_skin.lbMap.text=ClientSceneCfgData.getSceneInfo(team.line).q_map_name;
			
			
		}

		public function get data():MapTeamInfo
		{
			return _data;
		}
		override public function dispose():void
		{
			super.dispose();
			_data=null;
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			curItem=this;
		}
	}
}