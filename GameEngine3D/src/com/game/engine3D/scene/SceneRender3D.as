package com.game.engine3D.scene
{
	import com.game.engine3D.core.GameScene3D;

	import flash.utils.getTimer;

	import org.client.mainCore.utils.Tick;

	/**
	 *
	 * 3D场景渲染器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:26:37
	 *
	 */
	public class SceneRender3D
	{
		/**
		 * @private
		 * 场景
		 */
		private var _scene : GameScene3D;
		/**
		 * @private
		 * 是否正在渲染
		 */
		private var _isRendering : Boolean = false;
		private var _lastTime : uint = 0;

		public function SceneRender3D(scene : GameScene3D)
		{
			_scene = scene;
		}

		/**
		 * 开始渲染
		 * @param $immediatelyDo 是否立即执行一次
		 */
		public function startRender($immediatelyDo : Boolean = false) : void
		{
			_lastTime = getTimer();
			if ($immediatelyDo)
			{
				render();
			}
			if (!_isRendering)
			{
				Tick.addCallback(render);
				_isRendering = true;
			}
		}

		/**
		 * 停止渲染
		 */
		public function stopRender() : void
		{
			_lastTime = 0;
			if (_isRendering)
			{
				Tick.removeCallback(render);
				//
				_isRendering = false;
			}
		}

		/**
		 * 是否正在渲染
		 */
		public function get isRendering() : Boolean
		{
			return _isRendering;
		}

		/**
		 * @private
		 * 渲染
		 */
		final private function render(gapTm : uint = 0) : void
		{
			gapTm = getTimer() - _lastTime;
			_lastTime = getTimer();
			//场景刷新
			_scene.sceneRenderLayer.run(gapTm);
		}
	}
}
