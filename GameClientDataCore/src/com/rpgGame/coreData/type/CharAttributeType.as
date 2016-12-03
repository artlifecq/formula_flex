package com.rpgGame.coreData.type
{
	import com.rpgGame.coreData.rEnum;
	
	import flash.utils.Dictionary;
	

	/**
	 *  角色属性配置
	 * @author wewell
	 * 
	 */	
	public class CharAttributeType
	{
		/**
		 * 力道
		 */
		public static const LIDAO:int = 1;
		/**
		 * 根骨
		 */
		public static const GENGU:int = 2;
		/**
		 * 身法
		 */
		public static const SHENFA:int = 3;
		/**
		 * 慧根
		 */
		public static const HUIGEN:int = 4;
		
		/*---------------------寻秦记二级属性------------------------------*/
		/**气血,战斗中减少至0,判定目标死亡
		 * 
		 */
		public static const HP:int = 10;
		
		/**
		 * 能量
		 */
		public static const MP:int =  11;
		
		/**
		 * 最大气血
		 */
		public static const MAX_HP:int = 12;
		/**
		 * 最大能量
		 */
		public static const MAX_MP:int = 13;
		
		/**
		 * 外功,影响物理攻击伤害
		 */
		public static const WAI_GONG:int = 14;
		/**
		 * 内功,影响法系攻击伤害及治疗效果
		 */
		public static const NEI_GONG:int = 15;
		/**
		 * 防御百分比,按照百分比形式减少受到的伤害
		 */
		public static const DEFENSE_PER:int = 16;
		/**
		 * 暴击率,影响攻击及治疗时暴击的概率
		 */
		public static const CRIT_PER:int = 17;
		/**
		 * 暴击伤害,影响暴击时伤害加成系数
		 */
		public static const CRIT:int = 18;
		/**
		 * 暴击抗性,影响被攻击时攻暴击的概率
		 */
		public static const ANTI_CRIT_PER:int = 19;
		/**
		 * 生命回复,每5秒内自动恢复血量
		 */
		public static const HP_REC:int = 20;
		/**
		 * 能量回复,每种职业有自己独特的恢复技能释放所需能量的方式
		 */
		public static const MP_REC:int = 21;
		/**
		 * 效果抵抗,被攻击时,抵抗debuff的几率
		 */
		public static const ANTI_EFFECT:int = 22;
		/**
		 * 命中率,攻击时,击中目标的几率
		 */
		public static const HIT:int = 23;
		/**
		 * 闪避,被攻击时,闪避对方攻击的几率
		 */
		public static const MISS:int = 24;
		/**
		 * 移动速度,影响位移时的距离
		 */
		public static const SPEED:int = 25;
		/**
		 * 攻击速度,影响普通攻击时的频率
		 */
		public static const ATT_SPEED:int = 26;
		
		
		
		/**最大血量（生命）**/	
//		public static const MAX_LIFE:int = 1;
		/**物理攻击**/	
		public static const ATTACK:int = 2;
		/**物理防御力**/	
		public static const PHYSICAL_DEFENCE:int = 3;
		/**魔法防御(法术防御)**/	
		public static const MAGICAL_DEFENCE:int = 4;
	
		/**物理闪避**/	 
		public static const PHYSICAL_DODGE:int = 7;
		/**法术抵抗(法术闪避)**/	
		public static const MAGICAL_DODGE:int = 8;
		
		/**武力值 **/	
		public static const WU_LI:int = 10;
		/**体质值 **/	
		public static const TI_ZHI:int = 11;
		/**气血值 **/	
		public static const QI_XUE:int = 12;
		/**攻击速度 **/	
		public static const ADX:int = 13;
		/**法术攻击*/
		public static const  MAGICAL_ATTACK:int = 14;
		
		/**武力成长*/
		public static const  WU_LI_GROW:int = 15;
		/**体质成长*/
		public static const  TI_ZHI_GROW:int = 16;
		/**气血成长*/
		public static const  QI_XUE_GROW:int = 17;
		/**伤害增加**/
		public static const DAMAGE_INCRE:int = 18;
		/**伤害减少**/
		public static const DAMAGE_DECRE:int = 19;
		// 词缀属性 2015-7-30 22:26:33
		/**<暴击伤害增加>*/
		public static const CRIT_DAMAGE_INCRE:int = 20;
		/**<暴击伤害减少>*/
		public static const CRIT_DAMAGE_DECRE:int = 21;
		/**<跳闪命中>*/
		public static const JUM_SHIELD_HIT:int = 22;
		/**<跳闪闪避>*/
		public static const JUMP_SHIELD_DODGE:int = 23;
		/**<boss伤害增加>*/
		public static const BOSS_DAMAGE_INCRE:int = 24;
		/**<杀怪经验>*/
		public static const HERO_EXP:int = 25;
		
		
		//---------------------------------------------------------------
	
	
		/**当前副本令牌**/	
//		public static const PH:int = rEnum.next;
		/**最大副本令牌**/	
//		public static const MAX_PH:int = rEnum.next;
		//---------------------------------------------------------------
		
		/**等级**/	
		public static const LV:int = rEnum.ENUM_START(100);//上面的属性要跟服务器对应,有固定值...下面的客户端自己用,是随便值...
		/**当前经验**/	
		public static const EXP:int = rEnum.next;
		/**下一级经验**/	
		public static const MAX_EXP:int = rEnum.next;
		/**pk模式**/	
		public static const PK_MODE:int = rEnum.next;
		/**hp自动回血百分比**/	
		public static const AUTO_HP:int = rEnum.next;
		/**mp自动回血百分比**/	
		public static const AUTO_MP:int = rEnum.next;
		/**pp自动回血百分比**/	
		public static const AUTO_PP:int = rEnum.next;
		/**铜钱**/	
		public static const COPPER:int = rEnum.next;
		/**礼金**/	
		public static const GIFT:int = rEnum.next;
		/**元宝**/	
		public static const GOLD:int = rEnum.next;
		/**充值元宝**/	
		public static const CHARGE_GOLD:int = rEnum.next;
		/**<今日消耗元宝>*/
		public static const TODAY_CONSUME_GOLD:int = rEnum.next;
		/**系统元宝**/	
		public static const SYSTEM_GOLD:int = rEnum.next;
		/**包裹数**/	
		public static const BAG_COUNT:int = rEnum.next;
		/**仓库数**/	
		public static const STORAGE_COUNT:int = rEnum.next;
		/**当前酒气 就是真气**/	
		public static const JIUQI:int = rEnum.next;
		/**仓库铜钱数**/	
		public static const STORAGE_COPPER:int = rEnum.next;
		/**经验增加值**/	
		public static const EXP_PLUS:int = rEnum.next;
		/**分享到的鉴酒经验**/
		public static const SHARE_JIANJIU_EXP:int = rEnum.next;
		/**分享到鉴酒经验的剩余次数**/
		public static const SURPLUS_SHARE_NUM:int = rEnum.next;
		/**精力值**/
		public static const JINGLI:int = rEnum.next;
		/**pk值*/
		public static const PK:int = rEnum.next;
		/**精力值 最大值**/
		public static const JINGLI_MAX:int = rEnum.next;
		/**战斗指数54*/
		public static const FIGHT_POWER:int = rEnum.next;
		/**战斗力称号**/
		public static const POWER_TITLE:int = rEnum.next;
		/**成就称号**/
		public static const ACHIEVE_TITLE:int = rEnum.next;
		/**帮贡*/
		public static const CONTRIBUTE:int = rEnum.next;
		/**VIP等级*/
		public static const VIP_LEVEL:int = rEnum.next;
		/**累计商城消耗元宝数量*/
		public static const VIP_EXP:int = rEnum.next;
		/**真气上限*/
		public static const ZHENQI_MAX:int = rEnum.next;
		/**金币*/
		public static const BANG_YUAN:int = rEnum.next;
		
		/**跳跃速度*/
		public static const JUMP_SPEED:int = rEnum.next;
		/**二级跳速度*/
		public static const JUMP2_SPEED:int = rEnum.next;
		
		public static const WULI:int = rEnum.next;
		public static const TONG_SHUAI:int = rEnum.next;
		/** 轻功副本令牌 */
		public static const QING_GONG_PP:int = rEnum.next;
		/** 轻功是否到顶,给残影 */
		public static const QING_GONG_ISTOP:int = rEnum.next;
		/**服战声望*/
		public static const CROSS_SHENGWANG:int = rEnum.next;
		/**声望消耗*/
		public static const SHANGWANG_USE:uint = rEnum.next;
		/**功勋*/
		public static const GONG_XUN:uint = rEnum.next;
		/**竞技点*/
		public static const HONOUR:uint = rEnum.next;
		/**夺宝点*/
		public static const DUO_BAO_DIAN:uint = rEnum.next;
		/**侠义点*/
		public static const XIA_YI_DIAN:uint = rEnum.next;
		/** 副本点 */
		public static const FU_BEN_DIAN:uint = rEnum.next;
		/** 熔炉值 **/
		public static const RONG_LU_ZHI:uint = rEnum.next;
		/** 藏宝点 **/
		public static const CANG_BAO_DIAN:uint = rEnum.next; 
		
		//所有的属性值总个数..
		public static const ALL:uint = 26;
		
		/*******属性变更类型*******************************************************/
		public static const SUCK_BLOOD:int = 1;
		
		private static var idMap:Dictionary;
		private static var enMap:Dictionary;
		public static var baseAttrIdArr:Array;
		
		private static function setup():void
		{
			idMap = new Dictionary();
			enMap = new Dictionary();
			baseAttrIdArr = [];
			
			//对应SpriteStat
			pushAttir(MAX_HP, 							"life", 								"生命", 					"提高生命上限");
			pushAttir(MAX_MP, 							"mana", 							"法术", 					"提高法术上限");
//			pushAttir(PHYSICAL_ATTACK_LOWER, 	"physicalAttackLower", 		"物理攻击下限", 	"提高物理攻击最低伤害值");
			pushAttir(WAI_GONG, 		"physicalAttackUpper", 		"物理攻击上限", 	"提高物理攻击最高伤害值");
			pushAttir(PHYSICAL_DEFENCE, 				"physicalDefence", 			"物理防御", 			"降低受到的物理伤害");
//			pushAttir(MAGICAL_ATTACK_LOWER, 		"magicalAttackLower", 		"法术攻击下限", 	"提高法术攻击最低伤害值");
			pushAttir(NEI_GONG, 		"magicalAttackUpper", 		"法术攻击上限", 	"提高法术攻击最高伤害值");
			pushAttir(MAGICAL_DEFENCE, 				"magicalDefence", 			"法术防御", 			"降低受到的法术伤害");
			pushAttir(HIT, 									"hit", 								"命中", 					"提高攻击的命中概率");
			pushAttir(CRIT, 									"crit", 								"暴击", 					"增加暴击、降低被暴击的概率");
			pushAttir(SPEED, 						"moveSpeed", 					"移动速度", 			"移动速度");
		}
		
		setup();
		
		public static function pushAttir(id:int, en:String, cn:String, tip:String):void
		{
			var attri:Object = {id:id, en:en, cn:cn, tip:tip};
			idMap[id] = attri;
			enMap[en] = attri;
			baseAttrIdArr.push(id);
		}
		
		/**
		 * 通过属性ID,得到对应的属性名 
		 * @param attributeID
		 * @return 
		 * 
		 */		
		public static function getCNName(attributeID:uint):String
		{
			return idMap[attributeID]["cn"];
		}
		
		public static function getAttrTips(attributeID:uint):String
		{
			return idMap[attributeID]["tip"];
		}
		
		/**
		 * 通过属性ID,得到对应的属性名 
		 * @param attributeID
		 * @return 
		 * 
		 */		
		public static function getAttrName(attributeID:uint):String
		{
			return idMap[attributeID]["en"];
		}
		
		public static function getAtbtIDByName(attributeName:String):int
		{
			return idMap[attributeName]["id"];
		}
	}
}