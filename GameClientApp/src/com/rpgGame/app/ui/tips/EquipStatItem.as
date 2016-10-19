package com.rpgGame.app.ui.tips
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.info.stat.StatData;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import org.mokylin.skin.app.tips.EquipStatItemSkin;

	/**
	 * 带对比的属性条 
	 * @author Mandragora
	 * 
	 */
	public class EquipStatItem extends SkinUI
	{
		private var skin : EquipStatItemSkin;
		public function EquipStatItem()
		{
			skin = new EquipStatItemSkin();
			super(skin);
		}
		
		public function setStat(baseStat : StatData,type:int,contrastStat : StatData = null,addValue:int = 0):void
		{
			var str : String;
			if(baseStat.percent)
				str = baseStat.percent + "%" + HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_26, addValue!=0?"+"+addValue+"%":"");
			else
				str = baseStat.value+HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_26, addValue!=0?"+"+addValue:"");
			skin.statLbl.text = str;
			
			if(!contrastStat)
			{
				skin.contrastLbl.text = "";
				return;
			}
			var value:int;
			if(baseStat.percent && contrastStat.percent)
			{
				if(contrastStat.percent>baseStat.percent)
				{
					value = contrastStat.percent-baseStat.percent;
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_16, "↑" + value + "%" );
				}else
				{
					value = baseStat.percent - contrastStat.percent;
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, "↓" + value + "%" );
				}
			}else
			{
				if(contrastStat.value>baseStat.value)
				{
					value = contrastStat.value-baseStat.value;
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_16, "↑" + value );
				}else
				{
					value = baseStat.value - contrastStat.value;
					str = HtmlTextUtil.getTextColor( StaticValue.COLOR_CODE_13, "↓" + value );
				}
			}
		}
	}
}