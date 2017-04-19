package com.rpgGame.appModule.skill.lostskill
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangUI_2;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import org.mokylin.skin.app.wuxue.juexue.Juexue_jihuo;
	
	import starling.events.Event;

	public class LostSpellActivate
	{
		private var _skin:Juexue_jihuo
		public function LostSpellActivate(skin:Juexue_jihuo):void
		{
			_skin = skin;
			_skin.btn_jihuo.addEventListener(Event.TRIGGERED,triggeredHandler);
		}
		private function triggeredHandler(e:Event):void
		{
			if(_state!=null)
				return ;
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.LostSkill_ActivitMsg,_data.q_yuanbao);
			GameAlert.showAlert(alertSet,clickCallBack);
		}
		private function clickCallBack(gameAlert:GameAlert):void
		{
			switch(gameAlert.clickType)
			{
				case AlertClickTypeEnum.TYPE_SURE:
					LostSkillManager.instance().activitSkill(_data);
					break;
			}
		}
		private var _data:Q_lostskill_open;
		private var _state:SkillStateInfo;
		public function updataSkill(data:Q_lostskill_open,state:SkillStateInfo):void
		{
			_state = state;
			_data = data;
			if(state!=null)
			{
				_skin.container.visible = false;
				return ;
			}
			_skin.container.visible =true;
			_skin.lb_tiaojian.htmlText = LanguageConfig.getText(LangUI_2.Lostskill_activit).replace("$",_data.q_level);
		}
	}
}