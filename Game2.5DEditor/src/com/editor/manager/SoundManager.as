package com.editor.manager
{
	import com.editor.events.StorySoundEvent;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 声音管理
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-17 下午2:30:12
	 *
	 */
	public class SoundManager
	{
		private static var _instance : SoundManager;

		public static function getInstance() : SoundManager
		{
			if (!_instance)
				_instance = new SoundManager();
			return _instance;
		}
		//音效路径
		private var _soundPath : String;

		public function SoundManager()
		{
		}

		/**
		 * 设置当前音效路径
		 * @param value
		 */
		public function set soundPath(value : String) : void
		{
			_soundPath = value;

			BGMManager.playUIEffectSound(_soundPath);

			EventManager.dispatchEvent(StorySoundEvent.SELECT_SOUND, value);
		}

		/**
		 * 获取当前音效路径
		 */
		public function get soundPath() : String
		{
			return _soundPath;
		}
	}
}
