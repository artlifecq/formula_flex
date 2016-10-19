package com.game.engine2D.scene.render.ui
{
	import com.game.engine2D.utils.MaterialUtils;
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	
	import starling.display.Image;
	import starling.rendering.Painter;
	import starling.textures.IStarlingTexture;

	public class UIImage extends Image implements IPoolClass
	{
		static private const poolSize:int = 1000;
		static private var _pool:Pool = new Pool("PoolUIImage_pool", poolSize);
		
		public function UIImage()
		{
			super(MaterialUtils.defaultImageTexture);
		}
		
		override public function render(support:Painter):void
		{
			if (texture != MaterialUtils.defaultImageTexture)
			{
				super.render(support);
			}
		}
		
		override public function set texture(value:IStarlingTexture):void
		{
			if (value == null)
				value = MaterialUtils.defaultImageTexture;
			super.texture = value;
		}
		
		public function reSet($parameters:Array):void
		{
			scaleX = scaleY = 1.0;
			this.texture = MaterialUtils.defaultImageTexture;
		}
		
		override public function dispose():void
		{
			
		}
		
		public function destory():void
		{
			super.dispose();
		}
		
		static public function recycle($pool:UIImage):void
		{
			if ($pool)
			{
				if ($pool.parent)$pool.parent.removeChild($pool);
				if (_pool.length >= poolSize)
					$pool.destory();
				_pool.disposeObj($pool);
			}
		}
		
		static public function create():UIImage
		{
			return _pool.createObj(UIImage) as UIImage;
		}
	}
}