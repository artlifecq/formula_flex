package com.game.engine2D.vo
{
	import flash.display.IBitmapDrawable;

	public interface IDisplayDrawable
	{
		/**显示数据跑起来 */
		function run(gapTm : uint):void;
		/**显示渲染接口 */
		function draw(iBmppDrawable:IBitmapDrawable):void;
	}
}