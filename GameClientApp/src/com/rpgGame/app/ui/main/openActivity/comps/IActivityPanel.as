package  com.rpgGame.app.ui.main.openActivity.comps
{
	import engine.ui.base.core.GameUIComponent;
	

	public interface IActivityPanel
	{
		function set mainPanelType(value:int):void
		
		function updateActivtiyInfo():void
			
		function titleimg(titleUrl:String):void
			
		function updataPanel(tag:int = 0, isreq:Boolean = false):void
		
		function updateRechargeNum(activityId:int, num:int):void
		
		function dispose():void
			
		function set openSrc(value:GameUIComponent):void
	}
}