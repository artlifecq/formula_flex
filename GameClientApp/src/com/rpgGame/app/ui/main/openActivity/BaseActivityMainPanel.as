package com.rpgGame.app.ui.main.openActivity
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.ui.SkinUIPanel;
	import com.rpgGame.core.events.OpenActivityEvent;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
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
		/**
		 *获取一个活动，单独一条活动一个面板的可以使用这个接口，减少冗余 
		 * @param hash
		 * @return 
		 * 
		 */		
		public static function getSingleVo(hash:HashMap):ActivityVo
		{
			var vo:ActivityVo;
			var values:Array=hash.values();
			if (values.length) 
			{
				if (values[0].length) 
				{
					vo=values[0][0];
				}	
			}
			return vo;
		}
	}
}