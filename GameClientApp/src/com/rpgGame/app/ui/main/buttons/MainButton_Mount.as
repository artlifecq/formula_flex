package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.ui.tip.RTNodeID;
	
	import org.client.mainCore.manager.EventManager;
	
	public class MainButton_Mount extends MainButtonBases
	{
		public function MainButton_Mount()
		{
			SkinUI.addNode(null,RTNodeID.MAIN_JINJIE,this,60,null,false);
		}
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(ItemEvent.LEFT_GRID_CHANG,showLeftGridState);
			showLeftGridState(0);
		}
		
		override protected function onHite():void
		{
			EventManager.removeEvent(ItemEvent.LEFT_GRID_CHANG,showLeftGridState);
		}
		
		private function showLeftGridState(leftGrid:int):void
		{
			/*if(leftGrid<=5){
				_skin.qi_bg.visible=true;
				_skin.qi_mc.visible=true;
			if(leftGrid==0){
				_skin.qi_mc.gotoAndStop("m");
			}else{
				_skin.qi_mc.gotoAndStop(leftGrid.toString());
			}else{
				_skin.qi_bg.visible=false;
				_skin.qi_mc.visible=false;
				_skin.qi_mc.gotoAndStop("m");
			}*/
		}
	}
}