package com.rpgGame.appModule.skill.lostskill
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.coreData.enum.AlertClickTypeEnum;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
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
			var str:String = "是否需要花费$元宝激活该技能"
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.RECEIVE_JOIN_INVITE,_data.q_yuanbao);
			GameAlert.showAlert(alertSet,clickCallBack);
//			GameAlert.show(str.replace("$",_data.q_yuanbao), "提示");
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
			_skin.lb_tiaojian.htmlText = String("激活条件：人物等级达到$级").replace("$",_data.q_level);
		}
	}
}