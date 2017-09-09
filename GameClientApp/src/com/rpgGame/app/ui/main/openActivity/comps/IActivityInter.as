package  com.rpgGame.app.ui.main.openActivity.comps
{
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import starling.display.DisplayObject;

	public interface IActivityInter
	{
		function setData( info:ActivityVo ):void;
		
		function get x():Number;
		
		function get y():Number;
		
		function get width():Number;
		
		function get height():Number;
		
		function get dis():DisplayObject;
		
		function clearData():void;
	}
}