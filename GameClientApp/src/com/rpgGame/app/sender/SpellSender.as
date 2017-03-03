package com.rpgGame.app.sender
{
	import com.gameClient.log.GameLog;
	import com.rpgGame.app.manager.fight.FightFaceHelper;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleManager;
	import com.rpgGame.app.manager.scene.SceneManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	import com.rpgGame.coreData.type.EnumHurtType;
	import com.rpgGame.netData.fight.message.CSPerformPosSkillMessage;
	import com.rpgGame.netData.fight.message.CSPerformTargetSkillMessage;
	
	import app.cmd.SpellModuleMessages;
	
	import org.game.netCore.connection.SocketConnection;
	import org.game.netCore.data.long;

	/**
	 *
	 * 技能 moduleID==4
	 *
	 * ModuleID==4
	 * @author L.L.M.Sunny
	 * 创建时间：2015-4-21 下午5:22:16
	 *
	 */
	public class SpellSender extends BaseSender
	{
		private static var _tm : uint;

		public function SpellSender()
		{
			super();
		}

		/**
		 * 释放技能
		 *
		 * 附带
		 *
		 * varint32 type，使用的技能spell_type. 必须是已学会的
		 *
		 * varint32 技能释放坐标x
		 * varint32 技能释放坐标y
		 * varint32 释放角度
		 * varint64 目标id，如果无目标id则发送0，后面附带技能坐标
		 *
		 */
		public static function releaseSpell(spellID : int, x : int, y : int, angle : int, targetID : long) : void
		{
			GameLog.addShow("马上要释放技能id:\t" + spellID);
			if(targetID != null)
			{
				releaseSpellAtTarget(spellID,angle,targetID);
			}
			else
			{
				releaseSpellAtPos(spellID,angle,x,y);
			}
		}
		
		public static function releaseSpellAtPos(spellID:int,angle:int,x:int,y:int):void
		{
			var msg:CSPerformPosSkillMessage = new CSPerformPosSkillMessage();
			msg.skillId = spellID;
			msg.fightDirection = angle;
			msg.x = x;
			msg.y = y;
			SocketConnection.send(msg);
			GameLog.addShow("============================发给服务器的技能点为：\t" + x  + "  _  " +y);
		}
		
		public static function releaseSpellAtTarget(spellID:int,angle:int,targetID:long):void
		{
			var msg:CSPerformTargetSkillMessage = new CSPerformTargetSkillMessage();
			msg.skillId = spellID;
			msg.fightDirection = angle;
			msg.targetId = targetID;
			SocketConnection.send(msg);
		}

		//-----------------------------------

		/**
		 * 学习或升级某spellType的技能
		 *
		 * 发送要学习技能的spellType varint32
		 */
		public static function learnOrUpgradeActiveSpell(spellID : int, itemListVo:UpgradeItemListVo) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(spellID);
			_bytes.writeBytes(itemListVo.getByte());
			
			send(SpellModuleMessages.C2S_LEARN_OR_UPGRADE_ACTIVE_SPELL, _bytes);
		}

		/**
		 * 请求洗点
		 *
		 * UpgradeProto 洗点的UpgradeProto
		 */
//		public static function clearSpells() : void
//		{
//			_bytes.clear();
//			if(	MainRoleManager.actorInfo.totalStat.level >= SpellDataManager.clearSpellFreeLevel)
//			{
//				_bytes.writeBytes(UpgradeUtil.getUpgradeItemListVo(SpellDataManager.clearSpellCost).getByte());
//			}
//			send(SpellModuleMessages.C2S_CLEAR_SPELLS, _bytes);
//		}
	}
}
