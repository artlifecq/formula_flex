package com.rpgGame.coreData.cfg.active
{
	import com.gameClient.utils.JSONUtil;
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
		private var _worldBossCfg:Q_world_boss;
		public var _worldBossReward:Array;

		private var rewardVec:Vector.<Object>;
		
		public function BossActInfo()
		{
			super();
		}

		public function get worldBossCfg():Q_world_boss
		{
			return _worldBossCfg;
		}

		public function set worldBossCfg(value:Q_world_boss):void
		{
			_worldBossCfg = value;
			var list:Array=JSONUtil.decode(_worldBossCfg.q_rank_rewards);
			rewardVec=new Vector.<Object>();
			var num:int=list.length;
			for(var i:int=0;i<num;i++){
				rewardVec.push(list[i]);
			}
			rewardVec=rewardVec.sort(sortVec);
		}
		
		/**
		 *获取所在的排行段 
		 * @param rank
		 * @return 
		 * 
		 */
		private function getRewardRank(rank:int):int
		{
			var num:int=rewardVec.length-1;
			var result:int=-1;
			for(var i:int=num;i>=0;i--){
				if(rewardVec[i].paras.rank<rank){
					break;
				}
				result=rewardVec[i].paras.rank;
			}
			return result;
		}
		
		/**
		 *获取排行奖励 
		 * @return 
		 * 
		 */
		public function getRankReward(rank:int):Array
		{
			var result:Array=[];
			var num:int=rewardVec.length;
			var rankSeat:int=getRewardRank(rank);
			if(rankSeat==-1){
				num=0;
			}
			for(var i:int=0;i<num;i++){
				if(rewardVec[i].paras.rank==rank){
					result.push(rewardVec[i]);
				}
			}
			return result;
		}

		private function sortVec(A:Object,B:Object):int
		{
			if(A.paras.rank<B.paras.rank){
				return -1;
			}else if(A.paras.rank>B.paras.rank){
				return 1;
			}
			return 0;
		}
	}
}