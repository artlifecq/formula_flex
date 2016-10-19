package com.rpgGame.app.state.role.control
{
	import com.game.engine3D.state.role.RoleStateReference;
	import com.rpgGame.app.fight.spell.ReleaseSpellInfo;
	import com.rpgGame.coreData.info.fight.FightHurtResult;

	/**
	 *
	 * 伤害状态引用
	 * @author L.L.M.Sunny
	 * 创建时间：2015-8-13 下午5:25:12
	 *
	 */
	public class HurtStateReference extends RoleStateReference
	{
		/** 释放技能信息 **/
		private var _info : ReleaseSpellInfo;
		/** 对某个单位的一个技能伤害结果 ，可能包含多次伤害 **/
		private var _hurtVo : FightHurtResult;

		public function HurtStateReference()
		{
			super();
		}

		/**
		 * 设置数据 
		 * @param info 释放技能信息
		 * @param hurtVo 对某个单位的一个技能伤害结果 ，可能包含多次伤害
		 * 
		 */		
		public function setParams(info : ReleaseSpellInfo, hurtVo : FightHurtResult) : void
		{
			_info = info;
			_hurtVo = hurtVo;
		}

		/**
		 * 释放技能信息 
		 * @return 
		 * 
		 */		
		public function get info() : ReleaseSpellInfo
		{
			return _info;
		}

		/**
		 * 对某个单位的一个技能伤害结果 ，可能包含多次伤害 
		 * @return 
		 * 
		 */		
		public function get hurtVo() : FightHurtResult
		{
			return _hurtVo;
		}

		/**
		 * 销毁 
		 * 
		 */		
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
