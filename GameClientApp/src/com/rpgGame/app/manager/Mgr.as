package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.yunBiao.CheatsMgr;

	public class Mgr
	{
		public function Mgr()
		{
		}
		
		public static function get meridianMgr():MeridianMgr
		{
			return MeridianMgr.ins;
		}
		
		public static function get cheatsMgr():CheatsMgr
		{
			return CheatsMgr.ins;
		}
		public static function get teamMgr():TeamManager
		{
			return TeamManager.ins;
		}
	}
}