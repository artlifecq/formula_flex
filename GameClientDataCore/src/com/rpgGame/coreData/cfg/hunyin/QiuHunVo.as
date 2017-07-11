package com.rpgGame.coreData.cfg.hunyin
{
	public class QiuHunVo
	{
		private var _qiuhunType:int=0;
		private var _msg:*;
		private var _name:String;
		
		public function setdata(type:int,msg:*,name:String):void
		{
			_qiuhunType=type;
			_msg=msg;
			_name=name;
		}
		
		public function get qiuhunType():int
		{
			return _qiuhunType;
		}
		
		public function get msg():*
		{
			return _msg;
		}
		
		public function get qiuhunName():String
		{
			return _name;
		}
	}
}