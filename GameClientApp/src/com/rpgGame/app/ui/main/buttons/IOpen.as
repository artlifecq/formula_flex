package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.Q_newfunc;
	
	import feathers.core.IFeathersDisplayObject;

	public interface IOpen extends IFeathersDisplayObject
	{
		function get info():Q_newfunc;
		function set info(value:Q_newfunc):void;
		function canOpen():Boolean;
		function set styleClass(value:Class):void;
		function runAnimation():void;
	}
}