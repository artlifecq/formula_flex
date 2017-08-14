package com.rpgGame.app.manager.ctrl
{
	import org.game.netCore.data.long;

	public class FightDataVo
	{
		public var targetId:long;
		public var type:String;
		public var updateTime:Number;
		public var targetGid:Number;
		public function FightDataVo()
		{
		}
		private function clear():void
		{
			targetGid=0;
			targetId=null;
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