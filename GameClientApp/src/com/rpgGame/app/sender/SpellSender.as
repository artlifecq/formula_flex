package com.rpgGame.app.sender
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.utils.UpgradeUtil;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.info.item.UpgradeItemListVo;
	
	import app.cmd.SceneModuleMessages;
	import app.cmd.SpellModuleMessages;

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
		 * 设置快捷栏 ,服务器不主动改变技能栏, 所有的技能栏设置全由客户端发送消息, 而且此消息没有返回
		 * @param realID				ID,0表示把这个格子删掉
		 * @param pos					放的格子位置pos
		 * @param defaultPos			当前的默认技能是第几个格子, -1 则表示没有设置	2013.11.6 取消了默认技能
		 * @param type					类型
		 *
		 */
		public static function reqSetShortcut(realID : int, pos : int, type : int) : void
		{
		/*GameLog.add("CmdID.C2S_SET_SHORTCUT ：修改快捷栏设置");
		var shortcut : int = 0;
		switch (type)
		{
			case CDType.SPELL_CD:
				shortcut = realID << 3;
				break;
			case CDType.ITEM_CD:
				shortcut = (realID << 3) | 1;
				break;
//				case CDType.WEAPON:
//					shortcut = (realID << 3) | 2;
//					break;
		}
		//------------------------------------------
		_bytes.clear();
		_bytes.writeVarint32(shortcut);
		_bytes.writeVarint32(pos);
		_bytes.writeVarint32(-1);
		send(CmdID.C2S_SET_SHORTCUT, _bytes);*/
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
		public static function releaseSpell(spellType : int, x : int, y : int, angle : int, targetID : Number) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(spellType);
			_bytes.writeVarint32(x);
			_bytes.writeVarint32(y);
			_bytes.writeVarint32(angle);
			_bytes.writeVarint64(targetID);
			send(SceneModuleMessages.C2S_SCENE_RELEASE_SPELL, _bytes);
		}

		public static function updateSpellTarget(targetID : Number = -1, x : int = -1, y : int = -1) : void
		{
		/*targetID = targetID > 0 ? targetID : 0;
		_bytes.clear();
		if (targetID)
		{
			_bytes.writeVarint64(targetID);
		}
		else
		{
			_bytes.writeVarint64(targetID);
			_bytes.writeVarint32(x);
			_bytes.writeVarint32(y);
		}
		send(SceneSpellCmd.C2S_SCENE_UPDATE_SPELL_TARGET, _bytes);

		//			GameLog.add(getTimer() - _tm);
		_tm = getTimer();*/
		}

		//-----------------------------------

		/**
		 * 学习或升级某spellType的技能
		 *
		 * 发送要学习技能的spellType varint32
		 */
		public static function learnOrUpgradeActiveSpell(spellType : int, itemListVo:UpgradeItemListVo) : void
		{
			_bytes.clear();
			_bytes.writeVarint32(spellType);
			_bytes.writeBytes(itemListVo.getByte());
			
			send(SpellModuleMessages.C2S_LEARN_OR_UPGRADE_ACTIVE_SPELL, _bytes);
		}

		/**
		 * 请求洗点
		 *
		 * UpgradeProto 洗点的UpgradeProto
		 */
		public static function clearSpells() : void
		{
			_bytes.clear();
			if(	MainRoleManager.actorInfo.level >= SpellDataManager.clearSpellFreeLevel)
			{
				_bytes.writeBytes(UpgradeUtil.getUpgradeItemListVo(SpellDataManager.clearSpellCost).getByte());
			}
			send(SpellModuleMessages.C2S_CLEAR_SPELLS, _bytes);
		}
	}
}
