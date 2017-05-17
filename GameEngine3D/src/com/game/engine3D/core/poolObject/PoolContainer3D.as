package com.game.engine3D.core.poolObject
{
	
	import away3d.containers.ObjectContainer3D;
	
	/**
	 *
	 * 3D容器池
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午10:26:35
	 *
	 */
	public class PoolContainer3D extends ObjectContainer3D implements IInstancePoolClass
	{
		private static var _pool : InstancePool = new InstancePool("PoolContainer3D", 600);
		private static var _cnt : int = 0;
		
		public static function create() : PoolContainer3D
		{
			_cnt++;
			//利用池生成
			return _pool.createObj(PoolContainer3D) as PoolContainer3D;
		}
		
		public static function get cnt() : uint
		{
			return _cnt;
		}
		
		public static function recycle(container : PoolContainer3D) : void
		{
			if (!container || container.isDisposed)
				return;
			_cnt--;
			//利用池回收
			_pool.disposeObj(container);
		}
		
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
		
		public function PoolContainer3D()
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
		
		
		/*override public function set zOffset(value:int):void
		{
		super.zOffset = value;
		if (value != 0 && GlobalConfig.use2DMap)
		{
		updateZoffset(this, value);
		}
		}
		
		override public function addChild(child : ObjectContainer3D) : ObjectContainer3D
		{
		if (GlobalConfig.use2DMap)
		{
		var offset : int = this.zOffset;
		if (offset != 0)
		{
		child.zOffset += offset;
		updateZoffset(child, offset);
		}
		}
		return super.addChild(child);
		}
		
		static private function updateZoffset(graphicDis : ObjectContainer3D, offset : Number) : void
		{
		for (var i : int = graphicDis.numChildren - 1; i >= 0; i--)
		{
		var child : ObjectContainer3D = graphicDis.getChildAt(i);
		child.zOffset += offset;
		if (child.numChildren > 0)
		updateZoffset(child, offset);
		}
		}*/
		
		override public function dispose() : void
		{
			while (this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
			this.zOffset = 0;
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
		
		public function reSet($parameters : Array) : void
		{
			_isDisposed = false;
		}
		
		public function instanceDestroy() : void
		{
			destroy();
		}
		
		public function instanceDispose() : void
		{
			dispose();
		}
	}
}
