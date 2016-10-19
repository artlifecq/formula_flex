package com.game.engine2D.utils
{
	import flash.display.Stage;
	import flash.geom.Point;

	/**
	 * 2d事件检测 
	 * @author guoqing.wen
	 * 
	 */
	public class InteractiveUtils
	{
		public function InteractiveUtils()
		{
		}
		
		/**
		 * 检测是否点击2D 显示对象 
		 * 
		 */		
		static public function checkStage(stage:Stage):Boolean
		{
			// 屏蔽3D鼠标事件(2D的对象在3D上面)
			var vArray:Array = stage.getObjectsUnderPoint(new Point(stage.mouseX, stage.mouseY));
			var vLen:int = vArray.length;
			var vObject:Object = null;
			
			for(var i:int = 0; i < vLen; i++)
			{
				vObject = vArray[i];
				
				while(vObject)
				{
					if(vObject is flash.display.InteractiveObject)
					{
						break;
					}
					
					vObject = vObject.parent;
				}
				
				if(vObject is flash.display.InteractiveObject)
				{
					if(vObject.mouseEnabled)
					{
						return true;
					}
					else if(vObject is flash.display.DisplayObjectContainer)
					{
						while(vObject.parent)
						{
							vObject = vObject.parent;
							if(vObject.mouseChildren == false)
							{
								return true;
							}
						}
					}
				}
			}
			return false;
		}
	}
}