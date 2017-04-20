package com.rpgGame.app.manager
{
	public class Mgr
	{
		public function Mgr()
		{
		}
		
		public static function get meridianMgr():MeridianMgr
		{
			return MeridianMgr.ins;
		}
	}
}