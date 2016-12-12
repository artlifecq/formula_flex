package com.rpgGame.app.cmdlistener.scene
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.fight.spell.SpellAnimationHelper;
	import com.rpgGame.app.manager.CharAttributeManager;
	import com.rpgGame.app.manager.ClientTriggerManager;
	import com.rpgGame.app.manager.GameCameraManager;
	import com.rpgGame.app.manager.RankManager;
	import com.rpgGame.app.manager.ReliveManager;
	import com.rpgGame.app.manager.TrusteeshipManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.map.MapUnitDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneDropGoodsManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.manager.scene.SceneSwitchManager;
	import com.rpgGame.app.manager.task.TaskManager;
	import com.rpgGame.app.manager.task.TouJingManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.state.role.RoleStateUtil;
	import com.rpgGame.app.state.role.action.JumpStateReference;
	import com.rpgGame.app.state.role.control.StopWalkMoveStateReference;
	import com.rpgGame.app.state.role.control.WalkMoveStateReference;
	import com.rpgGame.app.task.TaskInfoDecoder;
	import com.rpgGame.app.utils.ReqLockUtil;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.configEnum.EnumHintInfo;
	import com.rpgGame.coreData.enum.BoneNameEnum;
	import com.rpgGame.coreData.info.map.EnumMapUnitType;
	import com.rpgGame.coreData.info.move.RoleMoveInfo;
	import com.rpgGame.coreData.info.task.target.TaskFollowEscortInfo;
	import com.rpgGame.coreData.lang.LangNoticeInfo;
	import com.rpgGame.coreData.lang.LangText;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.role.SceneDropGoodsData;
	import com.rpgGame.coreData.role.SceneDropGoodsItem;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.RenderUnitType;
	import com.rpgGame.coreData.type.RoleStateType;
	import com.rpgGame.coreData.type.SceneCharType;
	import com.rpgGame.netData.map.bean.MonsterInfo;
	import com.rpgGame.netData.map.bean.NpcInfo;
	import com.rpgGame.netData.map.bean.PlayerInfo;
	import com.rpgGame.netData.map.bean.SceneObjInfo;
	import com.rpgGame.netData.map.message.ResEnterMapMessage;
	import com.rpgGame.netData.map.message.ResPlayerStopMessage;
	import com.rpgGame.netData.map.message.ResRoundObjectsMessage;
	import com.rpgGame.netData.map.message.SCSceneObjMoveMessage;
	import com.rpgGame.netData.player.message.BroadcastPlayerAttriChangeMessage;
	
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.ByteArray;
	
	import app.cmd.MazeModuleMessages;
	import app.cmd.NpcModuleMessages;
	import app.cmd.SceneModuleMessages;
	import app.cmd.SimpleDungeonModuleMessages;
	import app.cmd.StoryModuleMessages;
	import app.cmd.TaskModuleMessages;
	import app.message.GoodsProto;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
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
			SocketConnection.addCmdListener(101116, RecvPlayerStopMessage);
			SocketConnection.addCmdListener(101148, RecvSCSceneObjMoveMessage);
			SocketConnection.addCmdListener(101125, RecvResRoundObjectsMessage);
			//场景中有对象血量有变化. 可能是因为状态, 可能是因为吃药
			SocketConnection.addCmdListener(103105, RecvBroadcastPlayerAttriChangeMessage);
			
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			//////
			////// 以下为参考代码，是深圳那边的后台协议，不适用
			//////
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_CHANGE_SCENE, onChangeScene);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_YOU_MOVE_FAIL, onYouMoveFail);
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_ADD_SENT_NPC, addSentNpc);
			SocketConnection_protoBuffer.addCmdListener(TaskModuleMessages.S2C_SYNC_SENT_NPC_POS, onSceneSyncSentNpcPos);
			SocketConnection_protoBuffer.addCmdListener(StoryModuleMessages.S2C_ADD_STORY_PROTECT_MONSTER, onAddStoryProtectMonster);
			
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_TP_SAME_SCENE, onRecHeroTpSameScene);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_HERO_TP_SAME_SCENE_BROADCAST, onHeroTp);
			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_SCENE_REQUEST_NPC_TRANSPORT, onNpcTransSuccess);
			SocketConnection_protoBuffer.addCmdListener(NpcModuleMessages.S2C_SCENE_REQUEST_NPC_TRANSPORT_FAIL, onNpcTransFail);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_BEEN_TAUNT_TARGET, onBeenTauntTarget);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_LOST_TAUNT_TARGET, onLostTauntTarget);
			
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_MAP_TRANSPORT, onSceneMapTransport);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_MAP_TRANSPORT_FAIL, onSceneMapTransportFail);
			
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_TRANSPORT_FAIL, onHeroTransportFail);
			
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_OBJECT_MAX_LIFE_CHANGE, onRecObjectMaxLifeChange);
			

			SocketConnection_protoBuffer.addCmdListener(SimpleDungeonModuleMessages.S2C_LEAVE_DUNGEON_FAIL, onLeaveDungeonFail);
			SocketConnection_protoBuffer.addCmdListener(SimpleDungeonModuleMessages.S2C_LEAVE_DUNGEON_SUCCESS, onLeaveDungeonSuccess);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_JUMP, onHeroJump);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_JUMP_FAIL, onHeroJumpFail);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_HERO_TRANSPORT_FAIL, onTransportFail);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_ADD_SCENE_BOX, onSceneAddBoxGoods);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_DROP_SCENE_BOX, onSceneDropBoxGoods);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS_INFO, onScenePickUpGoodsInfo);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS_INFO_FAIL, onScenePickUpGoodsInfoFail);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS, onScenePickUpGoods);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PICK_UP_GOODS_FAIL, onScenePickUpGoodsFail);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_NEXT_CAN_PICK_UP_TIME_CHANGED, onScenePickUpGoodsNextCanPickTime);
			
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_GET_SURROUNDING_SCENE_INFO_FAIL, onGetMapUnitInfoFiald);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_REPLY_SURROUNDING_SCENE_INFO, onGetMapUnitInfoSucced);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PLUNDER_HURT_RANK, onPlunderHurtRank);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_PLUNDER_HURT_RANK_SELF_AMOUNT, onPlunderHurtRankSelfAmount);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_SCENE_RESET_HURT_RANK, onResetHurtRank);
			SocketConnection_protoBuffer.addCmdListener(SceneModuleMessages.S2C_TRIGGER_CLIENT_EVENT, onTriggerClientEvent);
			
			finish();
		}
		
		/**
		 * 服务器已经把客户端添加到场景，客户端可以进入场景
		 * @param buffer
		 *
		 */
		public function RecvEnterMapMessage(msg:ResEnterMapMessage):void
		{
			GameLog.addShow("收到成功进入地图消息");
			
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
			
			//			CountryWarChengMenManager.checkChengMenStatus();
			
			if (playerData.totalStat.hp > 0)
				ReliveManager.hideRelivePanel();
			
			//			if (pkMode > 0)
			//				EventManager.dispatchEvent(MainPlayerEvent.PK_MODE_CHANGE);
		}
		
		/**
		 * 对象的位置修正消息，服务器一般在需要对象停止的时候发送，但跳跃等移动状态不匹配也会发送，需要针对性修正 
		 * @param msg
		 */		
		public function RecvPlayerStopMessage(msg:ResPlayerStopMessage):void
		{
			
			var objId : Number = msg.personId.fValue;
			//			var speed : int = buffer.readVarint32();
			var posX : int = msg.position.x;
			var posY : int = -msg.position.y;
			GameLog.addShow("%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 收到对象停止消息 :   " + posX + "   " + posY);
			
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
		
		/**
		 * 场景中有英雄/怪物/宠物啥的 移动了, 包含每个节点, 从起始节点出发的时间和速度. 到达每个节点的时间都是可以推算出来的
		 * @param buffer
		 *
		 */
		private function RecvSCSceneObjMoveMessage(msg:SCSceneObjMoveMessage):void
		{
			if(msg.objId.fValue == MainRoleManager.actorID)
			{
				trace("这里不应该有主角自己的呀！主角自己的移动不需要同步到自己吧！！！");
				return;
			}
			var mInfo : RoleMoveInfo = new RoleMoveInfo();
			mInfo.setValue(msg);
			var role : SceneRole = SceneManager.getSceneObjByID(mInfo.roleID) as SceneRole;
			if (role && role.usable && !role.getCamouflageEntity()) //有伪装则跟随伪装，防止服务器发伪装者移动。
			{
				var elapseTm : int = SystemTimeManager.curtTm - mInfo.startTm*1000;
				trace("寻路开始时间：" + mInfo.startTm, "_差值：" + elapseTm);
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
			var delArr:Vector.<long> = msg.removeObjs;
			for(var i:int=0;i<delArr.length;i++)
			{
				var roleID:uint = delArr[i].fValue;
				onSceneRemoveObject(roleID);
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
				}
			}
		}
		
		/**
		 * 把一个英雄/怪物/宠物等从视野中删除
		 * @param buffer
		 *
		 */
		private function onSceneRemoveObject(roleID : uint) : void
		{
			var sceneRole : SceneRole = SceneManager.getSceneObjByID(roleID) as SceneRole;
			if( sceneRole != null )
			{
				var data:MonsterData = sceneRole.data as MonsterData;
				if( data != null )
				{
					TouJingManager.setHuGuoSiEffect(data.modelID, sceneRole, false);
					var sceneClientRole:SceneRole = SceneManager.getSceneClientNpcByModelId( data.modelID );
					if( sceneClientRole != null )
					{
						sceneClientRole.visible = true;
						TouJingManager.setHuGuoSiEffect(data.modelID, sceneClientRole, true);						
					}
				}
			}
			SceneRoleManager.getInstance().removeSceneRoleById(roleID);
		}
		
		/**
		 * 其他玩家进入主角视野区
		 * @param buffer
		 *
		 */
		private function onAddHero(buffer : ByteArray) : void
		{
			var data : HeroData = new HeroData();
			
			var info:PlayerInfo = new PlayerInfo();
			info.read(buffer);
			
			HeroData.setEnterEyeUserInfo(data, info);
			var sceneRole : SceneRole = SceneRoleManager.getInstance().createHero(data);
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
			var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
			
			var info : MonsterInfo = new MonsterInfo();
			info.read(buffer);
			
			data.serverID = info.monsterId;
			data.id = info.monsterId.fValue;
			data.modelID = info.modelId;
			
			RoleData.readMonster(data,info);
			SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
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
			var data : MonsterData = new MonsterData(RoleType.TYPE_NPC);
			
			var info : NpcInfo = new NpcInfo();
			data.serverID = info.npcId;
			data.id = info.npcId.fValue;
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
			var role : SceneRole = SceneManager.getSceneObjByID(msg.playerid.fValue) as SceneRole;
			if (!role)
				return;
			var roleData : RoleData = role.data as RoleData;
			
			CharAttributeManager.setAttributeValue(roleData,msg.attributeChange.type, msg.attributeChange.value);
			
			
			if (roleData.totalStat.hp <= 0)
			{
				role.stateMachine.transition(RoleStateType.ACTION_DEATH, null, true);
			}
			
			if(roleData.id == MainRoleManager.actorID)
			{
				ReliveManager.autoHideRelive();
			}
		}
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		//////
		////// 以下为参考代码，是深圳那边的后台协议，不适用
		//////
		////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		
		
		/**
		 * 服务器发来的切场景协议
		 * @param buffer
		 */
		private function onChangeScene(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT);
			ReqLockUtil.unlockReq(MazeModuleMessages.C2S_TRY_TRANSPORT);
			
			var mapId : int = buffer.readVarint32();
			MainRoleManager.actorInfo.mapID = mapId;
			SceneSwitchManager.changeMap();
		}
		
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
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_47);
					break;
				case 2:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_48);
					break;
				case 3:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_49);
					break;
				case 4:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_50);
					break;
				case 5:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_51);
					break;
				case 6:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_52);
					break;
				case 7:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_53);
					break;
				case 8:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_54);
					break;
				case 9:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_55);
					break;
				default:
					infostr = LanguageConfig.getText(LangNoticeInfo.ErrorMsgNoticeManager_56);
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
		 * 主角移动失败
		 * @param buffer
		 *
		 */
		private function onYouMoveFail(buffer : ByteBuffer) : void
		{
			var posX : uint = buffer.readVarint32();
			var posY : uint = buffer.readVarint32();
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
		private function onSceneMapTransportFail(buffer : ByteBuffer) : void
		{
			var failId : int = buffer.readVarint32();
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
		
		private function onHeroTransportFail(buffer : ByteBuffer) : void
		{
			//			SceneModuleMessages.S2C_HERO_TRANSPORT_FAIL;
			var failId : int = buffer.readVarint32();
			switch (failId)
			{
				case 1:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL1);
					return;
				case 2:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL2);
					return;
				case 3:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL3);
					return;
				case 4:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL4);
					return;
				case 5:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL5);
					return;
				case 6:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL6);
					return;
				case 7:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL7);
					return;
				case 8:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL8);
					return;
				case 9:
					NoticeManager.showHint(EnumHintInfo.HERO_TRANSPORT_FAIL9);
					return;
			}
		}
		
		/**
		 * 离开副本失败, 附带varint32 错误码
		 *
		 * 1. 你不在副本中 (可能不在副本或者在加载中还没进入场景)
		 */
		private function onLeaveDungeonFail(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(SimpleDungeonModuleMessages.C2S_LEAVE_DUNGEON);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangText.SCENE_LEAVE_DUNGEON_FAIL;
					return;
			}
			NoticeManager.showNotify(failReason, failID);
		}
		
		/**
		 * 离开副本成功, 紧接着会收到切场景消息. 解锁
		 *
		 * 没有附带信息
		 */
		private function onLeaveDungeonSuccess(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(SimpleDungeonModuleMessages.C2S_LEAVE_DUNGEON);
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
		 * 传送失败,
		 *
		 * 附带varint32的失败原因
		 *
		 * 1. 距离太远
		 *
		 * 2. 被晕或者跳跃中或者已死亡等不能传送的状态中
		 *
		 * 3. 坐标没找到
		 *
		 * 4. 等级不够
		 *
		 * 5. 战斗状态中
		 *
		 * 6. 当前无法进入目标场景
		 *
		 * 7. 无法使用该传送门
		 */
		private function onTransportFail(buffer : ByteBuffer) : void
		{
			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_REQUEST_TRANSPORT);
			var failID : int = buffer.readVarint32();
			var failReason : String;
			switch (failID)
			{
				case 1:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_1;
					return;
				case 2:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_2;
					return;
				case 3:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_3;
					return;
				case 4:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_4;
					return;
				case 5:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_5;
					return;
				case 6:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_6;
					return;
				case 7:
					failReason = LangText.SCENE_TRANSPORT_INFO_FAIL_7;
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
				var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
				dropGoodsData.readFrom(buffer);
				dropGoodsData.isDroped = true;
				SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
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
				var dropGoodsData : SceneDropGoodsData = new SceneDropGoodsData();
				dropGoodsData.readFrom(buffer);
				SceneRoleManager.getInstance().createDropGoods(dropGoodsData);
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
			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO);
			var sceneGoodsId : Number = buffer.readVarint64();
			var goodsItems : Vector.<SceneDropGoodsItem> = new Vector.<SceneDropGoodsItem>();
			while (buffer.bytesAvailable)
			{
				var goodsProto : GoodsProto;
				var goodsItem : SceneDropGoodsItem;
				var index : int = buffer.readVarint32();
				var len : int = buffer.readVarint32();
				if (len > 0)
				{
					goodsProto = new GoodsProto();
					var protoBytes : ByteArray = new ByteArray();
					buffer.readBytes(protoBytes, 0, len);
					goodsProto.mergeFrom(protoBytes);
					goodsItem = new SceneDropGoodsItem(goodsProto);
					goodsItems.push(goodsItem);
				}
			}
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
			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS_INFO);
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
			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS);
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
			ReqLockUtil.unlockReq(SceneModuleMessages.C2S_SCENE_PICK_UP_GOODS);
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
		 * 传送成功后，返回这个消息，只表示成功
		 */
		private function onSceneMapTransport(buffer : ByteBuffer) : void
		{
			
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
				MapUnitDataManager.updataTeammate(bytes);
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
