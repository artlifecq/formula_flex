package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;

	/**
	 *
	 * 投放技能锁定状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-11-09 上午11:25:12
	 *
	 */
	public class CastSpellLockStateReference extends RoleStateReference
	{
		private var _spellData : Q_skill_model;

		public function CastSpellLockStateReference()
		{
			super();
		}

		public function setParams(spellData : Q_skill_model) : void
		{
			_spellData = spellData;
		}

		public function get spellData() : Q_skill_model
		{
			return _spellData;
		}

		override public function dispose() : void
		{
			_spellData = null;
			super.dispose();
		}
	}
}
