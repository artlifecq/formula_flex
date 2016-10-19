package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.lang.LangMisc;
	
	import app.message.AmountType;
	

	/**
	 *
	 * 商店相关类型
	 * @author EC
	 * 创建时间：2014-4-8 下午6:29:10
	 * 
	 */
	public class ShopType
	{
		/**元宝商城 */
		public static const SHOP_TYPE_MALL:int = 0;
		/**随身商店 */
		public static const SHOP_TYPE_BODY:int = 1;
		/**NPC商店 */
		public static const SHOP_TYPE_NPC:int = 2;
		
		/** 促销标示： 无热销  */
		public static const NOT_HOT_SELL:int = 0;
		/** 促销标示： 热销中  */
		public static const HOT_SELL:int = 1;
		/** 促销标示： 折扣 */
		public static const ZHEKOU_SELL:int = 2;
		/** 促销标示： 热销  + 折扣  */
		public static const HOT_AND_ZHEKOU_SELL:int = 3;
		
		public static function getMoneyStrByType(priceType:int):String
		{
			var moneyStr:String = "";
			switch(priceType)
			{
				case AmountType.EXP:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE8 );
					break;
				case AmountType.BAND_JINZI:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE4 );
					break;
				case AmountType.JINZI:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE3 );
					break;
				case AmountType.MONEY:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE1 );
					break;
				case AmountType.BAND_MONEY:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE2 );
					break;
				case AmountType.HONOR:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE5 );
					break;
				case AmountType.GONGXUN:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE7 );
					break;
				case AmountType.FAMILY_LILIAN:
					moneyStr = LanguageConfig.getText( LangMisc.MONEY_TITLE6 );
					break;
			}
			return moneyStr;
		}
		
		
		
		public static function getMoneyIco( priceType:int ):String
		{
			var moneyStr:String = "";
			switch( priceType )
			{
				case AmountType.EXP:
					moneyStr = "1EXP";
					break;
				case AmountType.BAND_JINZI:
					moneyStr = "122";
					break;
				case AmountType.JINZI:
					moneyStr = "101";
					break;
				case AmountType.MONEY:
					moneyStr = "yinzi";
					break;
				case AmountType.BAND_MONEY:
					moneyStr = "111";
					break;
				case AmountType.HONOR:
					moneyStr = "111";
					break;
				case AmountType.GONGXUN:
					moneyStr = "111";
					break;
				case AmountType.FAMILY_LILIAN:
					moneyStr = "111";
					break;
			}
			return moneyStr;
		
		}
	}
}