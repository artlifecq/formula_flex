package com.rpgGame.appModule.skill
{
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.appModule.skill.lostskill.LostSkillIcon;
	import com.rpgGame.appModule.skill.lostskill.LostSkillModePane;
	import com.rpgGame.appModule.skill.lostskill.LostSkillUpLevelView;
	import com.rpgGame.appModule.skill.lostskill.LostSpellActivate;
	import com.rpgGame.coreData.cfg.LostSkillData;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import feathers.controls.Radio;
	import feathers.controls.UIAsset;
	import feathers.core.ToggleGroup;
	
	import org.client.mainCore.manager.EventManager;
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
		private var _bgList:Vector.<UIAsset>;
		private var _lostSkillModePane:LostSkillModePane;
		public function LostSkillView(skin:Juexue_Skin,panel:SkinUIPanel)
		{
			_panel=panel;
			_skin=skin;
			initView();
		}
		private function initView():void
		{
			if(_lostSkillModePane==null)
			{
				var content:Inter3DContainer = new Inter3DContainer();
				this._skin.container.addChildAt(content,4);
				_lostSkillModePane = new LostSkillModePane();
				_lostSkillModePane.x = 25;
				_lostSkillModePane.y = 84;
				content.addChild3D(_lostSkillModePane);
			}
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
			
			_bgList = new Vector.<UIAsset>();
			_bgList.push(_skin.bg_1);
			_bgList.push(_skin.bg_2);
			_bgList.push(_skin.bg_3);
			_bgList.push(_skin.bg_4);
			_bgList.push(_skin.bg_5);
			_bgList.push(_skin.bg_6);
			_bgList.push(_skin.bg_7);
			_activit = new LostSpellActivate(_skin.sk_jihuo.skin as Juexue_jihuo);
			_updataLevel = new LostSkillUpLevelView(_skin.sk_shengji.skin as Juxue_Shengji);
			_radioGroup = Radio.RADIO_GROUP_NAMES[gropname];
			_radioGroup.addEventListener(Event.CHANGE,selecteChangeHandler);
			for(var i:int = 0;i<datas.length;i++)
			{
				if(datas[i]["q_id"]==LostSkillManager.instance().curSkillId)
				{
					_radioGroup.selectedIndex = i;
					break;
				}
			}
		}
		
		public function onShow():void
		{
			refeashIconsList();
			selecteChangeHandler();
			EventManager.addEvent(LostSkillManager.LostSkill_ChangeSkillId,changeStateHandler);
			EventManager.addEvent(LostSkillManager.LostSkill_ChangeSkillState,changeStateHandler);
			EventManager.addEvent(LostSkillManager.LostSkill_UpLevelSkillId,selecteChangeHandler);
		}
		public function onHide():void
		{
			EventManager.removeEvent(LostSkillManager.LostSkill_ChangeSkillId,changeStateHandler);
			EventManager.removeEvent(LostSkillManager.LostSkill_ChangeSkillState,changeStateHandler);
			EventManager.removeEvent(LostSkillManager.LostSkill_UpLevelSkillId,selecteChangeHandler);
		}
		private function refeashIconsList():void
		{
			for each(var icon:LostSkillIcon in _skillIconList)
			{
				icon.refeashView();
			}
		}
		private function changeStateHandler():void
		{
			refeashIconsList();
			selecteChangeHandler();
		}
		private function selecteChangeHandler():void
		{
			var index:int = _radioGroup.selectedIndex;
			var data:Q_lostskill_open = LostSkillData.datas[index];
			var state:SkillStateInfo = LostSkillManager.instance().getSkillStateInfoById(data.q_id);
			_activit.updataSkill(data,state);
			_updataLevel.updataSkill(data,state);
			_lostSkillModePane.setModedata(data);
			_skin.mc_name.gotoAndStop(index);
			for(var i:int = 0;i<_bgList.length;i++)
			{
				_bgList[i].visible = i==index;
			}
		}
	}
}