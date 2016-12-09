package com.rpgGame.app.manager.yunBiao
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.rpgGame.app.cmdlistener.enum.EmQuality;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.MainRoleSearchPathManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.YunBiaoSender;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.ui.alert.GameAlert;
	import com.rpgGame.core.events.YunBiaoEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.cfg.biao.BiaoPersonData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.npc.NpcCfgData;
	import com.rpgGame.coreData.info.alert.AlertSetInfo;
	import com.rpgGame.coreData.info.task.PrizeInfo;
	import com.rpgGame.coreData.lang.LangAlertInfo;
	import com.rpgGame.coreData.lang.LangYunBiao;
	import com.rpgGame.coreData.role.BiaoCheData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.AmountType;
	import app.message.BiaoResProto;
	import app.message.MonsterDataProto;
	import app.message.NpcDialogProto.NpcType;
	
	import gs.TweenLite;
	
	import org.client.mainCore.ds.HashMap;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 运镖管理器 
	 * @author 陈鹉光
	 * 
	 */	
	public class YunBiaoManager
	{
		/** 个人运镖 **/
		public static const GE_REN_YUN_BIAO:int = 0;
		/** 帮会运镖 **/
		public static const GUILD_YUN_BIAO:int = 1;
		/** 国家运镖 **/
		public static const COUNTRY_YUN_BIAO:int = 2;
		/** 个人贡献 **/
		public static const PERSONAL_CONTRIBUTE:int = 25;
		/** 个人镖车状态 **/
		private static var _geRenBiaoChe:GeRenBiaoCheState = new GeRenBiaoCheState();
		/** 帮会镖车状态 **/
		private static var _guildBiaoChe:GuildBiaoCheState = new GuildBiaoCheState();
		/** 国家任务镖车状态 **/
		private static var _countryBiaoChe:CountryBiaoCheState = new CountryBiaoCheState();
		/** 镖车可以被攻击的最小等级 **/
		private static var _unbreakMaxLevel:int;
		/** 个人运镖奖励道具id **/
		private static var _countryAwardGoodsId:int;
		/** 是否有镖车任务 **/
		public static var hasBiao:Boolean;
		/** 下次刷新时间 **/
		public static var refreshBiaoNextTime:Number=0;
		/** 品质 **/
		private static var _biaoQuality:int;
		/** 运镖刷新品质倒计时是否结束 **/
		private static var _isEnd:Boolean = true;
		/**是否开启国运**/
		public static var isCountryYunBiao : Boolean;
		/** 镖车时长 **/
		private static var _biaoExpireDuration:Number;
		/** 是否是第一次进入场景 **/
		private static var _isFirstEnterScene : Boolean = true;
		/** 下一个需要验镖的npc的下标 **/
		private static var _nextIndex:int;
		/** 新的运镖次数 **/
		public static var newBiaoCountint:int;
		/** 镖车的场景 **/
		public static var biaoSceneId:int;
		/** 接镖车任务的时候，镖车的移动速度 **/
		public static var moveSpeed:int;
		/** 是否在镖车上（镖车破损的时候，保存镖车破损前的上下镖车状态） **/
		public static var isInBiao:Boolean;
		/** 其他玩家的镖车数据（不是自己的） **/
		public static var _otherBiaoCheHashMap:HashMap = new HashMap();
		/** 镖车是否在跟随中 **/
		public static var isFollowimg:Boolean;
		/** 镖车停止的点 **/
		public static var point:Point = new Point();
		/** 镖车是否安全 **/
		private static var _isSafety:Boolean;
		/** 镖车破损次数 **/
		private static var _brokenCount:int;
		/** 刷新镖车的npc刷新次数数据 **/
		public static var refreshCountMap:HashMap = new HashMap();
		/** 王城军需官刷新镖车品质的次数 **/
		public static var refleshWangNpcCount:int;
		/** 阳平关军需官刷新镖车品质的次数 **/
		public static var refleshYangNpcCount:int;
		/** 是否远离镖车 **/
		private static var _isYuanLi:Boolean;
		/**伤害消息延迟删除 数据类型:TweenLite*/
		private static var _biaoCheHurtDelayList : Array = [];
		/**保留时间 秒*/
		private static const HOLE_TIME : int = 10;
		
		/**
		 * 设置上下镖车伪装（异步检测）
		 * @param sceneRole 场景角色
		 * @param isAddBiao 是不是视野里面出现了一台镖车（true），不是的话就是玩家进入场景（false）
		 * @param isInBiao 场景角色是否在镖车上
		 * 
		 */		
		public static function setCamouflageEntity( sceneRole:SceneRole, isAddBiao:Boolean, isInBiao:Boolean ):void
		{
			////处理方式:如果玩家进入场景,发现自己在镖车上面,这时候寻找视野内的我的镖车,如果没有找到,不处理
			////如果找到了,将玩家的位置同步到镖车的位置上去
			////如果视野里面出现了一台镖车,找场景里面拥有该镖车的玩家,找到后,如果发现该该玩家在场景中,并且状态是上镖中
			////则同步玩家位置到镖车的位置上去
			var biaoSceneRole:SceneRole;
			var heroData:HeroData;
			var selfId:Number = MainRoleManager.actorID;
			var biaoche:BiaoCheData;
			if( !isAddBiao && isInBiao )//玩家进入场景
			{
				heroData = sceneRole.data as HeroData;
				if( heroData == null )
					return;
				
				if( _otherBiaoCheHashMap != null && _otherBiaoCheHashMap.length > 0 )
				{
					biaoche = _otherBiaoCheHashMap.getValue( heroData.id );
					heroData.biaoCheData = _otherBiaoCheHashMap.getValue( heroData.id );
				}
				
				if( heroData.biaoCheData != null )
				{
					biaoSceneRole = SceneManager.getSceneObjByID( heroData.biaoCheData.id ) as SceneRole;
					if( biaoSceneRole != null )
						sceneRole.setCamouflageEntity( biaoSceneRole );
				}
				if( heroData.id == selfId )//是自己
				{
					var selfBiaoData:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
					if( selfBiaoData != null )
						selfBiaoData.isInBiao = isInBiao;
				}
				else
				{
					if( heroData.biaoCheData != null )
					{
						heroData.biaoCheData.isInBiao = isInBiao;
						if( _otherBiaoCheHashMap != null && _otherBiaoCheHashMap.length > 0 )
						{
							biaoche = _otherBiaoCheHashMap.getValue( heroData.id );
							heroData.biaoCheData = _otherBiaoCheHashMap.getValue( heroData.id );
						}
					}
				}
			}
			else if( !isAddBiao && !isInBiao )//玩家进入视野，不在镖车上
			{
				sceneRole.setCamouflageEntity( null );
			}
			else if( isAddBiao && !sceneRole )//视野出现一台镖车，找不到拥有该镖车的玩家（该玩家为空）
			{
				trace( "找不到该镖车拥有者，不处理！！！！" );
			}
			else if( isAddBiao && sceneRole )//视野出现一台镖车，找到拥有该镖车的玩家（该玩家不为空）
			{
				heroData = sceneRole.data as HeroData;
				if( heroData == null )
					return;
				
				if( heroData.id == selfId )//是自己
				{
					heroData.biaoCheData = MainRoleManager.actorInfo.biaoCheData;
				}
				else
				{
					if( _otherBiaoCheHashMap != null && _otherBiaoCheHashMap.length > 0 )
					{
						biaoche = _otherBiaoCheHashMap.getValue( heroData.id );
						heroData.biaoCheData = _otherBiaoCheHashMap.getValue( heroData.id );
					}
				}
				
				if( isInBiao )//该玩家在镖车上
				{
					if( heroData.biaoCheData != null )
					{
						biaoSceneRole = SceneManager.getSceneObjByID( heroData.biaoCheData.id ) as SceneRole;
						if( biaoSceneRole != null )
							sceneRole.setCamouflageEntity( biaoSceneRole );
					}
				}
				else
				{
					sceneRole.setCamouflageEntity( null );
				}
			}
			
			var camouflageEntity:SceneRole = sceneRole.getCamouflageEntity() as SceneRole;
			if(camouflageEntity)//处理伪装者的剩余路径
			{
				if(sceneRole.stateMachine.isWalkMoving)
				{
					var reference:WalkMoveStateReference=sceneRole.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
					if(reference && reference.endPos)
					{
						RoleStateUtil.walkToPos(camouflageEntity,reference.endPos,200);
					}
					sceneRole.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
					if (sceneRole.stateMachine.isPrewarWaiting)
						sceneRole.stateMachine.transition(RoleStateType.ACTION_PREWAR);
					else
						sceneRole.stateMachine.transition(RoleStateType.ACTION_IDLE);
				}
			}
		}
		
		/**
		 * 保存视野中其他玩家镖车数据 
		 * @param data
		 * 
		 */		
		public static function setOtherBiaoCheData( data:BiaoCheData ):void
		{
			var biaoCheData:BiaoCheData = _otherBiaoCheHashMap.getValue( data.ownerID );
			if( biaoCheData == null )
				_otherBiaoCheHashMap.add( data.ownerID, data );
		}
		
		/**
		 * 下一次刷新镖车的时间 
		 * @return 
		 * 
		 */		
		public static function lastNextRefreshTime():Number
		{
			if(BiaoCfgData.miscData)
				return BiaoCfgData.miscData.npc_refreh_duration;
			else
				return 0;
		}
		
		/**
		 * 是不是接受运镖的npc 
		 * @param npcModelId
		 * 
		 */		
		public static function isAcceptBiaoNpc( npcModelId:int ):Boolean
		{
			return NpcCfgData.isFunctionType(npcModelId, NpcType.ACCEPT_BIAO) || NpcCfgData.isFunctionType(npcModelId, NpcType.ACCEPT_INVINCIBLE_BIAO);
		}
		
		/**
		 * 是不是王城、或阳平关刷新镖车的npc 
		 * @param npcModelId
		 * @return 
		 * 
		 */		
		public static function isRefleshNpc( npcModelId:Number ):Boolean
		{
			return NpcCfgData.isFunctionType(npcModelId, NpcType.REFRESH_BIAO);
		}
		
		/**
		 * 是不是交镖的npc 
		 * @param npcModelId
		 * @return 
		 * 
		 */		
		public static function isCompleteNpc( npcModelId:Number ):Boolean
		{
			return NpcCfgData.isFunctionType(npcModelId, NpcType.COMPLETE_BIAO);
		}
		
		/**
		 * 是不是阳平关刷新镖车的npc 
		 * @param npcId
		 * @return 
		 * 
		 */		
		public static function isRefleshYangNpc( npcId:Number ):Boolean
		{
			var npcModelId:int = SceneManager.getSceneNpcModelId(npcId); 
			return ( BiaoCfgData.refleshYangNpc == npcModelId );
		}
		
		/**
		 * 是不是王城刷新镖车的npc 
		 * @param npcId
		 * @return 
		 * 
		 */		
		public static function isRefleshWangNpc( npcId:Number ):Boolean
		{
			var npcModelId:int = SceneManager.getSceneNpcModelId(npcId);
			return ( BiaoCfgData.refleshWangNpc == npcModelId );
		}
		
		/**
		 * 是否达到每天接镖最大次数 
		 * @return 
		 * 
		 */		
		public static function get isMaxCount():Boolean
		{
			return MainRoleManager.actorInfo.biaoTimes >= BiaoCfgData.miscData.can_acess_per_day;
		}
		
		/**
		 * 开启国家运镖 
		 * 
		 */		
		public static function openCountryYunBiao():void
		{
//			var country : CountryData = CountryManager.selfCountryData;
//			if(!country)
//				return;
//			if(country.strategy.isTodayStartGuoYun)
//			{
//				NoticeManager.showNotify("已经开启了国家运镖");
//				return;
//			}
//			CountrySender.onStartGuoYun();
		}
		
		/**
		 * 开启国家运镖完成 
		 * @param countryId
		 * 
		 */		
		public static function openCountryYunBiaoComplete(countryId : int):void
		{
//			var country : CountryData = CountryManager.selfCountryData;
//			if(!country)
//				return;
//			country.strategy.isTodayStartGuoYun = true;
//			country.strategy.guoYunEndTime = SystemTimeManager.curtTm + BiaoCfgData.miscData.guo_yun_duration;
//			EventManager.dispatchEvent(CrownEvent.NEI_ZHEN_CHANGE);
//			NoticeManager.systemSwitchNotify(CountryManager.getCountryName(countryId)+"开启了王帮托运");
//			if(countryId == MainRoleManager.actorInfo.countryId)
//			{
//				var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.openCountryYunBiaoComplete);
//				GameAlert.showAlert(alertSet,clickCallBack);
//			}
		}
		
		private static function clickCallBack(gameAlert:GameAlert):void
		{
			
		}
		
		/**
		 * 开始运镖 
		 * 
		 */		
		public static function onGameStartYunBiao():void
		{
			if(!_isFirstEnterScene)
				return;
			_isFirstEnterScene = false;
//			var country : CountryData = CountryManager.selfCountryData;
//			if(!country)
//				return;
//			if(!country.strategy.isTodayStartGuoYun)
//				return;
//			if(country.strategy.guoYunEndTime > SystemTimeManager.curtTm)
//				openCountryYunBiaoComplete(MainRoleManager.actorInfo.countryId);
		}
		
		/**
		 * 传送到托运npc处 
		 * 
		 */		
		private static function onTransNpc():void
		{
			var monsterdata:MonsterDataProto=MonsterDataManager.getData(BiaoCfgData.countryTuoYunNpc);
			var pos : Point = MonsterDataManager.getMonsterPosition(monsterdata);
			MainRoleSearchPathManager.walkToScene(MonsterDataManager.getMonsterSceneId(BiaoCfgData.countryTuoYunNpc), pos.x, pos.y, null, 200);
		}
		
//		/**
//		 * 刷新镖车成功
//		 * @param nextTime 下次刷新时间
//		 * 
//		 */		
//		public static function yunBiaoNextTime( nextTime:Number ):void
//		{
//			refreshBiaoNextTime = nextTime;
//			var cdTime:int = YunBiaoManager.lastNextRefreshTime() / 1000;
//			trace( "下一轮镖车刷新的时间：" + cdTime );
////			//偷经倒计时等待面板
////			AppManager.showApp( AppConstant.YUN_BIAO_CDPANEL );
//		}
		
		/**
		 * 品质变更了，变更场景中对象的外观 
		 * @param biaoDa 镖车数据
		 * @param quality 品质
		 * @param id 镖车id
		 * 
		 */		
		public static function yunBiaoSucceed( quality:int, id:Number ):void
		{
			biaoQuality = quality;
			var role:SceneRole = SceneManager.getSceneObjByID(id) as SceneRole;
			if ( role != null )
			{
				var roleData:BiaoCheData = role.data as BiaoCheData;
				if( roleData != null )
				{
					roleData.quality = quality;
					var data:BiaoPersonData = BiaoCfgData.getPersonalDataAtLevel( roleData.level );
					if( data != null )
					{
						var biaoRes:BiaoResProto = roleData.isBroken ? data.broken_biao_res : data.normal_biao_res;
						if( biaoRes != null )
						{
							var path:String = biaoRes.res[quality];
							SceneRoleManager.getInstance().updateBiaoche( role, path );
							
							//是自己的镖车，追踪栏才更新信息
							var myBiaoData:BiaoCheData = MainRoleManager.actorInfo.biaoCheData;
							if( myBiaoData != null )
							{
								if( myBiaoData.id == roleData.id )
								{
									//获取镖车品质提示
									getBiaoQuality( quality );
									EventManager.dispatchEvent( YunBiaoEvent.UPDATE_QUALITY_SUCCESS );
								}
							}
							EventManager.dispatchEvent( YunBiaoEvent.UPDATE_BIAOCHE_NAME, roleData );
						}
					}
				}
			}
		}
		
		/**
		 * 获取镖车品质提示
		 * @param quality 镖车品质[ 0：白色, 1：绿, 2：蓝, 3：紫, 4：橙 ]
		 * 
		 */			
		public static function getBiaoQuality( quality:int ):void
		{
			switch( quality )
			{
				case EmQuality.QUALITY_WHITE:
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CMDLISTENER_19 );
					break;
				case EmQuality.QUALITY_GREEN:
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CMDLISTENER_20 );
					break;
				case EmQuality.QUALITY_BLUE:
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CMDLISTENER_21 );
					break;
				case EmQuality.QUALITY_PURPLE:
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CMDLISTENER_22 );
					break;
				case EmQuality.QUALITY_ORANGE:
					NoticeManager.showNotify( LangYunBiao.YUN_BIAO_CMDLISTENER_23 );
					break;
			}
		}
		
		/**
		 * 无敌镖车被攻击，攻击者、受攻击者显示一个特效 （只有无敌镖车才有特效）
		 * @param atkor 场景角色
		 * @param attackerId 攻击者id
		 * @param hurter 受攻击者
		 * @param hurtType 伤害类型
		 * @param hurtAmount 伤害值
		 * 
		 */		
		public static function showInvivcibleBiaoEffect( atkor:SceneRole, attackerId:Number, hurter:SceneRole, hurtType:uint, hurtAmount:int ):void
		{
			if (attackerId != 0)
				atkor = SceneManager.getSceneObjByID(attackerId) as SceneRole;
			
			if (hurter == null)
				return;
			
			var selfData:HeroData = MainRoleManager.actorInfo;
			if( hurter.type == SceneCharType.BIAO_CHE )//必须是镖车
			{
				var biaoCheData:BiaoCheData = hurter.data as BiaoCheData;
				if (biaoCheData == null)
					return;
				
				if( biaoCheData.isInvivcibleBiao )//是无敌镖车
				{
					if( atkor.id == selfData.id || biaoCheData.ownerID == selfData.id )
					{
						SpellAnimationHelper.addTargetEffect( hurter, RenderUnitID.WU_DI_BIAO_CHE, RenderUnitType.SCRIPTURES, EffectUrl.WU_DI_BIAO_CHE_EFFECT );
					}
				}
			}
		}
		
		/**
		 * 镖车各个品质的奖励tips 
		 * @param prizeVect
		 * @return 
		 * 
		 */		
		public static function getAcceptBiaoPrizeInfoTips( prizeVect:Vector.<PrizeInfo> ):String
		{
			var str:String = "";
			if( prizeVect == null || prizeVect.length <= 0 )
				return str;
			
			var expValue:int;
			var prizeInfo:PrizeInfo;
			
			for (var i:int = 0; i < prizeVect.length; i++) 
			{
				prizeInfo = prizeVect[i];
				
				expValue = prizeInfo.moneyAmount.getAmountByType(AmountType.EXP);
//				if( CountryManager.isInGuoYun )
//					prizeInfo.moneyAmount.setSomeType(AmountType.EXP,expValue * BiaoCfgData.miscData.guo_yun_exp_additional);
				switch(i)
				{
					case EmQuality.QUALITY_WHITE://白
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_WHITE ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case EmQuality.QUALITY_GREEN://绿
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_GREEN, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_GREEN ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case EmQuality.QUALITY_BLUE://蓝
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_BLUE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_BLUE ) ) +HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case EmQuality.QUALITY_PURPLE://紫
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_PURPLE, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_PURPLE ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "<br/>");
						break;
					case EmQuality.QUALITY_ORANGE://橙
						if( expValue > 0 )
							str += HtmlTextUtil.getTextColor( StaticValue.Q_YELLOW, LanguageConfig.getText( LangYunBiao.YUN_BIAO_Q_YELLOW ) ) + HtmlTextUtil.getTextColor( StaticValue.Q_WHITE, expValue + "" );
						break;
					default:
						break;
				}
			}
			return str;
		}
		
		/**
		 * 设置运镖npc刷新数据 
		 * @param byte
		 * 
		 */		
		public static function setYunBiaoNpcRefreshCount( byte:ByteBuffer ):void
		{
			if( byte.bytesAvailable <= 0 )
			{
				setBiaoRefreshCount();
			}
			else
			{
				var allCount:int = BiaoCfgData.miscData.per_npc_max_can_refresh_times;
				while (byte.bytesAvailable > 0)
				{
					var npcId:int = byte.readVarint32();
					var refreshCount:int = byte.readVarint32();
					if( BiaoCfgData.refleshWangNpc == npcId )
					{
						refleshWangNpcCount = ( allCount - refreshCount );
						refreshCountMap.add( npcId, refleshWangNpcCount );
					}
					
					if( BiaoCfgData.refleshYangNpc == npcId )
					{
						refleshYangNpcCount = ( allCount - refreshCount );
						refreshCountMap.add( npcId, refleshYangNpcCount );					
					}
				}
				
				var arr:Array = refreshCountMap.keys();
				if( arr != null && arr.length > 0 )
				{
					if( arr.indexOf( BiaoCfgData.refleshWangNpc ) == -1 )
					{
						refleshWangNpcCount = allCount;
						refreshCountMap.add( BiaoCfgData.refleshYangNpc, allCount );
					}
					
					if( arr.indexOf( BiaoCfgData.refleshYangNpc ) == -1 )
					{
						refleshYangNpcCount = allCount;
						refreshCountMap.add( BiaoCfgData.refleshYangNpc, allCount );
					}
				}
			}
		}
		
		/**
		 * 接受运镖的时候，设置运镖npc刷新镖车次数的数据 
		 * 
		 */		
		public static function setBiaoRefreshCount():void
		{
			refleshWangNpcCount = BiaoCfgData.miscData.per_npc_max_can_refresh_times;
			refleshYangNpcCount = BiaoCfgData.miscData.per_npc_max_can_refresh_times;
			
			refreshCountMap.add( BiaoCfgData.refleshWangNpc, refleshWangNpcCount );
			refreshCountMap.add( BiaoCfgData.refleshYangNpc, refleshYangNpcCount );
		}
		
		/**
		 * 更新npc刷新次数的数据 
		 * @param npcId
		 * 
		 */		
		public static function updateBiaoRefreshCount( npcId:int ):void
		{
			var keyArr:Array = refreshCountMap.keys();
			if( keyArr == null || keyArr.length <= 0 )
				return;
			
			var newCount:int;
			for (var i:int = 0; i < keyArr.length; i++) 
			{
				if( npcId == keyArr[i] )
				{
					if( BiaoCfgData.refleshWangNpc == npcId )
					{
						refleshWangNpcCount--;
						refreshCountMap.add( npcId, refleshWangNpcCount );
					}
					
					if( BiaoCfgData.refleshYangNpc == npcId )
					{
						refleshYangNpcCount--;
						refreshCountMap.add( npcId, refleshYangNpcCount );					
					}
				}
			}
		}
		
		/**
		 * 设置镖车的名字颜色显示规则
		 * <br/><br/>第一行：
		 * <br/>自己的镖车显示蓝色，
		 * <br/>本国（盟国）的镖车显示绿色，
		 * <br/>敌国的镖车显示为红色（暗红），
		 * <br/>国的破损镖车显示为红色（亮红）。
		 		 * <br/><br/>第二行：
		 * <br/>自己本国（盟国）的镖车显示为白色
		 * <br/>敌国的镖车显示为红色（暗红），
		 * <br/>敌国的破损镖车显示为红色（亮红）。
		 * @param role 场景角色
		 * @return
		 *
		 */
		public static function setBiaoName(role : SceneRole) : String
		{
			var nameString : String = "";
			if (role == null)
				return nameString;
			
			var biaoData : BiaoCheData = role.data as BiaoCheData;
			if (biaoData == null)
				return nameString;
			
			return getBiaoCheName(biaoData);
		}
		
		/**
		 * 获取镖车的名字
		 * @param data
		 *
		 */
		private static function getBiaoCheName(biaoData : BiaoCheData) : String
		{
			if (!biaoData.isBroken) //非破损镖车
			{
				var ownerNameColor : String = ""; //镖车归属者的名字
				var biaoNameColor : String = ""; //镖车名字
				var color : uint;
				
				//自己的数据
				var selfData : HeroData = MainRoleManager.actorInfo;
//				if (!CountryManager.isAtEnemyCountry()) //本国镖车
//				{
//					if (biaoData.ownerID == selfData.id) //镖车归属者的名字，自己的镖车名字是蓝色，别人的是绿色
//						ownerNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_17, biaoData.ownerName + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_9) + "<br/>");
//					else
//						ownerNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_16, biaoData.ownerName + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_9) + "<br/>");
//					color = StaticValue.COLOR_CODE_1;
//				}
//				else
//				{
//					//敌国镖车
//					ownerNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_13, biaoData.ownerName + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_9) + "<br/>");
//					color = StaticValue.COLOR_CODE_13;
//				}
				
				
				//策划说镖车头顶的名字不根据镖车的品质走
				switch (biaoData.quality)
				{
					case EmQuality.QUALITY_WHITE: //白色
						biaoNameColor = HtmlTextUtil.getTextColor(color, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_1));
						break;
					case EmQuality.QUALITY_GREEN: //绿色
						biaoNameColor = HtmlTextUtil.getTextColor(color, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_2));
						break;
					case EmQuality.QUALITY_BLUE: //蓝色
						biaoNameColor = HtmlTextUtil.getTextColor(color, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_3));
						break;
					case EmQuality.QUALITY_PURPLE: //紫色
						biaoNameColor = HtmlTextUtil.getTextColor(color, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_4));
						break;
					case EmQuality.QUALITY_ORANGE: //橙色
						biaoNameColor = HtmlTextUtil.getTextColor(color, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_5));
						break;
				}
			}
			else
			{
				//破损镖车 亮红色
				ownerNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_12, biaoData.ownerName + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_9) + "<br/>");
				switch (biaoData.quality)
				{
					case EmQuality.QUALITY_WHITE: //白色
						biaoNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_12, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_1_1));
						break;
					case EmQuality.QUALITY_GREEN: //绿色
						biaoNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_12, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_2_1));
						break;
					case EmQuality.QUALITY_BLUE: //蓝色
						biaoNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_12, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_3_1));
						break;
					case EmQuality.QUALITY_PURPLE: //紫色
						biaoNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_12, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_4_1));
						break;
					case EmQuality.QUALITY_ORANGE: //橙色
						biaoNameColor = HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_12, biaoData.level + LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_5_1));
						break;
				}
			}
			return ownerNameColor + biaoNameColor;
		}
		
		/**
		 * 获取文字
		 * @return
		 *
		 */
		private function get biaoString() : String
		{
			return LanguageConfig.getText(LangYunBiao.YUN_BIAO_NAME_9);
		}
		
		/**
		 * 零点重置
		 *
		 */
		public static function resetDaily() : void
		{
			MainRoleManager.actorInfo.biaoTimes = 0;
		}
		
		/**
		 * 镖车伤害状态
		 * @param biaoche
		 * 
		 */		
		public static function setBiaoHurtState( biaoche : RoleData ):void
		{
			var tweenLite : TweenLite = TweenLite.delayedCall(HOLE_TIME, removeHurtInfo);
			_biaoCheHurtDelayList.push( tweenLite );
		}
		
		/**
		 * 移除一个镖车伤害信息
		 * @param biaoche
		 *
		 */
		public static function removeHurtInfo() : void
		{
			if (!_biaoCheHurtDelayList)
				return;
			_biaoCheHurtDelayList.shift();
			if( _biaoCheHurtDelayList == null || _biaoCheHurtDelayList.length <= 0 )
			{
				EventManager.dispatchEvent( YunBiaoEvent.BIAO_LIFE_UPDATE_NOT, true );
			}
		}
		
		/**镖车可以被攻击的最小等级*/
		public static function get canBeAttackedMinLevel():int
		{
			return _unbreakMaxLevel;
		}
		
		public function YunBiaoManager()
		{
		}
		
		public static function onDailyClean() : void
		{
			YunBiaoManager.setYunBiaoTimes(YunBiaoManager.GE_REN_YUN_BIAO, 0);
			YunBiaoManager.setYunBiaoTimes(YunBiaoManager.GUILD_YUN_BIAO, 0);
		}
		
