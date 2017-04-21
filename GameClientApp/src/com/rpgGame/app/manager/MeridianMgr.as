package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.MeridianCfg;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.clientConfig.Q_meridian;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.meridian.MeridianVo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.meridian.bean.AcuPointInfo;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	
	import app.message.GoodsType;
	


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
		/**
		 *是否能够激活条件：1.前置穴位 
		 * @param acu 满足就是未激活状态，不满足条件是锁定状态
		 * @return 
		 * 
		 */		
		public function getCanActive(acu:AcuPointInfo):Boolean
		{
			if (!acu) 
			{
				return false;
			}
			if (acu.level>0) 
			{
				return false;
			}
			
			var now:Q_meridian=MeridianCfg.getMeridianCfg(acu.MeridId+"_"+acu.acuPointId+"_"+(acu.level));
			if (!now) 
			{
				return false;
			}
			//没得前置穴位
			if (now.q_need_meridian_id==null||now.q_need_meridian_id=="") 
			{
				return true;
			}
			var tmp:Array=now.q_need_meridian_id.split("_");
			var qNeed:Q_meridian=MeridianCfg.getMeridianCfg(now.q_need_meridian_id);
		
			var needInfo:AcuPointInfo=Mgr.meridianMgr.vo.getMeridianAcuInfo(tmp[0],tmp[1]);
			if (!needInfo) 
			{
				return false;
			}
			//冲穴看等级
			if (qNeed.q_showtype==0) 
			{
				if (needInfo.level<now.q_prelvl) 
				{
					return false;
				}
			}
				//奇穴看石头等级
			else
			{
				if (needInfo.stone.length==0) 
				{
					return false;
				}
				var qItem:Q_item=ItemConfig.getQItemByID(needInfo.stone[0].itemModelId);
				if (qItem==null) 
				{
					return false;
				}
				if (qItem.q_levelnum<now.q_prelvl) 
				{
					return false;
				}
			}
			return false;
		}
		public function getBetterStone(stoneType:int,compareStone:ItemInfo=null):Vector.<ClientItemInfo>
		{
			var StoneArr:Array=BackPackManager.instance.getItemsByType(GoodsType.MERIDIANSTONE);
			var ret:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
			var stoneLv:int=-1;
			if (compareStone!=null) 
			{
				var qItem:Q_item=ItemConfig.getQItemByID(compareStone.itemModelId);
				if (qItem) 
				{
					stoneLv=qItem.q_levelnum;
				}
			}
			for each (var tmp:ClientItemInfo in StoneArr) 
			{
				if (tmp.qItem.q_levelnum>stoneLv) 
				{
					ret.push(tmp);
				}
			}
			return ret;
		}
		/**
		 *是否能升级条件：1玩家等级2前置穴位3真气 
		 * @param acu
		 * @return 
		 * 
		 */		
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
				var qNeed:Q_meridian=MeridianCfg.getMeridianCfg(now.q_need_meridian_id);
				var needInfo:AcuPointInfo=Mgr.meridianMgr.vo.getMeridianAcuInfo(tmp[0],tmp[1]);
				if (!needInfo) 
				{
					return false;
				}
				//冲穴看等级
				if (qNeed.q_showtype==0) 
				{
					if (needInfo.level<now.q_prelvl) 
					{
						return false;
					}
				}
				//奇穴看石头等级
				else
				{
					if (needInfo.stone.length==0) 
					{
						return false;
					}
					var qItem:Q_item=ItemConfig.getQItemByID(needInfo.stone[0].itemModelId);
					if (qItem==null) 
					{
						return false;
					}
					if (qItem.q_levelnum<now.q_prelvl) 
					{
						return false;
					}
				}
			
			}
			return true;
		}
	}
}