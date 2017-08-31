package com.rpgGame.app.manager.pet
{
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;

	public class PetShowData extends DynamicTipData
	{
		private var _exp:int;
		
		public function set exp(value:int):void
		{
			_exp=value;
		}
		
		public function get exp():int
		{
			return _exp;
		}
		
		public function needClearExp():Boolean
		{
			return true;
		}
	}
}