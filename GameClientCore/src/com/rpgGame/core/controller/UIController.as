package com.rpgGame.core.controller
{
	import com.game.mainCore.core.manager.LayerManager;
	import com.rpgGame.core.utils.UIUtil;
	
	import org.client.mainCore.ds.HashMap;
	
	import starling.display.DisplayObject;
	import starling.events.Event;

	/**
	 *
	 * ui控制
	 * @author fly.liuyang
	 * 创建时间：2014-6-12 下午10:16:09
	 * 
	 */
	public class UIController
	{
		private static var _autoAlignToStagecenterMap:HashMap = new HashMap();
		private static var _lockStagePosMap:HashMap = new HashMap();
		
		private static var _preStageWidth:int;
		private static var _preStageHeight:int;
		
		public static function setup():void
		{
			_preStageWidth = LayerManager.stage.stageWidth;
			_preStageHeight = LayerManager.stage.stageHeight;
			LayerManager.stage.addEventListener(Event.RESIZE,onStageResize); 
		}
		
		/**
		 * 把显示对象自动对齐到舞台中央， 在舞台发生变化时也将会自动对齐
		 * 需要的就添加, 不要一直对齐于舞台中央的. 用UIUtil.alignToStageCenter 
		 * @param dis
		 * 
		 */		
		public static function addAutoAlignToStageCenter(dis:DisplayObject):void
		{
			if(_autoAlignToStagecenterMap.containsKey(dis))
			{
//				GameLog.addError("重复添加了，addAutoAlignToStageCenter");
				return;
			}
			dis.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
			UIUtil.showToCenter(dis);
			_autoAlignToStagecenterMap.add(dis,dis);
		}
		
		private static function onRemoveFromStage(event:Event):void
		{
			var dis:DisplayObject = event.target as DisplayObject;
			dis.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
			removeAutoAlignToStageCenter(dis);
		}
		
		public static function removeAutoAlignToStageCenter(dis:DisplayObject):void
		{
			_autoAlignToStagecenterMap.remove(dis);
		}
		
		protected static function onStageResize(event:Event):void
		{
			var arr:Array = _autoAlignToStagecenterMap.getValues();
			var dis:DisplayObject;
			for each (dis in arr) 
			{
				UIUtil.alignToStageCenter(dis);
			}
			
			arr = _lockStagePosMap.getValues();
			for each (dis in arr) 
			{
				var currentStageWidth:int = LayerManager.stage.stageWidth;
				var currentStageHeight:int = LayerManager.stage.stageHeight;
				var updateX:int = (currentStageWidth - _preStageWidth) / 2;
				var updateY:int = (currentStageHeight - _preStageHeight) /2;
				updateX = dis.x + updateX;
				updateY = dis.y + updateY;
				dis.x = updateX;
				dis.y = updateY;
				_preStageHeight = currentStageHeight;
				_preStageWidth = currentStageWidth;
			}
		}
		
		/**
		 * 把显示对象固定在舞台当前显示位置
		 * 需要的就添加, 不要一直对齐于舞台中央的. 用UIUtil.alignToStageCenter 
		 * @param dis
		 * 
		 */		
		public static function addLockStagePos(dis:DisplayObject):void
		{
			if(_lockStagePosMap.containsKey(dis))
			{
//				GameLog.addError("重复添加了，addLockStagePos");
				return;
			}
			_lockStagePosMap.add(dis,dis);
		}
		
		public static function removeLockStagePos(dis:DisplayObject):void
		{
			_lockStagePosMap.remove(dis);
		}
		
	}
}