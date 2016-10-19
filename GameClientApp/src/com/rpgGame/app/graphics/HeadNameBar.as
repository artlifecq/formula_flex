package com.rpgGame.app.graphics
{
	import com.game.mainCore.libCore.pool.IPoolClass;
	import com.game.mainCore.libCore.pool.Pool;
	import com.rpgGame.coreData.utils.ColorUtils;
	
	import feathers.controls.Label;
	import feathers.controls.text.Fontter;

	/**
	 *
	 * 头部名字
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-10 上午11:12:28
	 *
	 */
	public class HeadNameBar extends Label implements IPoolClass
	{
		private static var headNameBarPool : Pool = new Pool("HeadNameBar", 300);

		/**
		 * 生成一个HeadNameBar
		 */
		public static function create() : HeadNameBar
		{
			//利用池生成HeadNameBar
			return headNameBarPool.createObj(HeadNameBar) as HeadNameBar;
		}

		/**
		 * @private
		 * 回收一个HeadNameBar
		 * @param bar
		 */
		public static function recycle(bar : HeadNameBar) : void
		{
			//利用池回收HeadNameBar
			headNameBarPool.disposeObj(bar);
		}

		private const WIDTH : uint = 300;
		private const HEIGHT : uint = 44;

		public function HeadNameBar()
		{
			super();
			reSet(null);
			touchable = touchGroup = false;
			touchAcross = true;
						
		}

		public function get realWidth() : uint
		{
			return WIDTH;
		}

		public function get realHeight() : uint
		{
			return HEIGHT;
		}

		/**
		 * 更新数据名字
		 * @param value
		 * @author 卢国征   2015-5-5
		 */
		public function update( value : *, $color:uint ) : void
		{
			htmlText = value;
			color = $color;
		}

		/**
		 * 更新名字颜色 
		 * @param value
		 * @author 陈鹉光   2016-06-22
		 */		
		public function updateNameColor( value:* ):void
		{
			htmlText = value;
		}
		
		public function reSet($parameters : Array) : void
		{
			width = WIDTH;
			height = HEIGHT;
			htmlText = "";
			fontName = Fontter.FONT_Hei;
			fontSize = 14;
			color = 0xff9900;
			bold = false;
			textAlign = "center";
			letterSpacing = 3;
			leading = 3;
			nativeFilters = ColorUtils.getDefaultStrokeFilter();
		}

		override public function dispose() : void
		{
			if (parent)
				parent.removeChild(this);
//			super.dispose();
		}
	}
}
