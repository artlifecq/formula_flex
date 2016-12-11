package com.rpgGame.app.cmdlistener
{
	import com.rpgGame.app.manager.BaZhenTuManager;
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.sender.SceneSender;
	import com.rpgGame.core.events.BaZhenTuEvent;
	import com.rpgGame.coreData.cfg.BaZhenTuCfgData;
	import com.rpgGame.coreData.lang.LangBaZhenTu;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleType;
	
	import app.cmd.BaZhenTuModuleMessages;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection_protoBuffer;
	import org.game.netCore.net_protobuff.ByteBuffer;

	public class BaZhenTuCmdListener extends BaseBean
	{
		override public function start() : void
		{
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_TRY_START, onTryStartSuccess);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_TRY_START_FAIL, onTryStartFail);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_LEADER_START_DUNGEON, onLeaderStartDungeon);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_REFRUSE, onRefruseSuccess);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_REFRUSE_FAIL, onRefruseFail);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_AGREE, onAgreeSuccess);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_AGREE_FAIL, onAgreeFail);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_OTHER_AGREE, onOtherArgee);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_CANCEL, onCancel);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_WAIT_ENTER_DUNGEON, onWaitEnterDungeon);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_ENTER_TIMES_CHANGED, onEnterTimesChanged);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_DUNGEON_INFO, onDungeonInfo);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_NEW_WAVE, onNewWave);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_STELE_ACTIVATE, onSteleActivate);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_BUFFER_INVALID, onBufferInvalid);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_FINISH, onFinish);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_ADD_MONSTER, onAddMonster);
			SocketConnection_protoBuffer.addCmdListener(BaZhenTuModuleMessages.S2C_ADD_STELE_MONSTER, onAddSteleMonster);
			finish();
		}

		/**
		 * 说明：
		 *
		 *  判断八阵图功能是否开启，通过判断类型
		 *
		 *  FunctionType
		 *      FUNC_BA_ZHEN_TU = 25; // 八阵图
		 *
		 * 收到
		 *      ModuleId = HERO_MISC_MODULE_ID = 8
		 *      MsgId = S2C_HERO_DAILY_CLEARED = 127
		 *      即8-127，将BaZhenTuModuleObj.today_enter_times设置为0
		 *
		 * -------------------------------------------
		 *
		 *
		 * 尝试开始，成功，其他队员会收到别的信息，自己提示
		 */
		private function onTryStartSuccess(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify(LangBaZhenTu.BA_ZHEN_TU_WAIT_JOIN);
		}

		/**
		 * 尝试开始，失败，返回varint32错误码
		 *
		 * 1. 但是英雄不在普通场景中
		 * 2. 但是英雄死了
		 * 3. 但是等级不够没开启
		 * 4. 已经在开启中了
		 * 5. 次数不够
		 * 6. 不是队长
		 * 7. 战斗中，无法申请
		 * 8. 有人不在线
		 * 9. 有人死了
		 * 10. 有人距离过远
		 * 11. 有人已经在申请中了
		 * 12. 有人在战斗中了
		 *
		 * if(buffer.readable()){
		 *      bytes 某人，比如某人不在线，某人死了，某人距离过远，某人申请中了
		 * }
		 */
		private function onTryStartFail(buffer : ByteBuffer) : void
		{
			var err : int = buffer.readByte();
			var str : String;
			var name : String = "";
//			LanguageConfig.getText(
			if (buffer.bytesAvailable)
			{
				name = buffer.readUTFBytes(buffer.bytesAvailable);
			}
			switch (err)
			{
				case 1:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_1;
					break;
				case 2:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_2;
					break;
				case 3:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_3;
					break;
				case 4:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_4;
					break;
				case 5:
					if (name != "")
					{
						str = "您所在队伍的" + name + "已经完成了八阵图挑战，请整理队伍后再次挑战。";
					}
					else
					{
						str = "次数不够";
					}
//					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_5;
					break;
				case 6:
					if (name != "")
					{
						str = name + "不是所在队伍的队长，只有队长才能开启组队模式挑战";
					}
					else
					{
						str = "你不是所在队伍的队长，只有队长才能开启组队模式挑战";
					}
//					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_6;
					break;
				case 7:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_7;
					break;
				case 8:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_8;
					break;
				case 9:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_9;
					break;
				case 10:
					if (name != "")
					{
						str = "您队伍中的成员" + name + "不在副本开启范围内，请聚集队伍成员后重新开启副本。";
					}
					else
					{
						str = "有人距离太远";
					}
//					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_10;
					break;
				case 11:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_11;
					break;
				case 12:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_12;
					break;
				case 13:
					str = LangBaZhenTu.BA_ZHEN_TU_CMDLISTENER_13;
					break;
			}
			NoticeManager.showNotify(str);
		}

		/**
		 * 开启了副本
		 *
		 * varint64 过期时间，过期时间到了，客户端自动关闭掉
		 * varint64 开启的人的id
		 * bytes 开启的人的名字
		 */
		private function onLeaderStartDungeon(buffer : ByteBuffer) : void
		{
			BaZhenTuManager.onLeaderStartDungeon(buffer);
		}

		/**
		 * 拒绝
		 */
		private function onRefruseSuccess(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify(LangBaZhenTu.REFRUSE_SUCCESS);
		}
		/**
		 * 同意失败，返回varint32
		 *
		 * 1. 当前没有队伍
		 * 2. 当前无法同意
		 */
		private function onRefruseFail(buffer : ByteBuffer) : void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("REFRUSE_FAIL_"+error);
		}

		/**
		 * 同意
		 */
		private function onAgreeSuccess(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify(LangBaZhenTu.AGREE_SUCCESS);
		}
		/**
		 * 同意失败，返回varint32
		 *
		 * 1. 当前没有队伍
		 * 2. 当前无法同意
		 */
		private function onAgreeFail(buffer : ByteBuffer) : void
		{
			var error : int = buffer.readVarint32();
			NoticeManager.showNotify("AGREE_FAIL_"+error);
		}

		/**
		 * 有人同意了
		 *
		 * bytes 同意的人的名字
		 */
		private function onOtherArgee(buffer : ByteBuffer) : void
		{
			var player : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showNotify(LangBaZhenTu.PLAYER_AGREE_JOIN_DUNGEON,player);
		}

		/**
		 * 进入副本取消了，客户端可能同时收到多条
		 *
		 * bytes 取消的人的名字
		 */
		private function onCancel(buffer : ByteBuffer) : void
		{
			var name : String = buffer.readUTFBytes(buffer.bytesAvailable);
			NoticeManager.showNotify(LangBaZhenTu.PLAYER_REFRUSE_JOIN_DUNGEON,name);
		}

		/**
		 * 战斗即将打响，等待进入副本
		 */
		private function onWaitEnterDungeon(buffer : ByteBuffer) : void
		{
			NoticeManager.showNotify(LangBaZhenTu.WAIT_JOIN_DUNGEON);
		}

		/**
		 * 能够进入八阵图的次数变更了
		 *
		 * varint32 新的次数
		 */
		private function onEnterTimesChanged(buffer : ByteBuffer) : void
		{
			var num : int = buffer.readVarint32();
			BaZhenTuCfgData.canEnterTimesPerDay = num;
		}

		/**
		 * 副本信息
		 *
		 * varint64 副本结束时间
		 *
		 * varint32 当前是第几波
		 * varint64 下一波刷新时间，如果当前波数是最后一波，直接显示刷新完了
		 *
		 * while(buffer.readable()){
		 *      varint32 导致buf不生效的怪物类型，即八卦类型
		 *      varint64 导致buf不生效结束时间
		 * }
		 */
		private function onDungeonInfo(buffer : ByteBuffer) : void
		{
			BaZhenTuManager.enterDungeonInfo(buffer);
		}

		/**
		 * 新的一波刷新了
		 *
		 * varint32 当前波数
		 * varint64 下一波刷新时间，如果当前波数是最后一波，直接显示刷新完了
		 */
		private function onNewWave(buffer : ByteBuffer) : void
		{
			BaZhenTuManager.newWaveUpdate(buffer);
		}

		/**
		 * 石碑状态变更了，这是一条广播
		 *
		 * varint32 石碑类型，即八卦类型
		 * bool 是否激活了，就是可以攻击了
		 */
		private function onSteleActivate(buffer : ByteBuffer) : void
		{
			var type : int = buffer.readVarint32();
			var bool : Boolean = buffer.readBoolean();
			var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
			data.baGuaType = type;
			data.isJihuo = bool;
			BaZhenTuManager.setShiBeiData(data);
			EventManager.dispatchEvent(BaZhenTuEvent.SHIBEI_ENTER_SCENE, type, bool);
		}

		/**
		 * 石碑导致怪物buf不生效
		 *
		 * varint32 导致buf不生效的怪物类型，即八卦类型
		 * varint64 导致buf不生效结束时间
		 */
		private function onBufferInvalid(buffer : ByteBuffer) : void
		{
			var type : int = buffer.readVarint32();
			var endTime : Number = buffer.readVarint64();
			BaZhenTuManager.setShiBeiBuff(type,endTime);
			trace("asasdasd");
		}

		/**
		 * 副本结束了
		 *
		 * bool true(成功)/false(失败)
		 */
		private function onFinish(buffer : ByteBuffer) : void
		{
			var bool : Boolean = buffer.readBoolean();
			BaZhenTuManager.isWin = bool;
			if(bool)
				NoticeManager.showNotify(LangBaZhenTu.DUNGEON_COMPLETE);
			else
			{
				NoticeManager.showNotify(LangBaZhenTu.DUNGEON_FAIL);
				SceneSender.requestLeaveDungeon();
			}
		}

		/**
		 * 场景中出现了一只八阵图的普通小怪物，需要带上怪物的八卦类型
		 *
		 * varint32 八卦类型
		 *
		 * varint32 技能id，即BaZhenTuDungeonProto.monster_spells中的id，后面的数据同3-4, S2C_ADD_MONSTER
		 *
		 * varint64 怪物在场景中的id // 注意是int64
		 * varint32 怪物的配置id
		 *
		 * // 接下来是和怪物共用的
		 * varint32 x点
		 * varint32 y点
		 * varint64 当前生命值
		 * varint64 最大生命值
		 * varint64 当前魔法值
		 * varint64 最大魔法值
		 *
		 * // 加载身上附带的状态
		 * while(byteArray.available){ // 以下每个循环就是一个不同的状态
		 *     stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
		 *     currentStackCount = byteArray.readVarInt32() // 这个状态的层数
		 *     disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
		 * }
		 */
		private function onAddMonster(buffer : ByteBuffer) : void
		{
//			var type:int = 
//			var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
//			data.baGuaType = buffer.readVarint32();
//			data.spellId = buffer.readVarint32();
//			data.id = buffer.readVarint64();
//			data.modelID = buffer.readVarint32();
//			RoleData.readGeneric(data, buffer);
//			SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
//			BaZhenTuManager.setSkillData(data);
//			EventManager.dispatchEvent(BaZhenTuEvent.MONSTER_ENTER_SCENE, data.baGuaType, data.spellId);

		}

		/**
		 * 场景中出现了一只八阵图石碑，需要带上怪物的八卦类型
		 *
		 * varint32 八卦石碑类型
		 * bool 是否被激活，后面的数据同3-4, S2C_ADD_MONSTER
		 *
		 * varint64 怪物在场景中的id // 注意是int64
		 * varint32 怪物的配置id
		 *
		 * // 接下来是和怪物共用的
		 * varint32 x点
		 * varint32 y点
		 * varint64 当前生命值
		 * varint64 最大生命值
		 * varint64 当前魔法值
		 * varint64 最大魔法值
		 *
		 * // 加载身上附带的状态
		 * while(byteArray.available){ // 以下每个循环就是一个不同的状态
		 *     stateID =  byteArray.readVarInt32() // 状态的id, 去config.proto中的状态大全里找
		 *     currentStackCount = byteArray.readVarInt32() // 这个状态的层数
		 *     disappearTime = byteArray.readVarInt64() // 这个状态消失的时刻 (到了这个时刻自动移除状态icon)
		 * }
		 */
		private function onAddSteleMonster(buffer : ByteBuffer) : void
		{

//			var data : MonsterData = new MonsterData(RoleType.TYPE_MONSTER);
//			data.baGuaType = buffer.readVarint32();
//			data.isJihuo = buffer.readBoolean();
//			data.id = buffer.readVarint64();
//			data.modelID = buffer.readVarint32();
//			RoleData.readGeneric(data, buffer);
//			SceneRoleManager.getInstance().createMonster(data, SceneCharType.MONSTER);
//			BaZhenTuManager.setShiBeiData(data);
//			EventManager.dispatchEvent(BaZhenTuEvent.SHIBEI_ENTER_SCENE, data.baGuaType, data.isJihuo);
		}
	}
}
