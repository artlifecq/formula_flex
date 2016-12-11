package com.rpgGame.coreData.info.fight.skill
{
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import com.rpgGame.netData.skill.message.ResSkillInfosMessage;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 所有学习过的技能数据
	 * @author NEIL
	 *
	 */
	public class ActiveSpellList_old
	{
		/**当前职业**/
		public var race : int = -1;

		/**升到等级，总共获得的技能点**/
		public var totalAddSpellPoint : int;
		/**额外获得的技能点数**/
		public var obtainSpellPoint : int;

		private var _spellMap : HashMap;
		private var _autoSpellMap : Array;
		private var _autoLastSpellType : int;

		public function ActiveSpellList_old()
		{
			_spellMap = new HashMap;
			_autoSpellMap = [];
			_autoLastSpellType = 0;
		}

		public function setHeroData(msg : ResSkillInfosMessage) : void
		{
			/*if (msg.hasRace)
			{
				race = msg.race;
			}*/

			for each (var spellInfo : SkillInfo in msg.skills)
			{
				addSpell(spellInfo);
			}
		}

		public function addSpell(spellInfo : SkillInfo) : void
		{
			_spellMap.add(spellInfo.skillModelId, spellInfo);
		}

		public function hasTypeSpell(spellType : int) : Boolean
		{
			return _spellMap.getValue(spellType);
		}

		public function getSpell(skillModelId : int) : SkillInfo
		{
			return _spellMap.getValue(skillModelId);
		}

		/**
		 * 得到所有的技能
		 * @return
		 *
		 */
		public function getSpellList() : Array
		{
			return _spellMap.getValues();
		}

		/**
		 * 得到所有的主动技能
		 * @return
		 *
		 */
		public function getAutoSpellList() : Vector.<SkillInfo>
		{
			var spellVect : Vector.<SkillInfo> = new Vector.<SkillInfo>;

			var spell : SkillInfo;
			var spells : Array = _spellMap.getValues();
			var len : int = spells.length;
			for (var i : int = 0; i < len; i++)
			{
				spell = spells[i];
				if (/*spell.activeSpell && */isAutoSpellId(spell.skillModelId))
					spellVect.push(spell);
			}

			return spellVect;
		}

		/**
		 * 得到当前对某个职业总等级
		 * 就是对这个系加了多少点
		 * @return
		 *
		 */
		public function getCurRaceSpellAllLevel(race : int = 0) : int
		{
			var allLevel : int = 0;
			var spell : SkillInfo;
			var spells : Array = _spellMap.getValues();
			var len : int = spells.length;
			/*for (var i : int = 0; i < len; i++)
			{
				spell = spells[i];

				if (race == spell.race || race == 0)
					allLevel += spell.spellLevel;
			}*/

			return allLevel;
		}
		
		public function getAllSpellPoint() : int
		{
			return obtainSpellPoint + totalAddSpellPoint;
		}

		public function getNextAutoSpellType() : int
		{
			var index : int = _autoSpellMap.indexOf(_autoLastSpellType);
			index++;
			if (index >= _autoSpellMap.length)
			{
				index = 0;
			}
			if (index < _autoSpellMap.length)
			{
				_autoLastSpellType = _autoSpellMap[index];
				return _autoLastSpellType;
			}
			return 0;
		}

		/**
		 * 重置了技能
		 *
		 */
		public function clearSpell() : void
		{
			race = -1;
			_spellMap.clear();
			//----------------------------清空自动使用技能设置
			_autoSpellMap.length = 0;
			_autoLastSpellType = 0;
		}

		//--------------------------------------------------

		/**
		 * 得到所有可以自动释放的技能
		 * @return
		 *
		 */
		public function getAllAutoSpellType() : Array
		{
			return _autoSpellMap;
		}

		public function getAutoSpellLen() : int
		{
			return _autoSpellMap.length;
		}

		/**
		 * 是否是可以自动释放的技能
		 * @param spellType
		 * @return
		 *
		 */
		public function isAutoSpellId(spellType : int) : Boolean
		{
			return _autoSpellMap.indexOf(spellType) > -1;
		}

		public function reqAutoSpellMsg(spellType : int) : Boolean
		{
			if (_autoSpellMap.length < 3)
			{
				var index : int = _autoSpellMap.indexOf(spellType);
				if (index < 0)
					_autoSpellMap.push(spellType);
				return true;
			}
			else
			{
				trace("设置自动释放技能时达到上限了，要先取消一下");
			}
			return false;
		}

		public function removeAutoSpell(spellType : int) : void
		{
			var index : int = _autoSpellMap.indexOf(spellType);
			if (index > -1)
			{
				_autoSpellMap.splice(index, 1);
			}
			else
			{
				trace("删除一个自动释放技能数据，失败了，说明没有设置过这个技能");
			}
		}
	}
}
