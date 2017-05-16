package com.game.engine2D.vo
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	/**
	 * 用于头顶文字容器
	 * ShowContainer缓存池 
	 * @author guoqing.wen
	 */
	public class ShowContainer extends Sprite implements IPoolClass
	{
		static private var _pool:Pool = new Pool("ShowContainer_pool", 1000);
		public var containerMosEnabled:Boolean = true;
		
		public function ShowContainer()
		{
			super();
		}
		
		public function reSet($parameters:Array):void
		{
			this.visible = true;
			this.alpha = 1;
			this.scale = 1;
			this.x = 0;
			this.y = 0;
		}
		
		public function get filters():Array
		{
			return null;
		}
		
		public function set filters($parameters:Array):void
		{
			
		}
		
		static public function recycle($pool:ShowContainer):void
		{
			if ($pool)
			{
				if ($pool.parent)$pool.parent.removeChild($pool);
				removeAllChild($pool);
				_pool.disposeObj($pool);
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
		
		static public function create():ShowContainer
		{
			var sprite:ShowContainer = _pool.createObj(ShowContainer) as ShowContainer;
			return sprite;
		}
	}
}