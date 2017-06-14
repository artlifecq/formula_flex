package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.MenuManager;
	import com.rpgGame.app.utils.MenuUtil;
	import com.rpgGame.coreData.cfg.GuildCfgData;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.TeamItem2_Skin;
	
	import starling.display.DisplayObject;
	
	public class GuildPlayerInfoCell extends DefaultListItemRenderer
	{
		private var _skin:TeamItem2_Skin;
		private var _permissionInfo:Q_guild_permission;
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
			var uise:Number= info.id.ToGID();
			var userName : String = info.name;
			var menus : Array = MenuUtil.getPlayerTargetGuildMenu(uise, true);
			MenuManager.showMenu(menus, [uise, userName], -1, -1, 80);
		}
		override protected function commitData():void
		{
			_permissionInfo = GuildCfgData.getPermissionInfo(info.memberType);
			_skin.numList2.text = _permissionInfo.q_name;
			_skin.lbTeamName.text = info.name;
			_skin.lbZhanli.text = info.battle.toString();
			_skin.lbRolenName.htmlText = info.level+"级"+HtmlTextUtil.getTextColor(0xff0000,ItemUtil.getJobName(info.job));
			_skin.lbZhouHuoYue.text = info.curActive.toString();
			_skin.lbZongHuoYue.text = info.allActive.toString();
			_skin.lbOnLine.text = info.online==1?"在线":"不在线";
		}
		private function get info():GuildMemberInfo
		{
			return this.data as GuildMemberInfo;
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