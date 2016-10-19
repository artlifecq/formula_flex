package com.rpgGame.coreData.enum
{
	public class RoleEnum
	{
		/** 人类骑士男 */
		public static const KNIGHT_MALE:int = 1;
		/** 人类弓箭手男 */
		public static const ARCH_MALE:int = 2;
		/** 人类骑士女 */
		public static const KNIGHT_FEMALE:int = 3;
		/** 人类弓箭手女 */
		public static const ARCH_FEMALE:int = 4;
		/** 老角色绿皮肤女 */
		public static const OLD_FEMALE:int = 5;
		/** 饕餮 */
		public static const MONSTER_TAOTIE:int = 6;
		
		public function RoleEnum()
		{
		}
		
		public static function roleName(roleType:int):String
		{
			var name:String = null;
			switch(roleType)
			{
				case KNIGHT_MALE:
				{
					name = "男骑士";
					break;
				}
				case ARCH_MALE:
				{
					name = "男弓箭手";
					break;
				}
				case KNIGHT_FEMALE:
				{
					name = "女骑士";
					break;
				}
				case ARCH_FEMALE:
				{
					name = "女弓箭手";
					break;
				}
				case OLD_FEMALE:
				{
					name = "女刺客";
					break;
				}
				case MONSTER_TAOTIE:
				{
					name = "饕餮";
					break;
				}
					
				default:
				{
					throw new Error("角色类型错误");
					break;
				}
			}
			return name;
		}
	}
}