/*		public static function getHelpList() : Vector.<GeRenYunBiaoHelpInfo>
		{
			return _geRenBiaoChe.getHelpList();
		}*/
		
		public static function addHelpInfo($heroName:String, $heroId:Number, $sceneId:int, $globalId:int, $biaoCheType:int) : void
		{
			_geRenBiaoChe.addHelpInfo($heroName, $heroId, $sceneId, $globalId);
		}

		
		public static function getPrizeCount($quality:int) : int
		{
			return _geRenBiaoChe.getPrizeCount($quality);
		}
		
		public static function get guildYunBiaoGetNpcId() : int
		{
			return _guildBiaoChe.getNpcId;
		}
		
		public static function isGuildYunbiaoSubmitNpcId($npcId:int) : Boolean
		{
			return _guildBiaoChe._guildYunBiaoSubmitNpcId.indexOf($npcId) != -1;
		}
		
		public static function onCheckYunBiaoSuccess() : void
		{
			_geRenBiaoChe.checkPoint ++;
			EventManager.dispatchEvent(YunBiaoEvent.CHECK_YUN_BIAO_SUCCESS);
		}
		
		public static function setGuoYunStartTime($yunBiaoStartTime:Number, $countryId:int) : void
		{
			_geRenBiaoChe.setGuoYunStartTime($yunBiaoStartTime, $countryId);
		}

		public static function getGuoYunStartTime($countryId:int) : Number
		{
			var ret:Number = _geRenBiaoChe._arrGuoYunStartTime[$countryId];
			if (0 != ret)
				return ret;

/*			var timeTonightNine:Number = TimeUtil.getTodayTime(SystemTimeManager.curtTm, guoYunConfigEndTime);
			if (SystemTimeManager.curtTm >= timeTonightNine)
			{
				ret = timeTonightNine;
			}*/

			return ret;
		}

		public static function setYunBiaoTimes($type:int, $yunBiaoTimes:int) : void
		{
			switch ($type)
			{
				case 0:
					_geRenBiaoChe.yunBiaoTimes = $yunBiaoTimes;
					break;
				case 1:
					_guildBiaoChe.yunBiaoTimes = $yunBiaoTimes;
					break;
			}
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}

		private static function onGuildYunBiaoTimeOut() : void
		{
			var alertSet : AlertSetInfo = new AlertSetInfo(LangAlertInfo.onGuildYunBiaoTimeOut);
			GameAlert.showAlert(alertSet);
			_guildBiaoChe.destoryFinishTimer();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}

		/**
		 * 设置镖车信息 
		 * @param $yunBiaoInfo 镖车信息
		 */		
		public static function onRequestYunbiaoSucceed($yunBiaoInfo:*, $addTimes:Boolean) : void
		{
			var biaoCheType:int = 0;
			if ($yunBiaoInfo.hasBiaoCheType)
			{
				biaoCheType = $yunBiaoInfo.biaoCheType;
			}
			switch (biaoCheType)
			{
				case GE_REN_YUN_BIAO:
					_geRenBiaoChe.onRequestYunbiaoSucceed($yunBiaoInfo, $addTimes);
/*					if ($addTimes)
					{
						TweenLite.delayedCall(3, AppManager.hideApp, [AppConstant.YUN_BIAO_CHECK_NPC_DIALOG_PANEL]);
						TweenLite.delayedCall(3, AppManager.showAppNoHide, [AppConstant.YUN_BIAO_NPC_DIALOG_PANEL]);
						var yaJin:int = getYaJin(MainRoleManager.actorInfo.lv);
						NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_6, yaJin);
					}*/
					EventManager.dispatchEvent(YunBiaoEvent.UPDATE_BIAO_CHE_STATE);
					EventManager.dispatchEvent(YunBiaoEvent.UPDATE_QUALITY_SUCCESS);
					break;
				case GUILD_YUN_BIAO:
					_guildBiaoChe.onRequestYunbiaoSucceed($yunBiaoInfo, $addTimes);
					EventManager.dispatchEvent(YunBiaoEvent.UPDATE_GUILD_BIAO_CHE_STATE);
					break;
				case COUNTRY_YUN_BIAO:
					_countryBiaoChe.onRequestYunbiaoSucceed($yunBiaoInfo, $addTimes);
/*					if ($addTimes)
					{
						TweenLite.delayedCall(3, AppManager.hideApp, [AppConstant.COUNTRY_YUN_BIAO_PANEL]);
					}*/
					EventManager.dispatchEvent(YunBiaoEvent.COUNTRY_UPDATE_BIAO_CHE_STATE);
					EventManager.dispatchEvent(YunBiaoEvent.COUNTRY_UPDATE_QUALITY_SUCCESS);
					break;
			}

			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}
		
		public static function updateHuBiaoInfo() : void
		{
			_geRenBiaoChe.updateHuBiaoInfo();
		}
		
		/**
		 * 获取剩余的运镖次数 
		 * @author 康露 2014年12月27日
		 */
		public static function getLeftTimes($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.getLeftTimes();
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.getLeftTimes();
			}
			return 0;
		}
		
		public static function getTotalTimes($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.getTotalTimes();
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.getTotalTimes();
			}
			return 0;
		}

		/**
		 * 获取当前运镖结束的时间 
		 * @return 返回当前运镖结束的时间
		 */
		public static function getYunBiaoLimitTime($type:int) : Number
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.limitTime;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.limitTime;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.limitTime;
			}
			return 0;
		}
		
		/**
		 * 是否正在运镖中 
		 * @return 返回是否正在运镖中
		 */
		public static function isInYunBiao($type:int) : Boolean
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return SystemTimeManager.curtTm <= _geRenBiaoChe.limitTime;
				case GUILD_YUN_BIAO:
					return SystemTimeManager.curtTm <= _guildBiaoChe.limitTime;
				case COUNTRY_YUN_BIAO:
					return SystemTimeManager.curtTm <= _countryBiaoChe.limitTime;
			}
			return false;
		}

		/**
		 * 是否在任意一种运镖中
		 * @return 
		 * 
		 */
		public static function isInYunBiaoAnyType():Boolean
		{
			return (isInYunBiao(GE_REN_YUN_BIAO) || isInYunBiao(GUILD_YUN_BIAO) || isInYunBiao(COUNTRY_YUN_BIAO));
		}
		
		/**
		 * 获取镖车品质 
		 * @return 返回镖车品质
		 */
		public static function getQuality($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.quality;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.quality;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.quality;
			}
			return 0;
		}

		public static function getLifePercentage($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
				{
					return _geRenBiaoChe.lifePercentage;
				}
				case GUILD_YUN_BIAO:
				{
					return _guildBiaoChe.lifePercentage;
				}
				case COUNTRY_YUN_BIAO:
				{
					return _countryBiaoChe.lifePercentage;
				}
			}
			return 0;
		}

		public static function updateLifePercentage($type:int, $value:int) : void
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
				{
					_geRenBiaoChe.lifePercentage = $value;
					_geRenBiaoChe.setBiaoCheHitted();
					break;
				}
				case GUILD_YUN_BIAO:
				{
					_guildBiaoChe.lifePercentage = $value;
					_guildBiaoChe.setBiaoCheHitted();
					break;
				}
				case COUNTRY_YUN_BIAO:
				{
					_countryBiaoChe.lifePercentage = $value;
					_countryBiaoChe.setBiaoCheHitted();
					break;
				}
			}
			
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_LIFE);
		}
		
		public static function updateBiaoCheQuality($sceneChar:SceneRole, $quality:int) : void
		{
			if($sceneChar == null || $sceneChar.avatar == null)return;
			var arr:Array = $sceneChar.avatar.getRenderUnitsByType(RenderUnitType.WEAPON);
			if(arr && arr.length > 0)
			{
				var ru:RenderUnit3D = arr[0];
				switch ($quality)
				{
					case StaticValue.Q_WHITE://白
						break;
					case StaticValue.Q_GREEN://绿
//						ru.addColorTransform(new ColorTransform(0.5,1,0.5));
						break;
					case StaticValue.Q_BLUE://蓝
//						ru.addColorTransform(new ColorTransform(0.1,0.6,1));
						break;
					case StaticValue.Q_PURPLE://紫
//						ru.addColorTransform(new ColorTransform(0.6,0.1,1));
						break;
					case StaticValue.Q_YELLOW://橙色
//						ru.addColorTransform(new ColorTransform(1,0.6,0));
						break;
				}
			}
		}
		
		public static function updateMyQuality($value:int) : void
		{
			_geRenBiaoChe.quality = $value;
		}
		
		public static function updateSceneQuality($heroId:Number, $quality:int) : void
		{
			var sceneChar:SceneRole = SceneManager.getSceneObjByID($heroId, SceneCharType.BIAO_CHE) as SceneRole;
			if (null == sceneChar)
				return;
//			sceneChar.headFace.updateTranform()(EnumItemQualityType.getColorValue($quality));
			updateBiaoCheQuality(sceneChar, $quality);
		}
		
		/**
		 * 有玩家的镖车被攻击 
		 * @param $heroName 玩家名
		 * @param $heroId 玩家id
		 * @param $sceneId 场景id
		 * @param $x 场景坐标
		 * @param $y 场景坐标
		 */
		public static function onBiaoCheIsHitedBroadcast($countryId,$attackUserId:Number, $attackName,$heroName:String, $heroId:Number, $sceneId:int, $x:int, $y:int) : void
		{
//			var country:String =  CountryCityManager.getCountryNamebyCountryId($countryId);
//			$attackName = NickNamUtil.getNickName($attackName,$attackUserId);
//			$heroName = NickNamUtil.getNickName($heroName,$heroId);
//			var strPos:String = TextUtil.replaceStr("$0（$1，$2）", MapDataManager.getMapName($sceneId), $x, $y);
//			var str2:String = SignTextUtil.getChatTranPos($sceneId, 1, $x, $y, strPos);
//			var str3:String = SignTextUtil.getChatFlyPos($sceneId, 1, $x, $y);
//			NoticeManager.notify(NoticeManager.SYSTEM_CHAT, TextUtil.replaceStr("$0[$1]在<font color='#00FF00'>$2</font>$3攻击我国人民，击杀可获得功勋，保家卫国。",country,$attackName,str2, str3), ChatChannelType.CHAT_CHANNEL_ALLY);
		}

		public static function get checkPoint() : int
		{
			return _geRenBiaoChe.checkPoint;
		}
		
		public static function get biaoCheLevel() : int
		{
			return _geRenBiaoChe.biaoCheLevel;
		}
		
		/**
		 * 判断指定的npc是否已经检查过镖了 
		 * @param $npcId 指定的npcId
		 * @return 返回指定的npc是否已经检查过镖了
		 */
		public static function isChecked($index:int) : Boolean
		{
			return $index < _geRenBiaoChe.checkPoint;
		}
		
		/**
		 * 放弃运镖 
		 */
		public static function giveUpYunBiao() : void
		{
			YunBiaoSender.giveUpYunBiao();
		}
		
		
		public static function get curCheckNpcId() : int
		{
			return _geRenBiaoChe._checkYunBiaoNpcId[checkPoint];
		}
		
		public static function get nextCheckNpcId() : int
		{
			if (checkPoint >= _geRenBiaoChe._checkYunBiaoNpcId.length)
				return 0;
			return _geRenBiaoChe._checkYunBiaoNpcId[checkPoint+1];
		}
		
		private static function isGeRenYunBiaoNpc($npcId:int) : Boolean
		{
			var getNpcId:int = getGetNpcId(YunBiaoManager.GE_REN_YUN_BIAO);
			if ($npcId == getNpcId)
				return true;

			var len:int = _geRenBiaoChe._checkYunBiaoNpcId.length;
			for (var idx:int=0; idx<len; idx++)
			{
				if ($npcId == _geRenBiaoChe._checkYunBiaoNpcId[idx])
					return true;
			}

			return false;
		}
		
		public static function hideGeRenNpcDialog($npcId:int) : Boolean
		{
//			if (!isYunBiaoNpc($npcId))
//				return false;
//			AppManager.hideApp(AppConstant.YUN_BIAO_COMMON_NPC_DIALOG_PANEL);
//			AppManager.hideApp(AppConstant.YUN_BIAO_CHECK_NPC_DIALOG_PANEL);
//			AppManager.hideApp(AppConstant.YUN_BIAO_NPC_DIALOG_PANEL);
			return true;
		}
		
		/** 显示npc对话框 **/
		public static function showGeRenNpcDialog($npcId:int) : Boolean
		{
			// 不在本国，不能运镖
/*			if (!MapDataManager.isInOurCountry())
			{
				return false;
			}*/

			if (!isGeRenYunBiaoNpc($npcId))
			{// 如果不是和运镖npc对话，直接返回
				return false;
			}
			
			if (isFarAway(GE_REN_YUN_BIAO))
			{
//				AppManager.showAppNoHide(AppConstant.YUN_BIAO_COMMON_NPC_DIALOG_PANEL, {npcId:$npcId, type:"far_away"});
				return true;
			}

			var getNpcId:int = getGetNpcId(YunBiaoManager.GE_REN_YUN_BIAO);
			if (!isInYunBiao(YunBiaoManager.GE_REN_YUN_BIAO))
			{// 当前不在运镖
				if (getLeftTimes(GE_REN_YUN_BIAO) <= 0)
				{// 如果今天剩余运镖次数已经用完，那么 今日运镖次数已用完
//					AppManager.showAppNoHide(AppConstant.YUN_BIAO_COMMON_NPC_DIALOG_PANEL, {npcId:$npcId, type:"times_up"});
					return true;
				}
				if ($npcId != getNpcId)
				{// 当前npc不是领镖npc，那么 请前往xxx处
//					AppManager.showAppNoHide(AppConstant.YUN_BIAO_COMMON_NPC_DIALOG_PANEL, {npcId:$npcId, type:"come_to_other_for_get"});
					return true;
				}
//				AppManager.showAppNoHide(AppConstant.YUN_BIAO_CHECK_NPC_DIALOG_PANEL, {npcId:$npcId, type:"get"});
				return true;
			}
			// 当前在运镖
			if ($npcId != curCheckNpcId)
			{// 没有和正确的npc对话，那么 请前往xxx处
//				AppManager.showAppNoHide(AppConstant.YUN_BIAO_COMMON_NPC_DIALOG_PANEL, {npcId:$npcId, type:"come_to_other_for_check"});
				return true;
			}

			// 如果当前不处于交镖阶段
			if (_geRenBiaoChe.getSubmitYunBiaoNpcId() != curCheckNpcId)
			{// 显示验镖面板
//				AppManager.showAppNoHide(AppConstant.YUN_BIAO_CHECK_NPC_DIALOG_PANEL, {npcId:$npcId, type:"check"});
				return true;
			}
			
			// 显示交镖面板
//			AppManager.showAppNoHide(AppConstant.YUN_BIAO_COMMON_NPC_DIALOG_PANEL, {npcId:$npcId, type:"commit"});
			return true;
		}

		/**
		 * 获取运镖npc id 
		 * @return 返回运镖npc的id
		 * @author 康露 2014年12月24日
		 */
		public static function getGetNpcId($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.getNpcId;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.getNpcId;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.getNpcId;
			}
			return 0;
		}

		/**
		 * 初始化运镖配置 
		 * @param $yunBiaoConfig 运镖配置
		 * @author 康露 2014年12月24日
		 */
		public static function init($yunBiaoConfig:*, $vipConfig:Array) : void
		{
			_unbreakMaxLevel = $yunBiaoConfig.biaoInvincibleLevel;
			_geRenBiaoChe.init($yunBiaoConfig, $vipConfig);
			_guildBiaoChe.init($yunBiaoConfig);
			_countryBiaoChe.init($yunBiaoConfig);
		}
		
		public static function get guoYunConfigStartTime() : int
		{
			return _geRenBiaoChe._guoYunConfigStartTime;
		}
		
		public static function get guoYunConfigEndTime() : int
		{
			return _geRenBiaoChe._guoYunConfigEndTime;
		}

		public static function getYaJin($level:int) : int
		{
			return _geRenBiaoChe._yaJin[$level];
		}
		
		public static function get checkYunBiaoNpcId() : Array
		{
			var ret:Array = [];
			for each (var npcId:int in _geRenBiaoChe._checkYunBiaoNpcId)
			{
				ret.push(npcId);
			}
			return ret;
		}

		public static function getSubmitYunBiaoNpcId($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.getSubmitYunBiaoNpcId();
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.getSubmitYunBiaoNpcId();
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.getSubmitYunBiaoNpcId();
			}
			return 0;
		}
		
		/** 镖车所在场景id **/
		public static function getSceneId($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.sceneId;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.sceneId;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.sceneId;
			}
			return 0;
		}
		
		/** 镖车坐标x **/
		public static function getPosX($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.posX;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.posX;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.posX;
			}
			return 0;
		}
		
		/** 镖车坐标y **/
		public static function getPosY($type:int) : int
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.posY;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.posY;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.posY;
			}
			return 0;
		}
		
		public static function isFarAway($type:int) : Boolean
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.isFarAwar;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.isFarAwar;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.isFarAwar;
			}
			return false;
		}
		
		public static function isHited($type:int) : Boolean
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return _geRenBiaoChe.isHited;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.isHited;
				case COUNTRY_YUN_BIAO:
					return _countryBiaoChe.isHited;
			}
			return false;
		}
		
		public static function updateBiaoCheState($sceneId:int, $x:int, $y:int, $isFarAway:Boolean, $isHited:Boolean, $biaoCheType:int) : void
		{
			switch ($biaoCheType)
			{
				case GE_REN_YUN_BIAO:
				{
					_geRenBiaoChe.updateBiaoCheState($sceneId, $x, $y, $isFarAway, $isHited);
					EventManager.dispatchEvent(YunBiaoEvent.UPDATE_BIAO_CHE_STATE);
					break;
				}
				case GUILD_YUN_BIAO:
				{
					_guildBiaoChe.updateBiaoCheState($sceneId, $x, $y, $isFarAway, $isHited);
					EventManager.dispatchEvent(YunBiaoEvent.UPDATE_GUILD_BIAO_CHE_STATE);
					break;
				}
				case COUNTRY_YUN_BIAO:
				{
					_countryBiaoChe.updateBiaoCheState($sceneId, $x, $y, $isFarAway, $isHited);
					EventManager.dispatchEvent(YunBiaoEvent.COUNTRY_UPDATE_BIAO_CHE_STATE);
					break;
				}
			}
		}
		
		public static function isCheckNpc($npcId:int) : Boolean
		{
			return _geRenBiaoChe._checkYunBiaoNpcId.indexOf($npcId) != -1;
		}
		
		public static function isMySubmitYunBiaoNpc($type:int, $npcId:int) : Boolean
		{
			return getSubmitYunBiaoNpcId($type) == $npcId;
		}
		
		public static function isMyCountryGuildSubmitYunbiaoNpc($npcId:int) : Boolean
		{
			if (_guildBiaoChe._guildYunBiaoSubmitNpcId[(MainRoleManager.actorInfo.countryId * 2)] == $npcId)
				return true;

			if (_guildBiaoChe._guildYunBiaoSubmitNpcId[(MainRoleManager.actorInfo.countryId * 2) + 1] == $npcId)
				return true;

			return false;
		}
		
		public static function onSubmitYunBiaoSucceed($isGuoYun:Boolean, $isDestoried:Boolean, $money:int, $itemId:int, $itemCount:int, $exp:int) : void
		{
			_geRenBiaoChe.reset();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
//			ClientSettingManager.reqSetClientBoolValue(EnumClientBoolSetting.HAVE_GOT_BIAO_CHE, true);
//			EventManager.dispatchEvent( ShareInviteEvent.COMPLETE_SHARE_DAILY_TASK, EnumShareDailyTaskType.DSTT_YUN_BIAO );
		}
		
		public static function onGiveUpYunBiaoSucceed() : void
		{
			if( isInYunBiao( GE_REN_YUN_BIAO ) )
			{
				_geRenBiaoChe.reset();
//				NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_8);
			}
			else if( isInYunBiao( COUNTRY_YUN_BIAO) )
			{
				_countryBiaoChe.reset();
//				NoticeManager.notify( NoticeManager.MOUSE_FOLLOW_TIP, LanguageConfig.getText( EnumLang_CountryYunBiao.CountryYunBiao_Giveup ) );
			}
			
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
			
//			ClientSettingManager.reqSetClientBoolValue(EnumClientBoolSetting.HAVE_GOT_BIAO_CHE, true);
		}
		
		public static function onOpenGuoYunSucceed() : void
		{
			EventManager.dispatchEvent(YunBiaoEvent.OPEN_GUO_YUN_SUCCEED);
		}
		
		public static function isGuoYun() : Boolean
		{
			var now:Number = SystemTimeManager.curtTm;
/*			var guoYunStartTime:Number = getGuoYunStartTime(CountryCityManager.getSelfCountryId());
			if (now < guoYunStartTime)
				return false;
			if (now > (guoYunStartTime + TimeUtil.HOUR_MICRO_SECONDS))
				return false;*/
			return true;
		}
		
		private static function onGuoYunOk() : void
		{
			var getNpcId:int = getGetNpcId(YunBiaoManager.GE_REN_YUN_BIAO);
			var npc:MonsterDataProto = MonsterDataManager.getData(getNpcId);
			if (null == npc)
				return;
//			EventManager.dispatchEvent(MapEvent.NPC_MAP_TRANS_TO,getNpcId);
		}

		private static function onGuoYunTimeOver($alertId:int) : void
		{
//			GameAlert.hideNoCovarAlert($alertId);
		}

		public static function onGuoYunBroadcast($country:int, $startTime:Number) : void
		{
//			NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_12, CountryCityManager.getCountryNamebyCountryId($country));
/*			YunBiaoManager.setGuoYunStartTime($startTime, $country);
			if (CountryCityManager.getSelfCountry().sequence == $country)
			{
				if (OpenFunctionManager.isOpenFunction(FunctionType.FUNC_YUN_BIAO))
				{
					var alertId:int = GameAlert.showConfirmNoCover("你的国家开启了1小时的国运时间，<font color='#FF0000'>运镖奖励增加50%</font>，是否立即前往？", "国运", true, onGuoYunOk);
					TweenLite.delayedCall(TimeUtil.HOUR_MICRO_SECONDS/TimeUtil.SECOND_MICRO_SECONDS, onGuoYunTimeOver, [alertId]);
				}
				return;
			}
			if (CountryCityManager.isFriendCountry($country))
			{
			} else
			{
				var countryName:String = CountryCityManager.getCountryNamebyCountryId($country);
				NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_9, countryName, countryName);
			}*/
		}
		
		/**
		 * 开启帮会运镖
		 */
		public static function requestGuildYunBiao($country:int) : void
		{
/*			if (_guildBiaoChe._yunbiaoLevelLimit > MainManager.actorInfo.lv)
			{
				NoticeManager.addConfigNotice(EnumLang_NoticeInfo.YunBiao_14);
				return;
			}*/
			YunBiaoSender.requestGuildYunBiao($country);
		}
		
		/**
		 * 提交帮会运镖
		 */
		public static function submitGuildYunBiao() : void
		{
			YunBiaoSender.submitGuildYunBiao();
		}
		
		/**
		 * 运镖召集帮众
		 */
		public static function guildYunBiaoHelp() : void
		{
			YunBiaoSender.guildYunBiaoHelp();
		}

		/**
		 * 开启帮会运镖 ,成功
		 */
		public static function onRequestGuildYunbiaoSucceed() : void
		{
//			AppManager.hideApp(AppConstant.GUILD_YUN_BIAO_PANEL);
		}
		
		/**
		 * 提交帮会运镖，成功
		 */
		public static function onGuildSubmitYunBiaoSucceed() : void
		{
			_guildBiaoChe.reset();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}
		
		/**
		 * 运镖召集帮众成功
		 */
		public static function onGuildYunBiaoHelpSucceed() : void
		{
			_guildBiaoChe.callUpFinishTime = SystemTimeManager.curtTm + _guildBiaoChe.callUpCdTime;
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_GUILD_CALL_UP);
		}

		public static function getCallUpFinishTime($type:int) : Number
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
					return 0;
				case GUILD_YUN_BIAO:
					return _guildBiaoChe.callUpFinishTime;
				case COUNTRY_YUN_BIAO:
					return 0;
			}
			return 0;
		}

		public static function isGuildYunBiaoOver() : Boolean
		{
			return (SystemTimeManager.curtTm>=_guildBiaoChe.limitTime) && (0==_guildBiaoChe.getLeftTimes());
		}

		/**
		 * 移除镖车
		 * @param $type 0：个人，1：帮会
		 * @author 康露 2014年12月30日
		 */
		public static function onRemoveBiaoChe($type:int) : void
		{
			switch ($type)
			{
				case GE_REN_YUN_BIAO:
				{
//					AppManager.hideApp(AppConstant.YUN_BIAO_NPC_DIALOG_PANEL);
					break;
				}
				case GUILD_YUN_BIAO:
				{
					break;
				}
				case COUNTRY_YUN_BIAO:
				{
					break;
				}
			}
			
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}
		
		/**
		 * 添加一个敌人 
		 * @param $enemyId 敌人id
		 * @author 康露 2015年1月4日
		 */
		public static function addEnemy($enemyId:Number) : void
		{
			_geRenBiaoChe.addEnemy($enemyId);
		}
		
		/**
		 * 移除一个敌人 
		 * @param $endmyId 敌人id
		 * @author 康露 2015年1月4日
		 */
		public static function delEnemy($enemyId:Number) : void
		{
			_geRenBiaoChe.delEnemy($enemyId);
		}
		
		/**
		 * 判断是否是自己的敌人 
		 * @param $enemyId
		 * @return 
		 * 
		 */
		public static function isEnemy($enemyId:Number) : Boolean
		{
			return _geRenBiaoChe.isEnemy($enemyId);
		}
		
		public static function addFaceIcon($enemyId:Number) : void
		{
			if (isEnemy($enemyId))
			{
				_geRenBiaoChe.addFaceIcon($enemyId);
			}
		}
		
		private static function applyHelp() : void
		{
			YunBiaoSender.goToGuildBiaoChe();
		}
		
		/**
		 * 获取帮会运镖需要的活跃值 
		 * @return 返回帮会运镖需要的活跃值
		 * @author 康露 2015年1月9日
		 */
		public static function getGuildYunBiaoActive() : int
		{
			return _guildBiaoChe.guildYunBiaoActive;
		}

		/**
		 * 帮主召集帮众来保护镖车
		 * @author 康露 2015年1月5日
		 */
		public static function onYunBiaoLeaderCallHelp() : void
		{
//			GameAlert.showConfirm("帮会镖车需要保护，是否立即前往？（免费传送）？", "帮会召集令", true, applyHelp, null, null, "立即前往", "稍后再去");
		}
		
		public static function onRemoveGuildBiaoChe() : void
		{
			_guildBiaoChe.reset();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
		}
		
		/**
		 * 个人运镖请求帮会的人帮忙
		 */
		public static function yunBiaoHelp() : void
		{
			if( isInYunBiao( GE_REN_YUN_BIAO ) )
			{
				_geRenBiaoChe.yunBiaoHelp();
			}
			else if( isInYunBiao( COUNTRY_YUN_BIAO ) )
			{
				_countryBiaoChe.yunBiaoHelp();
			}
		}
		
		/**
		 * 移除指定玩家的求助信息 
		 * @param $heroId 需要被移除求助信息的玩家id
		 * @author 康露 2015年1月30日
		 */
		public static function removeHelpInfo($heroId:Number) : void
		{
			_geRenBiaoChe.removeHelpInfo($heroId);
		}
		
		private static var _geRenAwardGoodsId:int = 0;
		
		public static function getGeRenYunBiaoAwardGoodsId() : int
		{
			YunBiaoSender.requestYunBiaoLevelGoodsId();
			return _geRenAwardGoodsId;
		}
		
		/**
		 * 请求传输到帮会中发起个人运镖帮助的那个人身边 
		 * @param $globalId 索引id
		 * @author 康露 2015年2月4日
		 */
		public static function requestPersionalGuildHelpTransport($globalId:int) : void
		{
			YunBiaoSender.requestPersionalGuildHelpTransport($globalId);
		}
		
		public static function updateGeRenYunbiaoAwardGoodsId($goodsId:int, countryGoodsId:int) : void
		{
			_geRenAwardGoodsId = $goodsId;
			_countryAwardGoodsId = countryGoodsId;
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_AWARD_GOODS_ID, $goodsId);
			EventManager.dispatchEvent(YunBiaoEvent.COUNTRY_UPDATE_AWARD_GOODS_ID, countryGoodsId);
		}
		
		
		
		
		/** 显示国家运镖npc对话框 **/
		public static function showCountryNpcDialog($npcId:int) : Boolean
		{
//			if( MainManager.actorInfo.lv < CountryTaskManager.LIMIT_LEVEL )
//			{
//				return false;
//			}
			if (!isCountryYunBiaoNpc($npcId))
			{// 如果不是和运镖npc对话，直接返回
				return false;
			}
//			var countryTaskInfo:CountryTaskInfo = CountryTaskManager.countryTaskInfo;
//			if( countryTaskInfo == null )
//			{
//				return false;
//			}
//			if( !CountryTaskManager.getPublishByType(EnumCountryTaskType.COUNTRY_YUN_BIAO) )
//			{
//				return false;
//			}
			if (isFarAway(COUNTRY_YUN_BIAO))
			{
//				AppManager.showAppNoHide(AppConstant.COUNTRY_YUN_BIAO_DIALOG_PANEL, {npcId:$npcId, type:"far_away"});
				return true;
			}
			
			var getNpcId:int = getGetNpcId(YunBiaoManager.COUNTRY_YUN_BIAO);
			if (!isInYunBiao(YunBiaoManager.COUNTRY_YUN_BIAO))
			{// 当前不在运镖
				if ($npcId != getNpcId)
				{// 当前npc不是领镖npc，那么 请前往xxx处
//					AppManager.showAppNoHide(AppConstant.COUNTRY_YUN_BIAO_DIALOG_PANEL, {npcId:$npcId, type:"come_to_other_for_get"});
					return false;
				}
//				AppManager.showAppNoHide(AppConstant.COUNTRY_YUN_BIAO_PANEL, {npcId:$npcId, type:"get"});
				return true;
			}
			// 当前在运镖
			if ($npcId != countryCheckNpcId)
			{// 没有和正确的npc对话，那么 请前往xxx处
//				AppManager.showAppNoHide(AppConstant.COUNTRY_YUN_BIAO_DIALOG_PANEL, {npcId:$npcId, type:"come_to_other_for_check"});
				return true;
			}
			
			// 如果当前不处于交镖阶段
			if (_countryBiaoChe.getSubmitYunBiaoNpcId() != countryCheckNpcId)
			{// 显示验镖面板
//				AppManager.showAppNoHide(AppConstant.COUNTRY_YUN_BIAO_PANEL, {npcId:$npcId, type:"check"});
				return true;
			}
			
			// 显示交镖面板
//			AppManager.showAppNoHide(AppConstant.COUNTRY_YUN_BIAO_DIALOG_PANEL, {npcId:$npcId, type:"commit"});
			return true;
		}
		
		private static function isCountryYunBiaoNpc($npcId:int) : Boolean
		{
			var getNpcId:int = getGetNpcId(YunBiaoManager.COUNTRY_YUN_BIAO);
			if ($npcId == getNpcId)
				return true;
			
			var len:int = _countryBiaoChe.checkYunBiaoNpcId.length;
			for (var idx:int=0; idx<len; idx++)
			{
				if ($npcId == _countryBiaoChe.checkYunBiaoNpcId[idx])
					return true;
			}
			
			return false;
		}
		
		public static function getCountryYunBiaoAwardGoodsId():int
		{
			YunBiaoSender.requestYunBiaoLevelGoodsId();
			return _countryAwardGoodsId;
		}
		
		public static function getCountryPrizeCount($quality:int) : int
		{
			return _countryBiaoChe.getPrizeCount($quality);
		}
		
		public static function get countryCheckNpcId():int
		{
			return _countryBiaoChe.checkYunBiaoNpcId[countryCheckPoint];
		}
		
		public static function get countryCheckPoint() : int
		{
			return _countryBiaoChe.checkPoint;
		}
		
		public static function get countryNextCheckNpcId() : int
		{
			if (countryCheckPoint >= _countryBiaoChe.checkYunBiaoNpcId.length)
				return 0;
			return _countryBiaoChe.checkYunBiaoNpcId[countryCheckPoint+1];
		}
		
		public static function get countryCheckYunBiaoNpcId() : Array
		{
			var ret:Array = [];
			for each (var npcId:int in _countryBiaoChe.checkYunBiaoNpcId)
			{
				ret.push(npcId);
			}
			return ret;
		}
		
		/**
		 * 判断指定的npc是否已经检查过镖了 
		 */
		public static function isCountryChecked($index:int) : Boolean
		{
			return $index < _countryBiaoChe.checkPoint;
		}
		
		public static function onCountryCheckYunBiaoSuccess() : void
		{
			_countryBiaoChe.checkPoint++;
			EventManager.dispatchEvent(YunBiaoEvent.COUNTRY_CHECK_YUN_BIAO_SUCCESS);
		}
		
		public static function onContrySubmitYunBiaoSucceed(isDestoried:Boolean, itemId:int, itemCount:int, personalContribute:int) : void
		{
			_countryBiaoChe.reset();
			_geRenBiaoChe.reset();
			EventManager.dispatchEvent(YunBiaoEvent.UPDATE_YUN_BIAO_INFO);
//			EventManager.dispatchEvent(ShareInviteEvent.COMPLETE_SHARE_DAILY_TASK, EnumShareDailyTaskType.DSTT_COUNTRY_TASK);
		}
		
		public static function updateCountryQuality($value:int) : void
		{
			_countryBiaoChe.quality = $value;
		}
		
		public static function initSubmitNpc():void
		{
//			_countryBiaoChe.initSubmitNpc( CountryCityManager.getSelfCountryId() );
		}
		
		public static function changeSubmitNpc():void
		{
//			_countryBiaoChe.changeSubmitNpc( CountryCityManager.getSelfCountryId() );
		}
		
		//---------------------------------------------------------------------------------

		/** 倒计时面板的倒计时是否结束 **/
		public static function get isEnd():Boolean
		{
			return _isEnd;
		}

		/**
		 * @private
		 */
		public static function set isEnd(value:Boolean):void
		{
			_isEnd = value;
		}

		/** 品质 **/
		public static function get biaoQuality():int
		{
			return _biaoQuality;
		}

		/**
		 * @private
		 */
		public static function set biaoQuality(value:int):void
		{
			_biaoQuality = value;
		}

		/** 镖车时长 **/
		public static function get biaoExpireDuration():Number
		{
			return _biaoExpireDuration;
		}

		/**
		 * @private
		 */
		public static function set biaoExpireDuration(value:Number):void
		{
			_biaoExpireDuration = value;
		}

		/** 下一个需要验镖的npc的下标 **/
		public static function get nextIndex():int
		{
			return _nextIndex;
		}

		/**
		 * @private
		 */
		public static function set nextIndex(value:int):void
		{
			_nextIndex = value;
		}

		/** 镖车是否安全 **/
		public static function get isSafety():Boolean
		{
			return _isSafety;
		}

		/**
		 * @private
		 */
		public static function set isSafety(value:Boolean):void
		{
			_isSafety = value;
		}

		/** 镖车破损次数 **/
		public static function get brokenCount():int
		{
			return _brokenCount;
		}

		/**
		 * @private
		 */
		public static function set brokenCount(value:int):void
		{
			_brokenCount = value;
		}

		/** 是否远离镖车 **/
		public static function get isYuanLi():Boolean
		{
			return _isYuanLi;
		}

		/**
		 * @private
		 */
		public static function set isYuanLi(value:Boolean):void
		{
			_isYuanLi = value;
		}


	}
}
