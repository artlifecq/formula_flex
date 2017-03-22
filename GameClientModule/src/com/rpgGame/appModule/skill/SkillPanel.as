package com.rpgGame.appModule.skill
{
	import com.rpgGame.app.ui.SkinUIPanel;
	
	import org.mokylin.skin.app.wuxue.Wuxue_Daohang;
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
		private var _navSkin:Wuxue_Daohang;
		
		public function SkillPanel()
		{
			_skin=new Wuxue_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skillStudyView=new SkillStudyView(_skin.jineng.skin as jineng_Skin);	
			_navSkin=_skin.daohang.skin as Wuxue_Daohang;
			_navSkin.btn_juexue.visible=false;
		}
		
		override public function show(data:*=null, openTable:String="", parentContiner:DisplayObjectContainer=null):void
		{
			super.show(data,openTable,parentContiner);
			_skillStudyView.onShow();
		}
		
		override public function hide():void
		{
			super.hide();
			_skillStudyView.onHide();
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			if(_skillStudyView.onTouchTarget(target)){
				return;
			}
			
			switch(target){
				case _navSkin.btn_jineng:
					_skin.jineng.visible=true;
					break;
				case _navSkin.btn_juexue:
					_skin.jineng.visible=false;
					break;
			}
		}
	}
}