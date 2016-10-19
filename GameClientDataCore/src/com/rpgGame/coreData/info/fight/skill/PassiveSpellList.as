package com.rpgGame.coreData.info.fight.skill
{
	

	/**
	 *
	 * 被动技能列表
	 * @author L.L.M.Sunny
	 * 创建时间：2015-7-13 上午11:32:15
	 *
	 */
	public class PassiveSpellList
	{
		private var _list : Vector.<*>;

		public function PassiveSpellList()
		{
			_list = new Vector.<*>();
		}

		public function addSpell(spellData:*) : void
		{
			if(spellData)
			{
				if (!hasTypeSpell(spellData.type))
					_list.push(spellData);
				else
					throw new Error("该类型的技能已经存在！" + spellData.type);
			}
		}

		public function hasTypeSpell(type : int) : Boolean
		{
			for each (var spellData : * in _list)
			{
				if (spellData.type == type)
					return true;
			}
			return false;
		}

		public function getSpell(type : int) : *
		{
			for each (var spellData : * in _list)
			{
				if (spellData.type == type)
				{
					return spellData;
				}
			}
			return null;
		}

//		public function getSpellByIndex(index : int) : *
//		{
//			if (index > -1 && index < _list.length)
//				return _list[index];
//			return null;
//		}

		public function cloneList() : Vector.<*>
		{
			return _list.slice();
		}
	}
}
