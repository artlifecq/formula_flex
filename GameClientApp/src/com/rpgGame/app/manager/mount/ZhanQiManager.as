package com.rpgGame.app.manager.mount
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.clientConfig.Q_source;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.netData.warFlag.bean.WarFlagDataInfo;
	import com.rpgGame.netData.warFlag.message.CSUseWarFlagAddtionMessage;
	import com.rpgGame.netData.warFlag.message.CSWarFlagStratumUpToGameMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagAllInfoToClientMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagExtraItemNumMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagModelIdChangMessage;
	import com.rpgGame.netData.warFlag.message.SCWarFlagUpResultToClientMessage;
	
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	
	public class ZhanQiManager
	{
		public static const ZhanQiUpLevel:int = UNIQUEID.NEXT;
		public static const ZhanQiChangeExp:int = UNIQUEID.NEXT;
		public static const ZhanQiExtraItemNum:int = UNIQUEID.NEXT;
		
		private var _zhanqiDataInfo:WarFlagDataInfo;
		
		public function ZhanQiManager()
		{
		}
		
		private var _useExtraItem1:int;
		
		/**
		 * 资质丹使用数量
		 */
		public function get useExtraItem1():int
		{
			return _useExtraItem1;
		}
		
		private var _useExtarItem2:int;
		
		/**
		 * 成长丹使用数量 
		 */
		public function get useExtarItem2():int
		{
			return _useExtarItem2;
		}
		
		public function get zhanqiDataInfo():WarFlagDataInfo
		{
			return _zhanqiDataInfo;
		}
		
		public function set zhanqiDataInfo(value:WarFlagDataInfo):void
		{
			_zhanqiDataInfo=value;
		}
		
		public function get zhanqiLevel():int
		{
			//测试用
			if(_zhanqiDataInfo==null) return 1;
			return _zhanqiDataInfo.warFlagModelId;
		}
		/////////////////////////////接收类////////////////////////
		/**
		 * 接收当前战旗的数据
		 * */
		public function onSCWarFlagAllInfoToClientMessage(msg:SCWarFlagAllInfoToClientMessage):void
		{
			zhanqiDataInfo=msg.warFlagDataInfo;
			if(zhanqiDataInfo.warFlagModelId>0) 
			{
				var role:SceneRole=MainRoleManager.actor;
				(role.data as HeroData).zhanqiLv=zhanqiDataInfo.warFlagModelId;
				updateZhanQiShow();
			}
		}
		
		/**
		 * 接收资质丹、成长丹使用消息
		 * */
		public function onSCWarFlagExtraItemNumMessage(msg:SCWarFlagExtraItemNumMessage):void
		{
			if(msg.type==1)
			{
				_useExtraItem1 = msg.num;
			}else if(msg.type ==2){
				_useExtarItem2 = msg.num;
			}
			EventManager.dispatchEvent(ZhanQiExtraItemNum);
		}
		
		/**
		 * 升阶结果反馈
		 * */
		public function onSCWarFlagUpResultToClientMessage(msg:SCWarFlagUpResultToClientMessage):void
		{
			zhanqiDataInfo.exp = msg.exp;
			if(zhanqiDataInfo.warFlagModelId !=msg.isSuccess)
			{
				zhanqiDataInfo.warFlagModelId=msg.isSuccess;
				EventManager.dispatchEvent(ZhanQiUpLevel);
				var role:SceneRole=MainRoleManager.actor;
				(role.data as HeroData).zhanqiLv=msg.isSuccess;
				updateZhanQiShow();
			}else{
				EventManager.dispatchEvent(ZhanQiChangeExp);
			}
		}
		
		/**
		 * 同步信息
		 * */
		public function onSCWarFlagModelIdChangMessage(msg:SCWarFlagModelIdChangMessage):void
		{
			var role:SceneRole=SceneManager.getSceneObjByID(msg.playerId.ToGID())as SceneRole;
			if(role)
			{
				(role.data as HeroData).zhanqiLv=msg.warFlagModelid;
				AvatarManager.callEquipmentChange(role);
			}
		}
		
		////////////////////////////请求类/////////////////////////
		
		/**
		 * 请求使用资质丹、成长丹消息
		 * */
		public function useExtraItemZhanQi(showdata:ZhanQiShowData,type:int):Boolean
		{
			var extraItemInfo:ZhanQiExtraItemInfo = showdata.getOpenLevelBytype(type);
			var useCount:int = showdata.getUseExtralItem(type);
			if(!extraItemInfo.canUseItem(showdata.zhanqiLevel,useCount))
			{
				NoticeManager.showNotifyById(9004,extraItemInfo.clientItemInfo.qItem.q_name);
				return false;
			}
			
			var clientitem:ClientItemInfo = extraItemInfo.clientItemInfo;
			if(BackPackManager.instance.getBagItemsCountById(clientitem.cfgId)<=0)
			{
				NoticeManager.showNotifyById(9002,clientitem.qItem.q_name);
				return false;
			}
			var msg:CSUseWarFlagAddtionMessage = new CSUseWarFlagAddtionMessage();
			msg.type = extraItemInfo.eatType;
			msg.num = 1;
			SocketConnection.send(msg);
			return true;
		}
		
		/**
		 * 请求升阶消息
		 * */
		public function eatItemZhanQi(showdata:ZhanQiShowData):Boolean
		{
			if(showdata.isMaxLevel)
			{
				NoticeManager.showNotifyById(9001);
				return false;
			}
			if(!showdata.isAutoBuyItem&&!showdata.canUpLevel())
			{
				NoticeManager.showNotifyById(9002,showdata.upLevelItem.qItem.q_name);
				return false;
			}
			if(showdata.isAutoBuyItem&&!showdata.canUpLevel())
			{
				var qSource:Q_source=SourceGetCfg.getSource(showdata.upLevelItem.qItem.q_id);
				if (!qSource) 
				{
					NoticeManager.mouseFollowNotify("商城未上架");
					return false;
				}	
				var shopItems:Array=Mgr.shopMgr.getMallItemShopVo(showdata.upLevelItem.qItem.q_id,qSource.q_shoptype,JSONUtil.decode(qSource.q_sub_shop_type));
				var needNum:int=showdata.upLevelNeedItemCount-showdata.bagHaveItemCount;
				if(!ShopManager.ins.isCanBuy(shopItems,needNum))
				{
					NoticeManager.showNotifyById(9002,"元宝");
					return false;
				}
			}
			var msg:CSWarFlagStratumUpToGameMessage = new CSWarFlagStratumUpToGameMessage();
			msg.Automatic = showdata.isAutoBuyItem?1:0;
			SocketConnection.send(msg);
			return true;
		}
		
		public function updateZhanQiShow():void
		{	
			var role:SceneRole=MainRoleManager.actor;
			AvatarManager.callEquipmentChange(role);
		}
		
		private static var _instance:ZhanQiManager;
		public static function instance():ZhanQiManager
		{
			if(_instance==null)
			{
				_instance = new ZhanQiManager();
			}
			return _instance;
		}
	}
}