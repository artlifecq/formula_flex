package com.rpgGame.app.manager.look
{
	import com.rpgGame.app.manager.goods.RoleEquipmentManager;
	import com.rpgGame.coreData.role.HeroData;
	
	import app.message.OtherHeroProto;

	/**
	 * @author 刘吉
	 * @E-mail:liuji@mokylin.com
	 * 创建时间：2016-8-15 上午9:53:34
	 */
	
	public class LookManager
	{
		public static function setRoleData(roleInfo:OtherHeroProto):void
		{
			if(!heroData)
			{
				heroData = new HeroData();
			}
			
			HeroData.setOtherRoleData(heroData, roleInfo);
		}
		
		public static var heroData:HeroData = null;
	}
}