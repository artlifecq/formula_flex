package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild;
	import com.rpgGame.netData.guild.bean.GuildInviteInfo;
	
	import org.mokylin.skin.app.banghui.ItemYaoQin;
	import org.mokylin.skin.common.ItemBg;
	
	import starling.display.DisplayObject;
	
	public class GuildInvitationListCell extends SkinUI
	{
		private var _skin:ItemYaoQin;
		private var _inviteInfo:GuildInviteInfo;
		private var indexValue:int;
		public function GuildInvitationListCell(index:int):void
		{
			_skin = new ItemYaoQin();
			super(_skin);
			indexValue=index;
		}
		
		
		
		private function updateSkin():void
		{
			var item:ItemBg = _skin.bg.skin as org.mokylin.skin.common.ItemBg;
			if(this.indexValue%2 ==0)
			{
				item.bg1.visible = true;
				item.bg2.visible = false;
			}else{
				item.bg1.visible = false;
				item.bg2.visible = true;
			}
			
		}
		public function setData(data:GuildInviteInfo):void
		{
			updateSkin();
			_inviteInfo = GuildManager.instance().getinviteListInfoByIndex(this.indexValue);
			if(_inviteInfo==null)
			{
				_skin.lbTeamName.visible = false;
				_skin.lbLevel.visible = false;
				_skin.lbRoleName.visible = false;
				_skin.lbZhanli.visible = false;
				_skin.lbNum.visible = false;
				_skin.btnOk.visible = false;
				_skin.lbZhanli0.visible = false;
				return ;
			}else{
				_skin.lbTeamName.visible = true;
				_skin.lbLevel.visible = true;
				_skin.lbRoleName.visible = true;
				_skin.lbZhanli.visible = true;
				_skin.lbNum.visible = true;
				_skin.btnOk.visible = true;
				_skin.lbZhanli0.visible = true;
			}
			_skin.lbTeamName.text = _inviteInfo.info.guildName;
			_skin.lbLevel.text = _inviteInfo.info.guildLevel.toString();
			_skin.lbRoleName.text = _inviteInfo.info.chiefName;
			_skin.lbZhanli.text = _inviteInfo.info.allBattle.toString();
			var levelInfo:Q_guild = GuildCfgData.getLevelInfo(_inviteInfo.info.guildLevel);
			_skin.lbNum.text = _inviteInfo.info.guildMemberNum.toString()+"/"+levelInfo.q_max_num.toString();
			if(_inviteInfo.info.guildMemberNum >= levelInfo.q_max_num)
			{
				_skin.btnOk.visible = false;
				_skin.lbZhanli0.visible = true;
			}else{
				_skin.btnOk.visible = true;
				_skin.lbZhanli0.visible = false;
			}
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(target == _skin.btnOk)
			{
				GuildManager.instance().reqGuildInviteOperation(_inviteInfo.id,1);
			}
		}
	}
}