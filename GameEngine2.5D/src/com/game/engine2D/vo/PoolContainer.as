package com.game.engine2D.vo
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
	
	import away3d.containers.ObjectContainer3D;
	
	/**
	 * PoolContainer缓存池 
	 * @author guoqing.wen
	 * 
	 */
	public class PoolContainer extends ObjectContainer3D implements IInstancePoolClass
	{
		private static var _pool:InstancePool = new InstancePool("PoolContainer3D_pool", 1000);

//		private var _pos:Vector3D = new Vector3D();

		private var _isDisposed:Boolean = false;
		private var _isDestroyed:Boolean;
		
		public function PoolContainer()
		{
			super();
		}

		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isDisposed():Boolean
		{
			return _isDisposed;
		}
		
		override public function get x():Number
		{
			return _pos.x;
		}
		
		override public function get y():Number
		{
			return _pos.y;
		}
		
		override public function get z():Number
		{
			return _pos.z;
		}
		
		override public function get scaleY():Number
		{
			return super.scaleY;
		}
		
		override public function set scaleY(val:Number):void
		{
			super.scaleY = val;
		}
		
		override public function set x(val:Number):void
		{
			_pos.x = val >> 0;
			super.x = _pos.x;
		}
		
		override public function set y(val:Number):void
		{
			_pos.y = val >> 0;
			super.y = -_pos.y;
		}

		override public function set z(val:Number):void
		{
			_pos.z = val >> 0;
			super.z = _pos.z;
		}
		
		public function reSet($parameters:Array):void
		{
			scaleX = scaleY = scaleZ = 1.0;
			rotationX = rotationY = rotationZ = 0.0;
			x = y = z = 0;
			_isDisposed = false;
		}
		
		/** 缓存池销毁对象 */
		public function instanceDestroy():void
		{
			_isDisposed = true; 
			this.dispose();
		}
		
		/** 进入缓存池调用 */
		public function instanceDispose():void
		{
			if (this.parent)
				this.parent.removeChild(this);
			removeAllChild(this);
			scaleX = scaleY = scaleZ = 1.0;
			rotationX = rotationY = rotationZ = 0.0;
			x = y = z = 0;
			_isDisposed = true;
		}
		
		static public function recycle($pool:PoolContainer):void
		{
			if ($pool && !$pool._isDisposed)
			{
				_pool.disposeObj($pool);
			}
		}
		
		/**
		 * 移除容器里的所有显示对象 (注意不要乱gc,小心报空对象^_^)
		 * @param dis
		 * @param gc
		 * 
		 */		
		public static function removeAllChild(dis:ObjectContainer3D, isDispose:Boolean = false):void
		{
			if(dis)
			{
				var display:ObjectContainer3D = null;
				while (dis.numChildren > 0)
				{
					if (isDispose)
					{
						display = dis.getChildAt(0);
						if (display)
							display.dispose();
						if (display.parent)
							dis.removeChildAt(0);
					}
					else
					{
						dis.removeChildAt(0);
					}
				}
			}
		}
		
		static public function create():PoolContainer
		{
			return _pool.createObj(PoolContainer) as PoolContainer;
		}
	}
}