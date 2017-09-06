package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.coreData.clientConfig.Q_mainbtn;
	
	import feathers.core.IFeathersDisplayObject;

	public interface IOpen extends IFeathersDisplayObject
	{
		function get info():Q_mainbtn;
		function set info(value:Q_mainbtn):void;
		function canOpen():Boolean;
		function set styleClass(value:Class):void;
		function runAnimation():void;
	}
}