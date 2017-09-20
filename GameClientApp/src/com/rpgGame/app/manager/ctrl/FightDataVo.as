package com.rpgGame.app.manager.ctrl
{
	

	public class FightDataVo
	{
		public var targetId:int;
		public var type:String;
		public var updateTime:Number;
		public function FightDataVo()
		{
		}
		private function clear():void
		{
			targetId=0;
			updateTime=0;
			type="";
		}
		private static var pool:Vector.<FightDataVo>=new Vector.<FightDataVo>();
		public static function gain():FightDataVo
		{
			if (pool.length>0) 
			{
				return pool.pop();
			}
			return new FightDataVo;
		}
		public static function revert(vo:FightDataVo):void
		{
			vo.clear();
			pool.push(vo)
		}
	}
}