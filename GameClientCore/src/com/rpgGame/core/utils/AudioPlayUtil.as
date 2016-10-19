package com.rpgGame.core.utils
{
	import com.rpgGame.core.manager.BGMManager;

	import feathers.controls.Button;

	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	/**
	 *
	 * 音频播放工具
	 * @author L.L.M.Sunny
	 * 创建时间：2016-6-24 上午10:26:37
	 *
	 */
	public class AudioPlayUtil
	{
		public function AudioPlayUtil()
		{
		}

		public static function playUIPanelOpen() : void
		{
			BGMManager.playUIEffectSound("UI/open");
		}

		public static function playUIPanelClose() : void
		{
			BGMManager.playUIEffectSound("UI/close");
		}

		public static function playUIButtonOver() : void
		{
			BGMManager.playUIEffectSound("UI/ui_touch2");
		}

		public static function playUIButtonDown() : void
		{
			BGMManager.playUIEffectSound("UI/click");
		}

		private static var _lastHoverTarget : DisplayObject;

		public static function touchPlay(e : TouchEvent, container : Sprite) : void
		{
			var t : Touch = e.getTouch(container, TouchPhase.HOVER);
			if (t != null && t.target != null)
			{
				if (t.target != _lastHoverTarget)
				{
					if (t.target is Button)
					{
						playUIButtonOver();
					}
					_lastHoverTarget = t.target;
				}
			}
			else
			{
				t = e.getTouch(container, TouchPhase.BEGAN);
				if (t != null && t.target != null)
				{
					if (t.target is Button)
					{
						playUIButtonDown();
					}
				}
			}
		}
	}
}
