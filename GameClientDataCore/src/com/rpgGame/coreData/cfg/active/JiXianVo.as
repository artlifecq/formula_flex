package com.rpgGame.coreData.cfg.active
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.coreData.cfg.JiXianTiaoZhanCfgData;
	import com.rpgGame.coreData.clientConfig.Q_limitchallenge;
	import com.rpgGame.netData.monster.bean.BossDamageInfo;
	import com.rpgGame.netData.monster.message.ResBossDamageInfosToClientMessage;
	
	public class JiXianVo
	{
		public const activityid:int=25;
		private var _killName:String;
		private var _bossDamageInfos:Vector.<BossDamageInfo>;
		private var _totalHP:int=0;
		private var _rank:int=0;
		private var _damage:int=0;
		private var _q_mod:Q_limitchallenge;
		private var _reward:Array=[];
		
		public function setdate(msg:ResBossDamageInfosToClientMessage):void
		{
			_bossDamageInfos = msg.BossDamageInfos;
			_totalHP = msg.totalHp;
			_rank = msg.rank;
			_damage = msg.damage;
		}
		
		public function set killName(name:String):void
		{
			_killName = name;
		}
		
		public function get killName():String
		{
			return _killName;
		}
		
		public function get bossDamageInfos():Vector.<BossDamageInfo>
		{
			if(_bossDamageInfos==null) _bossDamageInfos=new Vector.<BossDamageInfo>();
			return _bossDamageInfos;
		}
		
		public function get totalHP():int
		{
			return _totalHP;
		}
		
		public function get rank():int
		{
			return _rank;
		}
		
		public function get damage():int
		{
			return _damage;
		}		
		
		public function get qmod():Q_limitchallenge
		{
			if(_q_mod==null) 
			{
				_q_mod=JiXianTiaoZhanCfgData.getModById(activityid);
				_reward= JSONUtil.decode(_q_mod.q_rank_rewards);
			}
			return _q_mod;
		}
		
		/**
		 *获取排行奖励 
		 * @return 
		 * 
		 */
		public function getRankReward(rank:int):Array
		{
			var result:Array=[];
			var num:int=_reward.length;
			var rankSeat:int=getRewardRank(rank);
			if(rankSeat==-1){
				num=0;
			}
			for(var i:int=0;i<num;i++){
				if(_reward[i].paras.rank==rank){
					result.push(_reward[i]);
				}
			}
			return result;
		}
		
		/**
		 *获取所在的排行段 
		 * @param rank
		 * @return 
		 * 
		 */
		private function getRewardRank(rank:int):int
		{
			var num:int=_reward.length-1;
			var result:int=-1;
			for(var i:int=num;i>=0;i--){
				if(_reward[i].paras.rank<rank){
					break;
				}
				result=_reward[i].paras.rank;
			}
			return result;
		}
	}
}