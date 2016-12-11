package com.rpgGame.coreData.info.fight
{
	import com.rpgGame.coreData.type.EnumHurtType;
	
	import flash.geom.Point;
	
	/**
	 * 对某个单位的一个技能伤害结果 ，可能包含多次伤害
	 * @author
	 *
	 */
	public class FightHurtResult
	{
		/** 否造成位移。 **/
		public var hasPositionChange : Boolean = false;
		/** 本次技能之后, 还剩多少血。。 **/
		public var curLife : Number = 0;
		/** 本次技能之后, 还剩多少法术。。 **/
		public var curMana : Number = 0;
		/** 如果有造成位移，对象新的坐标。hasPositionChange为 true 时有效。 **/
		public var newPosition : Point = new Point();
		
		private var _hurts : Vector.<FightSingleHurt> = new Vector.<FightSingleHurt>();
		private var _hurtCounts : int = 0;
		private var _roleID : Number;
		/** 本次技能对此目标单位共造成伤害 **/
		private var _hurtAmount : int;
		public var stiffTime : int = 0;
		public var attackerId : Number = 0;
		
		public function FightHurtResult(roleID : Number)
		{
			this._roleID = roleID;
		}
		
		/**
		 * 本次技能对此目标单位共造成伤害 Vector
		 * @return
		 *
		 */
		public function get hurtList() : Vector.<FightSingleHurt>
		{
			return _hurts;
		}
		
		public function clearHurtList() : void
		{
			_hurts.length = 0;
		}
		
		public function get remainHurtAmount() : int
		{
			var cnt : int = 0;
			for each (var sVo : FightSingleHurt in _hurts)
			{
				if (sVo.hurtType != EnumHurtType.SPELL_HURT_TYPE_ABSORB)
				{
					cnt += sVo.hurtAmount;
				}
			}
			return cnt;
		}
		
		public function getHurtCounts() : int
		{
			return this._hurtCounts;
		}
		
		public function getHurt(i : int) : FightSingleHurt
		{
			if (i > this._hurtCounts - 1)
			{
				return null;
			}
			return this._hurts[i];
		}
		
		public function addHurt(hurt : FightSingleHurt) : void
		{
			this._hurts.push(hurt);
			this._hurtAmount += hurt.hurtAmount;
			this._hurtCounts++;
		}
		
		public function get roleID() : Number
		{
			return _roleID;
		}
		
		/**
		 * 本次技能对此目标单位共造成伤害
		 * @return
		 *
		 */
		public function get hurtAmount() : int
		{
			return _hurtAmount;
		}
	}
}
