package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	/**
	 * 换装ID...一个人身上的换装ID是唯一的...但是同一换装类型,会可能有多个换装ID...
	 * @author Carver
	 *
	 */
	public class RenderUnitID
	{
		/**主体ID(一般为衣服，也就是默认的换装类型，这是每个角色必备的换装)*/
		public static const BODY : int = rEnum.ENUM_START(1000000); //ID 会有跟其它换装冲突，要小心。

		/**头发ID*/
		public static const HAIR : int = rEnum.next;

		/**武器ID*/
		public static const WEAPON : int = rEnum.next;

		/**副武器ID*/
		public static const DEPUTY_WEAPON : int = rEnum.next;

		/**武器特效ID*/
		public static const WEAPON_EFFECT : int = rEnum.next;
		
		/**副武器特效ID*/
		public static const DEPUTY_WEAPON_EFFECT : int = rEnum.next;

		/**身体特效ID*/
		public static const BODY_EFFECT : int = rEnum.next;
		/**身体特效ID*/
		public static const BODY_EFFECT2 : int = rEnum.next;

		/**坐骑ID */
		public static const MOUNT : int = rEnum.next;

		/**特效ID */
		public static const EFFECT : int = rEnum.next;
		
		public static const BODY_METHOD_TYPE_EFFECT : int = rEnum.next;

		/**刀光ID */
		public static const KNIFE_LIGHT : int = rEnum.next;
		/**技能自身效果ID */
		public static const SPELL_SELF_EFFECT : int = rEnum.next;
		/**角色被选中光环特效*/
		public static const SELECTED_RING : int = rEnum.next;

		/**目标特效**/
		public static const TARGET_EFFECT : int = rEnum.next;
		/**任务**/
		public static const TASK : int = rEnum.next;
		/**升级**/
		public static const LEVEL : int = rEnum.next;
		/**偷经**/
		public static const TOU_JING : int = rEnum.next;
		/**鸡毛信**/
		public static const JI_MAO_XIN : int = rEnum.next;
		/**镖局**/
		public static const BIAO_JU : int = rEnum.next;
		/**无敌镖车**/
		public static const WU_DI_BIAO_CHE : int = rEnum.next;
		/**护国寺--普通**/
		public static const HU_GUO_SI_GENERAL : int = rEnum.next;
		/**护国寺--劫空**/
		public static const HU_GUO_SI_EMPTY : int = rEnum.next;
		/**护国寺--真谛**/
		public static const HU_GUO_SI_PARAMARTHA : int = rEnum.next;
		
		/**战魂**/
		public static const FIGHTSOUL : int = rEnum.next;
		public static const FIGHTSOUL_EFFECT:int = rEnum.next;
		
		/**战旗*/
		public static const ZHANQI_EFFECT:int = rEnum.next;
		
		/**军阶**/
		public static const JUNJIE : int = rEnum.next;
		
		/**宝物*/
		public static const BAOWU : int = rEnum.next;
		
		/**问号**/
		public static const TASKMARK : int = rEnum.next;
		/**流血**/
		public static const BLEED : int = rEnum.next;
		/**流血数字**/
		public static const BLEED_TEXT : int = rEnum.next;
//	/**角色光环特效ID*/
//		public static const MAGIC_RING:int = rEnum.next;
//		/**怪物光环*/
//		public static const MAGIC_MONSTER_RING:int = rEnum.next;
//		
//		/**角色脚底光环特效(跟着影子跑)ID*/	
//		public static const MAGIC_RING_FOOT:int = rEnum.next;
//		
//		/**怪物特效id*/
//		public static const MONSTER_EFFECT:int = rEnum.next;
//		
//		/**魔法特效ID*/	
//		public static const MAGIC:int = rEnum.next;
//		
//		/**气旋ID* */
//		public static const QIXUAN:int = rEnum.next;
//		
//		/**魔法传递特效 */	
//		public static const MAGIC_PASS:int = rEnum.next;
//		
//		/**魔法传递特效(拖尾)*/	
//		public static const MAGIC_PASS_TAIL:int = rEnum.next;
//		
//		/**马上主体ID*/	
//		public static const MOUNT_BODY:int = rEnum.next;
//		
//		/**马上主体ID*/	
//		public static const MOUNT_HEAD:int = rEnum.next;
//		
//		/**马上武器ID*/	
//		public static const MOUNT_WEAPON:int = rEnum.next;
//		
//		/**弓箭ID*/	
//		public static const BOW:uint = rEnum.next;
//		
//		/**马上弓箭ID*/	
//		public static const MOUNT_BOW:uint = rEnum.next;
//		
//		/**打坐光环特效*/	
//		public static const SIT:uint = rEnum.next;
//		
//		/**翅膀特效*/	
//		public static const WING:uint = rEnum.next;
//		
//		/**琴心特效*/	
//		public static const QIN_XIN:uint = rEnum.next;
//		
//		/**旋风斩特效*/	
//		public static const MOVE_ATTACK:uint = rEnum.next;
//		
//		/**旋风斩动作-当特效处理*/	
//		public static const XUAN_FENG_ZHAN_ATTACK:uint = rEnum.next;
//		
//		/**复活特效*/	
//		public static const RELIVE:uint = rEnum.next;
//		
//		/**升级特效*/	
//		public static const LEVEL_UP:uint = rEnum.next;
//		
//		/** 进度条特效 */
//		public static const BAR_EFFECT:uint = rEnum.next;
//		/**BUFF初始化特效*/
//		public static const BUFF_INIT:uint = rEnum.next;
//		/**BUFF结束特效*/
//		public static const BUFF_END:uint = rEnum.next;
//		
//		/**被击伤害特效*/	
//		public static const BE_HITTED:uint = rEnum.next;
//		
//		//以下为其他唯一换装*******************************************************************************
//		/**空白换装ID*/
//		public static const BLANK:int = rEnum.next;
//		
//		/**影子换装ID*/
//		public static const SHADOW:int = rEnum.next;
//		
//		/**角色选中红色光环*/
//		public static const SELECTED_RED:int = rEnum.next;
//		/**角色选中绿色光环*/
//		public static const SELECTED_GREEN:int = rEnum.next;
//		
//		/**白色*/
//		public static const WHITE_EFFECT:int = rEnum.next; 
//		
//		/**绿*/
//		public static const GREEN_EFFECT:int = rEnum.next; 
//		
//		/**蓝*/
//		public static const BLUE_EFFECT:int = rEnum.next; 
//		
//		/**紫*/
//		public static const VIOLET_EFFECT:int = rEnum.next; 
//		
//		/**橙色*/
//		public static const ORANGE_EFFECT:int = rEnum.next; 
//		
//		/**gold*/
//		public static const GOLD_EFFECT:int = rEnum.next; 
	}
}
