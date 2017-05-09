package com.rpgGame.app.manager.role
{
	import com.game.engine3D.config.GlobalConfig;
	import com.rpgGame.app.manager.AreaMapManager;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.GameCameraManager;
	import com.rpgGame.app.manager.ShortcutsManger;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.task.MiXinManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.role.RoleEvent;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.player.bean.MyPlayerInfo;
	
	import flash.geom.Vector3D;
	
	import org.client.mainCore.manager.EventManager;

	/**
	 *
	 * 主角管理器
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-4 上午10:02:16
	 *
	 */
	public class MainRoleManager
	{
		/**主角*/
		private static var _actor : SceneRole;
		private static var _actroInfo : HeroData;

		public function MainRoleManager()
		{
		}

		/**
		 * 获取个人用户信息
		 * @return
		 *
		 */
		public static function get actorInfo() : HeroData
		{
			_actroInfo = _actroInfo || new HeroData();
			return _actroInfo;
		}
		

		/**
		 * 获取个人用户ID
		 * @return
		 *
		 */
		public static function get actorID() : Number
		{
			return actorInfo.id;
		}

		public static function isSelf(id : Number) : Boolean
		{
			return id == actorInfo.id;
		}

		/**主角*/
		public static function get actor() : SceneRole
		{
			return _actor;
		}

		public static function initSingleData(heroInfo : MyPlayerInfo) : void
		{
			var heroName : String = heroInfo.name;
			//角色信息
			HeroData.setUserSingleInfo(actorInfo, heroName);
		
			ShortcutsManger.getInstance().replaceToTempSpells(HeroData.spellArrs);
		}

		public static function setLoginData(heroInfo : MyPlayerInfo) : void
		{
			//角色信息
			HeroData.setUserLoginInfo(actorInfo, heroInfo);
            EventManager.dispatchEvent(RoleEvent.UPDATE_NEEDLE, 
                MainRoleManager.actor, 
                0, 
                (MainRoleManager.actor.data as HeroData).totalStat.getResData(CharAttributeType.RES_JING_ZHENG));

//			if(heroProto.goodsContainerModuleObj)
//			{
//				//背包信息
//				BackPackManager.instance.setGoodsInfo(heroProto.goodsContainerModuleObj.depot);
//			}

			//仓库信息
//			var hasStorage : Boolean = heroProto.hasStorage;
//			StorageManager.instance.setHasStorage(heroProto.hasStorage);

//			if(heroProto.familyModuleObj)
//			{
//				//家族
//				SocietyManager.setHero(heroProto.familyModuleObj);
//			}
//			//任务信息
//			TaskManager.setTaskProto(heroProto.taskModuleObj);
//			//组队数据
//			TeamManager.setHeroTeam(heroProto.teamModuleObj);
//			//复活数据
//			if (heroProto.sceneModuleObj)
//				ReliveManager.setHeroData(heroProto.sceneModuleObj.heroRelive);
//			//回购物品
//			SmallShopItemManager.setBackBuyData(heroProto.shopModuleObj.buyBackGoods);
//
//			GuildManager.setupModuleObj(heroProto.guildModuleObj);
//			//摆摊
//			StallManager.setupStallModuleObj(heroProto.stallModuleObj);
//			//邮件
//			MailManager.setLoginData(heroProto.mailModuleObj);
//			if (heroProto.baZhenTuModuleObj)
//			{
//				BaZhenTuManager.todayEnterTimes = heroProto.baZhenTuModuleObj.todayEnterTimes;
//			}
		}

		public static function initActor() : void
		{
			//如果没有则创建
			if (_actor == null)
			{
				var data : HeroData = actorInfo;
				//获取主角
				_actor = SceneRoleManager.getInstance().createHero(data, true);
				_actor.type = SceneCharType.PLAYER;
				_actor.mouseEnable = false;
				
				SceneManager.getScene().mainChar = _actor;
				SceneManager.scene.mainChar = _actor;
				
				if(GlobalConfig.use2DMap)
				{
					GameCameraManager.startPlayerMode(SceneManager.scene.cameraTarget);
				}
				else
				{
					GameCameraManager.startPlayerMode(SceneManager.getScene().cameraTarget);
				}
				
				TrusteeshipManager.getInstance().setup(_actor);
				TaskAutoManager.getInstance().setup(_actor);
				//设置主角初始状态
				if (MiXinManager.isSubmitMiXinTask())
				{
//					_actor.headFace.addTaskIco(AssetUrl.JIMAOXIN);
				}
			}
		}

		public static function get actorGroundXYTips() : String
		{
			return int(actor.position.x) + "," + int(actor.position.z);
		}

		public static function getActorSpellHandHight() : int
		{
			var position : Vector3D = actor.getChildScenePositionByName(RenderUnitType.BODY, RenderUnitID.BODY, BoneNameEnum.c_0_body_02); //"出手挂节点"
			if (position)
				return position.y;
			return actor.y;
		}

		/**
		 * 更新主角状态，切换场景时会更新主角的生命值、buff列表、动作、影子
		 * @param info
		 *
		 */
		public static function updateActorStatus() : void
		{
			CharAttributeManager.setCharHp(MainRoleManager.actorInfo, MainRoleManager.actorInfo.totalStat.hp);
//			MainRoleManager.actor.mapAreaType = 0;
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, null, true);
			MainRoleManager.actor.setGroundXY(MainRoleManager.actorInfo.x, MainRoleManager.actorInfo.y);
			if (MainRoleManager.actorInfo.totalStat.hp <= 0)
			{
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			else
			{
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			}
			EventManager.dispatchEvent(BuffEvent.UPDATE_BUFF, MainRoleManager.actorID);
			AreaMapManager.updateActorEnterAreaInfo();
		}
		
		/**
		 * 是否在开战车
		 * @return 
		 * 
		 */
		public static function get isDriveZhanChe():Boolean
		{
			if(actorInfo)
			{
				return (actorInfo.zhanCheOwnerID == actorInfo.id);
			}
			return false;
		}
		
		/**
		 * 是否在乘坐战车（与开车是有区别的）
		 * @return 
		 * 
		 */
		public static function get isTakeZhanChe():Boolean
		{
			if(actorInfo)
			{
				return (actorInfo.zhanCheOwnerID > 0 && actorInfo.zhanCheOwnerID != actorInfo.id);
			}
			return false;
		}
		
		/**
		 * 是否在参与国战
		 * @return 
		 * 
		 */
		public static function get isInCountryWar():Boolean
		{
//			var currentWarInfo:CountryWarInfoData = CountryWarManager.getCurrentWarInfo();
//			if(currentWarInfo)
//			{
//				if(!CountryManager.isMyEnemyCountry(currentWarInfo.attackCountry) || !CountryManager.isMyEnemyCountry(currentWarInfo.defenceCountry))
//				{
//					if(MapDataManager.currentScene.isCountryWarMap && actorInfo.sceneSequence == currentWarInfo.defenceCountry)
//					{
//						return true;
//					}
//				}
//			}
			return false;
		}
		
	}
}
