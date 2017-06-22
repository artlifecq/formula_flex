package com.rpgGame.appModule.guild
{
	import com.rpgGame.app.manager.guild.GuildManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	
	import away3d.events.Event;
	
	import feathers.core.ToggleGroup;
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.banghui.BangHui_Skill;
	import org.mokylin.skin.app.banghui.Skill_Personal;
	import org.mokylin.skin.app.banghui.Skill_TongShuai;
	
	public class GuildSkillViewUI extends ViewUI
	{
		private var _skin:BangHui_Skill;
		private var _panleList:Vector.<GuildSkillBase>;
		private var _gropu:ToggleGroup;
		public function GuildSkillViewUI():void
		{
			_skin = new BangHui_Skill();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_panleList = new Vector.<GuildSkillBase>();
			_panleList.push(new GuildSelfSkillPanel(_skin.skinPersonal.skin as Skill_Personal));
			_panleList.push(new GuildOtherSkillPanel(_skin.skinTongShuai.skin as Skill_TongShuai));
			_gropu = _skin.btnSkill1.toggleGroup;
			_gropu.addEventListener(Event.CHANGE,changeHandler);
			changeHandler(null);
		}
		
		private function changeHandler(e:Event):void
		{
			var index:int = _gropu.selectedIndex;
			if(index<0)
				index = 0;
			var length:int = _panleList.length;
			for(var i:int = 0;i<length;i++)
			{
				_panleList[i].visible = i==index;
			}
		}
		
		override public function show(data:Object=null):void
		{
			super.show(data);
			if(!GuildManager.instance().haveGuild||!GuildManager.instance().isLeader)
			{
				_skin.btnSkill2.touchable = false;
				GrayFilter.gray(_skin.btnSkill2);
			}else{
				_skin.btnSkill2.touchable = true;
				_skin.btnSkill2.filter = null;
			}
			
			_gropu.selectedIndex = 0;
			GuildManager.instance().reqGuildSkillInfo();
		}
		
	}
}