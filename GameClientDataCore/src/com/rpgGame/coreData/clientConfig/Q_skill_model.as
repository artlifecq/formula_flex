package com.rpgGame.coreData.clientConfig
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author NEIL
	* 
	*/
	public class Q_skill_model
	{
		 /**  技能编号_技能等级 */
		public var q_skillID_q_grade:String;
		 /**  技能编号(不能超过65535) */
		public var q_skillID:int;
		 /**  技能阶数(不能超过255) */
		public var q_grade:int;
		 /**  最大等级 */
		public var q_max_level:int;
		 /**  技能名称 */
		public var q_skillName:String;
		 /**  技能效果，配置 技能效果 中的id */
		public var q_spell_effect:int;
		 /**  连招技能,逗号分割 */
		public var q_relate_spells:String;
		 /**  影响目标，0表示影响，1表示不影响，各位数表示英雄，十位数表示普通怪物，百位数表示精英怪，千位数表示Boss，万位数表示宠物，如“1001”表示对英雄和Boss不影响 */
		public var affect_target:int;
		 /**  是否可以激活自动施法 */
		public var is_allow_auto_combat:int;
		 /**  是否是锁定技能，必须指定一个目标的技能 */
		public var is_locking_spell:int;
		 /**  技能面板上的伤害文字描述 */
		public var q_skillpanel_description1:String;
		 /**  技能面板上的技能效果描述 */
		public var q_skillpanel_description2:String;
		 /**  显示所需人物等级 */
		public var q_show_needgrade:int;
		 /**  战斗力加成 */
		public var q_fight_bonus:int;
		 /**  技能伤害类型（0默认攻击技能，1治疗技能 2，特殊技能） */
		public var q_hurt_type:int;
		 /**  使用者（客户端纯显示用）（0怪物技能 1人物技能 2坐骑给人物添加的被动技能  3神将自身的技能） */
		public var q_skill_type:int;
		 /**  触发脚本ID */
		public var q_scriptid:int;
		 /**  使用方式（1主动技能，2被动技能） */
		public var q_trigger_type:int;
		 /**  触发方式（1在攻击时触发，2在挨打时触发(没做）,3攻击与挨打时都触发（没做），4命中后触发，5 被攻击死亡之前触发,6死亡后触发） */
		public var q_passive_action:int;
		 /**  使用消耗内力值(为-1则通过技能编号_技能等级  去q_skill_ignore表中读q_mp字段，轻功特殊处理读q_other字段) */
		public var q_need_mp:int;
		 /**  技能吟唱时间（毫秒，0表示无吟唱时间） */
		public var q_singing_time:int;
		 /**  冷却时间（毫秒） */
		public var q_cd:int;
		 /**  公共冷却时间 */
		public var q_public_cd:int;
		 /**  公共冷却层级 */
		public var q_public_cd_level:int;
		 /**  cd计算是否包含飞行时间 */
		public var q_cal_flycd:int;
		 /**  延迟命中时间（单位：毫秒） */
		public var q_delay_time:int;
		 /**  使用距离限制（自身与目标之间的距离）（单位：格子）,地面行走魔法表示行走距离(小于等于3：判定为近战攻击（处理音效）大于3：判定为远程攻击（处理音效）)   0表示无限距离 */
		public var q_range_limit:int;
		 /**  弹道飞行速度（单位：像素/秒）如果为0,表示无弹道,直接打鼠标指的地方或者直接作用到目标身上.PS：有弹道的话会碰触到任何目标都会触发。 */
		public var q_trajectory_speed:int;
		 /**  作用对象（1自己，2友好目标，3敌对目标，4当前目标，5场景中鼠标的当前坐标点，6主人） */
		public var q_target:int;
		 /**  作用目标上限 */
		public var q_target_max:int;
		 /**  技能伤害系数（万分比分子） */
		public var q_hurt_correct_factor:int;
		 /**  技能附加伤害（为-1则通过技能编号_技能等级  去q_skill_ignore表中读取无视防御伤害值） */
		public var q_ignore_defence:int;
		 /**  生命值低于万分比 */
		public var q_underHp_per:int;
		 /**  生命值低于百分比后提高技能伤害万分比。 */
		public var q_underHP_Damage_per:int;
		 /**  生命值 */
		public var q_maxHp:int;
		 /**  攻击力 */
		public var q_attack:int;
		 /**  防御力 */
		public var q_defence:int;
		 /**  命中值 */
		public var q_hit:int;
		 /**  闪避值 */
		public var q_dodge:int;
		 /**  暴击值 */
		public var q_crit:int;
		 /**  抗暴值 */
		public var q_antiCrit:int;
		 /**  攻击速度百分比 */
		public var q_attackSpeed_Per:int;
		 /**  是否可以注册快捷栏（1可以，0不可以） */
		public var q_shortcut:int;
		 /**  位置编号（0:不在人物面板,，1：人物主动技能面板，2：人物被动技能面板，3，抵抗技能） */
		public var q_index:int;
		 /**  是否可以设为默认技能（0不可设为默认技能，1可以设为默认技能） */
		public var q_default_enable:int;
		 /**  召唤怪物ID（1是幻象分身） */
		public var q_summon_id:int;
		 /**  召唤怪物数量 */
		public var q_summon_num:int;
		 /**  召唤的幻象分身，生命值比例（万分比分子） */
		public var q_summon_hp:int;
		 /**  召唤的幻象分身，攻击力比例（万分比分子） */
		public var q_summon_attack:int;
		 /**  召唤的怪物/幻象分身持续时间（单位：秒） */
		public var q_summon_last:int;
		 /**  BUFF触发器，JSON格式用于描述改技能释放后如如何触发各种BUFF。格式为:{t, id, max }{触发类型,作用目标，BuffID}t=触发类型: 1:命中，2:未命中,3:暴击 4:杀死 5攻击开始时触发被动技能 攻击目标id=buff的ID对应BUFF表。Max=一次攻击最多触发多少次.例子:[{t:1, id:1001, r:10000},{t:3, id:5040001, r:10000}]可以把里边值复制到http://www.json.cn.网站去查看 */
		public var q_buff_trigger:String;
		 /**  被动触发几率（本处填万分比的分子） 如果是被动技能触发才有效，BUFF触发概率通过BUFF表控制 */
		public var q_passive_prob:int;
		 /**  触发后附加的BUFF编号序列（格式：BUFF编号;BUFF编号）（该字段已作废） */
		public var q_passive_buff:String;
		 /**  BUFF命中系数 */
		public var q_buff_hit:int;
		 /**  BUFF修正系数 */
		public var q_buff_amendment:int;
		 /**  成功施加BUFF系数 */
		public var q_bufq_trigger_factor:int;
		 /**  成功施加BUFF抵抗系数 */
		public var q_bufq_defence_factor:int;
		 /**  BUFF持续时间提升系数 */
		public var q_bufq_timeup_factor:int;
		 /**  BUFF持续时间减免系数 */
		public var q_bufq_timedown_factor:int;
		 /**  BUFF作用数值修正系数 */
		public var q_bufq_num_factor:int;
		 /**  BUFF作用比例修正系数（特殊：符鬼技能攻击目标死亡后恢复生命值比例（万分比分子）） */
		public var q_bufq_action_factor:int;
		 /**  作用范围形状（1单体，2矩形，3扇形，4圆形, 5和目标之间的直线，6指定方向固定大小的矩，7全地图） */
		public var q_area_shape:int;
		 /**  处理单体攻击以外的范围攻击释放成功率，失败后将切换为单体攻击.万分比 */
		public var q_area_success_per:int;
		 /**  作用范围中心点（1自身为中心，2目标为中心）,如果地面魔法,那么也表示起点 */
		public var q_area_target:int;
		 /**  矩形长（像素） */
		public var q_area_length:int;
		 /**  矩形宽 */
		public var q_area_width:int;
		 /**  扇形开始角度 */
		public var q_sector_start:int;
		 /**  扇形结束角度 */
		public var q_secto_end:int;
		 /**  扇形半径(像素) */
		public var q_sector_radius:int;
		 /**  圆半径(像素) */
		public var q_circular_radius:int;
		 /**  是否触发一次战斗公式的伤害（0不触发，1触发，2造成 剩余生命值*q_hurt_correct_factor/10000 的伤害，3造成  总生命值*q_hurt_correct_factor/10000 的伤害） */
		public var q_trigger_figth_hurt:int;
		 /**  每次造成大怪(BOSS,精英)仇恨值 */
		public var q_enmity:int;
		 /**  技能类型（0普通爆发技能，1地面行走魔法(需要配置飞行速度),2地面定点效果 */
		public var q_skill_ground_type:int;
		 /**  技能是否需要引导(1表示需要引导) */
		public var q_guide:int;
		 /**  相同地面魔法是否可叠加效果,0可叠加,1不可叠加 */
		public var q_skill_ground_qverlay:int;
		 /**  地面魔法作用次数,0不限制,  大于0释放后执行触发效果的次数 (陷阱填1) */
		public var q_skill_act_num:int;
		 /**  地面魔法作用间隔时间（单位毫秒，500的倍数） */
		public var q_skill_ground_period:int;
		 /**  地面魔法持续时间/引导技能引导时间（毫秒） */
		public var q_skill_time:int;
		 /**  所处技能面板大类(0基础，1被动) */
		public var q_panel_type:int;
		 /**  受到该列技能克制 */
		public var q_restriction:int;
		 /**  技能加成攻击力值 */
		public var q_attack_addition:int;
		 /**  是否忽视【1禁止吸血，2禁止闪避，4禁止低血量秒杀(针对死亡印记BUFF)，8禁止直接斩杀(直接杀死怪物)，16禁止跳闪，32无视阻挡】 */
		public var q_is_ignore:int;
		 /**  升到该级所需真气值 */
		public var q_energy_up:int;
		 /**  升到该级所需银两 */
		public var q_cost_up:int;
		 /**  学会后的初始等级 */
		public var q_need_study:int;
		 /**  领悟/升到该阶所需消耗道具 json */
		public var q_need_items:String;
		 /**  升级所需人物等级(从上一级升到本级需要的等级，第一条数据为领悟需要的等级） */
		public var q_level_up:int;
		 /**  升级所需军衔等级(从上一级升到本级需要的军衔等级，第一条数据为领悟需要的军衔等级） */
		public var q_need_military_rank:int;
		 /**  技能描述所需数值 */
		public var q_introduce:String;
		 /**  技能图标ICON */
		public var q_icon:String;
		 /**  技能材质（用于处理音效） */
		public var q_matrial_sound:int;
		 /**  技能触发音效（用于处理音效） */
		public var q_trigger_sound:String;
		 /**  扩展字段 */
		public var q_other:String;

	}
}
		