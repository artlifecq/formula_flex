package com.rpgGame.app.manager
{
	/**
	 *新手引导 
	 * @author yfl
	 * 
	 */	
	public class GuideMgr
	{
		private var _curId:int;
		public function GuideMgr()
		{
		}

		public function get curId():int
		{
			return _curId;
		}

		public function onStepComplete():void
		{
			_curId++;
		}
	}
}