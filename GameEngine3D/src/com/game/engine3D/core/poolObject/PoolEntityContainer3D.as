package com.game.engine3D.core.poolObject
{
	import away3d.containers.PlanarContainer3D;
	
	public class PoolEntityContainer3D extends PlanarContainer3D implements IInstancePoolClass
	{
		private static var _pool : InstancePool = new InstancePool("PoolEntityContainer3D", 600);
		private static var _cnt : int = 0;
		
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
		
		public function PoolEntityContainer3D()
		{
			super();
			_isDestroyed = false;
			reSet(null);
		}
		
		public function get isDestroyed() : Boolean
		{
			return _isDestroyed;
		}
		
		public function get isDisposed() : Boolean
		{
			return _isDisposed;
		}
		
		override public function get z() : Number
		{
			return super.y;
		}
		
		override public function set z(value : Number) : void
		{
			super.y = value;
		}
		
		override public function get y() : Number
		{
			return super.z;
		}
		
		override public function set y(value : Number) : void
		{
			super.z = value;
		}
		
		public static function create() : PoolEntityContainer3D
		{
			_cnt++;
			//利用池生成
			return _pool.createObj(PoolEntityContainer3D) as PoolEntityContainer3D;
		}
		
		public static function get cnt() : uint
		{
			return _cnt;
		}
		
		public static function recycle(container : PoolEntityContainer3D) : void
		{
			if (!container || container.isDisposed)
				return;
			_cnt--;
			//利用池回收
			_pool.disposeObj(container);
		}
		
		override public function dispose() : void
		{
			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			this.x = 0;
			this.y = 0;
			this.z = 0;
			this.scaleX = 1;
			this.scaleY = 1;
			this.scaleZ = 1;
			this.rotationX = 0;
			this.rotationY = 0;
			this.rotationZ = 0;
			this.visible = true;
			this.name = '';
			if (this.parent)
				this.parent.removeChild(this);
			_isDisposed = true;
			super.dispose();
		}
		
		public function destroy() : void
		{
			dispose();
			_isDestroyed = true;
		}
		
		public function instanceDestroy() : void
		{
			destroy();
		}
		
		public function instanceDispose() : void
		{
			dispose();
		}
		
		public function reSet($parameters : Array) : void
		{
			_isDisposed = false;
		}
	}
}
