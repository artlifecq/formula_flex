package com.rpgGame.core.view.ui.tip.vo
{
	public class MeiRenGuanQiaData
	{
		private var _zhanli:int;
		private var _isTong:Boolean;
		private var _arr:Array;
		private var _guanqiaName:String;
		
		public function set zhanli(num:int):void
		{
			_zhanli=num;
		}
		
		public function set tongguanBool(bool:Boolean):void
		{
			_isTong=bool;
		}
		
		public function set prize(str:Array):void
		{
			_arr=str;
		}
		
		public function set guanqiaName(name:String):void
		{
			_guanqiaName=name;
		}
		
		public function get zhanli():int
		{
			return _zhanli;
		}
		
		public function get tongguanBool():Boolean
		{
			return _isTong;
		}
		
		public function get prize():Array
		{
			return _arr;
		}
		
		public function get guanqiaName():String
		{
			return _guanqiaName;
		}
	}
}