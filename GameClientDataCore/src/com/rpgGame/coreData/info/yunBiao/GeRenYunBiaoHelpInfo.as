package com.rpgGame.coreData.info.yunBiao
{
	import com.game.mainCore.core.timer.GameTimer;

	public class GeRenYunBiaoHelpInfo
	{
		public var heroName:String;
		public var heroId:Number;
		public var sceneId:int;
		public var globalId:int
		public var time:Number;
		public var endTimer:GameTimer = null;
		
		public function GeRenYunBiaoHelpInfo($time:Number, $heroName:String, $heroId:Number, $sceneId:int, $globalId:int)
		{
			time = $time;
			heroName = $heroName;
			heroId = $heroId;
			sceneId = $sceneId;
			globalId = $globalId;
		}
	}
}
