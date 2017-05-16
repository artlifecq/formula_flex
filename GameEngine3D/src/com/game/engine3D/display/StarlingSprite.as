package com.game.engine3D.display
{
	import com.game.engine3D.config.GlobalConfig;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;

	/**
	 *
	 * Starling精灵
	 * @author L.L.M.Sunny
	 * 创建时间：2016-8-30 上午10:42:33
	 *
	 */
	public class StarlingSprite extends Sprite
	{
		public function StarlingSprite()
		{
			super();
		}

		override public function addChild(child : DisplayObject) : DisplayObject
		{
			CONFIG::StarlingSprite_Debug
			{
				trace(GlobalConfig.DEBUG_HEAD + " " + name + "添加显示对象" + child.name);
			}
			return super.addChild(child);
		}

		override public function addChildAt(child : DisplayObject, index : int) : DisplayObject
		{
			CONFIG::StarlingSprite_Debug
			{
				trace(GlobalConfig.DEBUG_HEAD + " " + name + "添加显示对象" + child.name + "到" + index);
			}
			return super.addChildAt(child, index);
		}

		override public function removeChild(child : DisplayObject, dispose : Boolean = false) : DisplayObject
		{
			CONFIG::StarlingSprite_Debug
			{
				trace(GlobalConfig.DEBUG_HEAD + " " + name + "移除显示对象" + child.name);
			}
			return super.removeChild(child, dispose);
		}

		override public function removeChildAt(index : int, dispose : Boolean = false) : DisplayObject
		{
			var child : DisplayObject = super.removeChildAt(index, dispose);
			CONFIG::StarlingSprite_Debug
			{
				if (child)
				{
					trace(GlobalConfig.DEBUG_HEAD + " " + name + "移除位置" + index + "显示对象" + child.name);
				}
			}
			return child;
		}
	}
}
