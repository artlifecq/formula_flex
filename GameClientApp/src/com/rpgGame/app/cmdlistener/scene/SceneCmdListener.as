package com.rpgGame.app.cmdlistener.scene
{
	import com.game.engine3D.scene.render.RenderUnit3D;
	import com.game.engine3D.vo.BaseObj3D;
	import com.gameClient.log.GameLog;
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.fight.spell.SpellEffectRecordCtrl;
	import com.rpgGame.app.graphics.HeadFace;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.GameCameraManager;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.RankManager;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.DropGoodsManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneDropGoodsManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskAutoManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.process.StartGame;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.JumpStateReference;
	import com.rpgGame.app.state.role.control.StopWalkMoveStateReference;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.UserMoveEvent;
	import com.rpgGame.coreData.cfg.AnimationDataManager;
	import com.rpgGame.coreData.cfg.AttachEffectCfgData;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.MapJumpCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Attach_effect;
	import com.rpgGame.coreData.clientConfig.Q_SpellAnimation;
	import com.rpgGame.coreData.clientConfig.Q_map;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapUnitType;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.move.RoleMoveInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	import com.rpgGame.coreData.lang.LangQ_NoticeInfo;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.role.GirlPetData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneCollectData;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.role.SceneDropGoodsItem;
	import com.rpgGame.coreData.role.SceneJumpPointData;
	import com.rpgGame.coreData.role.SculptureData;
	import com.rpgGame.coreData.role.TrapInfo;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.map.bean.AttachInfo;
	import com.rpgGame.netData.map.bean.DropGoodsInfo;
	import com.rpgGame.netData.map.bean.MonsterInfo;
	import com.rpgGame.netData.map.bean.NpcInfo;
	import com.rpgGame.netData.map.bean.PetInfo;
	import com.rpgGame.netData.map.bean.PlayerInfo;
	import com.rpgGame.netData.map.bean.SceneObjInfo;
	import com.rpgGame.netData.map.bean.TopLeaderInfo;
	import com.rpgGame.netData.map.message.ResArmorChangeMessage;
	import com.rpgGame.netData.map.message.ResChangeMapFailedMessage;
	import com.rpgGame.netData.map.message.ResChangeMapMessage;
	import com.rpgGame.netData.map.message.ResChangePositionMessage;
	import com.rpgGame.netData.map.message.ResEnterMapMessage;
	import com.rpgGame.netData.map.message.ResHelmChangeMessage;
	import com.rpgGame.netData.map.message.ResPetTranMoveMessage;
	import com.rpgGame.netData.map.message.ResPlayerRunEndMessage;
	import com.rpgGame.netData.map.message.ResPlayerRunFailMessage;
	import com.rpgGame.netData.map.message.ResPlayerStopMessage;
	import com.rpgGame.netData.map.message.ResRoundGoodsExtraMessage;
	import com.rpgGame.netData.map.message.ResRoundGoodsMessage;
	import com.rpgGame.netData.map.message.ResRoundMonsterDisappearMessage;
	import com.rpgGame.netData.map.message.ResRoundObjectsMessage;
	import com.rpgGame.netData.map.message.ResRoundPetDisappearMessage;
	import com.rpgGame.netData.map.message.ResRoundPetMessage;
	import com.rpgGame.netData.map.message.ResWeaponChangeMessage;
	import com.rpgGame.netData.map.message.SCAreaJumpMessage;
	import com.rpgGame.netData.map.message.SCAttachStateChangeMessage;
	import com.rpgGame.netData.map.message.SCSceneObjMoveMessage;
	import com.rpgGame.netData.map.message.SCSyncPlayerPosMessage;
	import com.rpgGame.netData.map.message.SCUpdateTopLeaderMessage;
	import com.rpgGame.netData.monster.message.ResMonsterDieMessage;
	import com.rpgGame.netData.player.message.BroadcastPlayerAttriChangeMessage;
	import com.rpgGame.netData.player.message.ResChangeFactionMessage;
	import com.rpgGame.netData.player.message.ResChangePKStateMessage;
	import com.rpgGame.netData.player.message.ResPlayerDieMessage;
	import com.rpgGame.netData.player.message.ResPlayerStateChangeMessage;
	import com.rpgGame.netData.player.message.ResReviveSuccessMessage;
	import com.rpgGame.netData.player.message.SCUpdatePlayerTitleMessage;
	import com.rpgGame.netData.structs.Position;
	import com.rpgGame.statistics.Statistics;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	
	import app.message.MonsterType;
	
	import away3d.enum.LoadPriorityType;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;
	import org.game.netCore.net_protobuff.ByteBuffer;
	
	/**
	 *
	 * 场景消息侦听
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-5 下午4:50:25
	 *
	 */
	public class SceneCmdListener extends BaseBean
	{
		public function SceneCmdListener()
		{
			super();
		}
		
		override public function start() : void
		{
			SocketConnection.addCmdListener(101120, RecvEnterMapMessage);
			SocketConnection.addCmdListener(101116, RecvResPlayerStopMessage);
			SocketConnection.addCmdListener(101123, RecvResPlayerRunEndMessage);
			SocketConnection.addCmdListener(101148, RecvSCSceneObjMoveMessage);
			SocketConnection.addCmdListener(101125, RecvResRoundObjectsMessage);
			SocketConnection.addCmdListener(101106, onResRoundMonsterDisappearMessage);
			
			SocketConnection.addCmdListener(101128, onResChangePositionMessage);
			//场景中有对象血量有变化. 可能是因为状态, 可能是因为吃药
			SocketConnection.addCmdListener(103105, RecvBroadcastPlayerAttriChangeMessage);
			
			SocketConnection.addCmdListener(101143, RecvResPlayerRunFailMessage);
			SocketConnection.addCmdListener(101117, onResChangeMapMessage);
			//			SocketConnection.addCmdListener(SceneModuleMessages.S2C_SCENE_MAP_TRANSPORT, onSceneMapTransport);
			SocketConnection.addCmdListener(101126, onResChangeMapFailedMessage);
			SocketConnection.addCmdListener(103129, onResChangeFactionMessage);
			// 复活成功
			SocketConnection.addCmdListener(103114, onResPlayerDieMessage);
			SocketConnection.addCmdListener(103115, onResReviveSuccessMessage);
			SocketConnection.addCmdListener(101146, onResRoundGoodsExtraMessage);
			SocketConnection.addCmdListener(101103, onResRoundGoodsMessage);
			
			//换装
			SocketConnection.addCmdListener(101119, onResArmorChangeMessage);//衣服
			SocketConnection.addCmdListener(101150, onResHelmChangeMessage);//头盔
			SocketConnection.addCmdListener(101118, onResWeaponChangeMessage);//武器
			
			// 陷阱状态改变
			SocketConnection.addCmdListener(101151, onRecvSCAttachStateChangeMessage);
			
			SocketConnection.addCmdListener(101221, onSCAreaJumpMessage);//地图跳跃
			
			SocketConnection.addCmdListener(103110, onResChangePKStateMessage);
			SocketConnection.addCmdListener(114108, onResMonterDieMessage);
			SocketConnection.addCmdListener(101222, onSCUpdateTopLeaderMessage);
			SocketConnection.addCmdListener(101152, onSCSyncPlayerPosMessage);
			SocketConnection.addCmdListener(103109, onResPlayerStateChangeMessage);
			
			SocketConnection.addCmdListener(101104, onResRoundPetMessage);
			SocketConnection.addCmdListener(101108, onResRoundPetDisappearMessage);
			SocketConnection.addCmdListener(101134, onResPetTranMoveMessage);
			SocketConnection.addCmdListener(103217,onSCUpdatePlayerTitleHandler);
			//			SocketConnection.addCmdListener(SceneModuleMessages.S2C_TRIGGER_CLIENT_EVENT, onTriggerClientEvent);
			
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//////
			////// 以下为参考代码，是深圳那边的后台协议，不适用
			//////
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
//			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_ADD_SENT_NPC, addSentNpc);
//			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_SYNC_SENT_NPC_POS, onSceneSyncSentNpcPos);
//			SocketConnection_protoBuffer.addCmdListener(StoryModuleMessages.S2C_ADD_STORY_PROTECT_MONSTER, onAddStoryProtectMonster);
//			
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_TP_SAME_SCENE, onRecHeroTpSameScene);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_TP_SAME_SCENE_BROADCAST, onHeroTp);
//			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_SCENE_REQUEST_NPC_TRANSPORT, onNpcTransSuccess);
//			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_SCENE_REQUEST_NPC_TRANSPORT_FAIL, onNpcTransFail);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_BEEN_TAUNT_TARGET, onBeenTauntTarget);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_LOST_TAUNT_TARGET, onLostTauntTarget);
//			
//			
//			
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_OBJECT_MAX_LIFE_CHANGE, onRecObjectMaxLifeChange);
//			
//			
//			SocketConnection_protoBuffer.addCmdListener(SimpleDungeonModuleMessages.S2C_LEAVE_DUNGEON_FAIL, onLeaveDungeonFail);
//			SocketConnection_protoBuffer.addCmdListener(SimpleDungeonModuleMessages.S2C_LEAVE_DUNGEON_SUCCESS, onLeaveDungeonSuccess);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_JUMP, onHeroJump);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_JUMP_FAIL, onHeroJumpFail);
//			
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_ADD_SCENE_BOX, onSceneAddBoxGoods);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_DROP_SCENE_BOX, onSceneDropBoxGoods);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS_INFO, onScenePickUpGoodsInfo);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS_INFO_FAIL, onScenePickUpGoodsInfoFail);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS, onScenePickUpGoods);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS_FAIL, onScenePickUpGoodsFail);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_NEXT_CAN_PICK_UP_TIME_CHANGED, onScenePickUpGoodsNextCanPickTime);
//			
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_GET_SURROUNDING_SCENE_INFO_FAIL, onGetMapUnitInfoFiald);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_REPLY_SURROUNDING_SCENE_INFO, onGetMapUnitInfoSucced);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PLUNDER_HURT_RANK, onPlunderHurtRank);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PLUNDER_HURT_RANK_SELF_AMOUNT, onPlunderHurtRankSelfAmount);
//			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_RESET_HURT_RANK, onResetHurtRank);
			
			
			finish();
		}
		
		private function onSCUpdatePlayerTitleHandler(msg:SCUpdatePlayerTitleMessage):void
		{
			// TODO Auto Generated method stub
			var role : SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;			
			if(role)
			{
				var head:HeadFace=role.headFace as HeadFace;
				if (head) 
				{
					if (msg.flag==1) 
					{
						head.addTilteById(msg.titleId);
					}
					else
					{
						head.removeTitleById(msg.titleId);
					}
				}
			}
		}
		
		private function onResPlayerStateChangeMessage(msg:ResPlayerStateChangeMessage):void
		{
			// TODO Auto Generated method stub
			if (msg.state==0) 
			{
				MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_ENTER_LEAVE_FIGHT);
			}
			else
			{
				MainRoleManager.actor.stateMachine.removeState(RoleStateType.CONTROL_ENTER_LEAVE_FIGHT);
			}
		}
		
		private function onSCSyncPlayerPosMessage(msg:SCSyncPlayerPosMessage):void
		{
			// TODO Auto Generated method stub
			if (MainRoleManager.actor.stateMachine.isWalkMoving) 
			{
				var ref:WalkMoveStateReference=MainRoleManager.actor.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				ref.setServerTime(msg.pos);
			}
		}
		
		private function onResChangeFactionMessage(msg:ResChangeFactionMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;			
			if(role){
				(role.data as RoleData).faction=msg.faction;
			}else if(msg.personId.ToGID()==MainRoleManager.actorInfo.id){
				MainRoleManager.actorInfo.faction=msg.faction;
			}
		}
		
		private function onResMonterDieMessage(msg:ResMonsterDieMessage):void
		{
			// TODO Auto Generated method stub
			//LostSkillManager.instance().checkExpNotice(msg.killer);
			EventManager.dispatchEvent(MapEvent.ROLE_DIE,msg.monsterId);
		}
		
		private function onSCUpdateTopLeaderMessage(msg:SCUpdateTopLeaderMessage):void
		{
			var info:TopLeaderInfo = msg.topLeaderInfo;
			var sculp:SculptureData = new SculptureData(RoleType.Type_SCULPTURE);
			sculp.id = info.id.ToGID();
			sculp.modleId = info.modelId;
			sculp.name = info.playerName;
			sculp.roleId = info.playerId;
			sculp.updataTopType(info.topType);
			var qData : Q_monster = MonsterDataManager.getData(info.modelId);
			sculp.avatarRes = qData.q_body_res;
			SceneRoleManager.getInstance().createSculpture(sculp);
		}
		private function onResChangePKStateMessage(msg:ResChangePKStateMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if(role){
				(role.data as HeroData).pkMode=msg.pkState;
			}
			//主玩家
			if (role==MainRoleManager.actor) 
			{
				PKMamager.setPkMode(msg.pkState);
				EventManager.dispatchEvent(MainPlayerEvent.PK_MODE_CHANGE);
			}
		}
		
		private function onResChangePositionMessage(msg:ResChangePositionMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if (!role) 
			{
				return;
			}
			var posX : uint = msg.position.x;
			var posY : uint = msg.position.y;
			var stopWalkRef : StopWalkMoveStateReference = MainRoleManager.actor.stateMachine.getReference(StopWalkMoveStateReference) as StopWalkMoveStateReference;
			stopWalkRef.setParams(posX, posY);
			role.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, stopWalkRef);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE);
			EventManager.dispatchEvent(UserMoveEvent.MOVE_RESCHANGE);
			EventManager.dispatchEvent(MapEvent.MAP_FLY_COMPLETE);
		}
		
		// 陷阱状态改变
		private function onRecvSCAttachStateChangeMessage(msg : SCAttachStateChangeMessage) : void {
			var trap : RenderUnit3D = SceneManager.getSceneObjByID(msg.personId.ToGID()) as RenderUnit3D;
			if (null == trap) {
				return;
			}
			var info : TrapInfo = trap.data as TrapInfo;
			if (null == info || info.state == msg.state) {
				return;
			}
			if (info.effect) {
				info.effect.stop();
				SceneManager.removeSceneObjFromScene(info.effect);
			}
			info.state = msg.state;
			SceneManager.addSceneObjToScene(info.effect, true, false, false);
		}
		
		/**地图跳跃*///-------yt
		private function onSCAreaJumpMessage(msg : SCAreaJumpMessage) : void 
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.playerId.ToGID()) as SceneRole;
			if (role && role.usable)
			{
				var ref : JumpStateReference = role.stateMachine.getReference(JumpStateReference) as JumpStateReference;
				var destPoint:Vector3D=new Vector3D(msg.jumpPos.x,0,msg.jumpPos.y);
				var isEnd:Boolean=false;
				var jumpData:SceneJumpPointData=MapJumpCfgData.getJumpportData(msg.jumpId);
				if(jumpData)
				{
					var dist:int = Point.distance(new Point(jumpData.stopPoint.x,jumpData.stopPoint.y),new Point(msg.jumpPos.x,msg.jumpPos.y));
					if(dist<50)
					{
						isEnd=true;
					}
				}
				Lyt.a("跳跃点消息："+msg.jumpId+".."+msg.jumpPos.x+":"+msg.jumpPos.y+":end:"+isEnd);
				ref.setParams(1,msg.costTime,destPoint,isEnd);
				role.stateMachine.removeState(RoleStateType.ACTION_JUMP);//先移除状态 避免相同状态冲突
				role.stateMachine.transition(RoleStateType.ACTION_JUMP, ref,true);
			}
		}
		
		
		private function onResPlayerDieMessage(msg:ResPlayerDieMessage):void
		{
			if(msg.personId.ToGID()==MainRoleManager.actor.id)
			{
				var mapID : int = SceneSwitchManager.currentMapId;
				var cfg : SceneData = MapDataManager.getMapInfo(mapID);
				var qmap:Q_map=cfg.getData();
				if(qmap.q_revive_area!=0||qmap.q_rose_resurrection!=1){
					AppManager.showApp(AppConstant.DIE_PANEL,msg);
				}
				EventManager.dispatchEvent(MainPlayerEvent.PLAYER_DIE);
				SceneManager.scene.addGrayScene();
			}
		}
		
		private function onResArmorChangeMessage(msg:ResArmorChangeMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if(!role){
				return;
			}
			role.updateCloth(msg.armorResId);
		}
		
		private function onResHelmChangeMessage(msg:ResHelmChangeMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if(!role){
				return;
			}
			role.updateHair(msg.helmResId);
		}
		private function onResWeaponChangeMessage(msg:ResWeaponChangeMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if(!role){
				return;
			}
			role.updateWeapon(msg.weaponResId);
			role.updateDeputyWeapon(msg.weaponResId);
		}
		
		/**
		 * 服务器已经把客户端添加到场景，客户端可以进入场景
		 * @param buffer
		 *
		 */
		private function RecvEnterMapMessage(msg:ResEnterMapMessage):void
		{
			GameLog.addShow("收到成功进入地图消息");
			if (MainRoleManager.actorInfo.totalStat.level==1) 
			{
				Statistics.intance.pushNode(Statistics.STEP_ENTER_MAP,"首次登陆成功进入场景");
			}
			//			var infoID : uint = buffer.readVarint32();
			//			var pkMode : uint = infoID & 15;
			var line : uint = msg.line;
			//			var sceneSequence : uint = (infoID >>> 12);
			
			var playerData : HeroData = MainRoleManager.actorInfo;
			if (playerData == null)
				return;
			RoleData.readGeneric(playerData, new Point(msg.pos.x,msg.pos.y));
			
			//			playerData.pkMode = pkMode;
			playerData.line = line;
			playerData.sceneSequence = 0;
			
			EventManager.dispatchEvent(MapEvent.MAP_SWITCH_COMPLETE);

			EventManager.dispatchEvent(MapEvent.MAP_FLY_COMPLETE);
			
			//			CountryWarChengMenManager.checkChengMenStatus();
			
			if (playerData.totalStat.hp > 0)
				ReliveManager.hideRelivePanel();
			
			//			if (pkMode > 0)
			//				EventManager.dispatchEvent(MainPlayerEvent.PK_MODE_CHANGE);
		}
		
		/**
		 * 这个协议本来没有用的，但是现在有一个情况是当主角释放技能失败时，服务器会让主角停止走路，而客户端的主角本来是客户端自己
		 * 控制的，所以，主角一直到不了目标点，导致，主角一直在播行走的动作。停不下来了，所以这里临时处理下当主角释放技能失败，服务器要求停止主角
		 * 寻路的话，就让主角停下来
		 * @param msg
		 * 
		 */		
		private function RecvResPlayerStopMessage(msg:ResPlayerStopMessage):void
		{
			//			var objId : Number = msg.personId.ToGID();
			//			if(MainRoleManager.actorID == objId)
			//			{
			//				var posX : int = msg.position.x;
			//				var posY : int = msg.position.y;
			//				
			//				var role : SceneRole = SceneManager.getSceneObjByID(objId) as SceneRole;
			//				if (role && role.usable)
			//				{
			//					var walkMoveRef : WalkMoveStateReference;
			//					var stopWalkRef : StopWalkMoveStateReference;
			//					walkMoveRef = role.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
			//					walkMoveRef.isServerStop = true;
			//					stopWalkRef = role.stateMachine.getReference(StopWalkMoveStateReference) as StopWalkMoveStateReference;
			//					stopWalkRef.setParams(posX, posY);
			//					role.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, stopWalkRef);
			//					if (role.stateMachine.isPrewarWaiting)
			//						role.stateMachine.transition(RoleStateType.ACTION_PREWAR);
			//					else
			//						role.stateMachine.transition(RoleStateType.ACTION_IDLE);
			//				}
			//				return;
			//			}
		}
		
		/**
		 * 对象的位置修正消息，服务器一般在需要对象停止的时候发送，但跳跃等移动状态不匹配也会发送，需要针对性修正 
		 * @param msg
		 */		
		private function RecvResPlayerRunEndMessage(msg:ResPlayerRunEndMessage):void
		{	
			var objId : Number = msg.personId.ToGID();
			if(MainRoleManager.actorID == objId)
			{
				//				trace("主角自己，不用同步了吧！不然，场景会跳一下，体验不好！");
				return;
			}
			
			var posX : int = msg.position.x;
			var posY : int = msg.position.y;
			GameLog.addShow("%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 收到对象停止消息 :   " + posX + "   " + posY);
			GameLog.addShow("============================= 收到对象停止消息，对象id为：" + msg.personId.ToString());
			var role : SceneRole = SceneManager.getSceneObjByID(objId) as SceneRole;
			if (role && role.usable)
			{
				var walkMoveRef : WalkMoveStateReference;
				var stopWalkRef : StopWalkMoveStateReference;
				
				/////////////////伪装者停止移动
				var camouflageEntity : SceneRole = SceneRole(role.getCamouflageEntity());
				if (camouflageEntity)
				{
					walkMoveRef = camouflageEntity.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
					walkMoveRef.isServerStop = true;
					stopWalkRef = camouflageEntity.stateMachine.getReference(StopWalkMoveStateReference) as StopWalkMoveStateReference;
					stopWalkRef.setParams(posX, posY);
					camouflageEntity.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, stopWalkRef);
					if (camouflageEntity.stateMachine.isPrewarWaiting)
						camouflageEntity.stateMachine.transition(RoleStateType.ACTION_PREWAR);
					else
						camouflageEntity.stateMachine.transition(RoleStateType.ACTION_IDLE);
				}
				else
				{
					walkMoveRef = role.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
					walkMoveRef.isServerStop = true;
					stopWalkRef = role.stateMachine.getReference(StopWalkMoveStateReference) as StopWalkMoveStateReference;
					stopWalkRef.setParams(posX, posY);
					role.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, stopWalkRef);
					if (role.stateMachine.isPrewarWaiting)
						role.stateMachine.transition(RoleStateType.ACTION_PREWAR);
					else
						role.stateMachine.transition(RoleStateType.ACTION_IDLE);
				}
			}
		}
		
		private function RecvResPlayerRunFailMessage(msg:ResPlayerRunFailMessage):void
		{
			if(msg.personId.ToGID() != MainRoleManager.actorID)
			{
				GameLog.addShow("ResPlayerRunEndMessage这个message根本就不应该来！应该是针对主角的");
				return;
			}
			var posX : uint = msg.position.x;
			var posY : uint = msg.position.y;
			var walkMoveRef : WalkMoveStateReference = MainRoleManager.actor.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
			walkMoveRef.isServerStop = true;
			var stopWalkRef : StopWalkMoveStateReference = MainRoleManager.actor.stateMachine.getReference(StopWalkMoveStateReference) as StopWalkMoveStateReference;
			stopWalkRef.setParams(posX, posY);
			MainRoleManager.actor.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, stopWalkRef);
			if (MainRoleManager.actor.stateMachine.isPrewarWaiting)
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_PREWAR);
			else
				MainRoleManager.actor.stateMachine.transition(RoleStateType.ACTION_IDLE);
			var camouflageEntity : SceneRole = SceneRole(MainRoleManager.actor.getCamouflageEntity());
			if (camouflageEntity)
			{
				walkMoveRef = camouflageEntity.stateMachine.getReference(WalkMoveStateReference) as WalkMoveStateReference;
				walkMoveRef.isServerStop = true;
				stopWalkRef = camouflageEntity.stateMachine.getReference(StopWalkMoveStateReference) as StopWalkMoveStateReference;
				stopWalkRef.setParams(posX, posY);
				camouflageEntity.stateMachine.transition(RoleStateType.CONTROL_STOP_WALK_MOVE, stopWalkRef);
				if (camouflageEntity.stateMachine.isPrewarWaiting)
					camouflageEntity.stateMachine.transition(RoleStateType.ACTION_PREWAR);
				else
					camouflageEntity.stateMachine.transition(RoleStateType.ACTION_IDLE);
			}
			NoticeManager.showNotify("英雄移动失败");
		}
		
		/**
		 * 场景中有英雄/怪物/宠物啥的 移动了, 包含每个节点, 从起始节点出发的时间和速度. 到达每个节点的时间都是可以推算出来的
		 * @param buffer
		 *
		 */
		private function RecvSCSceneObjMoveMessage(msg:SCSceneObjMoveMessage):void
		{
			//chongci
			if(msg.objId.ToGID() == MainRoleManager.actorID&&msg.type!=1)
			{
//				trace("这里不应该有主角自己的呀！主角自己的移动不需要同步到自己吧！！！");
				return;
			}
			var role : SceneRole = SceneManager.getSceneObjByID(msg.objId.ToGID()) as SceneRole;
			if(!role){
				trace("居然同步了一个不存在的角色啊!!");
				return;
			}
			if (role && role.usable &&SceneCharType.GIRL_PET==role.type&&role.ownerIsMainChar) 
			{
				return;
			}
			var mInfo : RoleMoveInfo = new RoleMoveInfo();
			mInfo.setValue(msg);
			
			if (role && role.usable && !role.getCamouflageEntity()) //有伪装则跟随伪装，防止服务器发伪装者移动。
			{
				var elapseTm : int = SystemTimeManager.curtTm - mInfo.startTm;
				//trace("寻路开始时间：" + mInfo.startTm, "_差值：" + elapseTm + "_服务器时间 ：" + SystemTimeManager.curtTm);
				RoleStateUtil.walkByInfos(mInfo);
				
				//调试bug用，可以删除！！！！
				/*if (!ClientConfig.isBanShu && !ClientConfig.isStable)
				{
				var lastPathPos : Vector3D = null;
				var time : Number = 0;
				var dis : Number = 0;
				var lastPos : Point = new Point();
				var len : int = mInfo.pathList.length;
				var currTime : Number = SystemTimeManager.curtTm;
				var lastTime : Number = currTime;
				var pos : Point;
				for (var i : int = 0; i < len; i++)
				{
				pos = mInfo.pathList[i];
				if (lastPathPos)
				{
				lastPos.x = lastPathPos.x;
				lastPos.y = lastPathPos.z;
				dis = MathUtil.getDistance(pos.x, pos.y, lastPos.x, lastPos.y);
				time = time + (dis / mInfo.speed * 1000);
				}
				else
				{
				time = mInfo.startTm;
				}
				lastPathPos = new Vector3D(pos.x, 0, pos.y);
				if (time < currTime)
				lastTime = time;
				else
				break;
				}
				
				var delay : int = currTime - lastTime;
				if (delay > 0)
				{
				var pathInfo : String = "";
				for each (pos in mInfo.pathList)
				{
				pathInfo += pos.x + "," + pos.y + " | ";
				}
				GameAlert.debugShow("发现一个延迟" + delay + "的角色：" + role.id + "-" + role.name + //
				"，出生点：" + (role.data as RoleData).x + "，" + (role.data as RoleData).y + //
				"，当前坐标：" + role.x + "," + role.z + //
				"，路径：" + pathInfo);
				}
				}*/
			}
		}
		
		private function RecvResRoundObjectsMessage(msg:ResRoundObjectsMessage):void
		{
//			GameLog.addShow("ResRoundObjectsMessage  通知来了！ 看看通知了什么！ \t 删除对象个数：" + msg.removeObjs.length);
//			GameLog.addShow("ResRoundObjectsMessage  通知来了！ 添加对象个数：" + msg.objInfos.length);
			var delArr:Vector.<long> = msg.removeObjs;
			for(var i:int=0;i<delArr.length;i++)
			{
				var roleID:uint = delArr[i].ToGID();
				onSceneRemoveObject(roleID);
				SpellEffectRecordCtrl.clear(roleID);
//				GameLog.addShow("删除对象客户端id：" + roleID);
//				GameLog.addShow("删除对象服务器id：" + delArr[i].ToString());
			}
			
			var addArr:Vector.<SceneObjInfo> = msg.objInfos;
			for(var j:int=0;j<addArr.length;j++)
			{
				var sceneCharType:int = addArr[j].objType;
				
				var k:int=0;
				var len:int = addArr[j].bytesList.length;
				
				switch(String(sceneCharType))
				{
					case SceneCharType.PLAYER:
						for(k=0;k<len;k++)
						{
							onAddHero(addArr[j].bytesList[k]);
						}
						break;
					case SceneCharType.MONSTER:
						for(k=0;k<len;k++)
						{
							addMonster(addArr[j].bytesList[k]);
						}
						break;
					case SceneCharType.NPC:
						for(k=0;k<len;k++)
						{
							addNpc(addArr[j].bytesList[k]);
						}
						break;
					case SceneCharType.DROP_GOODS:
						for(k=0;k<len;k++)
						{
							addDropGoods(addArr[j].bytesList[k]);
						}
						break;
					case SceneCharType.TRAP:
						for (k = 0; k < len; ++k) {
							addTrap(addArr[j].bytesList[k]);
						}
						break;
					case SceneCharType.GIRL_PET:
						for(k=0;k<len;k++)
						{
							addGirlPet(addArr[j].bytesList[k]);
						}
						break;
					case SceneCharType.SCULPTURE:
						for(k=0;k<len;k++)
						{
							addSculpture(addArr[j].bytesList[k]);
						}
						break;
				}
			}
		}
		
		private function onResRoundMonsterDisappearMessage(msg:ResRoundMonsterDisappearMessage):void
		{
//			GameLog.addShow("onResRoundMonsterDisappearMessage  通知来了！ 看看通知了什么！ \t 删除对象个数：" + msg.monstersIds.length);
			var delArr:Vector.<long> = msg.monstersIds;
			for(var i:int=0;i<delArr.length;i++)
			{
				var roleID:uint = delArr[i].ToGID();
				onSceneRemoveObject(roleID);
//				GameLog.addShow("删除对象客户端id：" + roleID);
//				GameLog.addShow("删除对象服务器id：" + delArr[i].ToString());
			}
			
		}
		
		private function onResRoundPetMessage(msg:ResRoundPetMessage):void
		{
			GameLog.addShow("onResRoundPetMessage  通知来了！ 同步美人");
			
			var data:GirlPetData=new GirlPetData();
			data.setServerData(msg.pet);
			SceneRoleManager.getInstance().createGirlPet(data);
			if (msg.pet.positions.length>0) 
			{
				var mInfo : RoleMoveInfo = new RoleMoveInfo();
				mInfo.setValues(data.id,data.totalStat.getStatValue(CharAttributeType.SPEED), SystemTimeManager.curtTm,Position.FromXY(msg.pet.x,msg.pet.y),msg.pet.positions);
				RoleStateUtil.walkByInfos(mInfo);
			}
			GameLog.addShow("同步对象服务器id：" + msg.pet.petId.ToString()+"\n"+"美人位子:"+msg.pet.x+"_"+msg.pet.y);
		}
		
		private function onResRoundPetDisappearMessage(msg:ResRoundPetDisappearMessage):void
		{
			GameLog.addShow("onResRoundPetDisappearMessage  通知来了！ 删除美人");		
			var delArr:Vector.<long> = msg.petIds;
			for(var i:int=0;i<delArr.length;i++)
			{
				var roleID:uint = delArr[i].ToGID();
				onSceneRemoveObject(roleID);
				GameLog.addShow("删除对象客户端id：" + roleID);
				GameLog.addShow("删除对象服务器id：" + delArr[i].ToString());
			}
		}
		
		private function onResPetTranMoveMessage(msg:ResPetTranMoveMessage):void
		{
			GameLog.addShow("onResPetTranMoveMessage 美人传送：" + msg.petId.ToString());
			var role:SceneRole=SceneManager.getSceneObjByID(msg.petId.ToGID()) as SceneRole;	
			if(role)
			{
				var p:Point=SceneRoleManager.getInstance().getPetPoint(msg.position..x,msg.position.y,0);
				role.setGroundXY(msg.position.x,msg.position.y);
			}
			else
			{
				GameLog.addShow("场景中已经没有这个对象了：" + msg.petId.ToString());
			}
		}
		
		private function addSculpture(buffer:ByteArray):void
		{
			var info:TopLeaderInfo=new TopLeaderInfo();
			info.read(buffer);
			var sculp:SculptureData = new SculptureData(RoleType.Type_SCULPTURE);
			sculp.id = info.id.ToGID();
			sculp.modleId = info.modelId;
			sculp.name = info.playerName;
			sculp.roleId = info.playerId;
			sculp.updataTopType(info.topType);
			var qData : Q_monster = MonsterDataManager.getData(info.modelId);
			sculp.avatarRes = qData.q_body_res;
			sculp.x = info.position.x;
			sculp.y = info.position.y;
			SceneRoleManager.getInstance().createSculpture(sculp);
		}
		
		private function addGirlPet(buffer:ByteArray):void
		{
			var info:PetInfo=new PetInfo();
			info.read(buffer);
			var data:GirlPetData=new GirlPetData();
			data.setServerData(info);
			SceneRoleManager.getInstance().createGirlPet(data);
			if (info.positions.length>0) 
			{
				var mInfo : RoleMoveInfo = new RoleMoveInfo();
				mInfo.setValues(data.id,data.totalStat.getStatValue(CharAttributeType.SPEED), SystemTimeManager.curtTm,Position.FromXY(info.x,info.y),info.positions);
				RoleStateUtil.walkByInfos(mInfo);
			}
		}
		private function addDropGoods(buffer:ByteArray):void
		{
			var info:DropGoodsInfo=new DropGoodsInfo();
			info.read(buffer);
			var data:SceneDropGoodsData=new SceneDropGoodsData();
			data.updateWithGoodsData(info);
			data.isDroped=true;
			SceneRoleManager.getInstance().createDropGoods(data);
		}
		
		private function addTrap(buffer : ByteArray) : void {
			var info : AttachInfo = new AttachInfo();
			info.read(buffer);
			var cfg : Attach_effect = AttachEffectCfgData.getInfo(info.modelId);
			if (null == cfg) {
				GameLog.add("陷阱配置不存在:" + data.modelId);
				return;
			}
			var data : TrapInfo = new TrapInfo(info.id, info.id.ToGID(), info.modelId, info.state, info.position.x, info.position.y);
			SceneManager.addSceneObjToScene(data.normalEffect, true, false, false);
		}
		
		/**
		 * 把一个英雄/怪物/宠物等从视野中删除
		 * @param buffer
		 *
		 */
		private function onSceneRemoveObject(roleID : uint) : void
		{
			var unit : BaseObj3D = SceneManager.getSceneObjByID(roleID);
			if (null == unit) {
				return;
			}
			if (unit is SceneRole) {
				var sceneRole : SceneRole = unit as SceneRole;
				if(sceneRole != null )
				{
					var data:MonsterData = sceneRole.data as MonsterData;
					if( data != null )
					{
						TouJingManager.setHuGuoSiEffect(data.modelID, sceneRole, false);
						var sceneClientRole:SceneRole = SceneManager.getSceneClientNpcByModelId( data.modelID);
						if( sceneClientRole != null )
						{
							sceneClientRole.visible = true;
							TouJingManager.setHuGuoSiEffect(data.modelID, sceneClientRole, true);						
						}
					}else if(sceneRole.data is SceneDropGoodsData){
						DropGoodsManager.getInstance().removeDropGoods(sceneRole.data as SceneDropGoodsData);
					}
				}
				SceneRoleManager.getInstance().removeSceneRoleById(roleID);
				return;
			}
			if (unit is RenderUnit3D){
				var trap : RenderUnit3D = unit as RenderUnit3D;
				if (null != trap && (trap.data is TrapInfo)) {
					var trapInfo : TrapInfo = trap.data as TrapInfo;
					if (trapInfo.effect) {
						trapInfo.effect.stop();
					}
					if (trapInfo.normalEffect) {
						trapInfo.normalEffect.stop();
					}
					SceneManager.removeSceneObjFromScene(trapInfo.effect);
					SceneManager.removeSceneObjFromScene(trapInfo.normalEffect);
					return;
				}
			}
			SceneManager.removeSceneObjFromScene(unit);
		}
		
		/**
		 * 其他玩家进入主角视野区
		 * @param buffer
		 *
		 */
		private function onAddHero(buffer : ByteArray) : void
		{
			var data : HeroData = new HeroData(LoadPriorityType.LEVEL_CUSTOM_2);
			
			var info:PlayerInfo = new PlayerInfo();
			info.read(buffer);
			
			HeroData.setEnterEyeUserInfo(data, info);
			var sceneRole : SceneRole = SceneRoleManager.getInstance().createHero(data);
			
			GameLog.addShow("添加角色对象id：" + data.id);
			GameLog.addShow("添加对象服务器id：" + data.serverID.ToString());
			//角色自带寻路
			if (info.positions.length>0) 
			{
				var mInfo : RoleMoveInfo = new RoleMoveInfo();
				mInfo.setValues(data.id,data.totalStat.getStatValue(CharAttributeType.SPEED), SystemTimeManager.curtTm,info.position,info.positions);
				RoleStateUtil.walkByInfos(mInfo);
			}
			
			(sceneRole.headFace as HeadFace).updateGuildWarInfoBar(info.keyValueList);
			
			//			var otherHeroBiaoMap:HashMap = YunBiaoManager._otherBiaoCheHashMap;
			//			if( otherHeroBiaoMap.getValue( data.id ) != null )
			//				data.biaoCheData = otherHeroBiaoMap.getValue( data.id );
			//			
			//			if (data.zhanCheOwnerID > 0)
			//			{
			//				CountryWarZhanCheManager.addPassengerID(data.zhanCheOwnerID, data.id);
			//				var zhanCheID : Number = CountryWarZhanCheManager.getZhanCheID(data.zhanCheOwnerID);
			//				var zhanChe : SceneRole = SceneManager.getSceneObjByID(zhanCheID) as SceneRole;
			//				if (zhanChe)
			//				{
			//					sceneRole.setCamouflageEntity(zhanChe);
			//				}
			//			}
			//			else if (data.isInBiao)
			//			{
			//				YunBiaoManager.setCamouflageEntity(sceneRole, false, data.isInBiao);
			//			}
		}
		
		/**
		 * 其他怪物进入主角视野区
		 * @param buffer
		 *
		 */
		private function addMonster(buffer : ByteArray) : void
		{
			var info : MonsterInfo = new MonsterInfo();
			info.read(buffer);
			var qData : Q_monster = MonsterDataManager.getData(info.modelId);
			var data : MonsterData;
			var sceneRole : SceneRole;
			if(qData==null)return;
			if(qData.q_monster_type==MonsterType.COLLECT)//如果是采集物 去走采集物创建流程
			{
				var collectData : SceneCollectData = new SceneCollectData();
				collectData.serverID = info.monsterId;
				collectData.id = info.monsterId.ToGID();
				collectData.modelID = info.modelId;
				collectData.sceneID = info.mapModelId;
				collectData.distributeId=info.distributeId;
				collectData.name = qData.q_name;
				collectData.avatarRes = qData.q_body_res;
				collectData.sizeScale = qData.q_scale > 0 ? (qData.q_scale * 0.01) : 1;
				//collectData.direction = qData.q_direction;
				collectData.direction=info.dir;
				collectData.x = info.position.x;
				collectData.y = info.position.y;
				collectData.isDynamicCreate =true;
				collectData.relation=info.relation;
				collectData.faction=info.faction;
				SceneRoleManager.getInstance().createCollect(collectData);
			}
			else if(qData.q_monster_type==MonsterType.NPC)//npc创建流程
			{
				data = new MonsterData(RoleType.TYPE_NPC);
				data.serverID = info.monsterId;
				data.id = info.monsterId.ToGID();
				data.modelID = info.modelId;
				data.distributeId=info.distributeId;
				RoleData.readMonster(data,info);
				sceneRole =SceneRoleManager.getInstance().createNPC(data, SceneCharType.NPC);	
				
				GameLog.addShow("添加NPC客户端id：" + data.id);
				GameLog.addShow("添加NPC服务器id：" + data.serverID.ToString());
			}
			else//走怪物创建流程
			{
				data = new MonsterData(RoleType.TYPE_MONSTER);
				data.serverID = info.monsterId;
				data.id = info.monsterId.ToGID();
				data.modelID = info.modelId;
				data.distributeId=info.distributeId;
				RoleData.readMonster(data,info);
				sceneRole =SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
//				GameLog.addShow("添加怪物客户端id：" + data.id);
//				GameLog.addShow("添加怪物服务器id：" + data.serverID.ToString());
			}
			if (sceneRole&&info.positions.length>0) 
			{
				var mInfo : RoleMoveInfo = new RoleMoveInfo();
				mInfo.setValues(data.id,info.speed, SystemTimeManager.curtTm,info.position,info.positions);
				RoleStateUtil.walkByInfos(mInfo);
			}
			
		}
		
		/**
		 * 场景中添加了一只剧情保护怪物
		 *
		 * 参数跟添加怪物一毛一样的
		 */
		private function onAddStoryProtectMonster(buffer : ByteBuffer) : void
		{
			//			var data : MonsterData = new MonsterData(RoleType.TYPE_PROTECT_NPC);
			//			data.id = buffer.readVarint64();
			//			data.modelID = buffer.readVarint32();
			//			RoleData.readGeneric(data, buffer);
			//			SceneRoleManager.getInstance().createMonster(data, SceneCharType.PROTECT_NPC);
		}
		
		/**
		 * NPC进入主角视野区
		 * @param buffer
		 *
		 */
		private function addNpc(buffer : ByteArray) : void
		{
			var data : MonsterData = new MonsterData(RoleType.TYPE_NPC,LoadPriorityType.LEVEL_CUSTOM_1);
			
			var info : NpcInfo = new NpcInfo();
			data.serverID = info.npcId;
			data.id = info.npcId.ToGID();
			data.modelID = info.npcModelId;
			RoleData.readNpc(data, info);
			
			var sceneRole : SceneRole = SceneRoleManager.getInstance().createMonster(data, SceneCharType.NPC);
			TouJingManager.setHuGuoSiEffect(data.modelID, sceneRole, true);
			var sceneClientRole : SceneRole = SceneManager.getSceneClientNpcByModelId(data.modelID);
			if (sceneClientRole != null)
			{
				sceneClientRole.visible = false;
				TouJingManager.setHuGuoSiEffect(data.modelID, sceneClientRole, false);
			}
			//			CountryWarWorshipManager.checkShowOrHideKing(data.modelID, data.id);
		}
		
		/**
		 * 护送NPC进入主角视野区
		 * @param buffer
		 *
		 */
		private function addSentNpc(buffer : ByteBuffer) : void
		{
			//			var ownerId : Number = buffer.readVarint64();
			//			var ownerName : String = buffer.readUTF();
			//			var data : MonsterData = new MonsterData(RoleType.TYPE_NPC);
			//			data.id = buffer.readVarint64();
			//			data.modelID = buffer.readVarint32();
			//			data.ownerId = ownerId;
			//			data.ownerName = ownerName;
			//			RoleData.readGeneric(data, buffer);
			//			SceneRoleManager.getInstance().createMonster(data, SceneCharType.NPC);
			//			var escortInfo : TaskFollowEscortInfo = TaskInfoDecoder.currentEscortInfo;
			//			if (escortInfo && ownerId == MainRoleManager.actorID)
			//			{
			//				escortInfo.roleId = data.id;
			//				EventManager.dispatchEvent(TaskEvent.TASK_TARGET_PROGRESS_UPDATED, [TaskManager.currentMainTaskInfo ? TaskManager.currentMainTaskInfo.id : 0, 0]);
			//			}
		}
		
		/**
		 * 广播人物战斗属性变化消息( 血量最大血量一类 )
		 * @param msg
		 */
		private function RecvBroadcastPlayerAttriChangeMessage(msg : BroadcastPlayerAttriChangeMessage):void
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.playerid.ToGID()) as SceneRole;
			if (!role)
				return;
			var roleData : RoleData = role.data as RoleData;
			CharAttributeManager.setAttributeValue(roleData,msg.attributeChange.type, msg.attributeChange.value,msg.showEffect);
			
			if(msg.attributeChange.type==CharAttributeType.LV){//升级了
				var animatData : Q_SpellAnimation=AnimationDataManager.getData(9999);//获取升级动画
				SpellAnimationHelper.addTargetEffect(	role, 
					RenderUnitID.LEVEL, 
					RenderUnitType.LEVEL, 
					animatData.role_res,
					animatData.bind_bone);
			}
			
			if (roleData.totalStat.hp <= 0)
			{
				role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			
			if(roleData.id == MainRoleManager.actorID)
			{
				if(msg.attributeChange.type==CharAttributeType.HP)
				{
					EventManager.dispatchEvent(MainPlayerEvent.SELFHP_CHANGE);
				}
				else if (msg.attributeChange.type==CharAttributeType.LV) 
				{
					EventManager.dispatchEvent(MainPlayerEvent.LEVEL_CHANGE);
				}
				//				ReliveManager.autoHideRelive();
			}
			if (CharAttributeType.SPEED==msg.attributeChange.type) 
			{
				RoleStateUtil.updateMoveBySpeedChange(role);
			}
		}
		
		/**
		 * 服务器发来的切场景协议
		 * @param buffer
		 */
		private function onResChangeMapMessage(msg : ResChangeMapMessage) : void
		{
			if(!StartGame.isInitMap)return;
			ReqLockUtil.unlockReq(101206);
			//			ReqLockUtil.unlockReq(MazeModuleMessages.C2S_TRY_TRANSPORT);
			
			var mapId : int = msg.mapId;
			MainRoleManager.actorInfo.preMapID=MainRoleManager.actorInfo.mapID;
			trace(MainRoleManager.actorInfo.mapID);
			MainRoleManager.actorInfo.mapID = mapId;
			SceneSwitchManager.changeMap();
			
		}
		
		/**
		 * 传送成功后，返回这个消息，只表示成功
		 */
		private function onSceneMapTransport(buffer : ByteBuffer) : void
		{
			
		}
		
		/**
		 * 地图传送失败，附带Byte错误码
		 * 1、英雄不在普通场景中
		 * 2、传送道具不足
		 * 3、英雄已经在这个场景了
		 * 4、客户端发送的场景ID不是普通场景
		 * 5、英雄等级不足，还不能进入场景
		 * 6、数据异常(客户端发送的物品不是传送物品ID,发送的物品位置是null,发送的物品位置是上物品已过期,发送的物品位置上的物品个数不足)
		 * 7、帮派战期间 (板块战, 无双城, 皇城争霸)
		 * 8、英雄已经死亡，不能够地图传送
		 * 9、战斗中
		 * 10、你在他国
		 * 11、元宝不足
		 */
		private function onResChangeMapFailedMessage(msg : ResChangeMapFailedMessage) : void
		{
			ReqLockUtil.unlockReq(101206);
			GameLog.addShow("现在暂时没有切换场景失败的错误提示信息！因为目前，后端没有告诉客户端为什么会切换场景失败！");return;
			var failId : int = msg.getId();
			switch (failId)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL1);
					return;
				case 2:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL2);
					return;
				case 3:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL3);
					return;
				case 4:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL4);
					return;
				case 5:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL5);
					return;
				case 6:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL6);
					return;
				case 7:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL7);
					return;
				case 8:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL8);
					return;
				case 9:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL9);
					return;
				case 10:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL10);
					return;
				case 11:
					NoticeManager.showHint(EnumHintInfo.SCENE_TRANSPORT_FAIL11);
					return;
			}
		}
		
		
		private function onResRoundGoodsMessage(msg:ResRoundGoodsMessage):void
		{
			var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
			dropGoodsData.setGoodsMsg(msg);
			dropGoodsData.isDroped=true;
			SceneRoleManager.getInstance().createDropGoods(dropGoodsData)
		}
		
		private function onResRoundGoodsExtraMessage(msg:ResRoundGoodsExtraMessage):void
		{
			var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
			dropGoodsData.setGoodsExtraMsg(msg);
			dropGoodsData.isDroped=true;
			SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
		}
		
		private function onResReviveSuccessMessage(msg : ResReviveSuccessMessage) : void 
		{
			var role : SceneRole = SceneManager.getSceneObjByID(msg.personId.ToGID()) as SceneRole;
			if (!role)
				return;
			var roleData : RoleData = role.data as RoleData;
			(role.headFace as HeadFace).showBloodBar();
			CharAttributeManager.setAttributeValue(roleData, CharAttributeType.HP, msg.hp);
			role.stateMachine.transition(RoleStateType.ACTION_IDLE, null, true); //切换到“站立状态”
			//			SceneManager.removeSceneObjFromScene(role);
			//			role = SceneRoleManager.getInstance().createHero(roleData as HeroData);
			
			//to do 给这个人播放一个复活特效 
			SpellAnimationHelper.addTargetEffect(role, 
				RenderUnitID.LEVEL, 
				RenderUnitType.LEVEL, 
				EffectUrl.RELIVE_NORMAL);
			if(roleData.id == MainRoleManager.actorID)
			{
				ReliveManager.autoHideRelive();
			}
			if(roleData.id == MainRoleManager.actorID)
			{
				SceneManager.scene.removeGrayScene();
				ReliveManager.autoHideRelive();
				EventManager.dispatchEvent(MainPlayerEvent.SELFHP_CHANGE);
				EventManager.dispatchEvent(MainPlayerEvent.REVIVE_SUCCESS);
				var mapID : int = SceneSwitchManager.currentMapId;
				var cfg : SceneData = MapDataManager.getMapInfo(mapID);
				var qmap:Q_map=cfg.getData();
				if(qmap.q_rebirth_autofight==1&&cfg.getData().q_autofight_seat){//进入后自动战斗
					var p:Array=JSONUtil.decode(cfg.getData().q_autofight_seat);
					//MainRoleSearchPathManager.walkToScene(SceneSwitchManager.currentMapId, p[0], p[1],finishWalk, 100);
					var pos:Array=[SceneSwitchManager.currentMapId,p[0],p[1]];
					TrusteeshipManager.getInstance().startAutoFightToPos(pos);
				}
				else
				{
					TaskAutoManager.getInstance().stopAll();//死亡复活终止挂机
				}
			}
			else
			{
				role.mouseEnable = true;
			}
			
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////
		////// 以下为参考代码，是深圳那边的后台协议，不适用
		//////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * 收到主角同场景传送消息
		 */
		private function onRecHeroTpSameScene(buffer : ByteBuffer) : void
		{
			var tX : uint = buffer.readVarint32();
			var tY : uint = buffer.readVarint32();
			
			var hp : uint = buffer.readVarint32();
			var maxHp : uint = buffer.readVarint32();
			
			var playerData : HeroData = MainRoleManager.actorInfo;
			if (playerData == null)
				return;
			
			//			playerData.x = tX;
			//			playerData.y = tY;
			//			playerData.hp = hp;
			//			playerData.totalStat.life = maxHp;
			
			TrusteeshipManager.getInstance().stopAll();
			MainRoleManager.updateActorStatus();
			GameCameraManager.tryUseCameraProperty();
		}
		
		
		
		private function onHeroTp(buffer : ByteBuffer) : void
		{
			onAddHero(buffer);
		}
		
		/**
		 * NPC传送成功
		 */
		private function onNpcTransSuccess(buffer : ByteBuffer) : void
		{
			AppManager.hideApp(AppConstant.TASK_DIAILOG_FUNC_PANEL);
		}
		
		/**
		 *  NPC传送失败
		 */
		public static function onNpcTransFail(buffer : ByteBuffer) : void
		{
			var failtype : int = buffer.readVarint32();
			var infostr : String;
			switch (failtype)
			{
				case 1:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_47);
					break;
				case 2:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_48);
					break;
				case 3:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_49);
					break;
				case 4:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_50);
					break;
				case 5:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_51);
					break;
				case 6:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_52);
					break;
				case 7:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_53);
					break;
				case 8:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_54);
					break;
				case 9:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_55);
					break;
				default:
					infostr = LanguageConfig.getText(LangQ_NoticeInfo.ErrorMsgNoticeManager_56);
					break;
			}
			NoticeManager.showNotify(infostr);
		}
		
		
		
		
		
		/**
		 * 同步任务护送npc所在位置
		 *
		 * varint32 任务id
		 * varint64 npc的id
		 * varint32 场景id
		 * varint32 场景所属国家
		 * varint32 场景所属线
		 * varint32 场景x
		 * varint32 场景y
		 */
		private function onSceneSyncSentNpcPos(buffer : ByteBuffer) : void
		{
			var taskId : int = buffer.readVarint32();
			var npcId : Number = buffer.readVarint64();
			var sceneId : int = buffer.readVarint32();
			var countryId : int = buffer.readVarint32();
			var lineId : int = buffer.readVarint32();
			var x : int = buffer.readVarint32();
			var y : int = buffer.readVarint32();
			if (TaskManager.currentMainTaskInfo && TaskManager.currentMainTaskInfo.id == taskId && sceneId == MainRoleManager.actorInfo.mapID && MainRoleManager.actorInfo.countryId == countryId)
			{
				var escortInfo : TaskFollowEscortInfo = TaskInfoDecoder.currentEscortInfo;
				if (escortInfo)
				{
					escortInfo.rolePosX = x;
					escortInfo.rolePosY = y;
				}
			}
		}
		
		
		/**
		 * 离开副本失败, 附带varint32 错误码
		 *
		 * 1. 你不在副本中 (可能不在副本或者在加载中还没进入场景)
		 */
		private function onLeaveDungeonFail(buffer : ByteBuffer) : void
		{
			//			ReqLockUtil.unlockReq(101218);
			//			var failID : int = buffer.readVarint32();
			//			var failReason : String;
			//			switch (failID)
			//			{
			//				case 1:
			//					failReason = LangText.SCENE_LEAVE_DUNGEON_FAIL;
			//					return;
			//			}
			//			NoticeManager.showNotify(failReason, failID);
		}
		
		/**
		 * 离开副本成功, 紧接着会收到切场景消息. 解锁
		 *
		 * 没有附带信息
		 */
		private function onLeaveDungeonSuccess(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(101218);
		}
		
		/**
		 * 英雄跳广播
		 *
		 * 附带
		 *
		 * varint64 id
		 *
		 * varint32 跳跃动作
		 */
		private function onHeroJump(buffer : ByteBuffer) : void
		{
			var roleId : Number = buffer.readVarint64();
			var jumpAction : int = buffer.readVarint32();
			var role : SceneRole = SceneManager.getSceneObjByID(roleId) as SceneRole;
			if (role && role.usable)
			{
				var ref : JumpStateReference = role.stateMachine.getReference(JumpStateReference) as JumpStateReference;
				ref.setParams(jumpAction);
				role.stateMachine.transition(RoleStateType.ACTION_JUMP, ref);
			}
		}
		
		/** 跳跃失败
		 *
		 * 附带varint32的失败原因
		 *
		 * 1. 你已经挂了, 别瞎跳了
		 *
		 * 2. cd未到 (已删)
		 *
		 * 3. 晕眩中
		 *
		 * 4. 正在施法
		 */
		private function onHeroJumpFail(buffer : ByteBuffer) : void
		{
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangText.SCENE_HERO_JUMP_FAIL_1;
					return;
				case 2:
					failReason = LangText.SCENE_HERO_JUMP_FAIL_2;
					return;
				case 3:
					failReason = LangText.SCENE_HERO_JUMP_FAIL_3;
					return;
				case 4:
					failReason = LangText.SCENE_HERO_JUMP_FAIL_4;
					return;
			}
			NoticeManager.showNotify(failReason, failID);
		}
		
		/**
		 * 在视野中添加一个箱子（掉地上的），附带以下信息
		 *
		 * while(byteArray.avaliable){
		 *     varint64 id
		 *     varint32 x
		 *     varint32 y
		 * }
		 */
		private function onSceneAddBoxGoods(buffer : ByteBuffer) : void
		{
			while (buffer.bytesAvailable)
			{
				//				var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
				//				dropGoodsData.readFrom(buffer);
				//				dropGoodsData.isDroped = true;
				//				SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
			}
		}
		
		/**
		 * 在视野中添加一个物品（需要做抛出动画）
		 * 附带信息参考S2C_ADD_SCENE_GOODS消息中的附带消息(2个消息只是消息头不同)
		 */
		private function onSceneDropBoxGoods(buffer : ByteBuffer) : void
		{
			while (buffer.bytesAvailable)
			{
				//				var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
				//				dropGoodsData.readFrom(buffer);
				//				SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
			}
		}
		
		/**
		 * 返回可以拾取的物品的信息
		 *
		 * varint64 物品id
		 * while(buffer.readable()){
		 *      varint32 物品在箱子里面的下标
		 *      varint32 后面数据长度
		 *      bytes GoodsProto
		 * }
		 */
		private function onScenePickUpGoodsInfo(buffer : ByteBuffer) : void
		{
			//			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO);
			var sceneGoodsId : Number = buffer.readVarint64();
			var goodsItems : Vector.<SceneDropGoodsItem> = new Vector.<SceneDropGoodsItem>();
//			while (buffer.bytesAvailable)
//			{
//				var goodsProto : GoodsProto;
//				var goodsItem : SceneDropGoodsItem;
//				var index : int = buffer.readVarint32();
//				var len : int = buffer.readVarint32();
//				if (len > 0)
//				{
//					goodsProto = new GoodsProto();
//					var protoBytes : ByteArray = new ByteArray();
//					buffer.readBytes(protoBytes, 0, len);
//					goodsProto.mergeFrom(protoBytes);
//					goodsItem = new SceneDropGoodsItem(goodsProto);
//					goodsItems.push(goodsItem);
//				}
//			}
			SceneDropGoodsManager.pickUpGoodsInfoInit(sceneGoodsId, goodsItems);
		}
		
		private function onScenePickUpGoodsNextCanPickTime(buffer : ByteBuffer) : void
		{
			var nextTime : Number = buffer.readVarint64();
			SceneDropGoodsManager.setNextCanPickUpTime(nextTime);
		}
		
		/**
		 * 请求失败，返回varint32错误码
		 *
		 * 1. 物品没找到
		 * 2. 距离过远
		 * 3. 你不可以拾取
		 * 4. 挂了，不能拾取物品
		 */
		private function onScenePickUpGoodsInfoFail(buffer : ByteBuffer) : void
		{
			//			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangText.PICK_UP_GOODS_INFO_FAIL_1;
					return;
				case 2:
					failReason = LangText.PICK_UP_GOODS_INFO_FAIL_2;
					return;
				case 3:
					failReason = LangText.PICK_UP_GOODS_INFO_FAIL_3;
					return;
				case 4:
					failReason = LangText.PICK_UP_GOODS_INFO_FAIL_4;
					return;
			}
			NoticeManager.showNotify(failReason, failID);
		}
		
		/**
		 * 物品被拾取，收到S2C_SCENE_PICK_UP_GOODS消息
		 *
		 * varint64 箱子id
		 * varint32 拾取的下标
		 *
		 * 客户端收到这条消息后，播放拾取物品飞到背包图标的动画，同时删掉场景中的拾取物品
		 */
		private function onScenePickUpGoods(buffer : ByteBuffer) : void
		{
			//			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS);
			var sceneGoodsId : Number = buffer.readVarint64();
			var index : int = buffer.readVarint32();
			SceneDropGoodsManager.removeGoods(sceneGoodsId, index);
		}
		
		/**
		 * 失败返回S2C_SCENE_PICK_UP_GOODS_FAIL， 附带varint32错误码
		 * vatint32 错误码
		 *
		 * 错误类型：
		 * 1、拾取的物品不存在（可能已经被别人捡了）
		 * 2、物品不属于你（保护时间未过）
		 * 3、与物品距离过远（服务器检测2格以内，客户端需要走到物品所在的位置上面）
		 * 4、背包已满
		 * 5、跳跃中不能拾取物品
		 * 6、挂了，不能拾取物品
		 * 7、防沉迷中，不能拾取物品
		 * 8、拾取物品cd中
		 */
		private function onScenePickUpGoodsFail(buffer : ByteBuffer) : void
		{
			//			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangText.PICK_UP_GOODS_FAIL_1;
					return;
				case 2:
					failReason = LangText.PICK_UP_GOODS_FAIL_2;
					return;
				case 3:
					failReason = LangText.PICK_UP_GOODS_FAIL_3;
					return;
				case 4:
					failReason = LangText.PICK_UP_GOODS_FAIL_4;
					return;
				case 5:
					failReason = LangText.PICK_UP_GOODS_FAIL_5;
					return;
				case 6:
					failReason = LangText.PICK_UP_GOODS_FAIL_6;
					return;
				case 7:
					failReason = LangText.PICK_UP_GOODS_FAIL_7;
					return;
				case 8:
					failReason = LangText.PICK_UP_GOODS_FAIL_8;
					return;
			}
			NoticeManager.showNotify(failReason, failID);
		}
		
		
		/**
		 * 场景里对象最大血量变换的通知,会改变对象的当前血量
		 * @param buffer
		 */
		private function onRecObjectMaxLifeChange(buffer : ByteBuffer) : void
		{
			var id : Number = buffer.readVarint64();
			var hp : int = buffer.readVarint32();
			var maxLife : int = buffer.readVarint32();
			var role : SceneRole = SceneManager.getSceneObjByID(id) as SceneRole;
			if (role)
			{
				var roleData : RoleData = role.data as RoleData;
				CharAttributeManager.setCharMaxLife(roleData, maxLife);
				//				CharAttributeManager.setCharHp(roleData, hp);这行代码有效，值是这个接口变了，所以，就注释掉了
			}
		}
		
		private function onBeenTauntTarget(buffer : ByteBuffer) : void
		{
			var monsterId : Number = buffer.readVarint64();
			var role : SceneRole = SceneManager.getSceneObjByID(monsterId) as SceneRole;
			if (role)
			{
				SpellAnimationHelper.addTargetEffect(role, 1, RenderUnitType.TAUNT, EffectUrl.TAUNT_ANIMATION_RES, BoneNameEnum.c_0_name_01, 1, new Vector3D(0, 50, 0));
			}
		}
		
		private function onLostTauntTarget(buffer : ByteBuffer) : void
		{
			var monsterId : Number = buffer.readVarint64();
			var role : SceneRole = SceneManager.getSceneObjByID(monsterId) as SceneRole;
			if (role)
			{
				role.avatar.removeRenderUnitByID(RenderUnitType.TAUNT, 1);
			}
		}
		
		/**
		 * 请求失败，附带byte错误码
		 *
		 * 0. 你在远程服务器中
		 * 1. 没在场景中
		 * 2. 普通场景没有找到
		 * 3. 类型非法
		 */
		private function onGetMapUnitInfoFiald(buffer : ByteBuffer) : void
		{
			var code : int = buffer.readByte();
			trace("地图对象数据请求失败 " + code);
		}
		
		/**
		 * 此方法解析场景对象的数据
		 * 切记此处获取到的场景对象数据只能支持简单的显示功能
		 * 如果想要比较复杂的数据结构请通过其他途径
		 *  @author Wing
		 */
		private function onGetMapUnitInfoSucced(buffer : ByteBuffer) : void
		{
			var bytes : ByteBuffer = new ByteBuffer();
			buffer.readBytes(bytes);
			bytes.uncompress();
			
			var unitType : int = bytes.readVarint32();
			if (unitType == (1 << EnumMapUnitType.TYPE_NEAR_TEAM))
			{
				MapUnitDataManager.updataTeams(bytes);
			}
			else if (unitType == (1 << EnumMapUnitType.TYPE_NEAR_HERO))
			{
				MapUnitDataManager.updataNearbyHeros(bytes);
			}
			else if (unitType == (1 << EnumMapUnitType.TYPE_OFFICER))
			{
				MapUnitDataManager.upataOfficers(bytes);
			}
			else if (unitType == (1 << EnumMapUnitType.TYPE_FAMILY_MEMBER))
			{
				MapUnitDataManager.updataFamilyMembers(bytes);
			}
			else if (unitType == (1 << EnumMapUnitType.TYPE_COUNTRY_MEMBER))
			{
				MapUnitDataManager.updataCountryMemebers(bytes);
			}
			else if (unitType == (1 << EnumMapUnitType.TYPE_ENEMY_MEMBER))
			{
				MapUnitDataManager.updataEmemyMemebers(bytes);
			}
			else if (unitType == (1 << EnumMapUnitType.TYPE_TEAMMATE))
			{
				//MapUnitDataManager.updataTeammate(bytes);
			}
			else
			{
				GameLog.addShow("地图单元数据还有类型没处理或者读取异常！");
			}
			EventManager.dispatchEvent(MapEvent.UPDATE_MAP_UNIT_DATA, unitType);
		}
		
		/**
		 * 怪物伤害排行更新，服务器定时主动推送
		 * varint64 怪物id
		 * varint32 怪物配置id
		 * varint32 怪物掉落类型 MonsterHurtRankType，不同类型读取不同的数据
		 *
		 * while(byteArray.available)
		 *  RANK_PERSONAL:
		 *     varint64 heroId
		 *     UTF8 英雄名称
		 *     varint64 伤害量
		 *  RANK_TEAM:
		 *     UTF8 队伍名称
		 *     varint64 伤害量
		 *  RANK_FAMILY:
		 *     UTF8 帮派名称
		 *     varint64 伤害量
		 *  RANK_COUNTRY:
		 *     varint32 国家
		 *     varint64 伤害量
		 *
		 * 客户端收到这个消息，（如果看得到这个怪，看不到就算了）展示伤害排行榜面板（没有打开就打开）
		 */
		private function onPlunderHurtRank(buffer : ByteBuffer) : void
		{
			RankManager.setPlunderHurtRank(buffer);
		}
		
		/**
		 * 怪物伤害排行更新
		 * varint64 怪物id
		 * varint64 伤害量
		 *
		 * 客户端收到这个消息时，如果还没有收到怪物排行榜更新消息，此时客户端保存这个值
		 * 当怪物排行榜面板出现时，展示这个值
		 */
		private function onPlunderHurtRankSelfAmount(buffer : ByteBuffer) : void
		{
			RankManager.setPlunderHurtRankSelfAmount(buffer);
		}
		
		/**
		 * 重置伤害排行榜，客户端收到此消息，重置排行榜数据
		 * varint64 怪物id
		 *
		 * 怪物失去目标时，发送此消息
		 */
		private function onResetHurtRank(buffer : ByteBuffer) : void
		{
			RankManager.resetBossHurtRank(buffer);
		}
		
		/**
		 * 触发客户端事件
		 *
		 * varint64 触发的人的id,可能是怪物,可能是人
		 * varint32 触发的事件id
		 */
		private function onTriggerClientEvent(buffer : ByteBuffer) : void
		{
			var roleId : Number = buffer.readVarint64();
			var triggerId : Number = buffer.readVarint32();
			ClientTriggerManager.triggerById(triggerId, roleId);
		}
	}
}
