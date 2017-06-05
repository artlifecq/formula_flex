package com.rpgGame.appModule.shop
{
	import org.mokylin.skin.app.zhanchang.shangdian.ShengWangItem;
	
	public class BattleShopItemExt extends BaseShopItem
	{
		public function BattleShopItemExt(ix:int=0, iy:int=0)
		{
			super(new ShengWangItem(), ix, iy);
		}
	}
}