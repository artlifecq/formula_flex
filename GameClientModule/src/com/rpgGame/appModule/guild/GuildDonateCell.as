package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.ItemJuanXian;
	import org.mokylin.skin.common.ItemBg;
	
	public class GuildDonateCell extends SkinUI
	{
		private var _skin:ItemJuanXian;
		private var _permissionInfo:Q_guild_permission;
		private var index:int;
		public function GuildDonateCell(i:int):void
		{
			this.index=i;
			_skin = new ItemJuanXian();
			super(_skin);
		}

		private function updateSkin():void
		{
			var item:ItemBg = _skin.bg.skin as org.mokylin.skin.common.ItemBg;
			item.bg1.visible = this.index%2 ==0;
			item.bg2.visible = !item.bg1.visible ;
		}
		public function setData(info:GuildMemberInfo):void
		{
			updateSkin();
			_skin.uiFirt.visible = this.index ==0;
			if(info==null)
			{
				_skin.gUI.visible=false;
				return ;
			}
			_skin.gUI.visible=true;
			var rank:int = this.index+1;
			if(rank<4)
			{
				_skin.numList2.visible = false;
				_skin.numList.visible = true;
				_skin.numList.label = rank.toString();
			}else{
				_skin.numList.visible = false;
				_skin.numList2.visible = true;
				_skin.numList2.text = rank.toString();
			}
			_skin.lbZhanli.text = info.battle.toString();
			_skin.lbRolenName.text =MainRoleManager.getPlayerName( info.name);
			_skin.lbZhanli.text = info.curActive.toString();
		}
	}
}