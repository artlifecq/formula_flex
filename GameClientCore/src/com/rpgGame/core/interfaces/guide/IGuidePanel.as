package com.rpgGame.core.interfaces.guide
{
	import starling.display.DisplayObject;

	/**
	 *引导接口 
	 * @author yfl
	 * 
	 */	
	public interface IGuidePanel
	{
		function onGuideComplete():void;
		
		function addGuilde(target:DisplayObject,guideId):void;
		
		function onCheckGuideStart(curId:int):void;
	}
}