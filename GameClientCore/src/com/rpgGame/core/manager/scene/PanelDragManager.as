package com.rpgGame.core.manager.scene
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.gameClient.log.GameLog;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 面板拖动管理
	 * 所有想拖动的sprite都可以用这个来添加
	 * @author fly.liuyang
	 * 创建时间：2014-6-24 下午5:20:56
	 * 
	 */
	public class PanelDragManager
	{
		private static var _curentDrag:Sprite;
		private static var _dragMap:HashMap = new HashMap();
		
		public static function addDrag(dis:Sprite):void
		{
			if(dis == null)return;
			if(_dragMap.containsKey(dis))
			{
				GameLog.add("PanelDragManager.addDrag: 重复添加");
				return
			}
			_dragMap.add(dis,dis);
			dis.addEventListener(MouseEvent.MOUSE_DOWN,mouseDragBgDownHandler);
		}
		
		public static function removeDrag(dis:Sprite):void
		{
			if(dis == null)return;
			_dragMap.remove(dis);
			dis.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDragBgDownHandler);
		}
		
		protected static function mouseDragBgDownHandler(event:Event):void
		{
			
			event.stopImmediatePropagation();
			if(_curentDrag != null)
			{
				GameLog.add("有bug,上一个还没拖拽完呢");
				return;
			}
			var ev:EventDispatcher = event.target as EventDispatcher;
			_curentDrag = event.currentTarget as Sprite;
			var dis:DisplayObject = event.target as DisplayObject;
			if(!isHaveMouseEvent(dis,_curentDrag))
			{
				LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP, onStageDragMouseUpHandler);
				var dragRect:Rectangle = new Rectangle(
					-(dis.width - 40),
					-(dis.height - 40),
					LayerManager.stage.stageWidth + dis.width - 80,
					LayerManager.stage.stageHeight + dis.height - 80);
				_curentDrag.startDrag(false,dragRect);
			}else
			{
				_curentDrag = null;
			}
		}
		
		protected static function onStageDragMouseUpHandler(event:MouseEvent):void
		{
			LayerManager.stage.addEventListener(MouseEvent.MOUSE_UP, onStageDragMouseUpHandler);
			if(_curentDrag)
			{
				_curentDrag.stopDrag();
//				PanelFixedInSceneManager.updatePosPer(_curentDrag);
				_curentDrag = null;
			}
		}
		
		private static function isHaveMouseEvent(dis:DisplayObject,stopDis:DisplayObject):Boolean
		{
			if(dis.hasEventListener(MouseEvent.MOUSE_DOWN))
			{
				return true;
			}
			if(dis.hasEventListener(MouseEvent.MOUSE_UP))
			{
				return true;
			}
			if(dis.hasEventListener(MouseEvent.CLICK))
			{
				return true;
			}
			if(dis is TextField)
			{
				return true;
			}
			if(dis.parent != null)
			{
				if(dis.parent == stopDis)
				{
					return false;
				}
				return isHaveMouseEvent(dis.parent,stopDis)
			}
			return false;
		}
	}
}