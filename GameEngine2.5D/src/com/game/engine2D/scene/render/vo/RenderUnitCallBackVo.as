package com.game.engine2D.scene.render.vo
{
	public class RenderUnitCallBackVo
	{
		public var playBeforeStart:Function;
		public var playStart:Function;
		public var playUpdate:Function;
		public var playComplete:Function;
		public var added:Function;
		public var removed:Function;
		
		public function RenderUnitCallBackVo($playBeforeStart:Function=null,
											 $playStart:Function=null,
											 $playUpdate:Function=null,
											 $playComplete:Function=null,
											 $added:Function=null,
											 $removed:Function=null)
		{
			playBeforeStart = $playBeforeStart;
			playStart = $playStart;
			playUpdate = $playUpdate;
			playComplete = $playComplete;
			added = $added;
			removed = $removed;
		}
	}
}