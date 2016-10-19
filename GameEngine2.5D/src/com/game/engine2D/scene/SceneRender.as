package com.game.engine2D.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import gs.TweenLite;
	
	import org.client.mainCore.utils.FrameTimer;
	import org.client.mainCore.utils.Tick;
	
	
	/**
	 * 场景渲染器
	 * @author Carver
	 */
	public class SceneRender
	{
		/**场景*/
		private var _scene:Scene;
		/**是否正在渲染*/
		private var _isRendering:Boolean = false;
		
		public function SceneRender($scene:Scene)
		{
			_scene = $scene;
		}
		/**
		 * 是否正在渲染
		 */
		public function get isRendering():Boolean
		{
			return _isRendering;
		}
		
		/**
		 * 开始渲染
		 * @param $immediatelyDo 是否立即执行一次
		 */
		public function startRender($immediatelyDo:Boolean=false):void
		{
			if($immediatelyDo)
			{
				render();
			}
			if(!_isRendering)
			{
				Tick.addCallback(render);
				_isRendering = true;
				//
				Stage3DLayerManager.stage.addEventListener(Event.ENTER_FRAME,onSceneRender);
			}
		}
		/**
		 * 停止渲染
		 */
		public function stopRender():void
		{
			if(_isRendering)
			{
				Tick.removeCallback(render);
				//
				Stage3DLayerManager.stage.removeEventListener(Event.ENTER_FRAME,onSceneRender);
				//
				_isRendering = false;
			}
		}
		
		final private function onSceneRender(e:Event = null):void
		{
			GlobalConfig2D.nowTime = getTimer();
			TweenLite.globalTime = GlobalConfig2D.nowTime;
			//
			FrameTimer.update();
			
			//------------------------------------------
			TweenLite.externalUpdate(null);
			//镜头跟随
			_scene.cameraRun();
		}
		
		private var _tickCnt:uint=0;
		
		/**
		 * @private
		 * 渲染
		 */
		final private function render(gapTm:uint=0):void
		{
			_tickCnt++;
			var isInRender:Boolean = Boolean(_tickCnt & 1);
			if(isInRender)
			{
				_scene.sceneRenderLayer.run();
				//地图刷新
				if (_scene.sceneZoneMapLayer)
					_scene.sceneZoneMapLayer.run();
			}
		}
	}
}