package com.rpgGame.core.manager.scene
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.log.GameLog;
	
	import flash.geom.Point;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import flash.events.Event;

	/**
	 *
	 * 面板随着舞台缩放改变位置
	 * @author fly.liuyang
	 * 创建时间：2014-6-25 上午10:57:15
	 * 
	 */
	public class PanelFixedInSceneManager
	{
		private static var _disMap:HashMap;
		private static var _preStageMap:HashMap;
		
		
		setup();
		private static function setup():void
		{
			_disMap = new HashMap();
			_preStageMap = new HashMap();
			LayerManager.stage.addEventListener(Event.RESIZE,onStageResizeHandler);
		}
		
		public static function add(dis:DisplayObject):void
		{
			if(_disMap.containsKey(dis))
			{
				GameLog.add("重复添加");
				return;
			}
			_disMap.add(dis,dis);
			var point:Point = new Point();
			point.x = dis.x / (stageWidth - dis.width);
			point.y = dis.y / (stageHeight - dis.height);
			_preStageMap.add(dis,point);
		}
		
		public static function remove(dis:DisplayObject):void
		{
			_disMap.remove(dis);
			_preStageMap.remove(dis);
		}
		
		/**
		 * 舞台大下发生改变 重新定位所有已显示的面板 
		 * tips面板存在的情况下，直接隐藏掉。
		 */		
		protected static function onStageResizeHandler(e:Event):void
		{
			var panel:DisplayObject;
			var newX:int = 0;
			var newY:int = 0;
			var index:int = 0;
			var panelList:Array = _disMap.getValues();
			while(index < panelList.length)
			{
				panel = panelList[index] as DisplayObject;
				if (panel != null)
				{
					var point:Point = _preStageMap.getValue(panel);
					newX = point.x * (stageWidth - panel.width);
					newY = point.y * (stageHeight - panel.height);
					if (newX > (stageWidth - panel.width))
					{
						newX = stageWidth - panel.width;
					}
					if (newX < 0)
					{
						newX = 0;
					}
					if (newY > (stageHeight - panel.height))
					{
						newY = stageHeight - panel.height;
					}
					if (newY < 0)
					{
						newY = 0;
					}
					panel.x = newX;
					panel.y = newY;
				}
				index++;
			}
		}
		
		private static function get stageWidth():int
		{
			return LayerManager.stage.stageWidth;
		}
		
		private static function get stageHeight():int
		{
			return LayerManager.stage.stageHeight;
		}
		
		public static function updatePosPer(_curentDrag:Sprite):void
		{
			var point:Point = _preStageMap.getValue(_curentDrag);
			if(point)
			{
				point.x = _curentDrag.x / (stageWidth - _curentDrag.width);
				point.y = _curentDrag.y / (stageHeight - _curentDrag.height);
			}
		}
	}
}