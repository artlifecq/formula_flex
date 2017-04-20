package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.info.meridian.MeridianVo;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	


	public class MeridianMgr extends EventDispatcher
	{
		public  static var ins:MeridianMgr=new MeridianMgr();
	
		public var vo:MeridianVo=new MeridianVo();
		private var maxLevelDic:Dictionary;
		public function MeridianMgr()
		{
		}
		public function recMeridianInfoList(list:Vector.<AcuPointInfo>):void
		{
			vo.updateFromServerList(list);
			this.dispatchEvent(new MeridianEvent(MeridianEvent.ALL_DATA_UPATE));
		}
		public function recMeridianChange(change:AcuPointInfo):void
		{
			vo.updatePointData(change);
			this.dispatchEvent(new MeridianEvent(MeridianEvent.MERIDIAN_CHANGE,change));
		}
		public function isMaxAcuLevel(acu:AcuPointInfo):Boolean
		{
			return getNextLevelAcu(acu)!=null;
		}
		public function getNextLevelAcu(acu:AcuPointInfo):Q_meridian
		{
			var next:Q_meridian=MeridianCfg.getMeridianCfg(acu.MeridId+"_"+acu.acuPointId+"_"+(acu.level+1));
			return next;
		}
		public function getCanLevelUp(acu:AcuPointInfo):Boolean
		{
			var now:Q_meridian=MeridianCfg.getMeridianCfg(acu.MeridId+"_"+acu.acuPointId+"_"+(acu.level));
			if (!now) 
			{
				return false;
			}
			var next:Q_meridian=getNextLevelAcu(acu);
			if (!next) 
			{
				return false;
			}
			if (now.q_need_level>MainRoleManager.actorInfo.totalStat.level) 
			{
				return false;
			}
			if (now.q_need_spirit>MainRoleManager.actorInfo.maxZhenqi) 
			{
				return false;
			}
			if (now.q_need_meridian_id!=null&&now.q_need_meridian_id!="") 
			{
				var tmp:Array=now.q_need_meridian_id.split("_");
				var needInfo:AcuPointInfo=Mgr.meridianMgr.vo.getMeridianAcuInfo(tmp[0],tmp[1]);
				if (needInfo.level<now.q_prelvl) 
				{
					return false;
				}
			}
			return true;
		}
	}
}