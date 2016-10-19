package com.rpgGame.core.view.uiComponent.face.cd
{
	/**
	 * 道具或技能VO类接口
	 * @author Carver
	 * 
	 */	
	public interface ICoolingItemVo
	{
		/**获取ItemID*/
		function get coolID():*;
		/**设置ItemID*/
		function set coolID(value:*):void;
		
//		/**获取Item类型*/
//		function get coolType():int;
//		/**设置Item类型*/
//		function set coolType(value:int):void;
//		
//		/**获取固有冷却时间（注意：技能的CD时间和公共冷却时间不同,道具的相同）*/
//		function get coolTime():int;
//		/**设置固有冷却时间（注意：技能的CD时间和公共冷却时间不同,道具的相同）*/
//		function set coolTime(value:int):void;
//		
//		/**获取固有公共冷却时间*/
//		function get publicCoolTime():int;
//		/**设置固有公共冷却时间*/
//		function set publicCoolTime(value:int):void;
		
		/**固有固有公共冷却时间影响ItemID类别（注意：技能的此值为-1,道具的此值为其他值） */
		function get publicCoolTimeType():*;
		/**设置固有公共冷却时间影响ItemID类别（注意：技能的此值为-1,道具的此值为其他值） */
		function set publicCoolTimeType(value:*):void;
	}
}