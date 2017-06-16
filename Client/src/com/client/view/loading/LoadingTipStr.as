package com.client.view.loading
{
	public class LoadingTipStr
	{
		private static var data:Array=["强化装备可以提升装备的属性值",
													   "琢磨装备可以提升装备属性百分比",
														"多人副本中有几率获得极品稀有道具噢",
														"成为VIP，战力飙升，升级更轻松",
														"使用SPACE键，能翻滚躲避伤害"];
		private static var _index:int=0;
		public function LoadingTipStr()
		{
		}
		public static function getTips():String
		{
			_index++
			_index=_index%data.length;
			return data[_index];
		}
	}
}