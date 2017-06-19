package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.ui.common.NumSelectUICtrl;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	public class D1v1RankPageSelectCtrl extends NumSelectUICtrl
	{
		public function D1v1RankPageSelectCtrl(btnA:Button, btnD:Button, btnMax:Button, btnMin:Button, la:Label, addMax:int, maxValue:int, changeCall:Function)
		{
			super(btnA, btnD, btnMax, btnMin, la, addMax, maxValue, changeCall);
		}
		override protected function getText():String
		{
			return getValue()+"/"+maxCount;
		}
	}
}