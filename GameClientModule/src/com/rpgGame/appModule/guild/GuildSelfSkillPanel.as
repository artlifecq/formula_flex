package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.core.events.GuildEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.banghui.ProSkill_Item;
	import org.mokylin.skin.app.banghui.Skill_Personal;

	public class GuildSelfSkillPanel extends GuildSkillBase
	{
		private var _skin:Skill_Personal;
		private var _list:Vector.<GuildSkillCellPanel>;
		public function GuildSelfSkillPanel(skin:Skill_Personal):void
		{
			_skin = skin;
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_list = new Vector.<GuildSkillCellPanel>();
			_list.push(new GuildSkillCellPanel(1,_skin.skinGongji.skin as ProSkill_Item));
			_list.push(new GuildSkillCellPanel(2,_skin.skinFangyu.skin as ProSkill_Item));
			_list.push(new GuildSkillCellPanel(3,_skin.skinShengmin.skin as ProSkill_Item));
			_list.push(new GuildSkillCellPanel(4,_skin.skinMingzhong.skin as ProSkill_Item));
			_list.push(new GuildSkillCellPanel(5,_skin.skinBishan.skin as ProSkill_Item));
			_list.push(new GuildSkillCellPanel(6,_skin.skinBaoji.skin as ProSkill_Item));
		}
		
		override protected function show():void
		{
			super.show();
			EventManager.addEvent(GuildEvent.GUILD_SKILLINFO_CHAGE,refeashView);
			refeashView();
		}
		
		private function refeashView():void
		{
			var length:int = _list.length;
			for(var i:int = 0;i<length;i++)
			{
				_list[i].updata();
			}
			if(GuildManager.instance().haveGuild)
			{
				_skin.lbLevel.text = GuildManager.instance().guildData.level.toString();
				_skin.lbGongxian.text = GuildManager.instance().selfMemberInfo.contribution.toString();
			}else{
				_skin.lbLevel.text = "0";
				_skin.lbGongxian.text = "0";
			}
			SkinUI.notifyUpdate(RTNodeID.GUILD_SKILL_SELF);
		}
		
		
		override protected function hide():void
		{
			super.hide();
			EventManager.removeEvent(GuildEvent.GUILD_SKILLINFO_CHAGE,refeashView);
		}
		
	}
}