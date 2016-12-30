package com.game.engine2D.vo
{
	import com.game.engine3D.config.GlobalConfig;
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	
	import flash.geom.Vector3D;
	
	import away3d.containers.ObjectContainer3D;
	
	/**
	 * PoolSprite缓存池 
	 * @author guoqing.wen
	 * 
	 */
	public class PoolContainer extends ObjectContainer3D implements IPoolClass
	{
		private static const poolSize:int = 1000;
		private static var _pool:Pool = new Pool("PoolContainer3D_pool", poolSize);
		private var _pcPos:Vector3D = new Vector3D();
		
		public function PoolContainer()
		{
			super();
		}
		
		override public function get x():Number
		{
			return _pcPos.x;
		}
		
		override public function get y():Number
		{
			return _pcPos.y;
		}
		
		override public function get z():Number
		{
			return _pcPos.z;
		}
		
		override public function get scaleY():Number
		{
			return super.scaleZ;
		}
		
		override public function set scaleY(val:Number):void
		{
			super.scaleZ = val;
		}
		
		override public function set x(val:Number):void
		{
			_pcPos.x = val >> 0;
			super.x = _pcPos.x;
		}
		
		override public function set y(val:Number):void
		{
			_pcPos.y = val >> 0;
//			super.z = GlobalConfig.transformCoord_2d_3d(-_pcPos.y);
		}

		override public function set z(val:Number):void
		{
			_pcPos.z = val >> 0;
			super.y = _pcPos.z;
		}
		
		public function reSet($parameters:Array):void
		{
			scaleX = scaleY = scaleZ = 1.0;
			rotationX = rotationY = rotationZ = 0.0;
			_pcPos.setTo(0, 0, 0);
		}
		
		override public function dispose():void
		{
		}
		
		public function destory():void
		{
			super.dispose();
		}
		
		static public function recycle($pool:PoolContainer):void
		{
			if ($pool)
			{
				if ($pool.parent)$pool.parent.removeChild($pool);
				removeAllChild($pool);
				if (_pool.length >= poolSize)
					$pool.destory();
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
					display = dis.getChildAt(0);
					if (isDispose && display)
						display.dispose();
					dis.removeChildAt(0);
				}
			}
		}
		
		static public function create():PoolContainer
		{
			return _pool.createObj(PoolContainer) as PoolContainer;
		}
	}
}