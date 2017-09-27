package com.rpgGame.app.ui.main.activityBar
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.hud.ActivityBarManager;
	import com.rpgGame.app.ui.main.activityBar.item.ActivityButtonBase;
	import com.rpgGame.app.ui.main.buttons.IOpen;
	import com.rpgGame.app.ui.main.buttons.MainButtonManager;
	import com.rpgGame.core.events.ActivityEvent;
	import com.rpgGame.core.events.FunctionOpenEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.MainBtnCfgData;
	import com.rpgGame.coreData.clientConfig.Q_mainbtn;
	import com.rpgGame.coreData.enum.EnumFunctionBtnType;
	import com.rpgGame.coreData.info.MapDataManager;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;
	
	public class ActivityButtonList extends SkinUI 
	{
		private const SIZE_WIDTH:uint = 360;
		private const SIZE_HEIGHT:uint = 320;
		private const ALIGN:String = "right";
		
		private const ACT_TYPES:Array=[EnumFunctionBtnType.NORMAL_ACT,EnumFunctionBtnType.SPECIAL_ACT,EnumFunctionBtnType.TIME_ACT];
		private const ROW_START_Y:Array=[0,80,160];
		
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
		
		private function updatePositionAll(data:*=null):void
		{
			this.removeChildren();
			var q_map_zones:int=MapDataManager.currentScene.getData().q_map_zones;
			var length:int = ACT_TYPES.length;
			var button:IOpen;
			var len:int;
			var startX:int;
			var btnInfo:Q_mainbtn;
			var nextRowY:int;
			var nextNoZone:Array=[];
			var currentNoZone:Array=[];
			for(var i:int=0;i<length;i++){
				var list:Vector.<Q_mainbtn>=MainBtnCfgData.getBtnListByType(ACT_TYPES[i]);
				len=list.length;
				if(len<=0){
					continue;
				}
				startX = SIZE_WIDTH;
				if(i+1<ROW_START_Y.length){
					nextRowY=ROW_START_Y[i+1];
				}else{
					nextRowY=0;
				}
				for(var j:int=0;j<len;j++){
					btnInfo = list[j] as Q_mainbtn;
					if(q_map_zones==1&&btnInfo.q_show_zone!=q_map_zones)
						continue;
					if (btnInfo.q_is_activity) 
					{
						button = Mgr.activityPanelMgr.getBtn(btnInfo.q_id);
					}
					else
					{
						button = MainButtonManager.getButtonByInfo(btnInfo);
					}
					
					if(button!=null&&button.canOpen())
					{
						button.y = ROW_START_Y[i];
						setBtnX(button,btnInfo.q_btn_w,currentNoZone,startX);
						startX=button.x;
						if(nextRowY!=0&&(button.y+btnInfo.q_btn_h)>nextRowY){
							nextNoZone.push([startX,startX+btnInfo.q_btn_w]);
						}
						this.addChild(button as DisplayObject);
					}
				}
				currentNoZone=nextNoZone;
				nextNoZone=[];
			}
		}
		
		private function setBtnX(button:IOpen,w:int,noZones:Array,startX:int):void
		{
			var newStartX:int=startX-w;
			var endX:int=startX;
			var num:int=noZones.length;
			var list:Array;
			var inNoList:Array;
			for(var i:int=0;i<num;i++){
				list=noZones[i];
				if((list[0]<=newStartX&&list[1]>=newStartX)&&(list[0]<=endX&&list[1]>=endX)){
					inNoList=list;
					break;
				}
			}
			
			if(inNoList){
				newStartX=inNoList[0];
				setBtnX(button,w,noZones,newStartX);
			}else{
				button.x=newStartX;
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