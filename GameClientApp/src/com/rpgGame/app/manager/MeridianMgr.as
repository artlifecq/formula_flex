package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.events.MeridianEvent;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
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
			return getNextLevelAcu(acu)==null;
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
				return true;
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
			var qNeed:Q_meridian=MeridianCfg.getMeridianCfg(now.q_need_meridian_id+"_0");
		
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
			return true;
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
				if (tmp.qItem.q_location!=stoneType) 
				{
					continue;
				}
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
		public function getCanLevelUp(acu:AcuPointInfo,bShowNotice:Boolean=false):Boolean
		{
			var now:Q_meridian=MeridianCfg.getMeridianCfg(acu.MeridId+"_"+acu.acuPointId+"_"+(acu.level));
			if (!now) 
			{
				return false;
			}
			var next:Q_meridian=getNextLevelAcu(acu);
			if (!next) 
			{
				if (bShowNotice) 
				{
					NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7019));
				}
				return false;
			}
			if (now.q_need_level>MainRoleManager.actorInfo.totalStat.level) 
			{
				if (bShowNotice) 
				{
					NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7013),[now.q_need_level]);
				}
				return false;
			}
			if (now.q_need_spirit>MainRoleManager.actorInfo.curZhenqi) 
			{
				if (bShowNotice) 
				{
					NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7015));
				}
				return false;
			}
			if (now.q_need_meridian_id!=null&&now.q_need_meridian_id!="") 
			{
				var tmp:Array=now.q_need_meridian_id.split("_");
				var qNeed:Q_meridian=MeridianCfg.getMeridianCfg(now.q_need_meridian_id+"_0");
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
						if (bShowNotice) 
						{
							NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7014),[qNeed.q_name,now.q_prelvl]);
						}
						return false;
					}
				}
				//奇穴看石头等级
				else
				{
					if (needInfo.stone.length==0) 
					{
						if (bShowNotice) 
						{
							NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7018),[qNeed.q_name,now.q_prelvl,EnumMStoneType.getStoneTypeName(qNeed.q_stone_type)]);
						}
						return false;
					}
					var qItem:Q_item=ItemConfig.getQItemByID(needInfo.stone[0].itemModelId);
					if (qItem==null) 
					{
						return false;
					}
					if (qItem.q_levelnum<now.q_prelvl) 
					{
						if (bShowNotice) 
						{
							NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7018),[qNeed.q_name,now.q_prelvl,EnumMStoneType.getStoneTypeName(qNeed.q_stone_type)]);
						}
						return false;
					}
				}
			
			}
			return true;
		}
		//===============================下面是可以升级或者替换砭石的图标提示
		public function checkHasNodeCanClick():Boolean
		{
			var keys:Array=vo.meridianHash.keys();
			for each (var key:int in keys) 
			{
				if (checkNodeCanClick(key)) 
				{
					return true;
				}
			}
			return false;
		}
		public function checkNodeCanClick(mapId:int):Boolean
		{
			var arr:Array=vo.getMeridianMapData(mapId);
			if (arr) 
			{
				var len:int=arr.length;
				var data:AcuPointInfo;
				for (var i:int = 0; i < len; i++) 
				{
					data=arr[i];
					var id:String=data.MeridId+"_"+data.acuPointId+"_"+data.level;
					var config:Q_meridian=MeridianCfg.getMeridianCfg(id);
					
					if (config.q_showtype==0) 
					{
						if (getCanLevelUp(data)) 
						{
							return true;
						}
					}
					else
					{
						var canActive:Boolean=data.stone.length>0||Mgr.meridianMgr.getCanActive(data);
						if (canActive) 
						{
							var hasBetter:Boolean=(config.q_need_level<=MainRoleManager.actorInfo.totalStat.level)&&Mgr.meridianMgr.getBetterStone(config.q_stone_type,data.stone.length>0?data.stone[0]:null).length>0;
							if (hasBetter) 
							{
								return true;
							}
						}
					}
				}
			}
			return false;
		}
	}
}