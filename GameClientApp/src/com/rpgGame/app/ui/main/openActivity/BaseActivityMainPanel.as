package com.rpgGame.app.ui.main.openActivity
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.OpenActivityEvent;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.manager.EventManager;

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
			EventManager.addEvent(OpenActivityEvent.GET_DATA,onGetActivites);
			//setData(Mgr.activityPanelMgr.getTagActivityByMianPanel(_mainPanelType));
			Mgr.activityPanelMgr.reqActivitiesInfoMsg(_mainPanelType);
		}
		protected function setData(hash:HashMap):void
		{
			
		}
		protected function onGetActivites(type:int):void
		{
			// TODO Auto-generated method stub
			if (type==0||type==_mainPanelType) 
			{
				setData(Mgr.activityPanelMgr.getTagActivityByMianPanel(_mainPanelType))
			}
		}
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(OpenActivityEvent.GET_DATA,onGetActivites);
		}
	}
}