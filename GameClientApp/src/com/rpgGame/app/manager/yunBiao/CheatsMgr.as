package com.rpgGame.app.manager.yunBiao
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.CheatsEvent;
	import com.rpgGame.coreData.cfg.NotifyCfgData;
	import com.rpgGame.coreData.cfg.cheats.CheatsCfg;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.cfg.meridian.EnumMStoneType;
	import com.rpgGame.coreData.clientConfig.Q_cheats;
	import com.rpgGame.coreData.clientConfig.Q_cheats_node;
	import com.rpgGame.coreData.clientConfig.Q_item;
	import com.rpgGame.coreData.info.cheats.CheatsNodeVo;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	import com.rpgGame.netData.cheats.bean.CheatsInfo;
	import com.rpgGame.netData.cheats.bean.NodeInfo;
	
	import flash.events.EventDispatcher;
	
	import app.message.GoodsType;

	public class CheatsMgr extends EventDispatcher
	{
		public static var ins:CheatsMgr=new CheatsMgr();
		private var _cheatsHash:HashMap=new HashMap();
		
		public function recCheatsChange(info:CheatsInfo):void
		{
			// TODO Auto Generated method stub
			var tmp:CheatsVo=_cheatsHash.getValue(info.cheatsId);
			if (tmp) 
			{
				tmp.updateServerData(info);
				//检查关联属性
				for each (var tmp2:CheatsVo in _cheatsHash.values()) 
				{
					tmp2.checkEffectCheatUpdate(info.cheatsId);
				}
				
				this.dispatchEvent(new CheatsEvent(CheatsEvent.CHEATS_CHANGE,tmp));
			}
			
		}
		public function recCheatsNodeChange(change:NodeInfo):void
		{
			var tmp:CheatsVo=_cheatsHash.getValue(change.cheatsId);
			if (tmp) 
			{
				tmp.updateSubNode(change);
				this.dispatchEvent(new CheatsEvent(CheatsEvent.CHEATS_NODE_CHANGE,tmp.getSubNode(change.nodeId)));
			}
			
		}
		public function recCheatsList(infos:Vector.<CheatsInfo>):void
		{
			// TODO Auto Generated method stub
			
			var tmp:CheatsVo;
			for each (var p:CheatsInfo in infos) 
			{
				tmp=_cheatsHash.getValue(p.cheatsId);
				if (tmp) 
				{
					tmp.updateServerData(p,false);
				}
			}
			_cheatsHash.eachValue(function(vo:CheatsVo):void
			{
				vo.updateAttr();
			});
			
		}
	
		public function CheatsMgr()
		{
			var arr:Array=CheatsCfg.dataArr;
			var len:int=arr.length;
			var qCh:Q_cheats;
			for (var i:int = 0; i < len; i++) 
			{
				qCh=arr[i];
				_cheatsHash.put(qCh.q_id,new CheatsVo(qCh,getCheatVo));
			}
		}
		
		/**
		 *心法能否激活
		 * @return 
		 * 
		 */		
		public function getCanActive(cheatId:int):Boolean
		{
			var qChe:Q_cheats=CheatsCfg.getCheats(cheatId);
			if (!qChe) 
			{
				return false;
			}
			var vo:CheatsVo=getCheatVo(cheatId);
			if (!vo) 
			{
				return false;
			}
			if (vo.needItemHash.size()!=0) 
			{
				var arr:Array=vo.needItemHash.keys();
				if (arr&&arr.length>0) 
				{
					var len:int=arr.length;
					var itemMid:int;
					var itemNum:int;
					var backNum:int=0;
					for (var i:int = 0; i < len; i++) 
					{
						itemMid=arr[i];
						itemNum=vo.needItemHash.getValue(itemMid);
						backNum=BackPackManager.instance.getItemCount(itemMid);
						if (itemNum>backNum) 
						{
							return false;
						}
					}
				}
			}
			return true;
		}
		/**判断解锁**/
		public function getNodeIsUnlock(node:CheatsNodeVo):Boolean
		{
			if (node.isActive) 
			{
				return true;
			}
			var cheats:CheatsVo=_cheatsHash.getValue(node.cheatsId);
			//心法都没解锁
			if (cheats&&cheats.level==0) 
			{
				return false;
			}
			if (cheats&&cheats.level>1) 
			{
				return true;
			}
//			if (node.getUnLockNeedPlayerLevel()>MainRoleManager.actorInfo.totalStat.level)
//			{
//				return false;
//			}
			var preConfig:Q_cheats_node=node.getPreNodeConfig();
			
			if (preConfig) 
			{
				var arr:Array=preConfig.q_node_id.split("_");
				var needInfo:CheatsNodeVo=getCheatNodeVo(int(arr[0]),int(arr[1]));
				if (needInfo.serverData==null) 
				{
					return false;
				}
				//冲穴看等级
				if (needInfo.getNodeType()==0) 
				{
					if (needInfo.serverData.level<node.levelUpNeedPreLv) 
					{
						return false;
					}
				}
					//奇穴看石头等级
				else
				{
					if (needInfo.serverData.stone.length==0) 
					{
						return false;
					}
					var qItem:Q_item=ItemConfig.getQItemByID(needInfo.serverData.stone[0].itemModelId);
					if (qItem==null) 
					{
						return false;
					}
					if (qItem.q_levelnum<node.levelUpNeedPreLv) 
					{
						return false;
					}
				}
				
			}
			//判断解锁条件，前置，玩家等级
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
		public function getCanLevelUp(node:CheatsNodeVo,bShowNotice:Boolean=false):Boolean
		{
			var cheat:CheatsVo=getCheatVo(node.cheatsId);
			if (cheat.level==0) 
			{
				return false;
			}
			if (node.getConfig().q_type==1) 
			{
				return false;
			}
			if (node.curLevel>=cheat.level) 
			{
				if (bShowNotice) 
				{
					if (node.curLevel==node.getConfig().q_maxlevel) 
					{
						NoticeManager.showNotifyById(12002);
					}
					else
					{
						NoticeManager.showNotifyById(11002,cheat.cheatsConfig.q_name,cheat.level+1);
					}
					
				}
				return false;
			}
			
			if (node.levelUpNeedPlayerLevel>MainRoleManager.actorInfo.totalStat.level) 
			{
				if (bShowNotice) 
				{
					NoticeManager.showNotifyById(12000,node.levelUpNeedPlayerLevel);
				}
				return false;
			}
			if (node.levelUpNeedSpirit>MainRoleManager.actorInfo.curZhenqi) 
			{
				if (bShowNotice) 
				{
					NoticeManager.showNotifyById(12003);
				}
				return false;
			}
			var preConfig:Q_cheats_node=node.getPreNodeConfig();
			
			if (preConfig) 
			{
				var arr:Array=preConfig.q_node_id.split("_");
				var needInfo:CheatsNodeVo=getCheatNodeVo(int(arr[0]),int(arr[1]));
				if (needInfo.serverData==null) 
				{
					return false;
				}
				//冲穴看等级
				if (needInfo.getNodeType()==0) 
				{
					if (needInfo.serverData.level<node.levelUpNeedPreLv) 
					{
						if (bShowNotice) 
						{
							NoticeManager.showNotifyById(12001);
						}
						return false;
					}
				}
					//奇穴看石头等级
				else
				{
					if (needInfo.serverData.stone.length==0) 
					{
						if (bShowNotice) 
						{
							NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7018),[needInfo.getConfig().q_name,node.levelUpNeedPreLv,EnumMStoneType.getStoneTypeName(needInfo.getConfig().q_stone_type)]);
						}
						return false;
					}
					var qItem:Q_item=ItemConfig.getQItemByID(needInfo.serverData.stone[0].itemModelId);
					if (qItem==null) 
					{
						return false;
					}
					if (qItem.q_levelnum<node.levelUpNeedPreLv) 
					{
						if (bShowNotice) 
						{
							NoticeManager.mouseFollowNotify(NotifyCfgData.getNotifyTextByID(7018),[needInfo.getConfig().q_name,node.levelUpNeedPreLv,EnumMStoneType.getStoneTypeName(needInfo.getConfig().q_stone_type)]);
						}
						return false;
					}
				}
				
			}
			return true;
		}

		public function get cheatsHash():HashMap
		{
			return _cheatsHash;
		}
		public function getCheatVo(cheatId:int):CheatsVo
		{
			return _cheatsHash.getValue(cheatId);
		}
		public function getCheatNodeVo(cheatId:int,nodeId:int):CheatsNodeVo
		{
			var tmp:CheatsVo=_cheatsHash.getValue(cheatId);
			if (tmp) 
			{
				return tmp.getSubNode(nodeId);
			}
			return null;
		}
		public function checkNodeCanClick(cheatsId:int):Boolean
		{
			var cheats:CheatsVo=_cheatsHash.getValue(cheatsId);
			if (cheats) 
			{
				var arr:Array=cheats.subNodeHash.values();
				var len:int=arr.length;
				var node:CheatsNodeVo;
				for (var i:int = 0; i < len; i++) 
				{
					node=arr[i];
					var config:Q_cheats_node=node.getConfig();
					var hasUnlock:Boolean=Mgr.cheatsMgr.getNodeIsUnlock(node);
					if (config.q_type==0) 
					{
						if (hasUnlock) 
						{
							var canLevelUp:Boolean=Mgr.cheatsMgr.getCanLevelUp(node);
							if (canLevelUp)
							{
								return true;
							}
						}
					}
					else
					{
						if (hasUnlock) 
						{
							var hasBetter:Boolean=Mgr.meridianMgr.getBetterStone(config.q_stone_type,node.getStone()).length>0;
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