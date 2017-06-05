package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import feathers.core.IFeathersDisplayObject;

	public interface IOpen extends IFeathersDisplayObject
	{
		function get info():FunctionBarInfo;
		function set info(value:FunctionBarInfo):void;
		function canOpen():Boolean;
		function set styleClass(value:Class):void
	}
}