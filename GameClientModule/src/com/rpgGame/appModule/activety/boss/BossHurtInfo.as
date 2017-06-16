package com.rpgGame.appModule.activety.boss
{
	import com.rpgGame.netData.monster.bean.BossDamageInfo;

	/**
	 *boss伤害信息 
	 * @author dik
	 * 
	 */
	public class BossHurtInfo
	{
		public var rank:int;
		public var bossDamageInfo:BossDamageInfo;
		public var perDamage:String;
		
		public function BossHurtInfo(rank:int)
		{
			this.rank=rank;
		}
	}
}