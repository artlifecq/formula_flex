package com.rpgGame.coreData.info.tip
{
	import flash.geom.Point;

	/**
	 *
	 * TipTargetInfo
	 * @author fly.liuyang
	 * 创建时间：2014-8-7 下午9:24:49
	 * 
	 */
	public class TipTargetInfo
	{
		/** tips类型 **/
		public var tipType:int = 0;
		/** 当tip打开的时候，如果这个函数不为空，那么会调用这个函数来获取tip需要显示的数据 **/
		public var fnGetTipData:Function = null;
		/** 当tip打开的时候，如果这个函数不为空，那么会调用这个函数来获取tip需要显示的坐标 **/
		public var fnGetTipPos:Function = null;
		/** tips数据 **/
		public var tipData:* = null;
		/** tips显示的偏移 **/
		public var pos:Point = null;
		/** 对齐方式 **/
		public var alignType:int = 0;
		
		public function TipTargetInfo($type:int)
		{
			tipType = $type;
		}
	}
}
