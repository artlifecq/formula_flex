package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;

	import app.message.SpellEffectProto;

	/**
	 *
	 * 投放技能锁定状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-09 上午11:25:12
	 *
	 */
	public class CastSpellLockStateReference extends RoleStateReference
	{
		private var _spellEffectData : SpellEffectProto;

		public function CastSpellLockStateReference()
		{
			super();
		}

		public function setParams(spellEffectData : SpellEffectProto) : void
		{
			_spellEffectData = spellEffectData;
		}

		public function get spellEffectData() : SpellEffectProto
		{
			return _spellEffectData;
		}

		override public function dispose() : void
		{
			_spellEffectData = null;
			super.dispose();
		}
	}
}
