package com.rpgGame.core.ui.tip
{
	

	public class RTNodeID
	{
		//角色：主面板角色按钮-角色面板系统按钮（新功能id）-系统内部。。。
		//id无实际意义方便查看
		public static const MAINROLE:String="mainrole";
		//经脉
		public static const JM:String=MAINROLE+"-jm";
		public static const JM_RENM:String=JM+"-ren";
		public static const JM_DUM:String=JM+"-du";
		public static const JM_CHONGM:String=JM+"-c";
		public static const JM_DAIM:String=JM+"-dai";
		public static const JM_YINGM:String=JM+"-yin";
		public static const JM_YANGM:String=JM+"-yang"; 
		//心法
		public static const XF:String=MAINROLE+"-xf";
		
		//战功
		public static const ZG:String=MAINROLE+"-zg";
		//军阶
		public static const JJ:String=MAINROLE+"junjie";
		//军阶
		public static const JJ_BTN_ACTIVE:String=JJ+"-active";
		
		//进阶
		public static const MAIN_JINJIE:String="mainjinjie";
		public static const HORSE:String=MAIN_JINJIE+"-horse";
		public static const HORSE_UP:String=HORSE+"-up";
		public static const FIGHTFLAG:String=MAIN_JINJIE+"-fihtflag";
		public static const FIGHTFLAG_UP:String=FIGHTFLAG+"-up";
	
		//装备面板
		public static const MAIN_EQUIP:String="mainequip";
		public static const EQUIP_QH:String=MAIN_EQUIP+"-strength";
		public static const EQUIP_ZM:String=MAIN_EQUIP+"-zuomo";
		public static const EQUIP_XL:String=MAIN_EQUIP+"-xilian";
		public static const EQUIP_JC:String=MAIN_EQUIP+"-jicheng";
		public static const EQUIP_HC:String=MAIN_EQUIP+"-hecheng";
		
		//武学
		public static const MAIN_WU_XUE:String="mainwuxue";
		public static const WX_SKILL:String=MAIN_WU_XUE+"-skill";
		public static const WX_SKILL_LEVELUP:String=WX_SKILL+"-levelUp";
		public static const WX_SKILL_UPGRADE:String=WX_SKILL+"-upgrade";
		public static const WX_JX:String=MAIN_WU_XUE+"-juexue";
		public static const WX_JX_SKILL:String=WX_JX+"-skill";
		//战魂
		public static const MAIN_ZHANHUN:String="mainzhanhun";
		public static const ZH_UP:String=MAIN_ZHANHUN+"-up";
		public static const ZH_REWARD:String=MAIN_ZHANHUN+"-reward";
		public function RTNodeID()
		{
		}
	}
}