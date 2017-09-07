package  com.rpgGame.app.ui.main.openActivity.comps
{
	
	

	public interface IActivityPanel
	{
		function set mainPanelType(value:int):void
		
		function updateActivtiyInfo():void
					
		function updataPanel(tag:int = 0, isreq:Boolean = false):void
		
	}
}