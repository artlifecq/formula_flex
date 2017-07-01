package com.rpgGame.core.ui.tip
{
	import com.rpgGame.coreData.rEnum;

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
		public static const XF_1:String=XF+rEnum.ENUM_START(1);
		public static const XF_2:String=XF+rEnum.next;
		public static const XF_3:String=XF+rEnum.next;
		public static const XF_4:String=XF+rEnum.next;
		public static const XF_5:String=XF+rEnum.next;
		public static const XF_6:String=XF+rEnum.next;
		public static const XF_7:String=XF+rEnum.next;
		public static const XF_8:String=XF+rEnum.next;
		public static const XF_9:String=XF+rEnum.next;
		public static const XF_10:String=XF+rEnum.next;
		public function RTNodeID()
		{
		}
	}
}