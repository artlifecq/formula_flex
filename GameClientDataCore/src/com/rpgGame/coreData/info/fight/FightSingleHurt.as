package com.rpgGame.coreData.info.fight
{
	/**
	 * 一次打击伤害
	 * @author linYe
	 * 
	 */
	public class FightSingleHurt
	{
		/**伤害类型 0. 普通. 1. 闪避, 2. 暴击, 3. 跳闪   4. 免疫	5.吸收**/
		private var _hurtType:int;
		/**本次打击伤害了它多少血，服务器加血发的负数，伤害是正数，客户端刚好相反**/
		private var _hurtAmount:int;
		
		private var _roleID:Number;
		
		public function FightSingleHurt(hurtType:int,hurtAmount:int,roleID:Number)
		{
			this._hurtType = hurtType;
			this._hurtAmount = -hurtAmount;
			_roleID = roleID;
		}
		
		/**
		 * 伤害类型 1. 普通. 2. 闪避, 3. 暴击, 4. 跳闪	5.吸收
		 * @return 
		 * 
		 */
		public function get hurtType():int
		{
			return _hurtType;
		}

		/**
		 * 本次打击伤害了它多少血
		 * @return 
		 * 
		 */
		public function get hurtAmount():int
		{
			return _hurtAmount;
		}

		public function get roleID():Number
		{
			return _roleID;
		}

		
	}
}