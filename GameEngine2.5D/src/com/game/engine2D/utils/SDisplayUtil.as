package com.game.engine2D.utils
{
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;

	public class SDisplayUtil
	{
		/**
		 * 从该显示对象的父级移除该显示对象(注意不要乱gc,小心会BitmapData.dispose^_^) 
		 * @param dis 显示对象
		 */		
		public static function removeForParent(dis:DisplayObject):void
		{
			if(dis == null || dis.parent == null)
			{
				return;
			}
			if (dis is DisplayObject)
			{
				dis.parent.removeChild(dis);
			}
		}
		
		/**
		 * 移除容器里的所有显示对象 (注意不要乱gc,小心报空对象^_^)
		 * @param dis
		 * @param gc
		 * 
		 */		
		public static function removeAllChild(dis:DisplayObjectContainer, isDispose:Boolean = false):void
		{
			if(dis)
			{
				var display:DisplayObject = null;
				while (dis.numChildren > 0)
				{
					display = dis.removeChildAt(0);
					if (isDispose && display)
						display.dispose();
				}
			}
		}
	}
}