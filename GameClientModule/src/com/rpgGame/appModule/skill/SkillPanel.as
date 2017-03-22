package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.wuxue.Wuxue_Skin;
	import org.mokylin.skin.app.wuxue.jineng.jineng_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	
	/**
	 *武学面板 
	 * @author dik
	 * 
	 */
	public class SkillPanel extends SkinUIPanel
	{
		private var _skin:Wuxue_Skin;
		
		private var _skillStudyView:SkillStudyView;
		
		public function SkillPanel()
		{
			_skin=new Wuxue_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skillStudyView=new SkillStudyView(_skin.jineng.skin as jineng_Skin);	
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(_skillStudyView.onTouchTarget(target)){
				return;
			}
		}
	}
}