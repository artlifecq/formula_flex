package com.rpgGame.coreData.cfg.active
{
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
			if(_q_mod==null) _q_mod=JiXianTiaoZhanCfgData.getModById(activityid);
			return _q_mod;
		}
	}
}