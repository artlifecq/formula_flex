package com.rpgGame.coreData.cfg.active
{
	import com.rpgGame.coreData.clientConfig.Q_world_boss;

	/**
	 *boss活动信息 
	 * @author dik
	 * 
	 */
	public class BossActInfo extends ActivetyInfo
	{
		/**
		 *击杀者 
		 */
		public var killerName:String; 
		public var worldBossCfg:Q_world_boss;
		
		public function BossActInfo()
		{
			super();
		}
	}
}