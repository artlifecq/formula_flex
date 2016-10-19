package com.rpgGame.core.view.ui.tip.vo
{
	import com.rpgGame.core.view.ui.tip.implement.IBaseTipsInfo;
	
	import flash.geom.Point;

	public class BaseTipsInfo implements IBaseTipsInfo
	{
		private var _tipsType:uint;
		private var _isDynamic:Boolean;
		private var _data:*;
		private var _point:Point;
		
		
		public function set data(value:*):void
		{
			_data = value;
		}
		
		/**
		 * 得到tips面板所要的数据
		 * @return 
		 * 
		 */		
		public function getData():*
		{
			return _data;
		}
		
		/**
		 * tips面板的类型
		 * @return 
		 * 
		 */		
		public function get tipsType():uint
		{
			return _tipsType;
		}

		public function set tipsType(value:uint):void
		{
			_tipsType = value;
		}

		public function get isDynamic():Boolean
		{
			return _isDynamic;
		}

		public function set isDynamic(value:Boolean):void
		{
			_isDynamic = value;
		}

		public function get point():Point
		{
			return _point;
		}

		public function set point(value:Point):void
		{
			_point = value;
		}


	}
}