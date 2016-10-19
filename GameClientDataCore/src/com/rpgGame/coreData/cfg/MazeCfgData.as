package com.rpgGame.coreData.cfg
{
	import app.message.BoolArrayProto;
	import app.message.MazeConfig;
	import app.message.MazeMiscDataProto;

	public class MazeCfgData
	{
		public function MazeCfgData()
		{
		}
		
		public static var timeData : String;
		/**
		 * 准备时长
		 */		
		public static var prepareTime : Number;
		/**
		 *活动时长 
		 */		
		public static var duration : Number;
		
		public static function setup(data:MazeConfig):void
		{
			var misc : MazeMiscDataProto = data.miscData;
			timeData = misc.timeData;
			duration = misc.duration.toNumber();
			prepareTime = misc.prepareDuration.toNumber();
		}
		
		public static var mazeNpcIds : Array = new Array();
		public static function isMazeNpcId(npc:int):Boolean
		{
			return mazeNpcIds.indexOf(npc)!=-1;
		}
		
		public static var mazeNextFloorNpcIds : Array = new Array();
		public static function isMazeNextFloorNpcId(npc:int):Boolean
		{
			return mazeNextFloorNpcIds.indexOf(npc)!=-1;
		}
	}
}