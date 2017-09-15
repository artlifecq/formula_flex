package com.rpgGame.app.manager
{
	import com.rpgGame.app.manager.fulidating.DengJiLiBaoManager;
	import com.rpgGame.app.manager.fulidating.SignManager;
	import com.rpgGame.app.manager.fulidating.ZaiXianManager;
	import com.rpgGame.app.manager.pet.PetManager;
	import com.rpgGame.app.manager.shop.ShopManager;
	import com.rpgGame.app.manager.yunBiao.CheatsMgr;
	
	public class Mgr
	{
		public function Mgr()
		{
		}
		
		public static function get meridianMgr():MeridianMgr
		{
			return MeridianMgr.ins;
		}
		
		public static function get cheatsMgr():CheatsMgr
		{
			return CheatsMgr.ins;
		}
		public static function get teamMgr():TeamManager
		{
			return TeamManager.ins;
		}
		public static function get junjieMgr():JunJieManager
		{
			return JunJieManager.ins;
		}
		public static function get hunyinMgr():HunYinManager
		{
			return HunYinManager.ins;
		}
		public static function get shopMgr():ShopManager
		{
			return ShopManager.ins;
		}
		public static function get vipMgr():VipManager
		{
			return VipManager.ins;
		}
		public static function get jjBattleMgr():JJBattleManager
		{
			return JJBattleManager.ins;
		}
		public static function get d1v1Mgr():D1v1Manager
		{
			return D1v1Manager.ins;
		}
		public static function get nineTowerMgr():NineTowerMgr
		{
			return NineTowerMgr.ins;
		}
		public static function get petMgr():PetManager
		{
			return PetManager.ins;
		}
		public static function get activityPanelMgr():ActivityPanelMgr
		{
			return ActivityPanelMgr.ins;
		}	
		public static function get signMgr():SignManager
		{
			return SignManager.instance;
		}		
		public static function get dengjiMgr():DengJiLiBaoManager
		{
			return DengJiLiBaoManager.instance;
		}
		public static function get zaiXianMgr():ZaiXianManager
		{
			return ZaiXianManager.instance;
		}
	}
}