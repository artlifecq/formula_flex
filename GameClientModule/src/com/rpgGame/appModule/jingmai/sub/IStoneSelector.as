package com.rpgGame.appModule.jingmai.sub
{
	import org.game.netCore.data.long;
	
	import starling.display.DisplayObject;

	public interface IStoneSelector
	{
		function getView():DisplayObject;
		
		function selectStone(item:long):void
	}
}