package com.game.engine3D.core.poolObject
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;

	import away3d.containers.ObjectContainer3D;

	/**
	 *
	 * 3D容器池
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 上午10:26:35
	 *
	 */
	public class PoolContainer3D extends ObjectContainer3D implements IPoolClass
	{
		private static var _pool : Pool = new Pool("PoolContainer3D", 600);
		private static var _cnt : int = 0;
		
		/*override public function get z() : Number
		{
			return super.y;
		}
		
		override public function set z(value : Number) : void
		{
			if(value == 0)return;
			super.y = value;
		}
		
		override public function get y() : Number
		{
			return super.z;
		}
		
		override public function set y(value : Number) : void
		{
			super.z = value;
			if(super.y == 0 && value != 0)
			{
				super.y = value;
			}
		}*/

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
			if (!container)
				return;
			_cnt--;
			//利用池回收
			_pool.disposeObj(container);
		}

		public function PoolContainer3D()
		{
			super();
			reSet(null);
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
			super.dispose();
		}

		public function reSet($parameters : Array) : void
		{
		}
	}
}
