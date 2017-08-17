package com.rpgGame.coreData.cfg.npc
{
	import com.rpgGame.coreData.cfg.MazeCfgData;
	import com.rpgGame.coreData.cfg.biao.BiaoCfgData;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.cfg.task.MiXinCfgData;
	import com.rpgGame.coreData.cfg.task.TouJingCfgData;
	import com.rpgGame.coreData.cfg.task.TouZhuCfgData;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.role.MonsterBornData;
	
	import app.message.NpcType;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * NPC静态数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-5-4 上午11:32:15
	 *
	 */
	public class NpcCfgData
	{
		/** 边境传送npc的id **/
		public static var countryTransNPCId : int = -1;
		/**进入参拜区域npcID*/
		public static var enterWorshipNPCID:int;
		/**参拜国王NPCID*/
		public static var worshipKingNPCID:int;

		public static function parseNpcData(dataProto : Q_monster) : void
		{
			var npcId : int = dataProto.q_id;
//			var npcData : NpcProto = dataProto.npc;
//			if (!npcData)
//				return;

			//分析npc类型
//			for each (var dialog : NpcDialogProto in npcData.dialogs)
//			{
//				if(dialog.hasVehiclePath)
//				{
//					//载具路径数据
//					VehiclePathCfgData.setConfig(dialog.vehiclePath.vehicle);
//				}
//				setNpcId(dialog.npcType, npcId);
//			}
		}

		/**
		 * 设置npc的id
		 * @param npcType
		 * @param npcId
		 *
		 */
		private static function setNpcId(npcType : int, npcId : int) : void
		{
			switch (npcType)
			{
				case NpcType.TRANSPORT: //边境传送员
					NpcCfgData.countryTransNPCId = npcId;
					break;
				case NpcType.ACCEPT_MIXIN: //接受鸡毛信任务的npc
					MiXinCfgData.acceptNpc = npcId;
					break;
				case NpcType.ACCEPT_TOU_JING: //接受偷经任务的npc
					TouJingCfgData.acceptNpcID = npcId;
					break;
				case NpcType.ACCEPT_TOU_ZHU: //接受偷猪任务的npc
					TouZhuCfgData.acceptNpc = npcId;
					break;
				case NpcType.DO_TOU_JING: //做偷经任务的npc
					TouJingCfgData.submitNpcID = npcId;
					break;
				case NpcType.COMPLETE_MIXIN: //完成鸡毛信任务的npc
					MiXinCfgData.completeNpc = npcId;
					break;
				case NpcType.COMPLETE_TOU_JING: //完成偷经任务的npc
					TouJingCfgData.completeNpcID = npcId;
					break;
				case NpcType.COMPLETE_TOU_ZHU: //完成偷猪任务的npc
					TouJingCfgData.completeNpcID = npcId;
					break;
				case NpcType.REFRESH_MIXIN: //刷新鸡毛信的npc
					MiXinCfgData.refleshNpc = npcId;
					MiXinCfgData.submitNpc = npcId;
					break;
				case NpcType.REFRESH_WEAK_MIXIN: //弱国刷新鸡毛信的npc
					MiXinCfgData.weakRefleshNpc = npcId;
					break;
				case NpcType.ACCEPT_BIAO: //接镖的npc
					BiaoCfgData.acceptBiaoNpc = npcId;
					break;
				case NpcType.ACCEPT_INVINCIBLE_BIAO: //接无敌镖车
					BiaoCfgData.acceptInvincibleBiaoNpc = npcId;
					break;
				case NpcType.REFRESH_BIAO: //军需官1
				case NpcType.CHECK_BIAO: //军需官2
					if( BiaoCfgData.refleshWangNpc == 0 && BiaoCfgData.refleshYangNpc != npcId )
						BiaoCfgData.refleshWangNpc = npcId;
					
					if( BiaoCfgData.refleshYangNpc == 0 && BiaoCfgData.refleshWangNpc != npcId )
						BiaoCfgData.refleshYangNpc = npcId;
					break;
				case NpcType.COMPLETE_BIAO: //交镖的npc
					BiaoCfgData.completeNpc = npcId;
					break;
				case NpcType.COMPLETE_KING_BIAO: //王帮托运的NPC
					BiaoCfgData.countryTuoYunNpc = npcId;
					break;
				case NpcType.MAZE_PRIZE_AND_ENTER_NEXT://迷宫奖励
					MazeCfgData.mazeNextFloorNpcIds.push(npcId);
					break;
				case NpcType.MAZE_PRIZE://迷宫奖励
					MazeCfgData.mazeNpcIds.push(npcId);
					break;
				/*case NpcType.GUILD_CREATE://创建帮派
					GuildCfgData.createGuildNpc = npcId;*/
					break;
				case NpcType.COUNTRY_WAR_ENTER_ADMIRE_AREA://进入参拜区域
					enterWorshipNPCID = npcId;
					break;
				case NpcType.COUNTRY_WAR_DO_ADMIRE://参拜区域国王
					worshipKingNPCID = npcId;
					break;
			}
		}

		/**
		 * 获取NpcProto数据
		 * @param id npc的ID
		 * @return
		 *
		 */
		public static function getData(id : uint) : Q_monster
		{
			var monsterData : Q_monster = MonsterDataManager.getData(id);
//			if (!monsterData || !monsterData.npc)
//				return null;
			return monsterData;
		}

		/**
		 * 返回制定sceneID的NPC的数据（VECTOR格式）
		 * @param sceneID
		 * @return
		 *
		 */
		public static function getSceneNpcProtos(sceneID : uint) : Vector.<Q_monster>
		{
			var map : HashMap = MonsterDataManager.monsterMap;
			var list : Vector.<Q_monster> = new Vector.<Q_monster>;
//			var dataList : Array = map.getValues();
//			for each (var data : Q_monster in dataList)
//			{
//				if (data.npc && (data.sceneId == sceneID))
//				{
//					list.push(data);
//				}
//			}
			return list;
		}

		public static function getSceneNpcDatas(sceneID : uint) : Vector.<MonsterBornData>
		{
			var map : HashMap = MonsterDataManager.monsterMap;
			var list : Vector.<MonsterBornData> = new Vector.<MonsterBornData>;
//			var dataList : Array = map.getValues();
//			for each (var data : Q_monster in dataList)
//			{
//				if (data.npc && (data.sceneId == sceneID))
//				{
//					var monsterData : MonsterBornData = new MonsterBornData();
//					monsterData.setProtocData(data);
//					list.push(monsterData);
//				}
//			}
			return list;
		}

		/**
		 * 返回制定sceneID的NPC的数据（ARRAY格式）
		 * @param sceneID
		 * @return
		 *
		 */
		public static function getSceneNpcArr(sceneID : uint) : Array
		{
			var map : HashMap = MonsterDataManager.monsterMap;
			var arr : Array = new Array();
			var dataList : Array = map.getValues();
//			for each (var data : Q_monster in dataList)
//			{
//				if (data.npc && (data.sceneId == sceneID))
//				{
//					arr.push(data);
//				}
//			}
			return arr;
		}

		/**
		 * npc是否有传送功能
		 * @param npcId
		 * @return
		 *
		 */
		public static function isTransNpc(npcId : int) : Boolean
		{
			return isFunctionType(npcId, NpcType.TRANSPORT);
		}

		public static function isFunctionType(npcId : int, npcType : int) : Boolean
		{
			var monsterData : Q_monster = MonsterDataManager.getData(npcId);
//			if (!monsterData || !monsterData.npc)
//				return false;
//
//			for each (var dialogData : NpcDialogProto in monsterData.npc.dialogs)
//			{
//				if (dialogData.npcType == npcType)
//				{
//					return true;
//				}
//			}
			return false;
		}

		/**
		 * 获得NPC对话类型　
		 * @param npcId
		 * @return
		 *
		 */
		public static function getDialogType(npcId : int) : int
		{
//			var monsterData : Q_monster = MonsterDataManager.getData(npcId);
//			return (monsterData && monsterData.npc) ? monsterData.npc.dialogType : 0;
			return 0;
		}

		/**
		 * NPC名字
		 * @param id
		 * @return
		 *
		 */
		public static function getNpcName(id : int) : String
		{
//			var monsterData : Q_monster = MonsterDataManager.getData(id);
//			return (monsterData && monsterData.npc) ? monsterData.name : "";
			return "";
		}

		/**
		 * 头像资源，从icon目录下面找
		 * @param npcId
		 * @return
		 *
		 */
		public static function getHead(npcId : int) : String
		{
//			var monsterData : Q_monster = MonsterDataManager.getData(npcId);
//			return (monsterData && monsterData.npc) ? monsterData.head : "";
			return "";
		}

		/**
		 * 获取npc对话内容
		 * @param npcID
		 *
		 */
		public static function getNpcDialoguDesc(npcID : int) : String
		{
//			var monsterData : Q_monster = MonsterDataManager.getData(npcID);
//			return (monsterData && monsterData.npc) ? BytesUtil.bytes2UTF(monsterData.npc.dialog) : "";
			return "";
		}


		/**
		 * 获得NPC对应的传送列表
		 * @param npcId
		 * @return
		 *
		 */
		public static function getNpcTransportList(npcId : int) : Array
		{
			var monsterData : Q_monster = MonsterDataManager.getData(npcId);
//			if (!monsterData || !monsterData.npc)
//				return null;
//
//			for each (var dialogData : NpcDialogProto in monsterData.npc.dialogs)
//			{
//				if (dialogData.npcType == NpcType.TRANSPORT && dialogData.hasTransport)
//				{
//					return dialogData.transport.data.transport;
//				}
//			}
			return null;
		}

		/**
		 * 获得NPC指定功能的对话列表
		 * @param npcId
		 * @param npcType 功能
		 * @return
		 *
		 */
//		public static function getNpcDialog(npcId : int, npcType : int) : NpcDialogProto
//		{
//			var monsterData : Q_monster = MonsterDataManager.getData(npcId);
//			if (!monsterData || !monsterData.npc)
//				return null;
//
//			for each (var dialogData : NpcDialogProto in monsterData.npc.dialogs)
//			{
//				if (dialogData.npcType == npcType)
//				{
//					return dialogData;
//				}
//			}
//			return null;
//		}

		/**
		 * 获得NPC对话列表　
		 * @param npcId
		 * @return
		 *
		 */
		public static function getFunctionList(npcId : int) : Array
		{
			var monsterData : Q_monster = MonsterDataManager.getData(npcId);
//			if (!monsterData || !monsterData.npc)
//				return null;
//			return monsterData.npc.dialogs;
			return null;
		}
	}
}
