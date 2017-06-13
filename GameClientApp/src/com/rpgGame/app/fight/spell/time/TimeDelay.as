package com.rpgGame.app.fight.spell.time
{
	import flash.utils.getTimer;

	public class TimeDelay
	{
		private var _resetTime:int;
		private var _key:String;
		public function TimeDelay(key:String,time:int=1500)
		{
			this._key=key;
			_resetTime=time;
		}
		public  function get timeDelay():Number
		{
			return 0.05*getAttrChangeIndex();
		}
		private  var lastTime:int;
		private  var index:int;
		public  function getAttrChangeIndex():int
		{
			var now:int=getTimer();
			if(now-lastTime>_resetTime)
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