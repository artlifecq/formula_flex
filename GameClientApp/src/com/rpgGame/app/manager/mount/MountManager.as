package com.rpgGame.app.manager.mount
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.collect.CollectManager;
	import com.rpgGame.app.manager.mount.rEnum.EmMountSex;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.MountSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.FunctionMessageBarEvent;
	import com.rpgGame.core.events.mount.MountEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.mount.MountConfigData;
	import com.rpgGame.coreData.cfg.mount.MountHungerDegreeData;
	import com.rpgGame.coreData.cfg.mount.MountMiscData;
	import com.rpgGame.coreData.cfg.mount.MountSpeciesData;
	import com.rpgGame.coreData.cfg.mount.MountUnitData;
	import com.rpgGame.coreData.cfg.mount.MountVitalityData;
	import com.rpgGame.coreData.info.item.MountBeastCardInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	import com.rpgGame.coreData.info.mount.MountModuleObjClientData;
	import com.rpgGame.coreData.info.mount.MountStablesBreedData;
	import com.rpgGame.coreData.info.mount.MountStablesBreedSideData;
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.lang.LangMount;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.EnumFunctionMessageBarIcoType;
	
	import app.message.EquipedMountProto;
	import app.message.MountProto;
	import app.message.MountStatus;
	import app.message.MountType;
	import app.message.PrefixType;
	import app.message.Quality;
	import app.message.StablesBreedProto;
	import app.message.StablesBreedType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	
	import starling.display.DisplayObject;

	/**
	 * 坐骑数据管理 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountManager
	{
		/** 邀请繁育保留时间(2分钟120秒) 秒 **/
		public static const HOLE_TIME:int = 120;
		/** 坐骑数据 **/
		public static var mountInfoDataVec:Vector.<MountInfoData>;
		/** 坐骑状态(0，不出战，不训练，1 训练， 2 出战) **/
		public static var mountStatus:int;
		/** true(上马)/false(下马) **/
		public static var isRide:Boolean;
		/** 我是不是被邀请的 **/
		public static var isInvite:Boolean; 
		/** 当前选中的坐骑槽的数据 **/
		private static var _curSelectData:MountInfoData;
		/** 当前选中的坐骑槽index **/
		private static var _curSelectIdx:int=-1;
		/** 是否是强化的界面 **/
		private static var _isIntensifyTab:Boolean = false;
		/** 是否是鉴定的界面 **/
		private static var _isJianDingPanel:Boolean = false;
		/** 是否是转化的界面 **/
		private static var _isChangePanel:Boolean = false;
		/** 是否是繁育的界面 **/
		private static var _isBreedPanel:Boolean = false;
		/** 收到邀请我繁育数据管理 数据类型:MountStablesBreedData **/
		private static var _inventBreadList:HashMap = new HashMap();
		/** 所有邀请消息延迟删除 数据类型:TweenLite **/
		private static var _joinInfoDelayList:HashMap = new HashMap();
		/** 繁育邀请过期时间 **/
		private static var _inviteExpireTime:Number;
		/** 繁育邀请信息（邀请繁育、被邀请繁育信息） **/
		private static var mountStablesBreedSideHash:HashMap = new HashMap();
		/** 坐骑繁育状态 **/
		public static var mountStablesBreedType:int = -1;
		/** 坐骑繁育时长 **/
		private static var _mountBreedTime:Number;
		/** 是否已锁定 **/
		public static var isLock:Boolean;
		/** 是否有繁育在进行 **/
		public static var isHasBreed:Boolean;
		
		public function MountManager()
		{
		}
		
		//----------------------------------------------------------------------------------------------------
		/**
		 * 移除一个坐骑
		 * @param idx 坐骑槽(移除的是哪个坐骑槽的坐骑)
		 * 
		 */		
		public static function removeMountSlot( idx:int ):void
		{
			var mountDataVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( mountDataVec == null || mountDataVec.length <= 0 )
				return;
			
			for (var i:int = 0; i < mountDataVec.length; i++) 
			{
				if( mountDataVec[i].idx == idx )
				{
					mountDataVec.splice( i, 1 );
					
					//这事件是强化坐骑的时候用的
					EventManager.dispatchEvent( MountEvent.MOUNT_CLEAR_MOUNT_ICON_ITEM_GROUP_FILTER );
				}
			}
			EventManager.dispatchEvent( MountEvent.MOUNT_REMOVE_SLOT );
		}
		
		/**
		 * 设置坐骑的状态
		 * @param index 坐骑槽(第几个坐骑)
		 * @param statue 状态 MountStatus(0，不出战，不训练，1 训练， 2 出战)
		 * 
		 */		
		public static function setMountStatue( idx:int, statue:int ):void
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null || slotMountVec.length <= 0 )
				return;
			
			for each (var data:MountInfoData in slotMountVec)
			{
				if( statue == MountStatus.FIGHTING )
				{
					if( data.mountStatus == MountStatus.FIGHTING )//之前有出战过的坐骑，先把旧的出战的坐骑状态设置成休息
						data.mountStatus = MountStatus.REST;
				}
				
				if( data.idx == idx )//把现在需要设置的坐骑的状态重新设置
					data.mountStatus = statue;
			}
			EventManager.dispatchEvent( MountEvent.MOUNT_STATUE_SUCCEED );
		}
		
		/**
		 * 坐骑鉴定成功 
		 * @param index 坐骑槽(第几个坐骑)
		 * @param data MountProto 坐骑数据
		 * 
		 */		
		public static function setMountIdentify( idx:int, mountProto:MountProto ):void
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null || slotMountVec.length <= 0 )
				return;
			
			for each (var mountInfoData:MountInfoData in slotMountVec)
			{
				if( mountInfoData.idx != idx )
					continue;
				
				mountInfoData.setInfoData( mountProto );
				EventManager.dispatchEvent( MountEvent.MOUNT_AUTHENTICATE_SUCCESS, mountInfoData );
				NoticeManager.showNotify( LangMount.MOUNT_TIP_61 );
			}
		}
		
		
		//----------------------------------------------坐骑繁育-------------------------------------------------------------
		/**
		 * 设置 马厩繁育数据
		 * @param stablesBreedPro
		 * 
		 */		
		public static function setStablesBreedInfo( stablesBreedPro:StablesBreedProto ):void
		{
			var stablesBreedData:MountStablesBreedData = new MountStablesBreedData();
			stablesBreedData.setData( stablesBreedPro );
			MountManager.mountBreedTime = stablesBreedData.bornTime;
			MountManager.mountStablesBreedType = stablesBreedData.stablesBreedType;
			isHasBreed = true;
			
			//邀请者
			var mountInvitorData:MountStablesBreedSideData = new MountStablesBreedSideData();
			mountInvitorData.setData( stablesBreedPro.invitor );
			mountInvitorData.isInvite = false;
			mountStablesBreedSideHash.add( mountInvitorData.heroId, mountInvitorData );
			
			//被邀请者，可能为空
			var mountBreedInvitorData:MountStablesBreedSideData = new MountStablesBreedSideData();
			mountBreedInvitorData.setData( stablesBreedPro.beenInvitor );
			mountBreedInvitorData.isInvite = true;
			mountStablesBreedSideHash.add( mountBreedInvitorData.heroId, mountBreedInvitorData );
		}
		
		/**
		 * 获取所有的繁育邀请信息（邀请繁育、被邀请繁育信息）
		 * @return 
		 * 
		 */		
		public static function get allMountStablesBreedSideData():Array
		{
			return mountStablesBreedSideHash.getValues();
		}
		
		/**
		 * 根据玩家id获取繁育邀请信息
		 * @param id
		 * @return 
		 * 
		 */		
		public static function getMountStablesBreedSideByid( id:Number ):MountStablesBreedSideData
		{
			return mountStablesBreedSideHash.getValue( id );
		}
		
		/**
		 * 锁定成功 
		 * @param id 玩家id
		 * 
		 */		
		public static function MountBreedLockSuccess( id:Number ):void
		{
			isLock = true;
			MountManager.mountStablesBreedType = StablesBreedType.WAIT_LOCK;
			EventManager.dispatchEvent( MountEvent.MOUNT_BREED_LOCK_SUCCESS, id );
		}
		
		/**
		 * 其他人邀请你繁育了 
		 * @param data
		 * 
		 */		
		public static function MountBeenInvite( joinData:MountStablesBreedData ):void
		{
			isInvite = true;
			addCaptainInventInfo(joinData);
			
			//弹出繁育邀请消息icon
			if (!AppManager.isAppInScene(AppConstant.MOUNT_BREAD_INVITE_WAITE_PANEL))
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_SHOW_TYPE, EnumFunctionMessageBarIcoType.MOUNT_BREAD_INVITE_WAITE_TYPE, getInventMeBreadInfoList().length);
			}
			EventManager.dispatchEvent(MountEvent.MOUNT_BREAD_INVENT_JOIN_INFO_CHANGE);
		}
		
		/**
		 * 添加一个被邀请繁育的信息
		 * @param joinInfo
		 *
		 */
		public static function addCaptainInventInfo(joinInfo:MountStablesBreedData) : void
		{
			var tweenLite : TweenLite = TweenLite.delayedCall(HOLE_TIME, removeInventInfo, [joinInfo]);
			_inventBreadList.add(joinInfo.inviteTargetId, joinInfo);
			_joinInfoDelayList.add(joinInfo, tweenLite);
			EventManager.dispatchEvent(MountEvent.MOUNT_BREAD_INVENT_JOIN_INFO_CHANGE);
		}
		
		/**
		 * 移除一个被邀请繁育的信息
		 * @param joinInfo
		 *
		 */
		public static function removeInventInfo(joinInfo:MountStablesBreedData) : void
		{
//			MountSender.requestMountRefuseOtherInviteYou( joinInfo.inviteTargetId );
			if( isInvite )//邀请时间过来，我是被邀请的，邀请状态设置为false
				isInvite = false;
				
			var tweenLite:TweenLite = _joinInfoDelayList.getValue(joinInfo);
			tweenLite.kill();
			_inventBreadList.remove(joinInfo.inviteTargetId);
			EventManager.dispatchEvent(MountEvent.MOUNT_BREAD_INVENT_JOIN_INFO_CHANGE);
			if (_inventBreadList.length == 0)
			{
				EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MOUNT_BREAD_INVITE_WAITE_TYPE);
				AppManager.hideApp(AppConstant.MOUNT_BREAD_INVITE_WAITE_PANEL);
			}
		}
		
		/**
		 * 1、清空所有邀请繁育信息
		 * 2、移除主界面消息icon显示事件
		 * 3、关闭坐骑繁育邀请消息面板
		 *
		 */
		public static function clearAllInventInfo() : void
		{
			_inventBreadList.clear();
			var joinInfoArr : Array = _joinInfoDelayList.keys();
			var len : uint = joinInfoArr.length;
			for (var i : uint = 0; i < len; i++)
			{
				var joinInfo : MountStablesBreedData = joinInfoArr[i] as MountStablesBreedData;
				var tweenLite : TweenLite = _joinInfoDelayList.getValue(joinInfo);
				tweenLite.kill();
				_joinInfoDelayList.remove(joinInfo);
			}
			TweenLite.killDelayedCallsTo(removeInventInfo);
			EventManager.dispatchEvent(FunctionMessageBarEvent.FUNCTION_MESSAGE_BAR_HIDE_TYPE, EnumFunctionMessageBarIcoType.MOUNT_BREAD_INVITE_WAITE_TYPE);
			AppManager.hideApp(AppConstant.MOUNT_BREAD_INVITE_WAITE_PANEL);
		}
		
		/**
		 * 通过ID移除一个被邀请繁育的信息
		 * @param id
		 *
		 */
		public static function removeInventInfoById(id : Number) : void
		{
			removeInventInfo(getInventInfo(id));
		}
		
		/**
		 * 获取一个被邀请繁育的信息
		 * @param id
		 * */
		public static function getInventInfo(id : Number) : MountStablesBreedData
		{
			return _inventBreadList.getValue(id) as MountStablesBreedData;
		}
		
		/**
		 * 邀请被拒绝
		 * @param id 目标的id，用于区分
		 * @param name 目标的名字
		 * 
		 */		
		public static function MountBeRejectedInvite( id:Number,name:String ):void
		{
			NoticeManager.showNotify( LangMount.MOUNT_TIP_11, name );
		}
		
		/**
		 * 获取邀请我繁育的所有信息
		 * */
		public static function getInventMeBreadInfoList() : Array
		{
			return _inventBreadList.getValues();
		}
		
		/**
		 * 下一次邀请繁育的时间 
		 * @return 
		 * 
		 */		
		public static function getLastNextInviteTime():int
		{
			return (inviteExpireTime - SystemTimeManager.curtTm)/1000;
		}
		
		/**
		 * 获取繁育时长
		 * @return 
		 * 
		 */		
		public static function getMountBreedTime():int
		{
			return (mountBreedTime - SystemTimeManager.curtTm)/1000;
		}
		
		/**
		 * 取消繁育成功 
		 * @param equipMountPro
		 * @param idx
		 * 
		 */		
		public static function onCancelMountBreed( equipMountPro:EquipedMountProto, idx:int ):void
		{
			var info:MountInfoData = new MountInfoData();
			info.setInfoData( equipMountPro.mount );
			info.setMountEquipData( equipMountPro.mountEquipments );
			info.idx = idx;
			MainRoleManager.actorInfo.mounModuletData.mountInfoDataVec.push( info );
			
			mountStablesBreedType = -1;
			var data:MountStablesBreedSideData = getMountStablesBreedSideByid( MainRoleManager.actorID );
			if( data != null )
				mountStablesBreedSideHash.remove( MainRoleManager.actorID );
			
			EventManager.dispatchEvent( MountEvent.MOUNT_BREED_CANCEL_SELF );
		}
		
		/**
		 * 他人取消繁育了，将本次繁育设置为已经取消，你自己只能够把坐骑领回去了 
		 * 
		 */		
		public static function setBreedStatus():void
		{
			mountStablesBreedType = StablesBreedType.CANCEL;
			NoticeManager.showNotify( LangMount.MOUNT_CMDLISTENER_FAILD_87 );
			EventManager.dispatchEvent( MountEvent.MOUNT_BREED_CANCEL_OTHER );
		}
		
		//--------------------------------------------------------------------------------
		
		/**
		 * 经验变化
		 * @param index 坐骑槽位
		 * @param curLevel 当前等级
		 * @param curExp 当前经验
		 * 
		 */		
		public static function MountAddExp( idx:int, curLevel:int, curExp:Number ):void
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null )
				return;
			for each (var mountInfoData:MountInfoData in slotMountVec) 
			{
				if( mountInfoData.idx != idx )
					continue;
				
				mountInfoData.mountLevel = curLevel;
				mountInfoData.exp = curExp;
				EventManager.dispatchEvent( MountEvent.MOUNT_ADD_EXP, mountInfoData );
			}
		}
		
		/**
		 * 坐骑放生  
		 * @param index 坐骑槽(第几个坐骑) 
		 * 
		 */		
		public static function mountRelease( idx:int ):void
		{
			MountSender.requestMountRelease( idx );
		}
		
		/**
		 * 设置坐骑状态
		 * @param index 坐骑槽(第几个坐骑)
		 * @param status ( 0，不出战，不训练，1 训练， 2 出战 )
		 * 
		 */		
		public static function setUpMountStatus( index:int, status:int ):void
		{
			MountSender.requestSetUpMountStatus( index, status );
		}
		
		/**
		 * 上马/下马
		 * @param isRide 
		 * 
		 */		
		public static function setUpMountRide( isRide:Boolean ):void
		{
			MountSender.requestSetUpMountRide( isRide );
		}
		
		/**
		 * 设置上下马成功 
		 * @param isRide true(上马)/false(下马)
		 * 
		 */		
		public static function setMountRideStatue( isRide:Boolean ):void
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null )
				return;
			for each (var mountInfoData:MountInfoData in slotMountVec) 
			{
				if( mountInfoData.mountStatus != MountStatus.FIGHTING )
					continue;
				
				mountInfoData.isRiding = isRide;
				EventManager.dispatchEvent( MountEvent.MOUNT_ISRIDE, mountInfoData );
			}
		}
		
		/**
		 * 坐骑上下马，快捷键“T” 
		 * 
		 */		
		public static function setMountRide():void
		{
			if( !isHasFighting() )//所有的坐骑中，是否有处于出战的坐骑
			{
				NoticeManager.showNotify( LangMount.MOUNT_TIP_56 );
				return;
			}
			
			var fightinhMountInfoData:MountInfoData = getFightingMountInfoData( MainRoleManager.actorID );
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null )
				return;
			for each (var mountInfoData:MountInfoData in slotMountVec) 
			{
				if( mountInfoData.idx != fightinhMountInfoData.idx )
					continue;
				
				//坐骑单元数据
				var mountUnitData:MountUnitData = MountConfigData.getMountDataById( fightinhMountInfoData.id );
				if( mountUnitData == null )
					return;
				
				//坐骑物种数据
				var mountSpeciesData:MountSpeciesData = MountConfigData.getMountSpecieById( mountUnitData.speciesId );
				if( mountSpeciesData == null )
					return;
				if( fightinhMountInfoData.mountLevel < mountSpeciesData.requiredLevel )
				{
					NoticeManager.showNotify( LangMount.MOUNT_TIP_47 );
					return;
				}
				
				if( mountInfoData.isRiding )
					MountSender.requestSetUpMountRide( false );
				else
					MountSender.requestSetUpMountRide( true );
			}
		}
		
		/**
		 * 获取第一个坐骑的数据（每次上线第一个打开面板的时候）
		 * @return 
		 * 
		 */		
		public static function getDefaultMountInfoData():MountInfoData
		{
			var data:MountInfoData;
			//每次上线的时候，默认选择第一个坐骑的数据
			var _mountDataVec:Vector.<MountInfoData> = new Vector.<MountInfoData>();
			var mountData:MountModuleObjClientData = MainRoleManager.actorInfo.mounModuletData;
			if( mountData != null )
			{
				_mountDataVec = mountData.mountInfoDataVec;
				if( _mountDataVec != null && _mountDataVec.length > 0 )
					data = _mountDataVec[0];
			}
			return data;
		}

		/**
		 * 获取坐骑前缀 （0：勇猛的、1：迅捷的、2：机智的、3：坚毅的、4：强壮的）
		 * @param mountPrefixType
		 * @return 
		 * 
		 */		
		public static function getPrefixType( mountPrefixType:int ):String
		{
			var mountPrefixTypeStr:String;
			switch( mountPrefixType )
			{
				case PrefixType.BRAVE:
					mountPrefixTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_12 );
					break;
				case PrefixType.QUICK:
					mountPrefixTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_13 );
					break;
				case PrefixType.WITTY:
					mountPrefixTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_14 );
					break;
				case PrefixType.UPHELD:
					mountPrefixTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_15 );
					break;
				case PrefixType.STRONG:
					mountPrefixTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_16 );
					break;
				default:
					break;
			}
			return mountPrefixTypeStr;
		}
		
		/**
		 * 获取坐骑类型 （0：成年、1：宝宝、2：变异、3：二代）
		 * @param mountType
		 * @return 
		 * 
		 */		
		public static function getMountType( mountType:int ):String
		{
			var mountTypeStr:String;
			switch( mountType )
			{
				case MountType.ADULT://成年
					mountTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_17 );
					break;
				case MountType.BABY://宝宝
					mountTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_18 );
					break;
				case MountType.VARIATION://变异
					mountTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_19 );
					break;
				case MountType.BREED://二代
					mountTypeStr = LanguageConfig.getText( LangMount.MOUNT_TIP_20 );
					break;
				default:
					break;
			}
			return mountTypeStr;
		}
		
		/**
		 * 获取坐骑的性别图片URL （1：雄、2：雌） 
		 * @param mountSex
		 * 
		 */		
		public static function getMountSexURL( mountSex:int ):String
		{
			var mountSexStyleName:String;
			switch( mountSex )
			{
				case EmMountSex.MOUNT_SEX_NAN:
					mountSexStyleName = AssetUrl.MOUNT_SEX_NAN;
					break;
				case EmMountSex.MOUNT_SEX_NV:
					mountSexStyleName = AssetUrl.MOUNT_SEX_NV;
					break;
				default:
					break;
			}
			return mountSexStyleName;
		}
		
		/**
		 * 获取坐骑的性别 （1：雄、2：雌） 
		 * @param mountSex
		 * 
		 */		
		public static function getMountSexStr( mountSex:int ):String
		{
			var mountSexStr:String;
			switch( mountSex )
			{
				case EmMountSex.MOUNT_SEX_NAN:
					mountSexStr = LanguageConfig.getText( LangMount.MOUNT_TIP_21 );
					break;
				case EmMountSex.MOUNT_SEX_NV:
					mountSexStr = LanguageConfig.getText( LangMount.MOUNT_TIP_22 );
					break;
				default:
					break;
			}
			return mountSexStr;
		}
		
		/**
		 * 获取坐骑资质图片URL （0：普通、1：良好、2：优秀、3：超凡、4：完美）
		 * @param mountQuality
		 * @return 
		 * 
		 */		
		public static function getMountZiZhiURL( mountQuality:int ):String
		{
			var mountZiZhiStyleName:String;
			//坐骑资质  0：普通、1：良好、2：优秀、3：超凡、4：完美
			switch( mountQuality )
			{
				case Quality.WHITE:
					mountZiZhiStyleName = AssetUrl.MOUNT_ZIZHI_PUTONG;
					break;
				case Quality.BLUE:
					mountZiZhiStyleName = AssetUrl.MOUNT_ZIZHI_LIANGHAO;
					break;
				case Quality.YELLOW:
					mountZiZhiStyleName = AssetUrl.MOUNT_ZIZHI_YOUXIU;
					break;
				case Quality.GREEN:
					mountZiZhiStyleName = AssetUrl.MOUNT_ZIZHI_CHAOFAN;
					break;
				case Quality.PURPLE:
					mountZiZhiStyleName = AssetUrl.MOUNT_ZIZHI_WANMEI;
					break;
				default:
					break;
			}
			return mountZiZhiStyleName;
		}
		
		/**
		 * 获取坐骑资质 （0：普通、1：良好、2：优秀、3：超凡、4：完美）
		 * @param mountQuality
		 * @return 
		 * 
		 */		
		public static function getMountZiZhiStr( mountQuality:int ):String
		{
			var mountZiZhiStr:String;
			//坐骑资质  0：普通、1：良好、2：优秀、3：超凡、4：完美
			switch( mountQuality )
			{
				case Quality.WHITE:
					mountZiZhiStr = LanguageConfig.getText( LangMount.MOUNT_TIP_23 );
					break;
				case Quality.BLUE:
					mountZiZhiStr = LanguageConfig.getText( LangMount.MOUNT_TIP_24 );
					break;
				case Quality.YELLOW:
					mountZiZhiStr = LanguageConfig.getText( LangMount.MOUNT_TIP_25 );
					break;
				case Quality.GREEN:
					mountZiZhiStr = LanguageConfig.getText( LangMount.MOUNT_TIP_26 );
					break;
				case Quality.PURPLE:
					mountZiZhiStr = LanguageConfig.getText( LangMount.MOUNT_TIP_27 );
					break;
				default:
					break;
			}
			return mountZiZhiStr;
		}
		
		/**
		 * 《坐骑》<br/>
		 * 坐骑等级获取坐骑的状态（ 骑乘/骑战/可繁育/成年（二代或变异）类型坐骑不能繁育/当前可繁育/已繁育 ）<br/>
		 * @param curData
		 * @return 
		 * 
		 */		
		public static function getMountStatue( curData:MountInfoData ):String
		{
			var str:String;
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( curData.id );
			if( mountUnitData == null )
				return str;
			
			//坐骑物种数据
			var mountSpeciesData:MountSpeciesData = MountConfigData.getMountSpecieById( mountUnitData.speciesId );
			if( mountSpeciesData == null )
				return str;
			
			//策划要求这个暂时去掉，不需要显示
//			if( curData.mountLevel < mountSpeciesData.requiredLevel )
//				str = LanguageConfig.getText( LangMount.MOUNT_TIP_28, mountSpeciesData.requiredLevel );
//			else if( curData.mountLevel >= mountSpeciesData.requiredLevel && curData.mountLevel < MountMiscData.canRideFightLevel )
//				str = LanguageConfig.getText( LangMount.MOUNT_TIP_29, MountMiscData.canRideFightLevel );
			if( curData.mountLevel >= MountMiscData.canRideFightLevel && curData.mountLevel < MountMiscData.canBreedLevel && mountUnitData.mountType == MountType.BABY )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_30, MountMiscData.canBreedLevel );
			else if( curData.mountLevel >= MountMiscData.canRideFightLevel && mountUnitData.mountType == MountType.ADULT || mountUnitData.mountType == MountType.VARIATION || mountUnitData.mountType == MountType.BREED )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_31 );
			else if( curData.mountLevel >= MountMiscData.canBreedLevel && mountUnitData.mountType == MountType.BABY )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_32 );
			else if( curData.mountLevel >= MountMiscData.canBreedLevel && mountUnitData.mountType == MountType.BABY && curData.isBreed )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_33 );
			
			return str;
		}
		
		/**
		 * 《兽牌》<br/>
		 * 坐骑等级获取坐骑的状态（ 骑乘/骑战/可繁育/成年（二代或变异）类型坐骑不能繁育/当前可繁育/已繁育 ）<br/>
		 * @param curData
		 * @return 
		 * 
		 */		
		public static function getMountBeastCardStatue( curData:MountBeastCardInfo ):String
		{
			var str:String;
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( curData.id );
			if( mountUnitData == null )
				return str;
			
			//坐骑物种数据
			var mountSpeciesData:MountSpeciesData = MountConfigData.getMountSpecieById( mountUnitData.speciesId );
			if( mountSpeciesData == null )
				return str;
			
			//策划要求这个暂时去掉，不需要显示
//			if( curData.mountLevel < mountSpeciesData.requiredLevel )
//				str = LanguageConfig.getText( LangMount.MOUNT_TIP_28, mountSpeciesData.requiredLevel );
//			else if( curData.mountLevel >= mountSpeciesData.requiredLevel && curData.mountLevel < MountMiscData.canRideFightLevel )
//				str = LanguageConfig.getText( LangMount.MOUNT_TIP_29, MountMiscData.canRideFightLevel );
			if( curData.mountLevel >= MountMiscData.canRideFightLevel && curData.mountLevel < MountMiscData.canBreedLevel && mountUnitData.mountType == MountType.BABY )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_30, MountMiscData.canBreedLevel );
			else if( curData.mountLevel >= MountMiscData.canRideFightLevel && mountUnitData.mountType == MountType.ADULT || mountUnitData.mountType == MountType.VARIATION || mountUnitData.mountType == MountType.BREED )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_31 );
			else if( curData.mountLevel >= MountMiscData.canBreedLevel && mountUnitData.mountType == MountType.BABY )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_32 );
			else if( curData.mountLevel >= MountMiscData.canBreedLevel && mountUnitData.mountType == MountType.BABY && curData.isBreed )
				str = LanguageConfig.getText( LangMount.MOUNT_TIP_33 );
			
			return str;
		}
		
		/**
		 * 设置坐骑经验tips 
		 * @param target
		 * @param mountInfoData
		 * 
		 */		
		public static function setMountExpTips( target:DisplayObject, mountInfoData:MountInfoData ):void
		{
			TipTargetManager.remove( target );
			if( mountInfoData == null )
				return;
				
			var upgradeExp:Number = MountConfigData.getMountUpgradeExpByLevel( mountInfoData.mountLevel + 1 );
			var rate:Number = (mountInfoData.exp / upgradeExp) * 100;
			TipTargetManager.show( target, TargetTipsMaker.makeSimpleTextTips( LanguageConfig.getText( LangMount.MOUNT_TIP_64 ), [ mountInfoData.exp, upgradeExp, rate.toFixed(2) ] ) );
		}
		
		/**
		 * 更新坐骑饱食度（饥饿值） 
		 * @param idx 槽位
		 * @param hungerDegrees 新的饥饿值
		 * 
		 */		
		public static function updateMountInfoData( idx:int, hungerDegrees:int ):void
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec == null )
				return;
			
			for each (var mountInfoData:MountInfoData in slotMountVec) 
			{
				if( mountInfoData.idx != idx )
					continue;
				mountInfoData.hungerDegree = hungerDegrees;
				EventManager.dispatchEvent( MountEvent.MOUNT_HUNGER_DEGREE_CHANGED, mountInfoData );
			}
		}
		
		/**
		 * 根据玩家id，获取玩家当前拥有的坐骑槽的数据 
		 * @param playerId 玩家id
		 * @return 
		 * 
		 */			
		public static function getAllSlotMounts( playerId:Number ):Vector.<MountInfoData>
		{
			var atkor:SceneRole = SceneManager.getSceneObjByID( playerId ) as SceneRole;
			if ( atkor == null )
				return null;
			
			var roleData:HeroData = atkor.data as HeroData;
			return roleData.mounModuletData.mountInfoDataVec;
		}
		
		/**
		 * 获取根骨提升加成的百分比
		 * @param vitality
		 * @return 
		 * 
		 */		
		public static function getMountVitalityRateHash( vitality:int ):HashMap
		{
			//当前根骨属性
			//当前坐骑根骨数据
			var curMountVitalitysData:MountVitalityData = MountConfigData.getMountVitalityDataByVitality( vitality );
			if( curMountVitalitysData != null )
			{
				var curStatArr:Array = curMountVitalitysData.stat.getStatValues();
				var mountVitalityHash:HashMap = new HashMap()
				if( curStatArr != null && curStatArr.length > 0 )
				{
					var curStatLen:uint = curStatArr.length;
					if ( curStatLen > 0 )
					{
						for each ( var curStat:StatData in curStatArr )
						{
							var curStatValue:Number = curStat.value ? curStat.value : curStat.percent;
							var curDifference:Number = curStatValue / 100;
							mountVitalityHash.add( curStat.type, curDifference );
						}
					}
				}
			}
			return mountVitalityHash;
		}
		
		/**
		 * 坐骑增加的骑乘速度 
		 * @param hungerDegree 饥饿度
		 * @param mountUnitData 坐骑单元数据
		 * @return 
		 * 
		 */		
		public static function getMountRideMoveSpeed( hungerDegree:int, mountUnitData:MountUnitData ):int
		{
			var rideMoveSpeed:int;
			var speedPercent:int;
			var maxHungerDegreeArr:Array = [];
			var speedPercentArr:Array = [];			
			var mountHungerDegreeVec:Vector.<MountHungerDegreeData> = MountConfigData.mountHungerDegreeVec;
			if( mountHungerDegreeVec != null && mountHungerDegreeVec.length > 0 )
			{
				
				for each (var data:MountHungerDegreeData in mountHungerDegreeVec) 
				{
					maxHungerDegreeArr.push( data.max_hunger_degree );
					speedPercentArr.push( data.speed_percent );
				}
				
				if( maxHungerDegreeArr != null && maxHungerDegreeArr .length > 0 && speedPercentArr != null && speedPercentArr.length >0 )
				{
					if( hungerDegree <= maxHungerDegreeArr[0] )
					{
						speedPercent = speedPercentArr[0];
					}
					else if( hungerDegree  > maxHungerDegreeArr[0] && hungerDegree <= maxHungerDegreeArr[1]  )
					{
						speedPercent = speedPercentArr[1];
					}
					else if( hungerDegree  > maxHungerDegreeArr[1] && hungerDegree <= maxHungerDegreeArr[2]  )
					{
						speedPercent = speedPercentArr[2];
					}
				}
				
				rideMoveSpeed = mountUnitData.rideMoveSpeed * ( speedPercent / 100 );
			}
			return rideMoveSpeed;
		}
		
		/**
		 * 根据坐骑id获取该坐骑强化的时候能增加多少根骨点 
		 * @param id
		 * @return 
		 * 
		 */		
		public static function getAddVitalityExp( id:int ):int
		{
			var addVitalityExp:int;
			var mountUnitData:MountUnitData = MountConfigData.getMountDataById( id );
			if( mountUnitData != null )
			{
				addVitalityExp = mountUnitData.mountRefineAddVitality;
			}
			return addVitalityExp;
		}
		
		//---------------------------------携带、出战、训练、休息等状态------------------------------------------------
		/**
		 * 判断坐骑是否处于携带状态
		 * @param mountInfoData
		 * 
		 */		
		public static function isCarry( mountData:MountInfoData ):Boolean
		{
			var isCarry:Boolean;
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.idx != mountData.idx )//不是该坐骑槽的坐骑
						continue;
					
					if( mountInfoData.isCarry == true )
					{
						isCarry = mountInfoData.isCarry;
						return isCarry;
					}
				}
			}
			return isCarry;
		}
		
		/**
		 * 坐骑是否处于出战状态 
		 * @param mountInfoData
		 * @return 
		 * 
		 */		
		public static function isFighting( mountData:MountInfoData ):Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.idx != mountData.idx )//不是该坐骑槽的坐骑
						continue;
					
					if( mountInfoData.mountStatus == MountStatus.FIGHTING )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 所有的坐骑中，是否有处于出战的坐骑
		 * @return 
		 * 
		 */		
		public static function isHasFighting():Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.mountStatus == MountStatus.FIGHTING )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 获取当前出战状态的坐骑的数据 
		 * @param playerID
		 * @return 
		 * 
		 */		
		public static function getFightingMountInfoData( playerID:Number ):MountInfoData
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			var mountInfoData:MountInfoData;
			if( slotMountVec != null )
			{
				for each ( mountInfoData in slotMountVec) 
				{
					if( mountInfoData.mountStatus == MountStatus.FIGHTING )
						return mountInfoData;
				}
			}
			return mountInfoData;
		}
		
		/**
		 * 坐骑是否处于训练状态 
		 * @param mountInfoData
		 * @return 
		 * 
		 */		
		public static function isTraining( mountData:MountInfoData ):Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.idx != mountData.idx )//不是该坐骑槽的坐骑
						continue;
					
					if( mountInfoData.mountStatus == MountStatus.TRAINING )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否有处于训练状态的坐骑
		 * @return 
		 * 
		 */		
		public static function isHasTraining():Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.mountStatus == MountStatus.TRAINING )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 坐骑是否处于休息状态 （不训练、不出战）
		 * @param mountInfoData
		 * @return 
		 * 
		 */		
		public static function isRest( mountData:MountInfoData ):Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.idx != mountData.idx )//不是该坐骑槽的坐骑
						continue;
					
					if( mountInfoData.mountStatus == MountStatus.REST )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 坐骑是否有处于休息状态 （不训练、不出战）的坐骑
		 * @return 
		 * 
		 */		
		public static function isHasRest():Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.mountStatus == MountStatus.REST )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 坐骑是否有处于骑乘的坐骑
		 * @return 
		 * 
		 */		
		public static function isHasRiding():Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.isRiding )
						return true;
				}
			}
			return false;
		}
		
		/**
		 * 是否达到最大的坐骑训练数 （出战坐骑及训练坐骑最大数量总和为3）
		 * @return 
		 * 
		 */		
		public static function isFullTraining():Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				var trainingNum:uint;//怄气训练数
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.mountStatus == MountStatus.TRAINING || mountInfoData.mountStatus == MountStatus.FIGHTING )
						++ trainingNum;
				}
				return trainingNum >= MountMiscData.canTraningMountCount;
			}
			return false;
		}

		/**
		 * 坐骑采集 
		 * @param objectID
		 * @param collectGoodsType
		 * @param id
		 * 
		 */		
		public static function collectMountItem( objectID:int, name:String ):void
		{
			if( isMaxSlotCount() )
			{
				NoticeManager.showNotify(LangMount.MOUNT_TIP_107);
				return;
			}
			CollectManager.show( LanguageConfig.getText( LangMount.MOUNT_TIP_63 ) + name, 3000, onCollectComplete, [objectID] );
		}
		
		/**
		 * 采集完成 
		 * @param args
		 * 
		 */		
		private static function onCollectComplete( args:* ):void
		{
			var id:int = args[0];
			MountSender.requestCollectMountCollectObj( id );
		}
		
		/**
		 * 判断坐骑是不是未知品种，是否需要鉴定 
		 * @param id 坐骑id
		 * 
		 */		
		public static function isUnidentified( id:int ):Boolean
		{
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null )
			{
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					if( mountInfoData.id != id ) 
						continue;
					
					if( mountInfoData.unidentified == true )//是未知品种，需要鉴定
						return true;
				}
			}
			return false;
		}
		
		/**
		 *  所有已经开启、并且是空的坐骑槽位
		 * 
		 */		
		public static function getMountSlotArr():Array
		{
			var idx:int = -1;
			var allOpenSlotCount:int = MainRoleManager.actorInfo.mountSlotCount;
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			var i:int;
			var slotArr:Array = [];
			var allSlotArr:Array = [];
			
			//有坐骑的坐骑槽
			for ( i = 0; i < slotMountVec.length; i++ ) 
			{
				var mountInfoData:MountInfoData = slotMountVec[i];
				slotArr.push( mountInfoData.idx );
			}
			
			//所有的坐骑槽
			for ( i = 0; i < allOpenSlotCount; i++ ) 
			{
				allSlotArr.push( i );
			}
			
			//剩余的空的坐骑槽
			return arrScreening( slotArr, allSlotArr );
		}
		
		/**
		 * 筛选数组 
		 * @param slotArr
		 * @param allSlotArr
		 * @return 
		 * 
		 */		
		private static function arrScreening( slotArr:Array, allSlotArr:Array ):Array 
		{ 
			var arr:Array = []; 
			var obj:Object = {}; 
			for each( var elem:int in slotArr ) 
			{
				obj[ elem ] = true;
			} 
			
			for each( elem in allSlotArr ) 
			{ 
				if( !obj[ elem ] )
					arr.push( elem );
			} 
			return arr;
		}
		
		/**
		 * 获取坐骑槽第一个空格子下标 
		 * @return 
		 * 
		 */		
		public static function getFirstEmptyMountSlotIdx():int
		{
			var idx:int = -1;
			//剩余的空的坐骑槽
			var residueMountSlotArr:Array = getMountSlotArr();
			idx = residueMountSlotArr[0];
			return idx;
		}
		
		/**
		 * 玩家是否拥有坐骑 
		 * @return 
		 * 
		 */		
		public static function isHasMount():Boolean
		{
			var data:MountInfoData;
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec != null && slotMountVec.length > 0 )
			{
				var trainingNum:uint;//怄气训练数
				for each (var mountInfoData:MountInfoData in slotMountVec) 
				{
					data = mountInfoData;
				}
			}
			
			return data == null ? false : true;
		}
		
		/**
		 *  坐骑槽是否满了
		 * 
		 */		
		public static function isMaxSlotCount():Boolean
		{
			var allOpenSlotCount:int = MainRoleManager.actorInfo.mountSlotCount;
			var slotMountVec:Vector.<MountInfoData> = getAllSlotMounts( MainRoleManager.actorID );
			if( slotMountVec.length > allOpenSlotCount )
				return true;
			return false;
		}
		
		//----------------------------------------以下是一些get  set方法------------------------------------------
		/** 当前选中的坐骑槽index **/
		public static function get curSelectIdx():int
		{
			return _curSelectIdx;
		}

		/**
		 * @private
		 */
		public static function set curSelectIdx(value:int):void
		{
			_curSelectIdx = value;
			MountEquipmentManager.instance.updateMountEquipList();
		}

		/** 当前选中的坐骑槽的数据 **/
		public static function get curSelectData():MountInfoData
		{
			return _curSelectData;
		}

		/**
		 * @private
		 */
		public static function set curSelectData(value:MountInfoData):void
		{
			_curSelectData = value;
		}

		/** 是否是强化的界面 **/
		public static function get isIntensifyTab():Boolean
		{
			return _isIntensifyTab;
		}

		/**
		 * @private
		 */
		public static function set isIntensifyTab(value:Boolean):void
		{
			_isIntensifyTab = value;
		}

		/** 繁育邀请过期时间 **/
		public static function get inviteExpireTime():Number
		{
			return _inviteExpireTime;
		}

		/**
		 * @private
		 */
		public static function set inviteExpireTime(value:Number):void
		{
			_inviteExpireTime = value;
		}

		/** 坐骑繁育时长 **/
		public static function get mountBreedTime():Number
		{
			return _mountBreedTime;
		}

		/**
		 * @private
		 */
		public static function set mountBreedTime(value:Number):void
		{
			_mountBreedTime = value;
		}

		/** 是否是鉴定的界面 **/
		public static function get isJianDingPanel():Boolean
		{
			return _isJianDingPanel;
		}

		/**
		 * @private
		 */
		public static function set isJianDingPanel(value:Boolean):void
		{
			_isJianDingPanel = value;
		}

		/** 是否是转化的界面 **/
		public static function get isChangePanel():Boolean
		{
			return _isChangePanel;
		}

		/**
		 * @private
		 */
		public static function set isChangePanel(value:Boolean):void
		{
			_isChangePanel = value;
		}

		/** 是否是繁育的界面 **/
		public static function get isBreedPanel():Boolean
		{
			return _isBreedPanel;
		}

		/**
		 * @private
		 */
		public static function set isBreedPanel(value:Boolean):void
		{
			_isBreedPanel = value;
		}


	}
}