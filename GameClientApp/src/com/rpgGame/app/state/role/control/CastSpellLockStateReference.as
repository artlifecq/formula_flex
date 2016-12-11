package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.coreData.clientConfig.Q_SpellEffect;

	/**
	 *
	 * 投放技能锁定状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-09 上午11:25:12
	 *
	 */
	public class CastSpellLockStateReference extends RoleStateReference
	{
		private var _spellEffectData : Q_SpellEffect;

		public function CastSpellLockStateReference()
		{
			super();
		}

		public function setParams(spellEffectData : Q_SpellEffect) : void
		{
			_spellEffectData = spellEffectData;
		}

		public function get spellEffectData() : Q_SpellEffect
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
