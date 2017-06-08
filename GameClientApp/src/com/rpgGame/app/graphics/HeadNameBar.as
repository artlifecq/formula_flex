package com.rpgGame.app.graphics
{
	import com.game.engine3D.core.poolObject.IInstancePoolClass;
	import com.game.engine3D.core.poolObject.InstancePool;
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
	public class HeadNameBar extends Label implements IInstancePoolClass
	{
		private static var headNameBarPool : InstancePool = new InstancePool("HeadNameBar", 300);
		private var _isDestroyed : Boolean;
		private var _isDisposed : Boolean;
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
			headNameBarPool.recycleObj(bar);
		}

		public function HeadNameBar()
		{
			super();
			_isDestroyed = false;
			reSet(null);
			touchable = touchGroup = false;
			touchAcross = true;
		}

		public function get realHeight() : uint
		{
			return this.height;
		}

		public function get realWidth() : uint
		{
			return this.width;
		}

		/**
		 * 设置颜色
		 */
		public function setColor(color : uint) : void
		{
			this.color = color;
		}

		/**
		 * 设置名字
		 */
		public function setName(name : String) : void
		{
			this.height = 100;
			this.width = 300;
			this.htmlText = name;
			this.width = this.textWidth;
			this.height = this.textHeight;
		}

		public function reSet($parameters : Array) : void
		{
			_isDisposed = false;
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

		public function instanceDestroy() : void
		{
			putInPool();
			dispose();
			_isDestroyed = true;
		}

		public function putInPool() : void
		{
			if (parent)
				parent.removeChild(this);
			_isDisposed = true;
		}
		
		public function get isDestroyed():Boolean
		{
			return _isDestroyed;
		}
		
		public function get isInPool():Boolean
		{
			return _isDisposed;
		}
		
	}
}
