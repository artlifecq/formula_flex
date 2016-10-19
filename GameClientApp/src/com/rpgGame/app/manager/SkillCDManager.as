package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.cfg.GCDCfgData;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	
	import app.message.SpellCoolDownProto;
	import app.message.SpellModuleObjProto;
	import app.message.SpellProto;

	public class SkillCDManager
	{
		/** 全局技能CD KEY **/
		private static const GLOBAL_SKILL_KEY : String = "GLOBAL_SKILL_KEY";


		public function SkillCDManager()
		{
		}

		private static var _instance : SkillCDManager;

		public static function getInstance() : SkillCDManager
		{
			if (!_instance)
				_instance = new SkillCDManager();

			return _instance;
		}


		//---------------------------------------------
		/**
		 * 设置技能当前的CD
		 * @param spellCoolDownProto
		 *
		 */
		public function setHeroCd(heroSpellListProto : SpellModuleObjProto) : void
		{
			if (heroSpellListProto == null)
				return;

			var spellCoolDownProto : SpellCoolDownProto = heroSpellListProto.spellCoolDown;
			if (spellCoolDownProto == null)
				return;

			spellCoolDownProto.spellCoolTime;

			trace(spellCoolDownProto.spellCoolTime);
		}

		/**
		 * 得到技能CD的KEY		（加上字符SKill是为了防止与别的CD KEY相同）
		 * @param spellType
		 * @return
		 *
		 */
		public static function getSkillKey(spellType : int) : String
		{
			return FaceTypeEnum.SKILL + "_" + spellType;
		}

		//-----------------------------
		/**
		 * 获取此技能CD剩余时间，包括检测公共CD剩余时间。(公共CD与自身CD返回剩余长的)
		 * @param spellType
		 * @return
		 *
		 */
		public function getSkillCDLastTime(spellProto : SpellProto) : uint
		{
			var isGlobal : Boolean = getSkillHasGlobal(spellProto);
			if (isGlobal)
			{
				var lastTime : uint = Math.max(CDDataManager.getCdLostTm(GLOBAL_SKILL_KEY), CDDataManager.getCdLostTm(getSkillKey(spellProto.spellType)));
				return lastTime;
			}

			return CDDataManager.getCdLostTm(getSkillKey(spellProto.spellType));
		}

		/**
		 * 此技能是否还有CD存在，包括公共技能的CD。
		 * @param spellType
		 * @return
		 *
		 */
		public function getSkillHasCDTime(spellProto : SpellProto) : Boolean
		{
			return getSkillCDLastTime(spellProto) > 0;
		}

		/**
		 * 这个技能是否计算公共CD
		 * @param spellType
		 * @return
		 *
		 */
		private function getSkillHasGlobal(spellProto : SpellProto) : Boolean
		{
			if (!spellProto || !spellProto.activeSpell)
				return false;
			var curGcd : int = GCDCfgData.getGcd(spellProto.activeSpell.gcdId);
			return curGcd > 0;
		}

		//--------------------------------------------

		/**
		 * 添加技能CD
		 * @param skillID
		 *
		 */
		public function addSkillCDTime(spellData : SpellProto) : void
		{
			if (spellData == null)
			{
				return;
			}
			var curGcd : int = GCDCfgData.getGcd(spellData.activeSpell.gcdId);
			var isGlobal : Boolean = curGcd > 0;
			if (isGlobal) //是否添加全局CD
			{
				//直接替换成当前技能的gcd为公共CD，上个公共CD现在一定完了，不然不可能释放这个技能了
				CDDataManager.playCD(GLOBAL_SKILL_KEY, curGcd);
			}

			var cdTime : int = 0; //已经经过的时间
			var configCDTime : int = spellData.activeSpell.cd; //配置的CD时间
			CDDataManager.playCD(getSkillKey(spellData.spellType), configCDTime, cdTime);

			if (!isGlobal)
				return;
			//如果是全局CD那么给影响的技能全部加上CD，如果它本身就有CD的话，留下CD长的那个
			var spellList : Array = MainRoleManager.actorInfo.getActiveSpells();
			var len : int = spellList.length;
			var skillLastCd : int;
			for (var i : int = 0; i < len; i++)
			{
				spellData = spellList[i];
				skillLastCd = CDDataManager.getCdLostTm(getSkillKey(spellData.spellType));
				if (skillLastCd < curGcd)
				{
					CDDataManager.playCD(getSkillKey(spellData.spellType), curGcd, 0);
				}
			}
		}


	}
}
