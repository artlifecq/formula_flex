package com.rpgGame.coreData.info.society
{
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.StatNameCfgData;
	import com.rpgGame.coreData.cfg.society.SocietyStaticConfigData;
	import com.rpgGame.coreData.enum.StaticBuffCfgId;
	import com.rpgGame.coreData.info.buff.BuffInfo;
	import com.rpgGame.coreData.info.stat.StatData;

	import app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto;
	import app.message.AllFamilyCollageDatasProto.FamilyCollageSpellDatasProto.FamilyCollageSpellDataProto;

	/**
	 *
	 * 家族技能总数据
	 * @author L.L.M.Sunny
	 * 创建时间：2016-04-21 下午2:53:32
	 *
	 */
	public class SocietySpellTotalData
	{
		/**技能学习情况**/
		private var _learnLevels : Array = null;
		private var _societyData : SocietyDetailData = null;
		private var _spellDatas : Array = null;
		private var _buffInfo : BuffInfo = null;

		public function SocietySpellTotalData(roleId : Number)
		{
			_buffInfo = new BuffInfo(roleId);
			_buffInfo.cfgId = StaticBuffCfgId.SOCIETY_SPELL_BUFF_CFG_ID;
			_buffInfo.disappearTime = 0;
			_buffInfo.icoName = "bangji";
			_buffInfo.isBuff = true;
			_buffInfo.specialData = this;
			_learnLevels = [];
			_spellDatas = [];
		}

		public function updateLearnLevels(learnLevels : Array) : void
		{
			_learnLevels.length = 0;
			if (learnLevels)
			{
				_learnLevels = learnLevels;
			}
			updateSocietyData(_societyData);
		}

		public function updateSocietyData(societyData : SocietyDetailData) : void
		{
			_societyData = societyData;
			var collageLevel : int = _societyData ? _societyData.collageLevel : 0;
			var maxLevel : int = SocietyStaticConfigData.getBuildCollageMaxLevel();
			var maxCollageSpellLevel : int = SocietyStaticConfigData.getMaxCollageSpellLevel();
			_spellDatas.length = 0;
			var level : int = 0;
			while (level < maxLevel)
			{
				level++;
				var familyCollageSpellDatasProto : FamilyCollageSpellDatasProto = SocietyStaticConfigData.getBuildCollageSpellDatas(level);
				if (familyCollageSpellDatasProto)
				{
					var learnMaxLevel : int = familyCollageSpellDatasProto.spellData.length;
					var learnLevel : int = level <= _learnLevels.length ? _learnLevels[level - 1] : 0;
					if (learnLevel > learnMaxLevel)
					{
						learnLevel = learnMaxLevel;
					}
					var collageSpellDataProto : FamilyCollageSpellDataProto = (learnLevel > 0 && learnLevel <= learnMaxLevel) ? familyCollageSpellDatasProto.spellData[learnLevel - 1] : null;
					if (!collageSpellDataProto)
					{
						learnLevel = 0;
						collageSpellDataProto = familyCollageSpellDatasProto.spellData[0];
					}
					if (collageSpellDataProto)
					{
						var currMaxLearnLevel : int = 0;
						for each (var currSpellData : FamilyCollageSpellDataProto in familyCollageSpellDatasProto.spellData)
						{
							if (currSpellData.collageLevel > collageLevel)
							{
								break;
							}
							currMaxLearnLevel = currSpellData.level;
						}
						var spellData : SocietySpellData = new SocietySpellData();
						spellData.index = level - 1;
						spellData.learnLevel = learnLevel;
						spellData.maxLearnLevel = currMaxLearnLevel;
						spellData.maxSpellCollageLevel = collageLevel > maxCollageSpellLevel ? maxCollageSpellLevel : collageLevel;
						spellData.currCollageLevel = collageLevel;
						spellData.needCollageLevel = collageSpellDataProto.collageLevel;
						spellData.proto = collageSpellDataProto.spell;
						if (collageSpellDataProto.spell.passiveSpell)
						{
							spellData.spriteStat = new SpriteStat();
							spellData.spriteStat.setData(collageSpellDataProto.spell.passiveSpell.spriteStat);
						}
						else
						{
							spellData.spriteStat = null;
						}
						_spellDatas.push(spellData);
					}
				}
			}
		}

		public function getSpellList() : Array
		{
			return _spellDatas;
		}

		public function setSpellLevel(index : int, level : int) : void
		{
			_learnLevels[index] = level;
			updateSocietyData(_societyData);
		}

		public function get allSpellStateDesc() : String
		{
			var descs : Array = [];
			var value : String;
			var statValue : String;
			for each (var spellData : SocietySpellData in _spellDatas)
			{
				if (spellData.learnLevel > 0)
				{
					if (spellData.spriteStat)
					{
						var array : Array = spellData.spriteStat.getStatValues();
						for each (var stat : StatData in array)
						{
							value = stat.value ? stat.value + "" : stat.percent + "%";
							statValue = StatNameCfgData.getStatName(stat.type) + "+" + value;
							descs.push(spellData.proto.name + "：" + statValue);
						}
					}
					else
					{
						descs.push(spellData.proto.name);
					}
				}
			}
			return descs.join("<br>");
		}

		public function get hasLearnSpell() : Boolean
		{
			for each (var spellData : SocietySpellData in _spellDatas)
			{
				if (spellData.learnLevel > 0)
				{
					return true;
				}
			}
			return false;
		}

		public function clear() : void
		{
			_learnLevels.length = 0;
			_spellDatas.length = 0;
			_societyData = null;
		}

		public function get buffInfo() : BuffInfo
		{
			return _buffInfo;
		}

		public function get societyData() : SocietyDetailData
		{
			return _societyData;
		}
	}
}
