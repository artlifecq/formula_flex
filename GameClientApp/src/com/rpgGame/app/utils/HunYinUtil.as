package com.rpgGame.app.utils
{
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.enum.HunYinEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	import com.rpgGame.netData.marriage.bean.MarriageLoggerInfo;
	
	
	public class HunYinUtil
	{
		public static function getRiZiText(info:MarriageLoggerInfo):String
		{
			var str:String="";
			var time:String=TimeUtil.formatTimeToSpecString(info.time.fValue);
			switch(info.type)
			{
				case HunYinEnum.HD_SONGHUA:
				{
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,time+"  ")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.name)+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"送花给")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.targetName+"  双方增加了")+
						HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.intimacyValue.toString())+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"点亲密度");
					break;
				}				
				case HunYinEnum.HD_YONGBAO:
				{
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,time+"  ")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.name)+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"拥抱了")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.targetName+"  双方增加了")+
						HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.intimacyValue.toString())+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"点亲密度");
					break;
				}
				case HunYinEnum.HD_QINWEN:
				{
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,time+"  ")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.name)+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"亲吻了")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.targetName+"  双方增加了")+
						HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.intimacyValue.toString())+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"点亲密度");
					break;
				}
				case HunYinEnum.HD_DONGFANG:
				{
					str=HtmlTextUtil.getTextColor(StaticValue.A_UI_RED_TEXT,time+"  ")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,info.name+"与"+info.targetName)+HtmlTextUtil.getTextColor(StaticValue.A_UI_GREEN_TEXT,"洞房")+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"  双方增加了")+
						HtmlTextUtil.getTextColor(StaticValue.A_UI_YELLOW_TEXT,info.intimacyValue.toString())+HtmlTextUtil.getTextColor(StaticValue.A_UI_BEIGE_TEXT,"点亲密度");
					break;
				}
			}		
			return str;
		}
		
		public static function getzoneText(zoneid:int):String
		{
			switch(zoneid)
			{
				case 7501: return HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"简单难度");
				case 7502: return HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"普通难度");
				case 7503: return HtmlTextUtil.getTextColor(StaticValue.A_UI_GRAY_TEXT,"困难难度");
			}
			return "未知难度";
		}
	}
}