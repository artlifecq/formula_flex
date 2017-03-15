package com.rpgGame.coreData.info.face
{
	public interface IBaseFaceInfo
	{
		/** id */
		function get cfgId():int;
		function set cfgId(value:int):void;
		/** 类型  */
		function get type():int;
		function set type(value:int):void;
		/** icon */
		function set icoName(value:String):void;
		function get icoName():String;
		/** cd */
		function get coolID():String;
	}
}