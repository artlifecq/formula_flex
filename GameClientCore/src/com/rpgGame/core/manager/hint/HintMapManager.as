package com.rpgGame.core.manager.hint
{
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.manager.StarlingLayerManager;
	import com.rpgGame.core.view.ui.hint.SceneTitle;

	import org.client.mainCore.manager.EventManager;


	/**
	 * 进入场景的地图名字展示提示语			未完成
	 * @author luguozheng
	 *
	 */
	public class HintMapManager
	{

		/**进场景文字提示 */
		private var _enterSceneTitle : SceneTitle;

		public function HintMapManager()
		{
		}

		public function setup() : void
		{
			EventManager.addEvent(MapEvent.MAP_SWITCH_COMPLETE, onUpdateMap);
		}

		/**
		 *
		 *
		 */
		protected function onUpdateMap() : void
		{
			removeEnterSceneTip();

			if (_enterSceneTitle == null)
				_enterSceneTitle = new SceneTitle();

			_enterSceneTitle.setData(1);

			StarlingLayerManager.hintUILayer.addChild(_enterSceneTitle);
		}

		/**移除进场景提示*/
		public function removeEnterSceneTip() : void
		{
			if (_enterSceneTitle != null)
			{
				_enterSceneTitle.dispose();

				if (_enterSceneTitle.parent != null)
				{
					_enterSceneTitle.parent.removeChild(_enterSceneTitle);
				}
				_enterSceneTitle = null;
			}
		}

	}
}
