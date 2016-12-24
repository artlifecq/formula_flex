package com.editor.data
{
	import com.editor.enum.rEnum;

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
		/**坐骑ID */
		public static const MOUNT : int = rEnum.next;

		/**特效ID */
		public static const EFFECT : int = rEnum.next;
		/**身体效果方法类型特效ID */
		public static const BODY_METHOD_TYPE_EFFECT : int = rEnum.next;
		/**刀光ID */
		public static const KNIFE_LIGHT : int = rEnum.next;
		/**技能自身效果ID */
		public static const SPELL_SELF_EFFECT : int = rEnum.next;
		/**选中光圈*/
		public static const SELECTED_RING : int = rEnum.next;
	}
}
