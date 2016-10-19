package com.game.engine2D.scene.render.vo
{
	public interface IRenderUnitData
	{
		function get id():int;
		function set id(value:int):void;
		
		function get type():String;
		function set type(value:String):void;
		
		function get sleepTime():int;
		function set sleepTime(value:int):void;
	
		function get mouseEnabled():Boolean;
		function set mouseEnabled(value:Boolean):void;
		
		function get clearSameType():Boolean;
		function set clearSameType(value:Boolean):void;
		
		function get playCompleteAutoRecycle():Boolean;
		function set playCompleteAutoRecycle(value:Boolean):void;
		
		function set curtStatus($stauts:uint):void;
		function get curtStatus():uint;
		
		function set curtLogic($logic:int):void;
		function get curtLogic():int;
		
		function set repeat($repeat:uint):void;
		function get repeat():uint;
		
		function set depth($depth:int):void;
		function get depth():int;
		
		function set hasRotation($hasRotation:Boolean):void;
		function get hasRotation():Boolean;
		
		function set blendMode($blendMode:String):void;
		function get blendMode():String;
		
		function getFullSourcePath($status:uint):String;
	}
}