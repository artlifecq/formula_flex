package com.rpgGame.app.manager.map
{
	import com.game.engine3D.vo.SenderReferenceSet;
	import com.rpgGame.app.manager.TeamManager;
	import com.rpgGame.core.events.MapEvent;
	import com.rpgGame.core.events.TeamEvent;
	import com.rpgGame.coreData.info.MapDataManager;
	import com.rpgGame.coreData.info.map.EnumMapUnitType;
	import com.rpgGame.coreData.info.map.MapCountryMemeberInfo;
	import com.rpgGame.coreData.info.map.MapEmemyInfo;
	import com.rpgGame.coreData.info.map.MapFamilyMemberInfo;
	import com.rpgGame.coreData.info.map.MapOfficerInfo;
	import com.rpgGame.coreData.info.map.MapTeamMemberInfo;
	import com.rpgGame.coreData.info.map.MapUnitEvent;
	import com.rpgGame.coreData.info.map.SceneData;
	import com.rpgGame.coreData.info.team.TeamInfo;
	import com.rpgGame.coreData.info.team.TeamNearPlayerInfo;
	import com.rpgGame.coreData.info.team.TeamUnit;
	import com.rpgGame.coreData.utils.ByteUtil;

	import flash.utils.ByteArray;

	import app.cmd.SceneModuleMessages;

	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	/**
	 * 地图活动对象数据管理器
	 * 此对象数据管理器从服务器获取当前场景所有活动单位的数据信息
	 * 此地方获得的对象数据信息比较简单，只能够用作基础的显示功能
	 * 如果需要获取其他数据信息请走其他途径
	 * @see com.rpgGame.coreData.info.map.EnumMapUnitType
	 * @author Wing
	 * @modifier L.L.M.Sunny
	 * 修改时间：2016-06-02 下午3:05:12
	 */
	public class MapUnitDataManager
	{
//		/**附近的队伍信息，每个队伍中包含的成员信息*/
//		private static var _nearTeamInfos : Vector.<TeamInfo> = new Vector.<TeamInfo>();
//		/**周围的英雄数据*/
//		private static var _nearHeros : Vector.<TeamNearPlayerInfo> = new Vector.<TeamNearPlayerInfo>();
		/**周围的官员信息*/
		private static var _countryOfficers : Vector.<MapOfficerInfo> = new Vector.<MapOfficerInfo>();
		/**周围的队伍成员信息，即队友的信息*/
		private static var _myTeammates : Vector.<MapTeamMemberInfo> = new Vector.<MapTeamMemberInfo>();
		/**周围的家族成员信息*/
		private static var _familyMembers : Vector.<MapFamilyMemberInfo> = new Vector.<MapFamilyMemberInfo>();
		/**周围的盟友信息*/
		private static var _countryMembers : Vector.<MapCountryMemeberInfo> = new Vector.<MapCountryMemeberInfo>();
		/**周围的敌国成员信息*/
		private static var _enemyMembers : Vector.<MapEmemyInfo> = new Vector.<MapEmemyInfo>();
		/**需要请求的地图对象类型*/
		private static var _unitTypes : Array = [];

		public function MapUnitDataManager()
		{
		}

		private static const REQ_DATA_DELAY_TIME : int = 10000;
		private static var _reqReferenceSet : SenderReferenceSet = new SenderReferenceSet("MapUnitDataManager", onReqCmd, REQ_DATA_DELAY_TIME);

		private static var _nearTeamTypeCount : int = 0;
		private static var _nearHeroTypeCount : int = 0;
		private static var _nearOfficerTypeCount : int = 0;
		private static var _nearFamilyMemberTypeCount : int = 0;
		private static var _nearCountryMemberTypeCount : int = 0;
		private static var _nearEnemyMemberTypeCount : int = 0;
		private static var _nearTeammateTypeCount : int = 0;

		public static function addReqReference(ref : String, unitType : int) : void
		{
			var flag : Boolean = _reqReferenceSet.hasRef(ref + "_" + unitType);
			if (flag)
			{
				switch (unitType)
				{
					case EnumMapUnitType.TYPE_NEAR_TEAM:
						_nearTeamTypeCount++;
						break;
					case EnumMapUnitType.TYPE_NEAR_HERO:
						_nearHeroTypeCount++;
						break;
					case EnumMapUnitType.TYPE_OFFICER:
						_nearOfficerTypeCount++;
						break;
					case EnumMapUnitType.TYPE_FAMILY_MEMBER:
						_nearFamilyMemberTypeCount++;
						break;
					case EnumMapUnitType.TYPE_COUNTRY_MEMBER:
						_nearCountryMemberTypeCount++;
						break;
					case EnumMapUnitType.TYPE_ENEMY_MEMBER:
						_nearEnemyMemberTypeCount++;
						break;
					case EnumMapUnitType.TYPE_TEAMMATE:
						_nearTeammateTypeCount++;
						break;
				}
				_reqReferenceSet.addRef(ref + "_" + unitType);
			}
		}

		public static function removeReqReference(ref : String, unitType : int) : void
		{
			var flag : Boolean = _reqReferenceSet.removeRef(ref + "_" + unitType);
			if (flag)
			{
				switch (unitType)
				{
					case EnumMapUnitType.TYPE_NEAR_TEAM:
						_nearTeamTypeCount--;
						break;
					case EnumMapUnitType.TYPE_NEAR_HERO:
						_nearHeroTypeCount--;
						break;
					case EnumMapUnitType.TYPE_OFFICER:
						_nearOfficerTypeCount--;
						break;
					case EnumMapUnitType.TYPE_FAMILY_MEMBER:
						_nearFamilyMemberTypeCount--;
						break;
					case EnumMapUnitType.TYPE_COUNTRY_MEMBER:
						_nearCountryMemberTypeCount--;
						break;
					case EnumMapUnitType.TYPE_ENEMY_MEMBER:
						_nearEnemyMemberTypeCount--;
						break;
					case EnumMapUnitType.TYPE_TEAMMATE:
						_nearTeammateTypeCount--;
						break;
				}
			}
		}

		private static function onReqCmd() : void
		{
			var currScene : SceneData = MapDataManager.currentScene;
			if (!currScene || !currScene.isNormalScene)
			{
				return;
			}

			if (_nearTeamTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_NEAR_TEAM);
			else
				removeUnitType(EnumMapUnitType.TYPE_NEAR_TEAM);

			if (_nearHeroTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_NEAR_HERO);
			else
				removeUnitType(EnumMapUnitType.TYPE_NEAR_HERO);

			if (_nearOfficerTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_OFFICER);
			else
				removeUnitType(EnumMapUnitType.TYPE_OFFICER);

			if (_nearFamilyMemberTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_FAMILY_MEMBER);
			else
				removeUnitType(EnumMapUnitType.TYPE_FAMILY_MEMBER);

			if (_nearCountryMemberTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_COUNTRY_MEMBER);
			else
				removeUnitType(EnumMapUnitType.TYPE_COUNTRY_MEMBER);

			if (_nearEnemyMemberTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_ENEMY_MEMBER);
			else
				removeUnitType(EnumMapUnitType.TYPE_ENEMY_MEMBER);

			if (_nearTeammateTypeCount > 0)
				addUnitType(EnumMapUnitType.TYPE_TEAMMATE);
			else
				removeUnitType(EnumMapUnitType.TYPE_TEAMMATE);

			requestMapUnitCmd(_unitTypes);
		}

		public static function setup() : void
		{
		}

		public static function clear() : void
		{
//			_nearTeamInfos.length = 0;
//			_nearHeros.length = 0;
			_countryOfficers.length = 0;
			_myTeammates.length = 0;
			_familyMembers.length = 0;
			_countryMembers.length = 0;
			_enemyMembers.length = 0;
			_unitTypes.length = 0;
			EventManager.dispatchEvent(MapEvent.CLEAR_MAP_UNIT_DATA);
		}

		/**
		 * 添加一个需要请求的数据对象类型
		 * @param value
		 */
		private static function addUnitType(value : int) : void
		{
			if (_unitTypes.indexOf(value) == -1)
			{
				_unitTypes.push(value);
			}
		}

		/**
		 * 删除一个需要请求的数据对象类型
		 * @param value
		 */
		private static function removeUnitType(value : int) : void
		{
			var index : int = _unitTypes.indexOf(value);
			if (index > 0)
			{
				_unitTypes.splice(index, 1);
			}
		}

		/**
		 * 请求某个场景中的同服英雄数据，发送后锁定面板，直到收到返回解锁
		 *
		 * varint32 type，type是下面的任何类型的或集，单个类型，必须10S才能请求一次，比如
		 *          本次要请求本场景的官员以及本场景的本家族成员，10S内已经请求过了，不可以再
		 *          请求本场景的本家族成员了，只可以请求本场景的本家族成员，不然服务器踢你下线
		 *
		 * 比如要请求(2.本场景的官员)跟(5.本场景的所有敌对成员)
		 *
		 * type = (1 << 2) | (1 << 5)
		 *
		 *      0. 附近的队伍
		 *      1. 附近的英雄
		 *      2. 本场景的官员
		 *      3. 本场景的所有家族成员
		 *      4. 本场景的所有本国以及盟国成员
		 *      5. 本场景的所有敌对成员
		 *      6. 本场景的所有本队伍成员
		 *
		 * 例如：requestMapUnitCmd([EnumMapUnitType.TypeNearbyTeam, EnumMapUnitType.TypeCountryMember]);
		 * 是表示同时请求周围队伍的信息和国家成员的信息
		 *
		 */
		public static function requestMapUnitCmd(types : Array) : void
		{
			var type : int;
			for (var i : int = 0; i < types.length; i++)
			{
				type = ByteUtil.setByteValue(type, types[i], 1);
			}

			_bytes.clear();
			_bytes.writeVarint32(type);
			send(SceneModuleMessages.C2S_GET_SURROUNDING_SCENE_INFO, _bytes);
		}

//		/**附近的队伍信息，每个队伍中包含的成员信息*/
//		public static function get nearTeamInfos() : Vector.<TeamInfo>
//		{
//			return _nearTeamInfos;
//		}
//
//		/**周围的英雄数据*/
//		public static function get nearHeros() : Vector.<TeamNearPlayerInfo>
//		{
//			return _nearHeros;
//		}

		/**周围的官员信息*/
		public static function get countryOfficers() : Vector.<MapOfficerInfo>
		{
			return _countryOfficers;
		}

		/**周围的队伍成员信息，即队友的信息*/
		public static function get myTeammates() : Vector.<MapTeamMemberInfo>
		{
			return _myTeammates;
		}

		/**周围的家族成员信息*/
		public static function get familyMembers() : Vector.<MapFamilyMemberInfo>
		{
			return _familyMembers;
		}

		/**周围的盟友信息*/
		public static function get countryMembers() : Vector.<MapCountryMemeberInfo>
		{
			return _countryMembers;
		}

		/**周围的敌国成员信息*/
		public static function get enemyMembers() : Vector.<MapEmemyInfo>
		{
			return _enemyMembers;
		}

		/**
		 * 更新周围的队伍信息
		 * if(type是附近队伍){
		 *     while(buffer.readable) {
		 *         // 每个循环里面是一个队伍
		 *         var heroCount:int = byteArray.readVarint32() 队伍当前人数
		 *         for (var i:int = 0; i < heroCount; i++){
		 *             // 每个队员的信息, 用以显示tips, 以及线数. 算出队长等级和平均等级
		 *             // 列表里第一个就是队长
		 *             varint64 此人id
		 *             UTF 此人名字
		 *             varint32 此人等级
		 *             bool 是否在线，在线读取后面的数据，不在线直接不读取
		 *             if(在线){
		 *                 varint32 此人职业(0表示没有职业)
		 *             }
		 *         }
		 *     }
		 * }
		 */
		public static function updataTeams(bytes : ByteBuffer) : void
		{
//			_nearTeamInfos = new Vector.<TeamInfo>();
//			var nearTeamArr : Array = [];
//			var i : int = 0;
//			var heroCount : int = 0;
//			var teamInfo : TeamInfo; //队伍数据
//			var index : int = 0;
//			var teamID : int = 0;
//			while (bytes.bytesAvailable)
//			{
//				heroCount = bytes.readVarint32(); //队伍当前人数
//				teamInfo = new TeamInfo();
//				teamInfo.index = index;
//				var aveLv : int = 0; //队伍总等级
//				var membInfo : TeamUnit; //队伍成员数据
//
//				for (i = 0; i < heroCount; i++)
//				{
//					membInfo = new TeamUnit();
//					membInfo.id = bytes.readVarint64();
//					membInfo.name = bytes.readUTF();
//					membInfo.level = bytes.readVarint32();
//					var isOnline : Boolean = bytes.readBoolean();
//					membInfo.isOnline = isOnline
//					teamInfo.teamMemberInfolist.push(membInfo);
//					if (isOnline)
//						membInfo.raceId = bytes.readVarint32();
//
//					aveLv += membInfo.level;
//				}
//				membInfo = teamInfo.teamMemberInfolist[0];
//				teamInfo.teamID = teamID;
//				teamInfo.leaderId = membInfo.id;
//				teamInfo.leaderLv = membInfo.level;
//				teamInfo.leaderName = membInfo.name;
//				teamInfo.teamNumber = heroCount;
//				teamInfo.averageLv = aveLv / heroCount;
//				nearTeamArr.push(teamInfo);
//				_nearTeamInfos.push(teamInfo);
//				index++;
//				teamID++;
//			}
//			TeamManager.nearTeamsArr = nearTeamArr;
//			EventManager.dispatchEvent(TeamEvent.TEAM_NEAR_TEAM_SEARCH_RESULT_UPDATE);
		}

		/**
		 * 更新周围的英雄信息
		 * if(type是附近的人){
		 *     while(buffer.readable) {
		 *         varint64 id
		 *         UTF 名字
		 *         varint32 职业，即RaceId
		 *         varint32 等级
		 *         varint64 战斗力
		 *     }
		 * }
		 */
		public static function updataNearbyHeros(bytes : ByteBuffer) : void
		{
//			_nearHeros = new Vector.<TeamNearPlayerInfo>();
//			var index : int = 0;
//			while (bytes.bytesAvailable)
//			{
//				var playerData : TeamNearPlayerInfo = new TeamNearPlayerInfo();
//				playerData.id = bytes.readVarint64();
//				playerData.name = bytes.readUTF()
//				playerData.raceId = bytes.readVarint32();
//				playerData.level = bytes.readVarint32();
//				playerData.fighting = bytes.readVarint32();
//				_nearHeros.push(playerData);
//			}
//			TeamManager.screenNearPlayer(_nearHeros);
//			EventManager.dispatchEvent(TeamEvent.TEAM_NEAR_PLAYER_SEARCH_RESULT_UPDATE);
		}

		/**
		 * 更新周围官员信息
		 * if(type是官员) {
		 *     while(buffer.readable) {
		 *          varint32 官职CountryOfficerPos
		 *          utf 官员名字
		 *          varint32 坐标X
		 *          varint32 坐标Y
		 *      }
		 * }
		 */
		public static function upataOfficers(bytes : ByteBuffer) : void
		{
			_countryOfficers = new Vector.<MapOfficerInfo>();
			var info : MapOfficerInfo;
			while (bytes.bytesAvailable)
			{
				info = new MapOfficerInfo();
				info.office = bytes.readVarint32();
				info.name = bytes.readUTF();
				info.x = bytes.readVarint32();
				info.y = bytes.readVarint32();
				_countryOfficers.push(info);
			}
			EventManager.dispatchEvent(MapUnitEvent.UPDATE_MAP_OFFICER);
		}

		/**
		 * 更新周围队友的信息
		 * @param bytes
		 */
		public static function updataTeammate(bytes : ByteBuffer) : void
		{
			_myTeammates = new Vector.<MapTeamMemberInfo>();
			var info : MapTeamMemberInfo;
			while (bytes.bytesAvailable)
			{
				info = new MapTeamMemberInfo();
				info.name = bytes.readUTF();
				info.x = bytes.readVarint32();
				info.y = bytes.readVarint32();
				_myTeammates.push(info);
			}
			EventManager.dispatchEvent(MapUnitEvent.UPDATE_MAP_TEAMMATE);
		}

		/**
		 * 更新家族成员信息
		 * @param bytes
		 */
		public static function updataFamilyMembers(bytes : ByteBuffer) : void
		{
			_familyMembers = new Vector.<MapFamilyMemberInfo>();
			var info : MapFamilyMemberInfo;
			while (bytes.bytesAvailable)
			{
				info = new MapFamilyMemberInfo();
				info.name = bytes.readUTF();
				info.x = bytes.readVarint32();
				info.y = bytes.readVarint32();
				_familyMembers.push(info);
			}
			EventManager.dispatchEvent(MapUnitEvent.UPDATE_MAP_FAMILYMEMBER);
		}

		/**
		 * 更新本国家成员信息
		 * @param bytes
		 */
		public static function updataCountryMemebers(bytes : ByteBuffer) : void
		{
			_countryMembers = new Vector.<MapCountryMemeberInfo>();
			var info : MapCountryMemeberInfo;
			while (bytes.bytesAvailable)
			{
				info = new MapCountryMemeberInfo();
				info.id = bytes.readVarint64();
				info.name = "本国或盟国玩家";
				info.x = bytes.readVarint32();
				info.y = bytes.readVarint32();
				_countryMembers.push(info);
			}
			EventManager.dispatchEvent(MapUnitEvent.UPDATE_MAP_COUNTRYMEMBER);
		}

		/**
		 * 更新敌国成员信息
		 * @param bytes
		 */
		public static function updataEmemyMemebers(bytes : ByteBuffer) : void
		{
			_enemyMembers = new Vector.<MapEmemyInfo>();
			var info : MapEmemyInfo;
			while (bytes.bytesAvailable)
			{
				info = new MapEmemyInfo();
				info.name = "敌国玩家";
				info.x = bytes.readVarint32();
				info.y = bytes.readVarint32();
				_enemyMembers.push(info);
			}
			EventManager.dispatchEvent(MapUnitEvent.UPDATE_MAP_ENEMYMEMBER);
		}

		private static var _emptyBy : ByteArray = new ByteArray();
		private static var _bytes : ByteBuffer = new ByteBuffer();

		private static function send(cmdID : String, data : ByteArray = null) : void
		{
			_emptyBy.clear();
			data = data || _emptyBy;

			SocketConnection_protoBuffer.send(cmdID, data);
		}
	}
}
