package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;

	public class AvatarClothesType
	{
		/** 身体*/
		public static const SHEN_TI : uint = rEnum.ENUM_START(1);
		/** 武器*/
		public static const WU_QI : uint = rEnum.next;


		/** 坐骑*/
		public static const MOUNT : uint = rEnum.next;
		/** 怪物*/
		public static const MONSTER : uint = rEnum.next;
		/** npc*/
		public static const NPC : uint = rEnum.next;
		/** 采集物*/
		public static const CAIJI : uint = rEnum.next;
		/** 坐骑人行*/
		public static const MOUNT_ROLE : uint = rEnum.next;
		/** 光翼*/
		public static const LIGHT_WINGS : uint = rEnum.next;
		/** 古剑*/
		public static const GU_JIAN : uint = rEnum.next;
		/** */
		public static const UI_SMALL : uint = rEnum.next; //

		/** 玉衡*/
		public static const YU_HENG : uint = rEnum.next;


		public function AvatarClothesType()
		{
		}

		public static function getName(type : uint, id : *, lvl : int = 0) : String
		{
			var name : String;
			switch (type)
			{
				case SHEN_TI:
					name = "st_" + String(id);
					break;
				case WU_QI:
					name = "wq_" + String(id);
					break;
///////////////////////////////////////////////////////////

				case MOUNT:
					name = "zq_" + String(id); //czzp_
					break;
				case MOUNT_ROLE:
					name = "zq_rx_" + String(id); //czzp_
					break;
				case MONSTER:
					name = "gw_" + String(id);
					break;
				case NPC:
					name = "npc_" + String(id);
					break;
				case CAIJI:
					name = "cj_" + String(id);
					break;
				case LIGHT_WINGS:
					name = "gy_" + String(id);
					break;
				case GU_JIAN:
					if (id)
					{
						if (lvl <= 2)
						{
							name = "gj_" + String(id);
						}
						else
						{
							name = "gj_" + String(id) + "_" + lvl;
						}
					}
					break;
				case UI_SMALL:
					name = "us_" + String(id);
					break;

				case YU_HENG:
					name = "yh_" + String(id);
					break;
					break;
			}
			return name;
		}
	}
}
