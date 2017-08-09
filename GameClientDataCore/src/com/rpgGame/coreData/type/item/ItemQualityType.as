package com.rpgGame.coreData.type.item
{
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.item.EquipInfo;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.lang.LangMisc;
	
	import app.message.Evaluate;
	import app.message.Quality;

	public class ItemQualityType
	{
		public static function getColorValue(quality:int):int
		{
			switch(quality)
			{
				case Quality.WHITE:
					return StaticValue.Q_WHITE;
				case Quality.BLUE:
					return StaticValue.Q_BLUE;
				case Quality.YELLOW:
					return StaticValue.Q_YELLOW;
				case Quality.GREEN:
					return StaticValue.Q_GREEN;
				case Quality.PURPLE:
					return StaticValue.Q_PURPLE;
				default:
					return 0;
			}
		}
		
		/**
		 * 获取装备评价对应的名字 
		 * @param evalute
		 * @return 
		 * 
		 */		
		public static function getEvaluteStr(evalute:int):String
		{
			switch(evalute)
			{
				case Evaluate.GENERAL:
					return LanguageConfig.getText(LangMisc.GENERAL);
				case Evaluate.STRENGTHEN:
					return LanguageConfig.getText(LangMisc.STRENGTHEN);
				case Evaluate.EXCELLENT:
					return LanguageConfig.getText(LangMisc.EXCELLENT);
				case Evaluate.BEST:
					return LanguageConfig.getText(LangMisc.BEST);
				default:
					return LanguageConfig.getText(LangMisc.GENERAL);
			}
		}
		/**
		 * 获取装备品质对应的颜色 
		 * @param quality
		 * @return 
		 * 
		 */	
		public static function getColorStr(quality:int):String
		{
			switch(quality)
			{
				case Quality.WHITE:
					return LanguageConfig.getText( LangMisc.WHITE);
				case Quality.BLUE:
					return LanguageConfig.getText( LangMisc.BLUE);
				case Quality.YELLOW:
					return LanguageConfig.getText( LangMisc.YELLOW);
				case Quality.GREEN:
					return LanguageConfig.getText( LangMisc.GREEN);
				case Quality.PURPLE:
					return LanguageConfig.getText( LangMisc.PURPLE);
				default: 
					return LanguageConfig.getText( LangMisc.WHITE);
			}
		}
		
		public static function getHtmlColorStr( quality:int ):String
		{
			return "<font color='" + StaticValue.tran16ToStr(getColorValue(quality)) +"'>" + getColorStr(quality) + "</font>";
		}
		/**
		 * 获取物品的名字 
		 * @param equip
		 * @return 
		 * 
		 */		
		public static function getHtmlItemName(item:ClientItemInfo):String
		{
			if(!item)
				return "";
			var equip : EquipInfo;
			if (item is EquipInfo)
			{
				equip = item as EquipInfo;
				return equip?"<font color='" + StaticValue.tran16ToStr(getColorValue(equip.quality)) +"'>"  /*getEvaluteStr(equip.evaluate)*/ + equip.name + "</font>":item.name;
			}else if(item is ClientItemInfo)
				return "<font color='" + StaticValue.tran16ToStr(getColorValue(item.quality)) +"'>" + item.name + "</font>";
			return "";
		}
		/**
		 * 获取带有品质，评价,强化等级的名字 
		 * @param quality
		 * @param name
		 * @param evalute
		 * @return +5 普通的 武器
		 * 
		 */		
		public static function getHtmlEquipQualityEvaluteName(refineTimes : int,quality : int,name:String,evalute:int):String
		{
			if(refineTimes>0)
				return "<font color='" + StaticValue.tran16ToStr(getColorValue(quality)) +"'>+" + refineTimes + " " + getEvaluteStr(evalute) + name + "</font>";
			else
				return "<font color='" + StaticValue.tran16ToStr(getColorValue(quality)) +"'>" + getEvaluteStr(evalute) + name + "</font>";
		}
		
	}
}