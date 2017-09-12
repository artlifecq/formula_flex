package com.rpgGame.app.graphics.title
{
	import com.rpgGame.coreData.clientConfig.Q_title_control;

	public interface IBaseTitle
	{
		
		function get width():Number;
	
		function get height():Number;
		
		function playEffect(roleType:String,data:Q_title_control,repeat : int = 0, onPlayComplete : Function = null,addComplete:Function=null) : *;
		
		function get data():Q_title_control;
		
		function set y(value:Number):void;
	}
}