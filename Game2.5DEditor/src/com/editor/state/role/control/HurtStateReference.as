package com.editor.state.role.control
{
	import com.editor.fight.spell.ReleaseSpellInfo;
	import com.game.engine3D.state.role.RoleStateReference;

	/**
	 *
	 * 伤害状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-13 下午5:25:12
	 *
	 */
	public class HurtStateReference extends RoleStateReference
	{
		private var _info : ReleaseSpellInfo;
		private var _hurtVo : *; //FightHurtResult;

		public function HurtStateReference()
		{
			super();
		}

		public function setParams(info : ReleaseSpellInfo, hurtVo : * /*FightHurtResult*/) : void
		{
			_info = info;
			_hurtVo = hurtVo;
		}

		public function get info() : ReleaseSpellInfo
		{
			return _info;
		}

		public function get hurtVo() : * //FightHurtResult
		{
			return _hurtVo;
		}

		override public function dispose() : void
		{
			_info = null;
			if (_hurtVo)
			{
				_hurtVo.clearHurtList();
				_hurtVo = null;
			}
			super.dispose();
		}
	}
}
