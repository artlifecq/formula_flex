package app.message
{
	import com.rpgGame.coreData.rEnum;
	
	/**
	 *装备操作类型
	 *@author dik
	 *2017-4-17下午4:13:54
	 */
	public class EquipOperateType
	{
		/**
		 *普通强化
		 */
		public static const STRENGTH_NORMAL:uint = rEnum.ENUM_START();
		/**
		 *一键强化 
		 */
		public static const STRENGTH_ONEKEY:uint = rEnum.next;
		/**
		 * 普通琢磨
		 */
		public static const POLISH_NORMAL:uint = rEnum.next;
		/**
		 * 一键琢磨
		 */
		public static const POLISH_ONEKEY:uint = rEnum.next;
		/**
		 * 洗炼
		 */
		public static const WASH_NORMAL:uint = rEnum.next;
		/**
		 * 继承
		 */
		public static const INHERIT_NORMAL:uint = rEnum.next;
		/**
		 * 合成
		 */
		public static const COMBO_NORMAL:uint = rEnum.next;
		
		public function EquipOperateType()
		{
		}
	}
}