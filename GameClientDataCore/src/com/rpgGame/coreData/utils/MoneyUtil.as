package com.rpgGame.coreData.utils
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.lang.LangMisc;

	public class MoneyUtil
	{
		/** 两 **/
		public static const LIANG : int = 100;
		/** 锭 **/
		public static const DING : int = 100;
		/** 文 **/
		public static const WEN : int = 100;

		public function MoneyUtil()
		{
		}

		/**
		 * 转化成多少锭
		 * @param money
		 * @return
		 *
		 */
		public static function getDing(money : Number) : int
		{
			return money / DING / LIANG;
		}

		/**
		 * 转化成多少两
		 * @param money
		 * @return
		 *
		 */
		public static function getLiang(money : Number) : int
		{
			return money / LIANG % DING;
		}

		/**
		 * 转化成多少文
		 * @param money
		 * @return
		 *
		 */
		public static function getWen(money : Number) : int
		{
			return money % WEN;
		}

		/**
		 * 得到转化后的钱
		 * 如： 11锭11两11文
		 * @param money
		 * @return
		 *
		 */
		public static function getMoneyString(money : Number,useWen:Boolean = true) : String
		{
			var isCost : Boolean = money < 0;
			if (isCost)
				money = -money;
			var ding : int = getDing(money);
			var liang : int = getLiang(money);
			var wen : int = getWen(money);
			var moneyStrs : Array = [];
			if (ding > 0)
			{
				moneyStrs.push( ding + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO2));
			}
			if (liang > 0 || (!useWen && ding == 0))
			{
				moneyStrs.push(liang + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO3));
			}
			if (useWen && (wen > 0 || (ding == 0 && liang == 0)))
			{
				moneyStrs.push( wen + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO4));
			}
			//(isCost ? "-" : "") + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO, getDing(money), getLiang(money), getWen(money))
			return (isCost ? "-" : "") + moneyStrs.join(" ");
		}
		
		
		public static function getHtmlMoneyTips():String
		{
			var result:String="";
			
			return result;
		}
			
		
		
		/**
		 * 获取带颜色的钱
		 * @param money 钱
		 * @param onlyValid
		 * @param moneyDingColor 数值"XXX"颜色值
		 * @param moneyLiangColor 数值"XXX"颜色值
		 * @param moneyWenColor 数值"XXX"颜色值
		 * @param textDingColor "锭"字的颜色值
		 * @param textLiangColor "两"字的颜色值
		 * @param textWenColor "文"字的颜色值
		 * @param maxMoneyColor
		 * @return
		 *
		 */
		public static function getHtmlMoneyString( //
			money : Number, //
			onlyValid : Boolean = true, //
			moneyDingColor : uint = 0 ,//StaticValue.COLOR_CODE_1,
			moneyLiangColor : uint = 0 ,//StaticValue.COLOR_CODE_1, //
			moneyWenColor : uint = 0, //StaticValue.COLOR_CODE_1, //
			textDingColor : uint =  0,//StaticValue.COLOR_CODE_1, //
			textLiangColor : uint =0, // StaticValue.COLOR_CODE_1, //
			textWenColor : uint =  0,//StaticValue.COLOR_CODE_1, //
			maxMoneyColor : uint = 0, //StaticValue.COLOR_CODE_16, //
			useWen : Boolean = true) : String //
		{
			var isCost : Boolean = money < 0;
			if (isCost)
				money = -money;
			var tdc : String = StaticValue.tran16ToStr(textDingColor);
			var tlc : String = StaticValue.tran16ToStr(textLiangColor);
			var twc : String = StaticValue.tran16ToStr(textWenColor);
			var ding : int = getDing(money);
			var liang : int = getLiang(money);
			var wen : int = getWen(money);
			var dmc : String = StaticValue.tran16ToStr(ding > 999 ? maxMoneyColor : moneyDingColor);
			var d : String = HtmlTextUtil.getTextColor(dmc, ding + "");
			var lmc : String = StaticValue.tran16ToStr(moneyLiangColor);
			var l : String = HtmlTextUtil.getTextColor(lmc, liang + "");
			var wmc : String = StaticValue.tran16ToStr(moneyWenColor);
			var w : String = HtmlTextUtil.getTextColor(wmc, wen + "");
			var moneyStrs : Array = [];
			var costMc : String = null;
			if (ding > 0)
			{
				moneyStrs.push(HtmlTextUtil.getTextColor(tdc, d + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO2)));
				if (!costMc)
					costMc = dmc;
			}
			if (liang > 0 || (!useWen && ding == 0))
			{
				moneyStrs.push(HtmlTextUtil.getTextColor(tlc, l + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO3)));
				if (!costMc)
					costMc = lmc;
			}
			if (useWen && (wen > 0 || (ding == 0 && liang == 0)))
			{
				moneyStrs.push(HtmlTextUtil.getTextColor(twc, w + LanguageConfig.getText(LangMisc.MONEY_STRING_INFO4)));
				if (!costMc)
					costMc = wmc;
			}
			var cost : String = isCost ? HtmlTextUtil.getTextColor(costMc, "-") : "";
			return cost + moneyStrs.join(" ");
		}
		/**不使用文**/
		public static function getHtmlMoneyStringRemoveWen(money:Number):String
		{
			/*return getHtmlMoneyString(money,true,
				StaticValue.COLOR_CODE_1,
				StaticValue.COLOR_CODE_1,
				StaticValue.COLOR_CODE_1,
				StaticValue.COLOR_CODE_1,
				StaticValue.COLOR_CODE_1,
				StaticValue.COLOR_CODE_1,
				StaticValue.COLOR_CODE_16,
				false);*/
			return "";
		}
		
		public static function getAutoHtmlMoneyString(money:Number):String
		{
			/*if(money>=100000000)
				return getHtmlMoneyStringRemoveWen(money);
			return getHtmlMoneyString(money);*/
			return "";
		}

		/**
		 * 把大钱转成小钱
		 * 如：1锭1两1文 = 10101文
		 * @param ding
		 * @param liang
		 * @param wen
		 * @return
		 *
		 */
		public static function getSmallMoney(ding : Number, liang : Number, wen : Number) : Number
		{
			return wen + liang * LIANG + ding * LIANG * DING;
		}

	}
}
