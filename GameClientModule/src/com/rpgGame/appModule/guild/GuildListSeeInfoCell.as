package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.sender.GuildSender;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildListInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.TeamItemList;
	import org.mokylin.skin.common.ItemBg;
	
	import starling.display.DisplayObject;
	
	public class GuildListSeeInfoCell extends DefaultListItemRenderer
	{
		private var _skin:TeamItemList;
		private var _levelInfo:Q_guild;
		private var _guildListinfo:GuildListInfo;
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
				GuildSender.reqGuildBriefnessInfo(_guildListinfo.guildId,0);
			}else if(_skin.lbRolenName == target){
				LookSender.lookOtherPlayer(_guildListinfo.chiefId);
			}
			
		}
		private function updateSkin():void
		{
			var item:ItemBg = _skin.bg.skin as ItemBg;
			if(this.indexValue%2 ==0)
			{
				item.bg1.visible = true;
				item.bg2.visible = false;
			}else{
				item.bg1.visible = false;
				item.bg2.visible = true;
			}
		}
		private function get indexValue():int
		{
			return this.data as int;
		}

		override protected function commitData():void
		{
			updateSkin();
			_guildListinfo = GuildManager.instance().getGuildListInfoByIndex(this.indexValue);
			if(_guildListinfo==null)
			{
				_skin.lbLevel.visible = false;
				_skin.lbNum.visible = false;
				_skin.lbRolenName.visible = false;
				_skin.lbTeamName.visible = false;
				_skin.lbZhanli.visible = false;
				_skin.numList.visible = false;
				_skin.numList2.visible = false;
				_skin.uiFirt.visible = false;
				return ;
			}else{
				_skin.lbLevel.visible = true;
				_skin.lbNum.visible = true;
				_skin.lbRolenName.visible = true;
				_skin.lbTeamName.visible = true;
				_skin.lbZhanli.visible = true;
				_skin.numList.visible = true;
				_skin.numList2.visible = true;
			}
			_levelInfo = GuildCfgData.getLevelInfo(_guildListinfo.guildLevel);
			if(_guildListinfo.rank<4)
			{
				_skin.numList2.visible = false;
				_skin.numList.visible = true;
				_skin.numList.label = _guildListinfo.rank.toString();
			}else{
				_skin.numList.visible = false;
				_skin.numList2.visible = true;
				_skin.numList2.text = _guildListinfo.rank.toString();
			}
			_skin.uiFirt.visible = _guildListinfo.rank == 1;
			_skin.lbTeamName.text = _guildListinfo.guildName;
			_skin.lbLevel.text = _guildListinfo.guildLevel.toString();
			_skin.lbRolenName.text = _guildListinfo.chiefName;
			_skin.lbNum.text = _guildListinfo.guildMemberNum.toString()+"/"+_levelInfo.q_max_num.toString();
			_skin.lbZhanli.text = _guildListinfo.allBattle.toString();
			
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