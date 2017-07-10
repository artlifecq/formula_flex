package com.rpgGame.coreData.cfg
{
	import com.rpgGame.coreData.clientConfig.Q_battle_reward;
	
	import flash.utils.ByteArray;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *26_5争霸战事件积分表.xlsx
	 *@author dik
	 *2017-7-4
	 **/
	public class QBattleRewardCfgData
	{
		private static var rewardMap:HashMap=new HashMap();
		
		public function QBattleRewardCfgData()
		{
		}
		
		public static function setup(data : ByteArray) : void 
		{
			var arr : Array = data.readObject();
			for each(var info : Q_battle_reward in arr){
				rewardMap.add(info.q_id,info);
			}
		}
		
		/**
		 *通过积分获取奖励信息 
		 * @param integral
		 * @return 
		 * 
		 */
		public static function getInfoByIntegral(integral:int):Q_battle_reward
		{
			var infos:Array=rewardMap.getValues();
			var info:Q_battle_reward;
			var num:int=infos.length;
			for(var i:int=0;i<num;i++){
				info=infos[i];
				if((integral>info.q_integral_start&&integral<info.q_integral_end)||integral==info.q_integral_start||integral==info.q_integral_end){
					return info;
				}
			}
			return info;
		}
	}
}