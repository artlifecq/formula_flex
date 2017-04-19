package com.rpgGame.appModule.skill.lostskill
{
	import com.rpgGame.app.manager.LostSkillManager;
	import com.rpgGame.appModule.systemset.TouchToState;
	import com.rpgGame.coreData.clientConfig.Q_lostskill_open;
	import com.rpgGame.netData.lostSkill.bean.SkillStateInfo;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.wuxue.juexue.Juexue_Item;
	
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchPhase;

	public class LostSkillIcon
	{
		private var _skin:Juexue_Item;
		private var _data:Q_lostskill_open;
		private var _stateinfo:SkillStateInfo;
		public function LostSkillIcon(content:SkinnableContainer,data:Q_lostskill_open,groupName:String):void
		{
			_skin = content.skin as Juexue_Item;
			_skin.btn_over.groupName = groupName;
			_data = data;
			initView();
		}
		
		
		private function initView():void
		{
			_stateinfo = LostSkillManager.instance().getSkillStateInfoById(_data.q_id);
			_skin.qiyong.visible = _data.q_id == LostSkillManager.instance().curSkillId;
			_skin.lb_name.text = _data.q_name;
			_skin.lb_weijihuo.visible = _stateinfo ==null;
			
			_skin.qiyong.touchable = false;
			_skin.lb_name.touchable = false;
			_skin.weijihuo.touchable = false;
			_skin.jihuo.touchable = false;
			_skin.lb_weijihuo.touchable = false;
		}
		
		public function updataSelected(data:Q_lostskill_open):void
		{
//			_skin.btn_over.visible = _data == data?1:0;
		}
	}
}