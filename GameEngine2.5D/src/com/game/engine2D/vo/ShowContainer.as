package com.game.engine2D.vo
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import starling.display.DisplayObject;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	
	/**
	 * 用于头顶文字容器
	 * ShowContainer缓存池 
	 * @author guoqing.wen
	 */
	public class ShowContainer extends Sprite implements IInstancePoolClass
	{
		static private var _pool:InstancePool = new InstancePool("ShowContainer_pool", 1000);
		public var containerMosEnabled:Boolean = true;
		private var _isDestroy:Boolean = false;
		private var _isInputPool:Boolean = false;
		
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
			this._isInputPool = false;
		}
		
		public function get filters():Array
		{
			return null;
		}
		
		public function set filters($parameters:Array):void
		{
			
		}
		
		public function instanceDestroy():void
		{
			_isDestroy = true;
			super.dispose();
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroy;
		}
		
		public function get isInPool():Boolean
		{
			return _isInputPool;
		}
		
		public function putInPool():void
		{
			_isInputPool = true;
		}
		
		override public function dispose():void
		{
			
		}
		
		static public function recycle($pool:ShowContainer):void
		{
			if ($pool)
			{
				if ($pool.parent)$pool.parent.removeChild($pool);
				removeAllChild($pool);
				_pool.recycleObj($pool);
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