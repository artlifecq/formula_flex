package com.game.engine2D.scene
{
	import com.game.engine2D.Scene;
	import com.game.engine2D.config.GlobalConfig2D;
	import com.game.engine3D.manager.Stage3DLayerManager;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import away3d.tick.Tick;
	
	import gs.TweenLite;
	
	import org.client.mainCore.utils.FrameTimer;
	
	
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
				Tick.instance.addCallBack(render);
				_isRendering = true;
				Stage3DLayerManager.stage.addEventListener(Event.ENTER_FRAME,onSceneRender);
				_tickCnt = 0;
			}
		}
		/**
		 * 停止渲染
		 */
		public function stopRender():void
		{
			if(_isRendering)
			{
				Tick.instance.removeCallBack(render);
				Stage3DLayerManager.stage.removeEventListener(Event.ENTER_FRAME,onSceneRender);
				_isRendering = false;
				_tickCnt = 0;
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
				var recoverDisposal:Boolean = Stage3DLayerManager.stage3DProxy.recoverFromDisposal();//锁屏恢复还未完成
				if (recoverDisposal)
				{
					_scene.sceneRenderLayer.run();
					
					if (_scene.sceneZoneMapLayer)//地图刷新
						_scene.sceneZoneMapLayer.run();
				}
			}
		}
	}
}