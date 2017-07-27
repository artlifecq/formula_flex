package com.rpgGame.coreData.type
{
	import com.gameClient.utils.HashMap;
	import com.rpgGame.coreData.cfg.AttValueConfig;
	import com.rpgGame.coreData.cfg.BuffStateDataManager;
	import com.rpgGame.coreData.cfg.SpellDataManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.EquipWashAttCfg;
	import com.rpgGame.coreData.clientConfig.Q_att_values;
	import com.rpgGame.coreData.clientConfig.Q_buff;
	import com.rpgGame.coreData.clientConfig.Q_equip_wash_attr;
	import com.rpgGame.coreData.clientConfig.Q_skill_model;
	import com.rpgGame.coreData.type.item.ItemQualityType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.utils.Dictionary;
	
	

	/**
	 *  角色属性配置
	 * @author wewell
	 * 
	 */	
	public class CharAttributeType
	{
		public static const TYPE_NUM:int=16;
		
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
		 * 外功,影响物理攻击伤害（作攻击）
		 */
		public static const WAI_GONG:int = 14;
		/**
		 * 内功,影响法系攻击伤害及治疗效果(废弃)
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
		
		/**等级**/	
		public static const LV:int =27;
		/**治疗提升**/	
		public static const CURE_LIFT:int =28;
		/**减少技能CD百分比**/	
		public static const SUB_SKILL_CD:int =29;
		/**伤害加深百分比**/	
		public static const HURT_ADD_PERCENT:int =30;
		/**伤害加深固定值**/	
		public static const HURT_ADD_FIX:int =31;
		/**无视防御伤害**/	
		public static const IGNORE_DEFENSE:int =32;
		/**伤害减免百分比**/	
		public static const HURT_SUB_PERCENT:int =33;

		/**战斗力**/	
		public static const FIGHTING:int =44;
		/**秒伤**/	
		public static const HURT_SEC:int =45;
		
		
		//资源属性
		/**
		 *经验 
		 */
		public static const  RES_EXP:int=1;
		/**
		 * 真气

		 */
		public static const  RES_ZHENQI:int=2;
		/**
		 * 元宝
		 */
		public static const  RES_GOLD:int=3;
		/**
		 * 银两
		 */
		public static const  RES_MONEY:int=4;
		/**
		 * 礼金
		 */
		public static const  RES_BIND_GOLD:int=5;
		/**
		 * 绑银
		 */
		public static const  RES_BIND_MONEY:int=6;
		/**
		 * 声望
		 */
		public static const  RES_PRESTIGE:int=7;
		/**
		 *帮派贡献
		 */
		public static const  RES_GUILD_DEVOTE:int=8;
		/**
		 * 荣誉点
		 */
		public static const  RES_HONOR:int=9;
		/**
		 * 匠心值
		 */
		public static const  RES_JIANGXING:int=10;
		/**
		 *BOSS积分
		 */
		public static const  RES_BOSS_TOTAL:int=11;
		
		/**
		 *怒气值
		 */
		public static const  RES_NU_QI:int=12;
		
		/**
		 *金针
		 */
		public static const  RES_JING_ZHENG:int=13;
		
		/**
		 *弩塔
		 */
		public static const  RES_NU_TA:int=14;
		
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
		
		//所有的属性值总个数..
		public static const ALL:uint = 26;
		
		/*******属性变更类型*******************************************************/
		public static const SUCK_BLOOD:int = 1;
		
		private static var idMap:Dictionary;
		private static var enMap:Dictionary;
		public static var baseAttrIdArr:Array=[];
		
		public static var attrRes:Dictionary;
		public static var attrIconRes:Dictionary;
		private static function setup():void
		{
			idMap = new Dictionary();
			attrRes = new Dictionary();
			attrIconRes = new Dictionary();
			//对应SpriteStat
			pushAttir(LIDAO,"力道");//1
			pushAttir(GENGU,"根骨");//2
			pushAttir(SHENFA,"身法");//3
			pushAttir(HUIGEN,"慧根");//4
			pushAttir(HP,"气血");//10
			pushAttir(MP,"能量");//11
			pushAttir(MAX_HP,"最大气血");//12
			pushAttir(MAX_MP,"最大能量");//13
			pushAttir(WAI_GONG,"攻击");//14
			pushAttir(NEI_GONG,"攻击");//15
			pushAttir(DEFENSE_PER,"防御值",10);//16
			pushAttir(CRIT_PER,"暴击率",10);//17
			pushAttir(CRIT,"暴击伤害",10);//18
			pushAttir(ANTI_CRIT_PER,"暴击抗性",10);//19
			pushAttir(HP_REC,"生命回复",1,"/5秒");//20
			pushAttir(MP_REC,"能量回复");//21
			pushAttir(ANTI_EFFECT,"效果抵抗",10);//22
			pushAttir(HIT,"命中值",10);//23
			pushAttir(MISS,"闪避值",10);//24
			pushAttir(SPEED,"移动速度");//25
			pushAttir(ATT_SPEED,"攻击速度");//26
			pushAttir(LV,"角色等级");//27
			pushAttir(CURE_LIFT,"治疗效果提升",10);//28
			pushAttir(SUB_SKILL_CD,"减少技能CD百分比",10);//29
			pushAttir(HURT_ADD_PERCENT,"伤害加深百分比",10);//30
			pushAttir(HURT_ADD_FIX,"伤害加深固定值");//31
			pushAttir(IGNORE_DEFENSE,"无视防御伤害");//32
			pushAttir(HURT_SUB_PERCENT,"伤害减免百分比",10);//33		
			pushAttir(FIGHTING,"战斗力");//44
			pushAttir(HURT_SEC,"秒伤");//45
			
			attrIconRes[3]="shenfa";
			attrIconRes[12]="qixue";
			attrIconRes[14]="gongji";
			attrIconRes[16]="fangyu";
			attrIconRes[17]="baoji";
			attrIconRes[18]="baoshang";
			attrIconRes[23]="mingzhong";
			attrIconRes[24]="shanbi";
			
			attrRes[1]="ld";
			attrRes[2]="gg";
			attrRes[3]="sf";
			attrRes[4]="hg";
			attrRes[12]="qx";
			attrRes[14]="gjl";
			attrRes[16]="fyz";
			attrRes[17]="bjz";
			attrRes[18]="bjjc";
			attrRes[23]="mz";
			attrRes[24]="sb";
			attrRes[26]="gjsd";
		}
		
		setup();
		
		public static function pushAttir(id:int,cn:String,per:int=1,unit:String=""):void
		{
			baseAttrIdArr.push(id);
			var attri:Object = {id:id, cn:cn,per:per,unit:unit};
			idMap[id] = attri;
		}
		public static function getAttrNameUrl(attrId:int):String
		{
			if (attrRes[attrId]==undefined) 
			{
				return "";
			}
			return "ui/common/shuxing/"+attrRes[attrId]+".png";
		}
		public static function getAttrIconUrl(attrId:int):String
		{
			if (attrIconRes[attrId]==undefined) 
			{
				return "";
			}
			return "ui/common/shuxingIcon/tubiao/"+attrIconRes[attrId]+".png";
		}
		/**
		 *获取对应属性的转换值 
		 * @param attributeID
		 * @return 
		 * 
		 */
		public static function getAttrPer(attributeID:uint):int
		{
			return idMap[attributeID]["per"];
		}
		
		/**
		 *获取单位 
		 * @param attributeID
		 * @return 
		 * 
		 */
		public static function getAttrUnit(attributeID:uint):String
		{
			return idMap[attributeID]["unit"];
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
		
		
		/**
		 *获取洗炼属性描述 
		 * @param att
		 * @return 
		 * 
		 */
		public static function getWashAttDes(att:int):String
		{
			var cfg:Q_equip_wash_attr=EquipWashAttCfg.getEquipWashAttr(att);
			var title:String="属性:";
			var des:String="";
			if(cfg.q_attr_id!=0){
				des+= CharAttributeType.getCNNameAddValue(cfg.q_attr_id);
			}else if(cfg.q_buff_id!=0){
				des+= CharAttributeType.getDesByBuff(cfg.q_buff_id);
			}else if(cfg.q_skill_id!=0){
				des+= CharAttributeType.getDesBySkill(cfg.q_skill_id);
			}
			var color:int=ItemQualityType.getColorValue(cfg.q_quality);
			return HtmlTextUtil.getTextColor(StaticValue.Q_WHITE,title)+HtmlTextUtil.getTextColor(color,des);
		}
		
		public static function getDesBySkill(q_skill_id:int):String
		{
			var cfg:Q_skill_model=SpellDataManager.getSpellData(q_skill_id);
			if(cfg){
				return cfg.q_skillpanel_description1;
			}
			return "";
		}
		
		public static function getDesByBuff(q_buff_id:int):String
		{
			var cfg:Q_buff=BuffStateDataManager.getData(q_buff_id);
			if(cfg){
				return cfg.q_description;
			}
			return "";
		}
		
		
		
		/**
		 * 属性名+值的描述
		 * @param q_attr_id
		 * @return 
		 * 
		 */
		public static function getCNNameAddValue(q_attr_id:int):String
		{
			var attValue:Q_att_values=AttValueConfig.getAttInfoById(q_attr_id);
			var maps:HashMap=AttValueConfig.getTypeValueMap(attValue);
			var keys:Array=maps.keys();
			var values:Array=maps.values();
			var result:String="";
			for(var i:int=0;i<keys.length;i++){
				var name:String=CharAttributeType.getCNName(keys[i]);
				var value:String=values[i];
				result+=name+"+"+value;
			}
			
			return result;
		}
	}
}
