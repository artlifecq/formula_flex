package com.rpgGame.app.ui.main.buttons
{
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zuoqi;
	
	public class MainButton_Mount extends MainButtonBases
	{
		public function MainButton_Mount(info:FunctionBarInfo):void
		{
			super(info);
		}
		
		override protected function initialize():void
		{
			this.styleClass = ButtonSkin_zuoqi;
			super.initialize();
		}
		
		override protected function onShow():void
		{
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