package com.rpgGame.core.fight.spell
{
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	
	import flash.geom.Point;

	/**
	 *
	 * 投放技能信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class CastSpellInfo
	{
		private var _spellData : Q_skill_model;
		public var caseSpellData : Q_skill_model;
		public var targetID : int;
		public var targetPos : Point;
		public var releasePos : Point;
		public var angle : int;
		public var range : int;

		public function CastSpellInfo(spellData : Q_skill_model)
		{
			_spellData = spellData;
		}

		public function get spellData() : Q_skill_model
		{
			return _spellData;
		}

		public function get isReleaseAtMouse() : Boolean
		{
			return true;//_spellData.activeSpell && _spellData.activeSpell.isReleaseAtMouse; //是否鼠标处释放
		}

		public function get isReleaseOnlyUpMount() : Boolean
		{
			return false;//_spellData.activeSpell && _spellData.activeSpell.isReleaseOnlyUpMount; //是否只有在马上才能释放
		}

		public function get spellEffectData() : Q_SpellEffect
		{
			return SpellEffectDataManager.getData(_spellData.q_spell_effect);
		}
	}
}
