package com.rpgGame.appModule.skill
{
	import com.rpgGame.core.events.SpellEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.wuxue.jineng.jinengItemsSkin;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 *技能描述元素 
	 * @author dik
	 * 
	 */
	public class SkillItem extends SkinUI
	{
		private var _skin:jinengItemsSkin;
		private var _skillInfo:SkillInfo;
		private var _skillCfg:Q_skill_model;
		private var _selected:Boolean;
		
		public function SkillItem()
		{
			_skin=new jinengItemsSkin();
			selected=false;
			super(_skin);
		}
		
		public function get skillCfg():Q_skill_model
		{
			return _skillCfg;
		}

		public function get skillInfo():SkillInfo
		{
			return _skillInfo;
		}

		public function updateItem(cfg:Q_skill_model,info:SkillInfo=null):void
		{
			_skin.txt_Name.text=cfg.q_skillName;
			_skillCfg=cfg;
			_skillInfo=info;
			if(info){
				_skin.txt_level.text="等级:"+info.skillLevel+"/"+cfg.q_max_level;
			}
			
		}
		
		override protected function onTouch(e:TouchEvent):void
		{
			super.onTouch(e);
			if(_selected){
				return;
			}
			var t:Touch=e.getTouch(_skin.select_btn);
			if(!t){
				_skin.select_btn.alpha=0;
			}
			t=e.getTouch(_skin.select_btn,TouchPhase.HOVER);
			if(t){
				_skin.select_btn.alpha=0.5;
			}
		}
		
		public function set selected(value:Boolean):void
		{
			_selected=value;
			if(value){
				_skin.select_btn.alpha=1;
			}else{
				_skin.select_btn.alpha=0;
			}
		}
			
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			selected=true;
			EventManager.dispatchEvent(SpellEvent.SELECTE_SPELL,this);
		}
	}
}