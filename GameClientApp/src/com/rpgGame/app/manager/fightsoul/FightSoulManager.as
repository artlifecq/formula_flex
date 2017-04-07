package com.rpgGame.app.manager.fightsoul
{
	import com.rpgGame.coreData.cfg.FightsoulData;
	import com.rpgGame.coreData.clientConfig.Q_fightsoul;
	import com.rpgGame.netData.fightsoul.bean.FightSoulInfo;

	public class FightSoulManager
	{
		/**
		 * 战魂数据
		 */
		private var _fightSoulInfo: FightSoulInfo;
		public function get fightSoulInfo(): FightSoulInfo{
			return _fightSoulInfo;
		}
		public function set fightSoulInfo(value: FightSoulInfo): void{
			this._fightSoulInfo = value;
		}
		
		public function get  shetdata():Q_fightsoul
		{
			return FightsoulData.getInfobyId(_fightSoulInfo.level);
		}
		
		
		private static var _instance:FightSoulManager;
		public static function instance():FightSoulManager
		{
			if(_instance==null)
			{
				_instance = new FightSoulManager();
			}
			return _instance;
		}
	}
}