package com.rpgGame.app.manager.mount
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.goods.BackPackManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.HorseSender;
	import com.rpgGame.app.state.role.control.MountRideStateReference;
	import com.rpgGame.app.ui.alert.SomeSystemNoticePanel;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.UNIQUEID;
	import com.rpgGame.coreData.cfg.HorseConfigData;
	import com.rpgGame.coreData.cfg.HorseSpellData;
	import com.rpgGame.coreData.cfg.SourceGetCfg;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_horse;
	import com.rpgGame.coreData.clientConfig.Q_horse_skills;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.clientConfig.Q_source;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.netData.horse.bean.HorseDataInfo;
	import com.rpgGame.netData.horse.message.SCExtraItemNumMessage;
	import com.rpgGame.netData.horse.message.SCHorseUpResultToClientMessage;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	import gs.TweenLite;
	
	import org.client.mainCore.manager.EventManager;
	
	public class HorseManager
	{
		public static const HorseUpLevel:int = UNIQUEID.NEXT;
		public static const HorseChangeExp:int = UNIQUEID.NEXT;
		public static const HorseExtraItemNum:int = UNIQUEID.NEXT;
		private var _horsedataInfo:HorseDataInfo;
		private var _spellList:Vector.<BaseFaceInfo>;
		
		private var _useExtraItem1:int;
		
		public static var isInRideCD:Boolean;
		private static var _tweenLite:TweenLite;
		
		public static const MaxDistance:int  = 400;
		
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
		
		public function get horsedataInfo():HorseDataInfo
		{
			return _horsedataInfo;
		}
		
		public function set horsedataInfo(value:HorseDataInfo):void
		{
			_horsedataInfo = value;
		}
		
		public function uplevel(msg:SCHorseUpResultToClientMessage):void
		{
			_horsedataInfo.exp = msg.exp;
			if(msg.isSuccess)
			{
				_horsedataInfo.horseModelId+=1;
				EventManager.dispatchEvent(HorseUpLevel);
			}else{
				EventManager.dispatchEvent(HorseChangeExp,msg.exp,msg.count);
			}
		}
		public function updateExtraItemNum(msg:SCExtraItemNumMessage):void
		{
			if(msg.type==1)
			{
				_useExtraItem1 = msg.num;
			}else if(msg.type ==2){
				_useExtarItem2 = msg.num;
			}
			EventManager.dispatchEvent(HorseExtraItemNum);
		}
		public function get spellList():Vector.<BaseFaceInfo>
		{
			return _spellList;
		}
		public function get horseConfigData():Q_horse
		{
			return HorseConfigData.getMountDataById(houseLevel);
		}
		
		private function init():void
		{
			_spellList = new Vector.<BaseFaceInfo>();
			for each(var data:Q_horse_skills in HorseSpellData.allSpell)
			{
				var skill:Q_skill_model = SpellDataManager.getSpellData(data.q_id,1);
				_spellList.push(FaceUtil.chanceSpellToFaceInfo(skill));
			}
			EventManager.addEvent(ItemEvent.ITEM_INIT,propSysCanUseExtraItem);
			EventManager.addEvent(ItemEvent.ITEM_ADD,addItemHandler);
		}
		private function addItemHandler(info:ClientItemInfo):void
		{
			if(_horsedataInfo==null)
				return ;
			if(_showdata == null)
				_showdata= new MountShowData();
			_showdata.heroJob = MainRoleManager.actorInfo.job;
			_showdata.horsedataInfo =  HorseManager.instance().horsedataInfo;
			if(_showdata.isMaxLevel)
				return ;
			if(info.cfgId != _showdata.upLevelItem.cfgId)
				return ;
			propSysCanUseExtraItem(info);
		}
		public function get houseLevel():int
		{
			return _horsedataInfo.horseModelId;
		}
		
		public function eatItemHorse(showdata:MountShowData):Boolean
		{
			if(showdata.isMaxLevel)
			{
				NoticeManager.showNotifyById(9001);
				return false;
			}
			if(!showdata.isAutoBuyItem&&!showdata.canUpLevel())
			{
				NoticeManager.showNotifyById(9002,"",showdata.upLevelItem.qItem.q_name);
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
			HorseSender.horseStratumUp(showdata.isAutoBuyItem,showdata.isAutoing);
			return true;
		}
		
		public function useExtraItemHorse(showdata:MountShowData,type:int):Boolean
		{
			var extraItemInfo:HorseExtraItemInfo = showdata.getOpenLevelBytype(type);
			var useCount:int = showdata.getUseExtralItem(type);
			if(!extraItemInfo.canUseItem(showdata.mountLevel,useCount))
			{
				NoticeManager.showNotifyById(9004,"",extraItemInfo.clientItemInfo.qItem.q_name);
				return false;
			}
			
			var clientitem:ClientItemInfo = extraItemInfo.clientItemInfo;
			if(BackPackManager.instance.getBagItemsCountById(clientitem.cfgId)<=0)
			{
				NoticeManager.showNotifyById(9002,"",clientitem.qItem.q_name);
				return false;
			}
			HorseSender.useHorseAddtion(extraItemInfo.eatType,1);
			return true;
		}
		
		private var _showdata:MountShowData; 
		private function propSysCanUseExtraItem(item:*):void
		{
			if(_horsedataInfo==null)
				return ;
			if(_showdata == null)
				_showdata= new MountShowData();
			_showdata.heroJob = MainRoleManager.actorInfo.job;
			_showdata.horsedataInfo =  HorseManager.instance().horsedataInfo;
			if(_showdata.isMaxLevel)
			{
				return;
			}
			if(_showdata.canUpLevel())
			{
				var data:Object={};
				data.sys=SomeSystemNoticePanel.SYS_HORSE;
				data.desc="坐骑可以进阶";
				data.btnText="立即进阶";
				EventManager.dispatchEvent(MainPlayerEvent.SYS_CAN_LEVEL_UP,data); 
			}
		}
		
		private static var _instance:HorseManager;
		public static function instance():HorseManager
		{
			if(_instance==null)
			{
				_instance = new HorseManager();
				_instance.init();
			}
			return _instance;
		}
		
		public function autoRiding(walkRole:SceneRole, pos:Vector3D):void
		{
			if(_horsedataInfo==null)
				return;
			var scenedata:SceneData = MapDataManager.currentScene;
			if (scenedata== null ||!scenedata.isMountLimit)
			{
				return;
			}
			var hoseId:int = HeroData(walkRole.data).mount;
			if(hoseId>0)
				return ;
			hoseId= _horsedataInfo.horseModelId;
			var q_mount:Q_horse = HorseConfigData.getMountDataById(hoseId);
			var disance:Number = Point.distance(new Point(walkRole.x, walkRole.z), new Point(pos.x, pos.y));
			if(disance <q_mount.q_distance)
				return ;
			
			clearDelatAutoRideMount();
			var rideTime:int = q_mount.q_ride_time;
			TweenLite.delayedCall(rideTime * 0.001, delayRideMount);
//			setHouseRide();
		}
		
		public function setRoleRideState(role:SceneRole,isRide:Boolean):void
		{
			if(role.isMainChar)
			{
				role.stateMachine.removeState(RoleStateType.CONTROL_MOUNT_RIDE);
			}
		}
		
		public function setMountRide():void
		{
			var currentHouseid:int = HeroData(MainRoleManager.actor.data).mount;
			
			if (currentHouseid > 0)
			{
				onRequestSetUpMountRide(false);
			}
			else
			{
				onRequestSetUpMountRide(true);
			}
		}
		/**不管有么有上马，都上马*/
		public function setMountRideUp():void
		{
			var currentHouseid:int = HeroData(MainRoleManager.actor.data).mount;
			
			if (currentHouseid == 0)
			{
				onRequestSetUpMountRide(true);
			}
		}
		/**不管有么有上马，都下马*/
		public function setMountRideDown():void
		{
			var currentHouseid:int = HeroData(MainRoleManager.actor.data).mount;
			
			if (currentHouseid > 0)
			{
				onRequestSetUpMountRide(false);
			}
		}
		
		
		/**
		 * 请求坐骑切换/上马/下马 
		 * 
		 */
		public function onRequestSetUpMountRide(isRide:Boolean):void
		{
			if(isInRideCD && isRide)
			{
				return;
			}
			
			//坐骑未开放
			if(_horsedataInfo == null)
				return ;
			var scenedata:SceneData = MapDataManager.currentScene;
			if (scenedata== null ||!scenedata.isMountLimit)
			{
				NoticeManager.showNotifyById(9007);
				return;
			}
			var hoseId:int = _horsedataInfo.horseModelId;
			var currentHouseid:int = HeroData(MainRoleManager.actor.data).mount;
			if(currentHouseid ==hoseId)
			{
				hoseId = 0;
			}/*else if(MainRoleManager.actor.stateMachine.isAttacking){
				NoticeManager.showNotifyById(9006);
				return;
			}*/
			
			var ref:MountRideStateReference = null;
			if (MainRoleManager.actor.stateMachine.passTo(RoleStateType.CONTROL_MOUNT_RIDE))
			{
				if (isRide)
				{
					isInRideCD = true;
					_tweenLite = TweenLite.delayedCall((200 * 0.001), onDelayedCD);
				}
				ref = (MainRoleManager.actor.stateMachine.getReference(MountRideStateReference) as MountRideStateReference);
				ref.setParams(isRide,hoseId);
				MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_MOUNT_RIDE, ref);
			}
		}
		
		private function onDelayedCD():void
		{
			isInRideCD = false;
			if (_tweenLite)
			{
				_tweenLite.kill();
				_tweenLite = null;
			}
		}
		
		/**
		 * 专门针对行走距离过长，要骑马做的延时回调函数 
		 * 
		 */		
		public function delayRideMount():void
		{
			if(isInRideCD)
				return;
			if(MainRoleManager.actor.stateMachine.isRiding)
			{
				return;
			}
			onRequestSetUpMountRide(true);
		}
		
		public function clearDelatAutoRideMount():void
		{
			TweenLite.killDelayedCallsTo(delayRideMount);
		}
		public function canHorseLevelUp():Boolean
		{
			if(_horsedataInfo==null)
				return false;
			if(_showdata == null)
				_showdata= new MountShowData();
			_showdata.heroJob = MainRoleManager.actorInfo.job;
			_showdata.horsedataInfo =  HorseManager.instance().horsedataInfo;
			if(_showdata.isMaxLevel)
			{
				return false;
			}
			return (_showdata.canUpLevel());
		}
	}
}