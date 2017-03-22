package com.rpgGame.appModule.skill
{
	import feathers.controls.Scroller;
	
	import org.mokylin.skin.app.wuxue.jineng.JinengTitle_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 *技能学习 
	 * @author dik
	 * 
	 */
	public class SkillStudyView
	{
		private var _skin:jineng_Skin;
		private var _skillContainer:Sprite;
		
		private var _jobTitle1:JinengTitle_Skin;
		private var _jobTitle2:JinengTitle_Skin;
		private var _jobTl1:Sprite;
		private var _jobTl2:Sprite;
		
		public function SkillStudyView(skin:jineng_Skin)
		{
			_skin=skin;
			initView();
		}
		
		private function initView():void
		{
			this._skin.vs_bar.verticalScrollBarPosition = Scroller.VERTICAL_SCROLL_BAR_POSITION_RIGHT;
			this._skin.vs_bar.horizontalScrollPolicy = Scroller.SCROLL_POLICY_OFF;
			this._skin.vs_bar.verticalScrollPolicy = Scroller.SCROLL_POLICY_ON;
			this._skin.vs_bar.scrollBarDisplayMode = Scroller.SCROLL_BAR_DISPLAY_MODE_FIXED;
			_skillContainer=new Sprite();
			this._skin.vs_bar.addChild(_skillContainer);
			this._skin.vs_bar.width=550;
			_jobTitle1=new JinengTitle_Skin();
			_jobTitle2=new JinengTitle_Skin();
			_jobTitle2.labelDisplay.text="其他技能";
			_jobTl1=_jobTitle1.toSprite();
			_jobTl2=_jobTitle2.toSprite();
			
		}
		
		public function onTouchTarget(target:DisplayObject):Boolean
		{
			return false;
		}
	}
}