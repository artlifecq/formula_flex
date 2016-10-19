package com.game.engine3D.utils
{
	import starling.display.DisplayObjectContainer;

	/**
	 *
	 * 显示工具
	 * @author L.L.M.Sunny
	 * 创建时间：2015-9-17 下午6:05:12
	 *
	 */
	public class DisplayUtil
	{
		public function DisplayUtil()
		{
		}

		public static function disposeDisplayContainer(display : DisplayObjectContainer) : void
		{
			if (display)
			{
				display.mask = null;
				while (display.numChildren)
					display.removeChildAt(0);
				if (display.parent)
					display.parent.removeChild(display);
				display.dispose();
				display = null;
			}
		}
	}
}
