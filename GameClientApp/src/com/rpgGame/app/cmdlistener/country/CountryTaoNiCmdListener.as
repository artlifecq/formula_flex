package com.rpgGame.app.cmdlistener.country
{
	import com.rpgGame.app.manager.chat.NoticeManager;
	import com.rpgGame.app.manager.country.CountryTaoNiManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.NpcSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.TaoNiEvent;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.info.country.CountryTaoNiAccountData;
	import com.rpgGame.coreData.lang.LangTaoNi;
	import com.rpgGame.coreData.role.MonsterData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.role.RoleType;
	import com.rpgGame.coreData.type.SceneCharType;

	import app.cmd.TaoNiModuleMessages;
	import app.message.MonsterDataProto;
	import app.message.MonsterDataProto.MonsterType;

	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.net.ByteBuffer;

	/**
	 *
	 * 国家讨逆消息处理器
	 * @author L.L.M.Sunny
	 * 创建时间：2016-05-03 上午10:05:12
	 *
	 */
	public class CountryTaoNiCmdListener extends BaseBean
	{
		public function CountryTaoNiCmdListener()
		{
		}

		override public function start() : void
		{
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_TAO_NI_START, onTaoNiStart);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_TAO_NI_STATUS, onTaoNiStatus);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_TAO_NI_END, onTaoNiEnd);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_ENTER_DUNGEON, onTaoNiEnter);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_ENTER_DUNGEON_FAIL, onTaoNiEnterFail);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_DUNGEON_INFO, onTaoNiInfo);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_STAGE_CHANGED, onStageChanged);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_NEW_WAVE, onNewWave);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_KILL_MONSTER_CHANGED, onKillMonsterChanged);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_FINISH, onFinish);
			SocketConnection.addCmdListener(TaoNiModuleMessages.S2C_ADD_LIANG_CANG, addLiangCang);

			finish();
		}

		private function onTaoNiStart(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.startDungeon();
		}

		/**
		 * 讨逆的情况
		 *
		 * varint64 活动开启时间
		 * varint32 讨逆活动的场景
		 * varint32 刷出来的npc的数量
		 * varint32 已经进入的npc数量
		 * varint32 剩余npc数量
		 */
		private function onTaoNiStatus(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.setStatus(buffer);
		}

		private function onTaoNiEnd(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.endDungeon();
		}

		private function onTaoNiEnter(buffer : ByteBuffer) : void
		{
			NpcSender.unlockSend();
		}

		/**
		 * 请求进入副本失败
		 *
		 * 1. 没在自己国家的场景
		 * 2. 你已经死了
		 * 3. 该npc别人已经进去了
		 * 4. 不是队长
		 * 5. 有人不在线
		 * 6. 有人死了
		 * 7. 有人距离过远
		 * 8. 有人不在普通场景
		 * 9. 你当前状态不允许进入讨逆副本
		 * 10. 有人当前状态不允许进入讨逆副本
		 * 11. 当前没有讨逆活动
		 */
		private function onTaoNiEnterFail(buffer : ByteBuffer) : void
		{
			NpcSender.unlockSend();

			var failID : int = buffer.readVarint32();
			switch (failID)
			{
				case 1:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_1);
					break;
				case 2:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_2);
					break;
				case 3:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_3);
					break;
				case 4:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_4);
					break;
				case 5:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_5);
					break;
				case 6:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_6);
					break;
				case 7:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_7);
					break;
				case 8:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_8);
					break;
				case 9:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_9);
					break;
				case 10:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_10);
					break;
				case 11:
					NoticeManager.showNotify(LangTaoNi.COUNTRY_TAO_NI_ENTER_FAIL_11);
					break;
			}
		}

		/**
		 * 场景信息
		 *
		 * varint64 副本结束时间
		 * varint64 当前阶段的结束时间
		 * varint32 当前阶段
		 * varint32 当前阶段第几波
		 * varint64 下一波的时间，如果为0表示没有下一波
		 *
		 * while(buffer.readable()){
		 *      varint32 怪物配置id
		 *      varint32 怪物击杀数量
		 * }
		 */
		private function onTaoNiInfo(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.setDungeonData(buffer);
		}

		/**
		 * 阶段变更了
		 *
		 * varint32 阶段
		 * varint64 该阶段结束时间
		 * varint64 第一波的时间
		 */
		private function onStageChanged(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.stageChanged(buffer);
		}

		/**
		 * 下一波信息
		 *
		 * varint32 当前波数
		 * varint64 下一波的时间，如果下一波的时间为0，表示该阶段没有下一波了
		 */
		private function onNewWave(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.newWave(buffer);
		}

		/**
		 * 击杀怪物信息变更
		 *
		 * varint32 monsterConfigId，该怪物可能不是本阶段的，客户端自己根据情况去做处理
		 * varint32 击杀个数
		 */
		private function onKillMonsterChanged(buffer : ByteBuffer) : void
		{
			CountryTaoNiManager.killMonsterChanged(buffer);
		}

		/**
		 * 粮仓进入主角视野区
		 * @param buffer
		 *
		 */
		private function addLiangCang(buffer : ByteBuffer) : void
		{
			var data : MonsterData = new MonsterData(RoleType.TYPE_LIANG_CANG);
			data.id = buffer.readVarint64();
			data.modelID = buffer.readVarint32();
			RoleData.readGeneric(data, buffer);
			var sceneRole : SceneRole = SceneRoleManager.getInstance().createMonster(data, SceneCharType.LIANG_CANG);
			EventManager.dispatchEvent(TaoNiEvent.TAO_NI_LIANG_CANG_ADD_TO_SCENE, sceneRole);
		}

		/**
		 * 副本结束了
		 *
		 * bool true(通关)/false(失败)
		 *
		 * while(buffer.readable()){
		 *      varint64 成员id
		 *      utf 成员名字
		 *
		 *      varint32 复活次数
		 *
		 *      varint32 击杀怪物数量
		 *      for(i->击杀怪物数量){
		 *          varint32 怪物配置id
		 *          varint32 击杀数量
		 *      }
		 * }
		 */
		private function onFinish(buffer : ByteBuffer) : void
		{
			var isSuccess : Boolean = buffer.readBoolean();
			var list : Array = [];
			while (buffer.bytesAvailable)
			{
				var accountData : CountryTaoNiAccountData = new CountryTaoNiAccountData();
				accountData.heroId = buffer.readVarint64();
				accountData.heroName = buffer.readUTF();
				accountData.reliveCount = buffer.readVarint32();
				var killCount : int = buffer.readVarint32();
				accountData.killMonsterCount = 0;
				accountData.killEliteCount = 0;
				accountData.killBossCount = 0;
				for (var i : int = 0; i < killCount; i++)
				{
					var monsterId : int = buffer.readVarint32();
					var monsterCount : int = buffer.readVarint32();
					var monsterData : MonsterDataProto = MonsterDataManager.getData(monsterId);
					if (monsterData)
					{
						if (monsterData.monsterType == MonsterType.ELITE)
							accountData.killEliteCount += monsterCount;
						else if (monsterData.monsterType == MonsterType.BOSS)
							accountData.killBossCount += monsterCount;
						else
							accountData.killMonsterCount += monsterCount;
					}
				}
				list.push(accountData);
			}
			AppManager.showAppNoHide(AppConstant.COUNTRY_TAO_NI_ACCOUNT_PANEL, {isSuccess: isSuccess, list: list});
			if (isSuccess)
			{
				NoticeManager.showNotify(LangTaoNi.TAO_NI_FINISH_SUCCESS);
			}
			else
			{
				NoticeManager.showNotify(LangTaoNi.TAO_NI_FINISH_FAIL);
			}
		}
	}
}
