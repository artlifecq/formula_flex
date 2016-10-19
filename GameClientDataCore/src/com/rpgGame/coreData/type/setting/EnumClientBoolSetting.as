package com.rpgGame.coreData.type.setting
{
	/**
	 *
	 * 保存true/false类数据		暂时只支持64个选项(0-63)
	 * 
	 * @author fly.liuyang
	 * 创建时间：2014-5-15 下午5:44:42
	 * 
	 */
	public class EnumClientBoolSetting
	{
		//聊天设置
		/** 拒绝接收队友死亡消息*/
		public static const SHIELD_TEAM_MEMBER_DIE_MSG:int = 0;
		/** 拒绝接收帮会成员死亡消息*/
		public static const SHIELD_PART_MEMBER_DIE_MSG:int = 1;
		/** 拒绝接收好友上线提示*/
		public static const SHIELD_FRIEND_UPLINE:int = 2;
		/** 拒绝接收敌人上线提示*/
		public static const SHIELD_ENEMY_UPLINE:int = 3;
		/** 屏蔽私聊信息*/
		public static const SHIELD_PRIVATE_CHAT:int = 4;
		/** 屏蔽队伍聊天信息*/
		public static const SHIELD_TEAM_CHAT:int = 5;
		/** 屏蔽帮会聊天信息*/
		public static const SHIELD_PART_CHAT:int = 6;
		/** 屏蔽国家聊天信息*/
		public static const SHIELD_COUNTRY_CHAT:int = 7;
		/** 屏蔽世界聊天信息*/
		public static const SHIELD_WORLD_CHAT:int = 8;
		
		//挂机设置
		/** 是否自动进行反击 */		
		public static const FIGHT_OPTION_COUNTERATTACK:int = 9;
		/** 是否【不】低于百分几自动补血 */		
		public static const FIGHT_OPTION_IS_AUTO_DRUG:int = 10;
		/** 自动吃药是否从小到大 */		
		public static const FIGHT_OPTION_AUTO_DRUG_IS_MINTOMAX:int = 11;
		/** 是否自动熔炼装备   */		
		public static const FIGHT_OPTION_AUTO_SELL_EQUIP:int = 12;
		/** 是否【不】自动买药 */		
		public static const FIGHT_OPTION_AUTO_BUY_DRUG:int = 13;
		/** 是否【不】自动拾取装备 */		
		public static const FIGHT_OPTION_AUTO_PICK_UP_EQUIP:int = 14;
		/** 是否【不】自动拾取物品 */		
		public static const FIGHT_OPTION_AUTO_PICK_UP_ITEM:int = 15;
		/** 是否低血不回城 */		
		public static const FIGHT_OPTION_LOW_BLOOD_BACK:int = 16;
		/** 是否死亡复活 */		
		public static const FIGHT_OPTION_RESURRECTION:int = 17;
		/** 挂机中是否使用天赋技能 */
		public static const FIGHT_OPTION_AUTO_GIFT_SPELL:int = 18;
		/** 是否挂机多少分钟回城打坐 */		
		public static const FIGHT_OPTION_TIMER_BACK:int = 19;
		
		//系统设置
		/** 是否屏蔽屏幕震动特效 */		
		public static const STOP_SHAKE_EFFECT:int = 20;
		/** 是否屏蔽血量过低的闪屏特效  */
		public static const STOP_LOW_BLOOD_EFFECT:int = 21;
		
		/**屏蔽他人的古剑*/
		public static const SHIELD_OTHERS_SWORD_SOUL:int = 23;
		/**屏蔽被击白光滤镜*/
		public static const SHIELD_HIGH_EFFECT:int = 24;
		/**屏蔽帮会成员*/
		public static const SHIELD_GUILD_MEMBER:int = 26;
		/**屏蔽普通怪物*/
		public static const SHIELD_COMMON_MONSTER:int = 27;
		/**屏蔽他人的技能特效*/
		public static const SHIELD_OTHERS_SKILL_EFFECT:int = 28;
		/**屏蔽角色影子*/
		public static const SHIELD_ROLE_SHADOW:int = 29;
		/**屏蔽自己的技能特效*/
		public static const SHIELD_SELF_SKILL_EFFECT:int = 30;
		/**屏蔽其他玩家*/
		public static const SHIELD_OTHERS_BODY:int = 31;
		/**屏蔽地图特效*/
		public static const SHIELD_MAP_EFFECT:int = 33;
		/**是否是第一次登陆*/
		public static const IS_FIRST_LOGIN:int = 34;
		
		/** 是否关闭音效  */
		public static const IS_CLOSE_MUSIC:int = 35;
		
		/**是否引导过古剑穿装备*/
		public static const GUIDE_GU_JIAN_CHUAN_ZHUANG_BEI:int = 41;
		/**是否引导过藏宝阁抽奖*/
		public static const GUIDE_CANG_BAO_GE:int = 42;
		/**是否引导过主线副本进入*/
		public static const GUIDE_ZHU_XIAN_FU_BEN_IN:int = 43;
		/**是否引导过古剑进阶*/
		public static const GUIDE_GU_JIAN_LEVEL_UP:int = 44;
		
		/** 是否已经领取过镖车 **/
		public static const HAVE_GOT_BIAO_CHE:int = 45;
		/**是否引导过古剑技能使用*/
		public static const GUIDE_GU_JIAN_JI_NENG_SHI_YONG:int = 46;
		/**是否是正常的红玉*/
		public static const IS_NORMAL_HONG_YU:int = 47;
		
		public function EnumClientBoolSetting()
		{
		}
	}
}