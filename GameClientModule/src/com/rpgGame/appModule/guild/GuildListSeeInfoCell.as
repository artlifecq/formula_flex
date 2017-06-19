package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.game.netCore.data.long;
	import org.mokylin.skin.app.banghui.TeamItemList;
	
	import starling.display.DisplayObject;
	
	public class GuildListSeeInfoCell extends DefaultListItemRenderer
	{
		private var _skin:TeamItemList;
		private var _levelInfo:Q_guild;
		public function GuildListSeeInfoCell():void
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin = new TeamItemList();
			_skin.toSprite(this);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(_skin.lbTeamName == target)
			{
				AppManager.showApp(AppConstant.GUILD_APPLAYINFO_PANEL,info.guildId);
			}else if(_skin.lbRolenName == target){
//				LookSender.lookOtherPlayer(new long(heroId));
			}
			
		}
		override protected function commitData():void
		{
			if(info==null)
				return ;
			_levelInfo = GuildCfgData.getLevelInfo(info.guildLevel);
			if(info.rank<4)
			{
				_skin.numList2.visible = false;
				_skin.numList.visible = true;
				_skin.numList.label = info.rank.toString();
			}else{
				_skin.numList.visible = false;
				_skin.numList2.visible = true;
				_skin.numList2.text = info.rank.toString();
			}
			
			_skin.lbTeamName.text = info.guildName;
			_skin.lbLevel.text = info.guildLevel.toString();
			_skin.lbRolenName.text = info.chiefName;
			_skin.lbNum.text = info.guildMemberNum.toString()+"/"+_levelInfo.q_max_num.toString();
			_skin.lbZhanli.text = info.allBattle.toString();
			
		}
		private function get info():GuildListInfo
		{
			return this.data as GuildListInfo;
		}
		
		override public function get width():Number
		{
			return _skin.width;
		}
		
		override public function get height():Number
		{
			return _skin.height;
		}
	}
}