package com.game.engine2D.vo
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	
	/**
	 * AvatarSprite缓存池 
	 * @author guoqing.wen
	 */
	public class AvatarSprite extends PoolContainer implements IPoolClass
	{
		static private var _pool:Pool = new Pool("AvatarSprite_pool", 1000);
		private var _shadowEnabled:Boolean = false;
		
		public function AvatarSprite()
		{
			super();
		}
		
		public function get shadowEnabled():Boolean
		{
			return _shadowEnabled;
		}

		public function set shadowEnabled(value:Boolean):void
		{
			_shadowEnabled = value;
		}
		
		override public function reSet($parameters:Array):void
		{
			_shadowEnabled = false;
			super.reSet($parameters);
		}
		
		static public function recycle($pool:AvatarSprite):void
		{
			if ($pool)
				_pool.disposeObj($pool);
		}
		
		static public function create():AvatarSprite
		{
			var sprite:AvatarSprite = _pool.createObj(AvatarSprite) as AvatarSprite;
			return sprite;
		}
	}
}