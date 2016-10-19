package com.rpgGame.core.utils
{
	import com.rpgGame.core.ui.SpriteStatLine;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.LanguageConfig;
	import com.rpgGame.coreData.cfg.StatNameCfgData;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.lang.LangEquip;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import app.message.StatType;

	/**
	* 属性条布局/显示工具
	* 借助Group的布局功能，利用AddChild来帮助显示
	* 2016年4月7日16:01:35
	* @author Mandragora
	* 
	*/	
	public class SpriteStatLineUtil
	{
		public function SpriteStatLineUtil()
		{
		}
		private static const MIN_STAT:Array=[StatType.PHYSICAL_ATTACK_LOWER, StatType.MAGICAL_ATTACK_LOWER];//10,13
		private static const MAX_STAT:Array=[StatType.PHYSICAL_ATTACK_UPPER, StatType.MAGICAL_ATTACK_UPPER];//11,14
		/**
		 * 
		 * @param statLineClass 默认可以传，自定义需要自己重新写一个皮肤SpriteStatLine
		 * @param addChildFun 把单条的SpriteStatLine添加到group里。
		 * @param base 基础属性
		 * @param isNeedShowAdd 是否需要显示强化属性
		 * @param addStat 强化属性
		 * @param isNeedShowOther 是否需要显示对比属性
		 * @param other 对比属性
		 * 
		 */		
		public static function createSpriteStatLine(statLineClass:Class,addChildFun:Function,base:SpriteStat, isNeedShowAdd:Boolean = true,addStat : SpriteStat = null,isNeedShowOther:Boolean = false,other:SpriteStat=null):void
		{
			var stat:StatData;
			var value:String;
			var statLine : SpriteStatLine;
			var statValue:String;
			var array : Array = base.getStatValues()
			for each (stat in array)
			{
				if(MIN_STAT.indexOf(stat.type) != -1)
					continue;
				statLine=new statLineClass();
				statValue = "";
				if (MAX_STAT.indexOf(stat.type) != -1)
				{
					switch (stat.type)
					{
						case StatType.PHYSICAL_ATTACK_UPPER:
							statValue=LanguageConfig.getText(LangEquip.PHYSICAL_ATTACK_LOWER_UPPER,
								base.getStatValue(StatType.PHYSICAL_ATTACK_LOWER),
								base.getStatValue(StatType.PHYSICAL_ATTACK_UPPER));
							break;
						case StatType.MAGICAL_ATTACK_UPPER:
							statValue=LanguageConfig.getText(LangEquip.MAGICAL_ATTACK_LOWER_UPPER, 
								base.getStatValue(StatType.MAGICAL_ATTACK_LOWER), 
								base.getStatValue(StatType.MAGICAL_ATTACK_UPPER));
							break;
					}
				}
				else
				{
					value=stat.value ? stat.value + "" : stat.percent + "%";
					statValue=StatNameCfgData.getStatName(stat.type) + value;
				}
				if(isNeedShowAdd && addStat)
				{
					if(addStat.getStatValue(stat.type))
					{
						statValue+=HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_4,"+"+addStat.getStatValue(stat.type));
					}else if(addStat.getStatPercent(stat.type))
					{
						statValue+=HtmlTextUtil.getTextColor(StaticValue.COLOR_CODE_4,"+"+addStat.getStatPercent(stat.type)+"%");
					}
				}
				if(isNeedShowOther && other)
				{
					var isAdd : Boolean;
					var addValue : Number;
					if(other.getStatValue(stat.type))
					{
						isAdd = stat.value < other.getStatValue(stat.type);
						addValue = other.getStatValue(stat.type) - stat.value;
					}else if(other.getStatPercent(stat.type))
					{
						isAdd = stat.percent < other.getStatPercent(stat.type);
						addValue = other.getStatPercent(stat.type) - stat.percent;
					}
				}
				statLine.setBaseStatStr(statValue,stat);
				addChildFun && addChildFun(statLine);
			}
		}
	}
}