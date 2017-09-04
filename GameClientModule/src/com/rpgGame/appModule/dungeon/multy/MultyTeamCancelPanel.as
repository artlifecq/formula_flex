package com.rpgGame.appModule.dungeon.multy
{
	import com.rpgGame.app.manager.DungeonManager;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.sender.DungeonSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.netData.team.bean.TeamMemberInfo;
	
	import feathers.controls.StateSkin;
	
	import org.mokylin.skin.app.fuben.FuBenTanKuang2;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	public class MultyTeamCancelPanel extends SkinUIPanel
	{
		private var _skin:FuBenTanKuang2;
		public function MultyTeamCancelPanel()
		{
			_skin = new FuBenTanKuang2();
			super(_skin);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			//super.onTouchTarget(target);
			switch (target) {
				case _skin.btnOK:
					this.hide();
					break;
			}
			
		}
		override public function show(data:*=null, openTable:int=0, parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			var playerId:int=int(data);
			var memberinfoList:Vector.<TeamMemberInfo>=TeamManager.ins.teamInfo.memberinfo;
			_skin.title.htmlText="";
			if(playerId>0&&memberinfoList)
			{
				for each(var memberinfo:TeamMemberInfo in memberinfoList)
				{
					if(memberinfo.memberId.ToGID()==playerId)
					{
						_skin.title.htmlText=memberinfo.memberName+"还没有准备就绪";
						return;
					}
				}
				
			}
			_skin.title.htmlText="队伍中有玩家还没有准备就绪";
			
		}
	}
}