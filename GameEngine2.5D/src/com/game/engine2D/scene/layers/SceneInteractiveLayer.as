package com.game.engine2D.scene.layers
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.SceneCharacter;
	import com.game.engine2D.config.SceneConfig;
	import com.game.engine2D.events.SceneEvent;
	import com.game.engine2D.events.SceneEventAction_interactive;
	import com.game.engine2D.scene.map.vo.MapTile;
	import com.game.engine2D.utils.InteractiveUtils;
	import com.game.engine2D.utils.SceneUtil;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import org.client.mainCore.manager.EventManager;
	
	import starling.core.Starling;
	import starling.events.EventDispatcher;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	/**
	 * @private
	 * 场景交互事件层
	 * @author Carver
	 */
	public class SceneInteractiveLayer extends EventDispatcher
	{
		private static var helpPoint:Point = new Point();
		private var _resultPoint:Point = new Point();
		private var _scene:Scene;
		private var _nativeStageCapturedEvent:Boolean = false;
		private var _capturedEventCallback:Function = null;
		
		public function SceneInteractiveLayer($scene:Scene)
		{
			_scene = $scene;
		}
		
		//鼠标键盘交互相关
		/**
		 * 开始场景鼠标和键盘监听 
		 * 
		 */		
		public function enableInteractiveHandle():void 
		{
			Starling.current.stage.addEventListener(TouchEvent.TOUCH, onTouchHandle);
			
			var nativeStage:Stage = Starling.current.nativeStage;
			nativeStage.addEventListener("rightMouseDown", mouseHandle);
			nativeStage.addEventListener("rightMouseUp", mouseHandle);
		}
		
		private function onTouchHandle(e:TouchEvent):void
		{
			var mouseSc:SceneCharacter;
			var nativeStage:Stage = Starling.current.nativeStage;
			//是否响应starlingUI及2d对象
			if (_nativeStageCapturedEvent &&　InteractiveUtils.checkStage(nativeStage))return;
			if (Starling.current.touchProcessor.capturedEvent) //移动到了starling的显示对象上了，
			{
				EventManager.dispatchEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_MOVE,mouseEvent,null,null);
				return;
			}
			if (_capturedEventCallback != null && _capturedEventCallback())return;
			var touch:Touch = e.getTouch(Starling.current.stage, TouchPhase.HOVER);
			if (touch)
				helpPoint.setTo(touch.globalX, touch.globalY);
			
			var p:Point = _scene.globalToLocal(helpPoint, _resultPoint);
			var beginTouch:Touch = e.getTouch(Starling.current.stage, TouchPhase.BEGAN);
			var endTouch:Touch = e.getTouch(Starling.current.stage, TouchPhase.ENDED);
			var mouseEvent:MouseEvent = new MouseEvent(MouseEvent.MOUSE_MOVE);
			mouseEvent.movementX = mouseEvent.localX = p.x;
			mouseEvent.movementY = mouseEvent.localY = p.y;
			//得到逻辑格坐标
			var tileX:int = int(p.x/SceneConfig.TILE_WIDTH);
			var tileY:int = int(p.y/SceneConfig.TILE_HEIGHT);
			var mapTile:MapTile = SceneUtil.getMapTile(tileX, tileY);
			//if (null == mapTile)return;
			if (touch)
			{
				helpPoint.setTo(touch.globalX, touch.globalY);
				
				//找到鼠标下面的角色
				mouseSc = _scene.getScFromShowContainerUnderPoint(p);
				if(mouseSc==null)
				{
					mouseSc = _scene.getScFromAvatarUnderPointByPixel32(p);
				}
				//派发鼠标划过事件
				if(mapTile)
					EventManager.dispatchEvent(SceneEvent.INTERACTIVE,SceneEventAction_interactive.MOUSE_MOVE,mouseEvent,mouseSc,mapTile);
			}
			else if (beginTouch)
			{
				helpPoint.setTo(beginTouch.globalX, beginTouch.globalY);
				mouseSc = _scene.getScFromShowContainerUnderPoint(p);
				if(mouseSc==null)
				{
					mouseSc = _scene.getScFromAvatarUnderPointByPixel32(p);
				}
				if(mapTile)
					EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction_interactive.MOUSE_DOWN,mouseEvent,mouseSc,mapTile);
				return;
			}
			else if (endTouch)
			{
				helpPoint.setTo(endTouch.globalX, endTouch.globalY);
				if(mapTile)
					EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction_interactive.MOUSE_UP,mouseEvent,mouseSc,mapTile);
				return;
			}
			else
			{
				if(mapTile)
					EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction_interactive.MOUSE_OUT,null,mouseSc,mapTile);
			}
		}
		/**
		 * 停止场景鼠标和键盘监听 
		 * 
		 */		
		public function disableInteractiveHandle():void 
		{
			Starling.current.stage.removeEventListener(TouchEvent.TOUCH, mouseHandle);
			//
			var nativeStage:Stage = Starling.current.nativeStage;
			nativeStage.removeEventListener("rightMouseDown", mouseHandle);
			nativeStage.removeEventListener("rightMouseUp", mouseHandle);
		}
		/**
		 * 鼠标事件处理函数
		 * 
		 */		
		private function mouseHandle(e:MouseEvent):void 
		{
			if(_scene.mapConfig == null)return;
			helpPoint.setTo(e.stageX, e.stageY);
			var p:Point = _scene.globalToLocal(helpPoint, _resultPoint);
			var mouseSc:SceneCharacter;
			//得到逻辑格坐标
			var tileX:int = int(p.x/SceneConfig.TILE_WIDTH);
			var tileY:int = int(p.y/SceneConfig.TILE_HEIGHT);
			var mapTile:MapTile = SceneUtil.getMapTile(tileX, tileY);
			switch(e.type)
			{
				//------------------------------------------------右键相关------------------------------------------------
				case "rightMouseDown":
				{
					//派发鼠标划出事件
					if(mapTile)
						EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction_interactive.RIGHT_MOUSE_DOWN,e,mouseSc,mapTile);
					break;
				}
				case "rightMouseUp":
				{
					//派发鼠标划出事件
					if(mapTile)
						EventManager.dispatchEvent(SceneEvent.INTERACTIVE, SceneEventAction_interactive.RIGHT_MOUSE_UP,e,mouseSc,mapTile);
					break;
				}
			}
		}

		/** 是否检测2d事件 */		
		public function set nativeStageCapturedEvent(value:Boolean):void
		{
			_nativeStageCapturedEvent = value;
		}

		public function set capturedEventCallback(value:Function):void
		{
			_capturedEventCallback = value;
		}
		//====================================================================================================================================================================
		
	}
}