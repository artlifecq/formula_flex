package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.netData.team.bean.MapTeamInfo;
	import com.rpgGame.netData.team.bean.TeamMemberNameInfo;
	
	import org.mokylin.skin.app.shejiao.zudui.DuiWu_Tips;
	
	public class TeamTipExt extends SkinUI implements ITip
	{
		private static var _instance : TeamTipExt = null;
		
		public static function get instance() : TeamTipExt
		{
			if (!_instance)
			{
				_instance = new TeamTipExt();
			}
			return _instance;
		}
		private var _skin:DuiWu_Tips;
		public function TeamTipExt()
		{
			_skin=new DuiWu_Tips();
			super(_skin);
		}
		
		public function setTipData(data:*):void
		{
			var mapTeam:MapTeamInfo=(data as DynamicTipData).data;
			_skin.lbl_laiyuan.text="";
			_skin.lbl_miaoshu.text="";
			if (mapTeam) 
			{
				var len:int=mapTeam.memberinfo.length;
				var nameStr:String="";
				var lvStr:String="";
				var mem:TeamMemberNameInfo;
				var flag:String="";
				for (var i:int = 0; i < len; i++) 
				{
					if (i!=len-1) 
					{
						flag="<br>";
					}
					else
					{
						flag="";
					}
					mem=mapTeam.memberinfo[i];
					nameStr+=mem.memberName+flag;
					lvStr+=mem.memberLevel+flag;
				}
				_skin.lbl_miaoshu.text=nameStr;
				_skin.lbl_laiyuan.text=lvStr;
			}
		}
		
		public function hideTips():void
		{
		}
	}
}