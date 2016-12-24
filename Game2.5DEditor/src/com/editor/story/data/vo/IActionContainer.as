package com.editor.story.data.vo
{
	import org.client.mainCore.ds.HashMap;

	public interface IActionContainer
	{
		function get actionMaxID():int;
		function set actionMaxID(value:int):void;
		function get actionHash():HashMap;
		function get roleMaxID():int;
		function set roleMaxID(value:int):void;
		function get effectMaxID():int;
		function set effectMaxID(value:int):void;
	}
}