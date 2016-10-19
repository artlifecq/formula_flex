package com.rpgGame.coreData.utils
{
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.filters.GradientGlowFilter;

	public class FilterUtility
	{
		public static const GLOW_FILTER_GREEN:Array = [new GlowFilter(0x00FF00,1,4,4,8,BitmapFilterQuality.LOW)];
		public static const GLOW_FILTER_RED:Array = [new GlowFilter(0xFF0000,1,2,2,3,BitmapFilterQuality.LOW)];
//		public static const GLOW_FILTER_WHITE:Array = [new GlowFilter(0xFFFFFF,1,2,2,3,BitmapFilterQuality.LOW)];
//		public static const GLOW_FILTER_LOW:GlowFilter = [new GlowFilter(0xFFFFCC,1,6,6,2,BitmapFilterQuality.LOW)];
		
		/**
		 * 选择效果 
		 */
		public static const GLOW_FILTER_SELECT:Array = [new GlowFilter(0xFFFF00,1,5,5,2,BitmapFilterQuality.LOW)];
		
		/**
		 * 选择效果 
		 */
		public static const BLURT_FILTER:Array = [new BlurFilter(10,10)];
		
		/**
		 * 灰度 
		 */
		public static const GRAYSCALE_FILTER:Array = [new ColorMatrixFilter([0.3086,0.6094,0.0820,0,0,0.3086,0.6094,0.0820,0,0,0.3086,0.6094,0.0820,0,0,0,0,0,1,0])];
		
		/**
		 * 白色模糊 
		 */		
//		public static const WHITE_COLOR_FILTER:Array = [new ColorMatrixFilter([1, 0, 0, 0, 45, 0, 1, 0, 0, 45, 0, 0, 1, 0, 45, 0, 0, 0, 1, 0])];
		
		/**
		 * 高亮 
		 */		
		public static const HIGHT_LIGHT_FILTER:Array = [new ColorMatrixFilter([1, 0, 0, 0, 50, 0, 1, 0, 0, 50, 0, 0, 1, 0, 50, 0, 0, 0, 1, 0])];
		
		/**
		 * 黑色笔触
		 */		
//		public static const BLACK_STROKE:GlowFilter = [new GlowFilter(0, 0.7, 2, 2, 17, 1, false, false)];
		
		/**
		 * 字体描边 投影滤镜
		 */
		public static const OUTLINE_FILTER:Array = [new DropShadowFilter(0,45,0x000000,1,3,3,10,1)];
		
		/**
		 * 绿色描边 
		 */		
		public static const GREEN_GLOW:Array	    = [new GlowFilter(0x55AA22, 1, 4, 4, 6)];
		
//---------------------------发光(copy过来的，感谢老版本的辛勤积累)------------------------------------
		public static const RESOURCE_TEXT_FILTER:Array = [new GlowFilter(0, 0.65, 1, 1, 4, 3)];
		
		/**
		 * 红色发光滤镜
		 */		
		public static const RED_FILTERS:Array = [new GlowFilter(0xE80000, 1, 10, 10, 2, 1, false, false)];
		
		/**黄色发光滤镜*/
		public static const GLOW_FILTERS_YELLOW:Array = [new GlowFilter(0xFFFF00, 1, 8, 8, 2, 1, false, false)];
		
		/**发光滤镜*/
		public static const GLOW_FILTERS:Array = [new GlowFilter(0xFFFFFF, 1, 6, 6, 1, 1, false, false)];
		
		/**提示文字滤镜*/
		public static const SIMPLE_TEXT_FILTER:Array = [new GlowFilter(0, 1, 2, 2, 10, 8)];
		
		/**文本黑色描边滤镜*/
		public static const NORMAL_TEXT_FILTER:GlowFilter = new GlowFilter(0, 1, 2, 2, 4, 3);
		
		/**文字滤镜*/
		public static const TEXT_FILTER:Array = [new GlowFilter(0x2A1702, 1, 4, 4, 4)];
		
		/**道具名称滤镜*/
		public static const ITEM_NAME_FILTER:Array = [new GlowFilter(0, 0.75, 2, 2, 1, 3)];
		
		/**美术出的alpha为0.65的滤镜*/
		public static const TEXT_FILTER_65:Array = [new GlowFilter(0, 0.65, 2, 2, 1)];
		
		/**美术出的白色滤镜*/
		public static const TEXT_FLITER_90_WHITE:Array = [new GlowFilter(0xFFFFFF, .9, 2, 2, 1)];
		
		/**跑动人物名称的滤镜*/
		public static const RUNPLAYER_TEXT_FILTER:Array = [new GlowFilter(0, 1, 3, 3, 4)];
		
		/**对话界面中的滤镜效果*/
		public static const DIALOG_TEXT_FILTER:Array = [new GlowFilter(0,1,2,2,10,1)];
		
		/**移上去高亮显示滤镜*/
		public static const ROLLOVER_FILTER:Array = [new GradientGlowFilter(0, 0, [0xFAFAFA, 0xFFFBFB], [0, .2], [0, 128], 10, 10, 1, BitmapFilterQuality.HIGH, "inner")];
		
//---------------------------渐变------------------------------------
		/**0XE8E805渐变发光*/
		public static const GRADIENT_0XE8E805_FILTERS:Array = [new GradientGlowFilter(4, 90, [0XFFFFFF, 0XE8E805], [1, 1], [0, 255], 4, 4, 1, 1, "inner", false)];
		
		///////////装备品质///////////////
		/**0XFFFFFF//白//渐变发光*/
		public static const GRADIENT_0XFFFFFF_FILTERS:Array = [new GradientGlowFilter(4, 90, [0X747A74, 0XFFFFFF], [1, 1], [0, 255], 4, 4, 1, 1, "inner", false)];
		
		/**0X33CCFF//蓝//渐变发光*/
		public static const GRADIENT_0X33CCFF_FILTERS:Array = [new GradientGlowFilter(4, 90, [0XFFFFFF, 0X33CCFF], [1, 1], [0, 255], 4, 4, 1, 1, "inner", false)];
		
		/**0X66FF33//绿//渐变发光*/
		public static const GRADIENT_0X66FF33_FILTERS:Array = [new GradientGlowFilter(4, 90, [0XFFFFFF, 0X66FF33], [1, 1], [0, 255], 4, 4, 1, 1, "inner", false)];
		
		/**0X8000FF//黄//渐变发光*/
		public static const GRADIENT_0X8000FF_FILTERS:Array = [new GradientGlowFilter(4, 90, [0XFFFFFF, 0X8000FF], [1, 1], [0, 255], 4, 4, 1, 1, "inner", false)];
		
		/**0XFF8000//橙//渐变发光*/
		public static const GRADIENT_0XFF8000_FILTERS:Array = [new GradientGlowFilter(4, 90, [0XFFFFFF, 0XFF8000], [1, 1], [0, 255], 4, 4, 1, 1, "inner", false)];
		////////////////战斗颜色发光////////////////
		/**战斗武功名称渐变发光*/
		public static const GRADIENT_SKILL_NAME_FILTERS:Array = [new GradientGlowFilter(4, 90, [0xF5E97A, 0xD88323], [1, 1], [0, 201], 4, 4, 1, 1, "inner", false)];
		//		new GlowFilter(0x2F1A00, 1, 2, 2, 10)

		////////////////////////////////选中变色相关/////////////////////////////////////////////////
		private static const byteToPerc:Number = 1 / 0xff;
		
		/**
		 * 拆分颜色方法 
		 * @param color
		 * @return 
		 * 
		 */		
		private static function SplitRGB( color:uint ):Array
		{
			return [color >> 16 & 0xff, color >> 8 & 0xff, color & 0xff];
		}

		/**
		 * 获得一个可以设置选中颜色的文字滤镜效果
		 * @param SelectionColor		选中背景颜色
		 * @param TextColor			文字颜色
		 * @param SelectedColor		选中文字颜色
		 * @return 
		 * 
		 */		
		public static function getSelectionFilter(SelectionColor:uint=0x0000FF, TextColor:uint=0xFFFFFF, SelectedColor:uint=0xFFFFFF):Array
		{
			var _ColorFilter:ColorMatrixFilter = new ColorMatrixFilter();
			var o:Array = SplitRGB( SelectionColor );
			var r:Array = SplitRGB( TextColor );
			var g:Array = SplitRGB( SelectedColor );
			
			var ro:int = o[0];
			var go:int = o[1];
			var bo:int = o[2];
			
			var rr:Number = ((r[0] - 0xff) - o[0]) * byteToPerc + 1;
			var rg:Number = ((r[1] - 0xff) - o[1]) * byteToPerc + 1;
			var rb:Number = ((r[2] - 0xff) - o[2]) * byteToPerc + 1;
			
			var gr:Number = ((g[0] - 0xff) - o[0]) * byteToPerc + 1 - rr;
			var gg:Number = ((g[1] - 0xff) - o[1]) * byteToPerc + 1 - rg;
			
			var gb:Number = ((g[2] - 0xff) - o[2]) * byteToPerc + 1 - rb;
			
			_ColorFilter.matrix = [rr, gr, 0, 0, ro, rg, gg, 0, 0, go, rb, gb, 0, 0, bo, 0, 0, 0, 1, 0];
			
			return [_ColorFilter];
		}
	}
}