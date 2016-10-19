package com.rpgGame.core.fight.spell
{
	import com.rpgGame.coreData.cfg.SpellEffectDataManager;

	import flash.geom.Point;

	import app.message.SpellEffectProto;
	import app.message.SpellProto;

	/**
	 *
	 * 投放技能信息
	 * @author L.L.M.Sunny
	 * 创建时间：2015-6-11 下午5:22:16
	 *
	 */
	public class CastSpellInfo
	{
		private var _spellData : SpellProto;
		public var caseSpellData : SpellProto;
		public var targetID : Number;
		public var targetPos : Point;
		public var releasePos : Point;
		public var angle : int;
		public var range : int;

		public function CastSpellInfo(spellData : SpellProto)
		{
			_spellData = spellData;
		}

		public function get spellData() : SpellProto
		{
			return _spellData;
		}

		public function get isReleaseAtMouse() : Boolean
		{
			return _spellData.activeSpell && _spellData.activeSpell.isReleaseAtMouse; //是否鼠标处释放
		}

		public function get isReleaseOnlyUpMount() : Boolean
		{
			return _spellData.activeSpell && _spellData.activeSpell.isReleaseOnlyUpMount; //是否只有在马上才能释放
		}

		public function get spellEffectData() : SpellEffectProto
		{
			if (!_spellData.activeSpell)
				return null;
			return SpellEffectDataManager.getData(_spellData.activeSpell.spellEffectId);
		}
	}
}
