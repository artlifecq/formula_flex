package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.enum.EnumGuildPost;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.banghui.TeamItem2_Skin;
	import org.mokylin.skin.common.ItemBg;
	
	import starling.display.DisplayObject;
	
	public class GuildPlayerInfoCell extends DefaultListItemRenderer
	{
		private var _skin:TeamItem2_Skin;
		private var _permissionInfo:Q_guild_permission;
		private var _guildMemberInfo:GuildMemberInfo;
		public function GuildPlayerInfoCell():void
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin = new TeamItem2_Skin();
			_skin.toSprite(this);
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			
			if(_guildMemberInfo==null)
				return ;
			var uise:*= _guildMemberInfo.id.hexValue
			var userName : String = _guildMemberInfo.name;
			var menus : Array;
			if(MainRoleManager.isSelf(_guildMemberInfo.id.ToGID()))
			{
				if(!GuildManager.instance().canLeader)
					return ;
				menus= MenuUtil.getPlayerTargetGuildMenu2(uise, true);
				MenuManager.showMenu(menus, [uise, userName], -1, -1, 80);
			}else{
				menus= MenuUtil.getPlayerTargetGuildMenu(uise, true);
				MenuManager.showMenu(menus, [uise, userName], -1, -1, 80);
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
		override protected function commitData():void
		{
			updateSkin();
			_guildMemberInfo = GuildManager.instance().getSortGuildMenberInfoByIndex(indexValue);
			if(_guildMemberInfo==null)
			{
				_skin.lbOnLine.visible = false;
				_skin.lbRolenName.visible = false;
				_skin.lbTeamName.visible = false;
				_skin.lbZhanli.visible = false;
				_skin.lbZhouHuoYue.visible = false;
				_skin.lbZongHuoYue.visible = false;
				_skin.numList2.visible = false;
				_skin.uiFirt.visible = false;
				_skin.uiTongShuai.visible = false;
				return ;
			}else{
				_skin.lbOnLine.visible = true;
				_skin.lbRolenName.visible = true;
				_skin.lbTeamName.visible = true;
				_skin.lbZhanli.visible = true;
				_skin.lbZhouHuoYue.visible = true;
				_skin.lbZongHuoYue.visible = true;
				_skin.numList2.visible = true;
				_skin.uiTongShuai.visible = true;
			}
			_skin.uiFirt.visible = this.indexValue ==0;
			var memberType:int = _guildMemberInfo.memberType;
			if(_guildMemberInfo.isProxyChief==1)
				memberType = EnumGuildPost.GUILDPOST_AGEN_CHIEF;
			_permissionInfo = GuildCfgData.getPermissionInfo(memberType);
			_skin.numList2.text = _permissionInfo.q_name;
			_skin.lbTeamName.text = _guildMemberInfo.name;
			_skin.lbZhanli.text = _guildMemberInfo.battle.toString();
			_skin.lbRolenName.htmlText = _guildMemberInfo.level+"级"+HtmlTextUtil.getTextColor(0xff0000,ItemUtil.getJobName(_guildMemberInfo.job));
			_skin.lbZhouHuoYue.text = _guildMemberInfo.curActive.toString();
			_skin.lbZongHuoYue.text = _guildMemberInfo.allActive.toString();
			_skin.uiTongShuai.visible = _guildMemberInfo.isLeader ==1;
			if(_guildMemberInfo.online==1)
			{
				_skin.lbOnLine.text = "在线";
				_skin.lbOnLine.filter = null;
				_skin.lbRolenName.filter = null;
				_skin.lbTeamName.filter = null;
				_skin.lbZhanli.filter = null;
				_skin.lbZhouHuoYue.filter = null;
				_skin.numList2.filter = null;
				_skin.uiTongShuai.filter = null;
			}else{
				_skin.lbOnLine.text = "离线";
				GrayFilter.gray(_skin.lbOnLine);
				GrayFilter.gray(_skin.lbRolenName);
				GrayFilter.gray(_skin.lbTeamName);
				GrayFilter.gray(_skin.lbZhanli);
				GrayFilter.gray(_skin.lbZhouHuoYue);
				GrayFilter.gray(_skin.numList2);
				GrayFilter.gray(_skin.uiTongShuai);
			}
		}
		private function get indexValue():int
		{
			return this.data as int;
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