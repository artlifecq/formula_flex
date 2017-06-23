package com.rpgGame.appModule.guild
{
	import com.rpgGame.coreData.clientConfig.Q_guild_permission;
	import com.rpgGame.netData.guild.bean.GuildMemberInfo;
	
	import feathers.controls.renderers.DefaultListItemRenderer;
	
	import org.mokylin.skin.app.banghui.ItemBg;
	import org.mokylin.skin.app.banghui.ItemJuanXian;
	
	public class GuildDonateCell extends DefaultListItemRenderer
	{
		private var _skin:ItemJuanXian;
		private var _permissionInfo:Q_guild_permission;
		public function GuildDonateCell():void
		{
			super();
		}
		
		override protected function initialize():void
		{
			_skin = new ItemJuanXian();
			_skin.toSprite(this);
		}
		
		
		private function updateSkin():void
		{
			var item:ItemBg = _skin.bg.skin as ItemBg;
			item.bg1.visible = this.index/2 !=0;
			item.bg1.visible = this.index/2 ==0;
		}
		override protected function commitData():void
		{
			updateSkin();
			_skin.uiFirt.visible = this.index ==0;
			if(info==null)
			{
				return ;
			}
			
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
			_skin.lbRolenName.text = info.name;
			_skin.lbZhanli.text = info.curActive.toString();
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