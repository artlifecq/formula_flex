package com.rpgGame.app.fight.spell.time
{
	import flash.utils.getTimer;

	public class TimeDelay
	{
		private var _resetTime:int;
		private var _key:String;
		private var _single:Number;
		private var _maxCount:int=10;
		public function TimeDelay(key:String,s:Number=0.05,time:int=1500)
		{
			this._key=key;
			_single=s;
			_resetTime=time;
		}
		public  function get timeDelay():Number
		{
			var ret:Number=_single*getAttrChangeIndex();
			return ret
		}
		private  var lastTime:int;
		private  var index:int;
		public  function getAttrChangeIndex():int
		{
			var now:int=getTimer();
			if(now-lastTime>_resetTime||index>=_maxCount)
			{
				index=0;
				lastTime=now;
				return index;	
			}
			else
			{
				index++;
				return index;
			}
		}
	}
}