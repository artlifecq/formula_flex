package com.rpgGame.coreData.cfg
{
	/**
	 * 邮件server端配置数据
	 * @author Guodong.Zhang
	 * 
	 */
	public class MailCfgData
	{
		public static const MAX_FU_JIAN_COUNT:int = 7;
		/**最大邮件数量*/
		public static const MAX_MAIL_COUTN:int = 120;
		/**邮件过期时长，单位毫秒**/
		public static var mailExpireTime:Number = 1;
		/**基础扣费，单位：文**/
		public static var baseBandMoneyTax:Number = 1;
		/** 银两收费类型 **/
		public static var moneyTaxType:Number = 1;
		/****/
		public static var moneyTax:Number = 1;
		/** 物品税 **/
		public static var goodsTax:Array = [];
		/**最近联系人数限制**/
		public static var mailTargetLimit:int = 10;
		
		
//		public static function setConfig( mailConfig:MailConfig ):void
//		{
//			if( mailConfig == null )
//				return;
//			
//			mailExpireTime = mailConfig.mailExpireTime.toNumber();
//			baseBandMoneyTax = mailConfig.baseBandMoneyTax;
//			moneyTaxType = mailConfig.moneyTaxType;
//			moneyTax = mailConfig.moneyTax;
//			goodsTax = mailConfig.goodsTax;
//			mailTargetLimit = mailConfig.recentMailTargetLimit;
//		}
		
		/**
		 * 发一封邮件所要的扣的钱
		 * @param money
		 * @param itemCount
		 * @return 
		 * 
		 */		
//		public static function getMailTax( money:int, itemCount:int ):int
//		{
//			var mt:int = 0;
//			if( money > 0)
//			{
//				if( moneyTaxType == MoneyTaxType.FIX )
//				{
//					mt =  moneyTax;
//				}
//				else if( moneyTaxType == MoneyTaxType.PERCENT )
//				{
//					mt = money * moneyTax / 100;
//				}
//			}
//			var gt:int = 0;
//			if( itemCount <= 0 )
//				gt = 0;
//			else if( itemCount >= goodsTax.length )
//				gt = goodsTax[ goodsTax.length - 1];
//			else
//				gt = goodsTax[ itemCount - 1];
//			
//			return baseBandMoneyTax + mt + gt;
//		}
	}
}