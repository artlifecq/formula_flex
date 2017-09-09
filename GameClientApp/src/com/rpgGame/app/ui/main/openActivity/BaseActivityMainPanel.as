package com.rpgGame.app.ui.main.openActivity
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.ActivityPanelMgr;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.app.ui.main.openActivity.comps.IActivityPanel;
	
	import flash.events.Event;
	
	import feathers.controls.StateSkin;

	/**
	 *活动面板基类 
	 * @author yfl
	 * 
	 */	
	public class BaseActivityMainPanel extends SkinUIPanel
	{
		protected var _mainPanelType:int
		public function BaseActivityMainPanel(type:int,skin:StateSkin)
		{
			super(skin);
			_mainPanelType=type;
			this.dragAble=true;
		}
		public function get mainPanelType():int
		{
			return _mainPanelType;
		}
		
		override protected function onShow():void
		{
			super.onShow();
			Mgr.activityPanelMgr.addEventListener(ActivityPanelMgr.EVENT_GET,onGetActivites);
			setData(Mgr.activityPanelMgr.getTagActivityByMianPanel(_mainPanelType));
		}
		protected function setData(hash:HashMap):void
		{
			
		}
		protected function onGetActivites(event:Event):void
		{
			// TODO Auto-generated method stub
			setData(Mgr.activityPanelMgr.getTagActivityByMianPanel(_mainPanelType))
		}
		override protected function onHide():void
		{
			super.onHide();
			Mgr.activityPanelMgr.removeEventListener(ActivityPanelMgr.EVENT_GET,onGetActivites);
		}
	}
}