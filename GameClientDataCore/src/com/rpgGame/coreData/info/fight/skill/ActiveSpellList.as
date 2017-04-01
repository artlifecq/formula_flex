package com.rpgGame.coreData.info.fight.skill
{
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.netData.skill.bean.SkillInfo;
	import com.rpgGame.netData.skill.message.ResSkillInfosMessage;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 角色已经拥有的技能，可以放到技能栏中释放的技能 
	 * @author NEIL
	 * 
	 */	
	public class ActiveSpellList
	{
		/**当前职业**/
//		public var race : int = -1;

		/**升到等级，总共获得的技能点**/
		public var totalAddSpellPoint : int;
		/**额外获得的技能点数**/
		public var obtainSpellPoint : int;

		private var _skillInfoMap : HashMap;
		private var _spellMap : HashMap;
		private var _autoSpellMap : Array;
		private var _autoLastSpellID : int;

		public function ActiveSpellList()
		{
			_spellMap = new HashMap;
			_skillInfoMap=new HashMap();
			_autoSpellMap = [];
			_autoLastSpellID = 0;
		}

		public function setHeroData(msg : ResSkillInfosMessage) : void
		{
//			if (learnRaceSpells.hasRace)
//			{
//				race = learnRaceSpells.race;
//			}

//			for each (var spellData : SpellProto in learnRaceSpells.spells)
//			{
//				addSpell(spellData);
//			}
            _spellMap.clear();
			_skillInfoMap.clear();
			for each (var spellInfo : SkillInfo in msg.skills)
			{
				addSkillData(spellInfo);
			}
		}
		
		public function addSkillData(spellInfo:SkillInfo):void
		{
			addSpell(SpellDataManager.getSpellData(spellInfo.skillModelId,spellInfo.skillLevel));
			addSkillInfo(spellInfo);
		}
		
		private function addSkillInfo(spellInfo:SkillInfo):void
		{
			_skillInfoMap.add(spellInfo.skillModelId,spellInfo);
		}
		
		public function getSkillInfo(spellID : int):SkillInfo
		{
			return _skillInfoMap.getValue(spellID);
		}
		
		public function addSpell(spellData : Q_skill_model) : void
		{
			_spellMap.add(spellData.q_skillID, spellData);
		}

		public function hasTypeSpell(spellID : int) : Boolean
		{
			return _spellMap.getValue(spellID);
		}
		
		/**
		 *获取学习技能信息 
		 * @return 
		 * 
		 */
		public function getStudySpell(spellID:int):Q_skill_model
		{
			var spell : Q_skill_model;
			var info:SkillInfo=getSkillInfo(spellID);
			if(!info){
				return null;
			}
			spell=SpellDataManager.getSpellData(spellID,info.skillLevel);
			if(spell){
				return spell;
			}
			return null;
		}

		public function getSpell(spellID : int) : Q_skill_model
		{
			return _spellMap.getValue(spellID);
		}
		
		/**
		 * 得到默认技能 
		 * @return 
		 * 
		 */		
		public function getDefaultSpell():Q_skill_model
		{
			var spell : Q_skill_model;
			var spells : Array = _spellMap.getValues();
			var len : int = spells.length;
			for (var i : int = 0; i < len; i++)
			{
				spell = spells[i];
				if(spell.q_trigger_type == 1 && isDefaultSpell(spell.q_skillID))
				{
					return spell;
				}
			}
			return null;
		}
		
		/**
		 * 该技能是否为默认技能 
		 * @param spellID
		 * @return 
		 * 
		 */		
		public function isDefaultSpell(spellID:int):Boolean
		{
			var spell:Q_skill_model = getSpell(spellID);
			if(spell.q_default_enable)
				return spell;
			return false;
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
		public function getAutoSpellList() : Vector.<Q_skill_model>
		{
			var spellVect : Vector.<Q_skill_model> = new Vector.<Q_skill_model>;

			var spell : Q_skill_model;
			var spells : Array = _spellMap.getValues();
			var len : int = spells.length;
			for (var i : int = 0; i < len; i++)
			{
				spell = spells[i];
				if(spell.q_trigger_type == 1 && isAutoSpellId(spell.q_skillID))
					spellVect.push(spell);
//				if (spell.activeSpell && spell.race == race && isAutoSpellId(spell.spellID))
			}

			return spellVect;
		}
        
        /**
         * 得到所有的主动技能
         * @return
         *
         */
        public function getShortcutSpellList() : Vector.<Q_skill_model>
        {
            var spellVect : Vector.<Q_skill_model> = new Vector.<Q_skill_model>;
            
            var spell : Q_skill_model;
            var spells : Array = _spellMap.getValues();
            var len : int = spells.length;
            for (var i : int = 0; i < len; i++)
            {
                spell = spells[i];
                if(spell.q_shortcut == 1)
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
			var spell : Q_skill_model;
			var spells : Array = _spellMap.getValues();
			var len : int = spells.length;
			for (var i : int = 0; i < len; i++)
			{
				spell = spells[i];

//				if (race == spell.race || race == 0)
//					allLevel += spell.spellLevel;
				allLevel = spell.q_grade;
			}

			return allLevel;
		}

		public function getAllSpellPoint() : int
		{
			return obtainSpellPoint + totalAddSpellPoint;
		}

		public function getNextAutoSpellID() : int
		{
			var index : int = _autoSpellMap.indexOf(_autoLastSpellID);
			index++;
			if (index >= _autoSpellMap.length)
			{
				index = 0;
			}
			if (index < _autoSpellMap.length)
			{
				_autoLastSpellID = _autoSpellMap[index];
				return _autoLastSpellID;
			}
			return 0;
		}

		/**
		 * 重置了技能
		 *
		 */
		public function clearSpell() : void
		{
//			race = -1;
			_spellMap.clear();
			//----------------------------清空自动使用技能设置
			_autoSpellMap.length = 0;
			_autoLastSpellID = 0;
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
		 * @param spellID
		 * @return
		 *
		 */
		public function isAutoSpellId(spellID : int) : Boolean
		{
			return _autoSpellMap.indexOf(spellID) > -1;
		}

		public function reqAutoSpellMsg(spellID : int) : Boolean
		{
			if (_autoSpellMap.length < 3)
			{
				var index : int = _autoSpellMap.indexOf(spellID);
				if (index < 0)
					_autoSpellMap.push(spellID);
				return true;
			}
			else
			{
				trace("设置自动释放技能时达到上限了，要先取消一下");
			}
			return false;
		}

		public function removeAutoSpell(spellID : int) : void
		{
			var index : int = _autoSpellMap.indexOf(spellID);
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
