package com.rpgGame.appModule.fightsoul
{
	import com.rpgGame.app.manager.fightsoul.FightSoulManager;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul_path;

	public class FightSoulPathInfoData
	{
		private var _path:Q_fightsoul_path;
		private var _count:int;
		public function FightSoulPathInfoData(path:Q_fightsoul_path):void
		{
			_path = path;
			refeash();
		}
		
		public function get path():Q_fightsoul_path
		{
			return _path;
		}
		
		public function refeash():void
		{
			_count = _path.q_total-FightSoulManager.instance().getActivityByType(_path.q_id);
		}
		
		public function get count():int
		{
			return _count;
		}
		
		public function get isOver():Boolean
		{
			return _count<=0;
		}
	}
}