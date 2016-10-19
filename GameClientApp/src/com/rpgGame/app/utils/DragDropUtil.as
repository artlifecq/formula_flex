package com.rpgGame.app.utils
{
	import com.rpgGame.app.view.icon.DragDropGrid;
	import com.rpgGame.coreData.info.item.GridInfo;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 * 拖拽检测工具 
	 * @author mandragora
	 * 
	 */
	public class DragDropUtil
	{
		public function DragDropUtil()
		{
		}
		private static var targetHash : HashMap = new HashMap();
		private static var sourceHash : HashMap = new HashMap();
		public static var sourceGridInfo : GridInfo;
		/**
		 * 是否正在拖动中，如果拖动完成了，就要屏蔽这些东西。 
		 */		
		public static var isInDrag : Boolean = false;
		/**
		 * 添加回调检测 
		 * @param target 添加目标
		 * @param fun 添加目标回调 fun(gridInfo)
		 * 
		 */		
		public static function addDragDropTarget(target:DisplayObject,fun:Function):void
		{
			if(!target)
				return;
			target.addEventListener(TouchEvent.TOUCH,onTouch);
			targetHash.add(target,fun); 
		}
		
		private static function onTouch(event:TouchEvent):void
		{
			var target:DisplayObject = event.target as DisplayObject;
			if(!target)
				return;
			var touch : Touch = event.getTouch(target,TouchPhase.HOVER);
			if(touch)
				DragDropUtil.dragDropEnd(target);
		}
		/**
		 *  
		 * @param target
		 * 
		 */		
		public static function removeDragDropTarget(target:DisplayObject):void
		{
			target.removeEventListener(TouchEvent.TOUCH,onTouch);
			targetHash.remove(target);
		}
		
		public static function dragDropEnd(target:DisplayObject):void
		{
			if(isInDrag)
				checkSpriteInHash(target,targetHash);
		}
		
		/**
		 * 添加出发点的回调 
		 * @param source 出发点
		 * @param fun
		 * 
		 */		
		public static function addDragDropSource(source:DisplayObject,fun:Function):void
		{
			sourceHash.add(source,fun);
		}
		/**
		 * 移除出发点的回调 
		 * @param source
		 * 
		 */		
		public static function removeDragDropSource(source:DisplayObject):void
		{
			sourceHash.remove(source);
		}
		public static function dragDropStart(source:DisplayObject,data:*):void
		{
			checkSpriteInHash(source,sourceHash);
		}
		private static function checkSpriteInHash(check:DisplayObject,hash:HashMap):void
		{
			if(!check || !sourceGridInfo)
				return;
//			if((check is DragDropGrid) == true)
//				return;//做一个特殊检测，如果是可拖拽格子，那就屏蔽掉
			if(hash.getValue(check) != null)
			{
				hash.getValue(check)(sourceGridInfo);
				isInDrag = false;
				return;
			}
			if(check.parent)
				return checkSpriteInHash(check.parent,hash);
		}
	}
}