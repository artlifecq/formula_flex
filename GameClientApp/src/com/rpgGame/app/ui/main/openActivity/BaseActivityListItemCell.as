package com.rpgGame.app.ui.main.openActivity
{
	import com.rpgGame.app.ui.main.openActivity.comps.IActivityInter;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import feathers.controls.StateSkin;
	
	import starling.display.DisplayObject;
	
	public class BaseActivityListItemCell extends SkinUI implements IActivityInter
	{
		public function BaseActivityListItemCell(skin:StateSkin=null)
		{
			super(skin);
		}
		
		public function setData(info:ActivityVo):void
		{
		}
		
		public function get dis():DisplayObject
		{
			return this;
		}
		override protected function onHide():void
		{
			clearData();
		}
		public function clearData():void
		{
			throw new Error("BaseActivityListItemCell clearData must be override");
		}
	}
}