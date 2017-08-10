package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.app.manager.hud.ActivityBarManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.FunctionOpenEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.FuncionBarCfgData;
	import com.rpgGame.coreData.clientConfig.FunctionBarInfo;
	import com.rpgGame.coreData.info.MapDataManager;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;
	
	public class ActivityButtonList extends SkinUI 
	{
		private const SIZE_WIDTH:uint = 360;
		private const SIZE_HEIGHT:uint = 320;
		private const GRID_WIDTH:Array = [80,80,80,80]
		private const GRID_HEIGHT:uint = 80;
		private const ALIGN:String = "right";
		public function ActivityButtonList()
		{
			super();
			init();
		}
		
		private function init():void
		{
			EventManager.addEvent(ActivityEvent.OPEN_ACTIVITY, updatePositionAll);
			EventManager.addEvent(ActivityEvent.CLOSE_ACTIVITY, updatePositionAll);
			EventManager.addEvent(FunctionOpenEvent.FUNCTIONOPENID,updatePositionAll);
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE,updatePositionAll);
			updatePositionAll(0);
		}
		
		private function onCloseActivityGroup(activityType:String):void
		{
			var btn:ActivityButtonBase = getActivityType(activityType);
			if (btn != null)
			{
				TweenLite.killTweensOf(btn);
				btn.clearTime();
			}
		}
		
		private function getActivityType(activityType:String):ActivityButtonBase
		{
			return ActivityBarManager.buttonDics[activityType] as ActivityButtonBase;
		}
		
		private static const TYPE:int = 1;
		private function updatePositionAll(data:*=null):void
		{
			this.removeChildren();
			var q_map_zones:int=MapDataManager.currentScene.getData().q_map_zones;
			var rows:Array = FuncionBarCfgData.getinfoRows(TYPE);
			var length:int = rows.length;
			var button:IOpen;
			var row:int;
			var len:int;
			var starX:int;
			var funinfo:FunctionBarInfo;
			var width:int;
			for(var i:int=0;i<length;i++){
				row = rows[i];
				var list:Array=FuncionBarCfgData.getInfoListbyType(TYPE,row);
				len=list.length;
				if(len<=0){
					continue;
				}
				starX = SIZE_WIDTH;
				width = GRID_WIDTH[row];
				for(var j:int=0;j<len;j++){
					funinfo = list[j] as FunctionBarInfo;
					if(q_map_zones==1&&funinfo.q_map_zones==q_map_zones)
						continue;
					button = MainButtonManager.getButtonBuyInfo(funinfo);
					if(button!=null&&button.canOpen())
					{
						button.y = row*GRID_HEIGHT;
						starX -= width;
						button.x = starX;
						this.addChild(button as DisplayObject);
					}
				}
			}
		}
		
		override protected function onShow():void
		{
			
		}
		
		override protected function onHide():void
		{
		}
		
		
		public function playEffect():void
		{
			
		}
		
		public function stopEffect():void
		{
			/* var i:int = 0;
			var btn:ActivityButtonBase = null;
			while (i < buttonList.length)
			{
			btn = (buttonList[i] as ActivityButtonBase);
			if (btn.isHasEffect)
			{
			btn.stopEffect();
			}
			i++;
			}*/
		}
		
		override public function get width():Number
		{
			return SIZE_WIDTH;
		}
		
		override public function get height():Number
		{
			return SIZE_HEIGHT;
		}
	}
}