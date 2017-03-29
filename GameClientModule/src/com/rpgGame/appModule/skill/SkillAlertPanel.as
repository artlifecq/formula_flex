package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.sender.SpellSender;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	
	import org.mokylin.skin.app.wuxue.jineng.JinengTankuang_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * 
	 * @author dik
	 * 
	 */
	public class SkillAlertPanel extends SkinUIPanel
	{
		private var _skin:JinengTankuang_Skin;
		private var _skillData:Q_skill_model;
		
		public function SkillAlertPanel()
		{
			_skin=new JinengTankuang_Skin();
			super(_skin);
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_skillData=data as Q_skill_model;
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.chk_ok:
					SpellDataManager.unAlert=_skin.chk_ok.isSelected;
					break;
				case _skin.btn_ok:
					SpellSender.reqSkillLevelUp(_skillData.q_skillID,0,1);
					if(_skin.chk_ok.isSelected){
						SpellDataManager.oneKeyup=true;
					}	
					this.hide();
					break;
				case _skin.btn_cancel:
					SpellSender.reqSkillLevelUp(_skillData.q_skillID,0,0);
					if(_skin.chk_ok.isSelected){
						SpellDataManager.oneKeyup=false;
					}
					this.hide();
					break;
			}
		}
	}
}