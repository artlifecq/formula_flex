package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.skill.lostskill.LostSkillIcon;
	import com.rpgGame.appModule.skill.lostskill.LostSkillUpLevelView;
	import com.rpgGame.appModule.skill.lostskill.LostSpellActivate;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import feathers.controls.Radio;
	import feathers.core.ToggleGroup;
	
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Skin;
	import org.mokylin.skin.app.wuxue.juexue.Juexue_jihuo;
	import org.mokylin.skin.app.wuxue.juexue.Juxue_Shengji;
	
	import starling.events.Event;

	public class LostSkillView
	{
		private var _skin:Juexue_Skin;
		private var _panel:SkinUIPanel;
		private var _skillIconList:Vector.<LostSkillIcon>;
		private var _radioGroup:ToggleGroup;
		private var _activit:LostSpellActivate;
		private var _updataLevel:LostSkillUpLevelView;
		public function LostSkillView(skin:Juexue_Skin,panel:SkinUIPanel)
		{
			_panel=panel;
			_skin=skin;
			initView();
		}
		private function initView():void
		{
			_skillIconList = new Vector.<LostSkillIcon>();
			var datas:Array = LostSkillData.datas;
			var gropname:String = "lostSkillgroup";
			_skillIconList.push(new LostSkillIcon(_skin.sk_feisheng,datas[0],gropname));
			_skillIconList.push(new LostSkillIcon(_skin.sk_wanghun,datas[1],gropname));
			_skillIconList.push(new LostSkillIcon(_skin.skin_bindong,datas[2],gropname));
			_skillIconList.push(new LostSkillIcon(_skin.sk_renzhe,datas[3],gropname));
			_skillIconList.push(new LostSkillIcon(_skin.sk_shikong,datas[4],gropname));
			_skillIconList.push(new LostSkillIcon(_skin.sk_canglong,datas[5],gropname));
			_skillIconList.push(new LostSkillIcon(_skin.sk_shengsheng,datas[6],gropname));
			_activit = new LostSpellActivate(_skin.sk_jihuo.skin as Juexue_jihuo);
			_updataLevel = new LostSkillUpLevelView(_skin.sk_shengji.skin as Juxue_Shengji);
			_radioGroup = Radio.RADIO_GROUP_NAMES[gropname];
			_radioGroup.addEventListener(Event.CHANGE,selecteChangeHandler);
			_radioGroup.selectedIndex = 5;
		}
		
		private function selecteChangeHandler():void
		{
			var index:int = _radioGroup.selectedIndex;
			var data:Q_lostskill_open = LostSkillData.datas[index];
			var state:SkillStateInfo = LostSkillManager.instance().getSkillStateInfoById(data.q_id);
			_activit.updataSkill(data,state);
			_updataLevel.updataSkill(data,state);
		}
		
		private function updataSelectItem(q_data:Q_lostskill_open):void
		{
			for each(var icon:LostSkillIcon in _skillIconList)
			{
				icon.updataSelected(q_data);
			}
		}
	}
}