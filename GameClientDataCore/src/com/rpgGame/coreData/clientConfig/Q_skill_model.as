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
		 /**  技能编号_技能阶数 */
		public var q_skillID_q_grade:String;
		 /**  技能编号(不能超过65535) */
		public var q_skillID:int;
		 /**  技能名称 */
		public var q_skillName:String;
		 /**  技能面板上的伤害文字描述 */
		public var q_skillpanel_description1:String;
		 /**  技能面板上的技能进阶效果描述 */
		public var q_skillpanel_description2:String;
		 /**  职业技能(1:兵家 2：墨家男3：墨家女 4：医家 0：不分职业-公共技能) */
		public var q_job:int;
		 /**  技能阶数(不能超过255) */
		public var q_grade:int;
		 /**  最大等级 */
		public var q_max_level:int;
		 /**  技能图标ICON */
		public var q_icon:String;
		 /**  连招技能,逗号分割 */
		public var q_relate_spells:String;
		 /**    */
		public var q_mainSkill:int;
		 /**  技能效果，配置“技能效果表”中的id */
		public var q_spell_effect:int;
		 /**  位移类型（客户端），0-无 1-冲锋 2-跳劈 3-闪烁 4-翻滚 */
		public var q_blink_type:int;
		 /**  位移距离 */
		public var q_blink_range:int;
		 /**  位移速度，填每秒飞行像素 */
		public var q_blink_speed:int;
		 /**  跳劈的高度，可以不配置 */
		public var q_blink_height:int;
		 /**  技能伤害类型（0默认攻击技能，1友好技能 2，特殊技能） */
		public var q_hurt_type:int;
		 /**  作用对象（1自己，2友好目标，3敌对目标，4当前目标，5场景中鼠标的当前坐标点，6组队 7无目标） */
		public var q_target:int;
		 /**  作用目标上限 */
		public var q_target_max:int;
		 /**  技能表现类型（服务端区分） 0.常规类型 2.召唤类型  4有位移类型,5灭世金针6多段伤害 */
		public var q_skill_type:int;
		 /**  使用方式（1主动技能，2被动技能） */
		public var q_trigger_type:int;
		 /**  影响目标，0表示影响，1表示不影响，各位数表示英雄，十位数表示普通怪物，百位数表示精英怪，千位数表示Boss，万位数表示宠物，如“1001”表示对英雄和Boss不影响 */
		public var q_affect_target:int;
		 /**  能否边走边放，1表示可以，0或者不配表示不行，默认不行 */
		public var q_can_walk_release:int;
		 /**  是否可以和别的技能同时释放（0不可以，1可以，1的状态下相当于施法者同时释放多个技能，但是同一个技能同时只能释放一个，受CD检查的限制） */
		public var q_performAtTime:int;
		 /**  是否可以激活自动施法(0激活) */
		public var q_is_allow_auto_combat:int;
		 /**  是否可以设为默认技能（0不可设为默认技能，1可以设为默认技能） */
		public var q_default_enable:int;
		 /**  是否是锁定技能，必须指定一个目标的技能（0不锁定，1锁定,2锁定死亡） */
		public var q_is_locking_spell:int;
		 /**  显示所需人物等级 */
		public var q_show_needgrade:int;
		 /**  战斗力加成 */
		public var q_fight_bonus:int;
		 /**  触发脚本ID */
		public var q_scriptid:int;
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
		 /**  飞行特效的飞行速度。 有飞行特效才能填。 有飞行特效必须填 */
		public var q_fly_speed:int;
		 /**  是否飞行穿越（0不穿越，1是穿越） */
		public var q_is_fly_cross:int;
		 /**  弹道飞行总时长(目前客户端专用) */
		public var q_fly_time:int;
		 /**  飞行数量（1次技能有多少飞行弹道数量） */
		public var q_fly_count:int;
		 /**  飞行间隔时间（毫秒） */
		public var q_fly_spacing:int;
		 /**  飞行是否追踪（0是不追踪，1是追踪） */
		public var q_fly_follow:int;
		 /**  是否计算路径点伤害（0不计算，1计算） */
		public var q_fly_cal_line:int;
		 /**  无目标状态是否触发空弹道（0不触发，1触发） */
		public var q_fly_empty:int;
		 /**  施法距离限制（自身与目标之间的距离）（单位：格子）,地面行走魔法表示行走距离(小于等于3：判定为近战攻击（处理音效）大于3：判定为远程攻击（处理音效）)   0表示无限距离 */
		public var q_range_limit:int;
		 /**  保持间距（单位：像素）（不配默认使用施法范围） */
		public var q_keep_spacing:int;
		 /**  伤害衰减 */
		public var q_reduce_per:int;
		 /**  作用范围形状（1单体，2矩形，3扇形，4圆形,7全地图） */
		public var q_area_shape:int;
		 /**  作用范围中心点（1自身为中心，2目标为中心）,如果地面魔法,那么也表示起点 */
		public var q_area_target:int;
		 /**  矩形长（像素） */
		public var q_area_length:int;
		 /**  矩形宽（像素） */
		public var q_area_width:int;
		 /**  扇形角度 */
		public var q_sector_start:int;
		 /**  扇形半径(像素) */
		public var q_sector_radius:int;
		 /**  圆半径(像素) */
		public var q_circular_radius:int;
		 /**  处理单体攻击以外的范围攻击释放成功率，失败后将切换为单体攻击.万分比 */
		public var q_area_success_per:int;
		 /**  扇形结束角度（废弃） */
		public var q_secto_end:int;
		 /**  技能属性（人物属性加成）被动技能加成人物属性 */
		public var q_attributes:String;
		 /**  战斗计算技能伤害属性 */
		public var q_fight_attributes:String;
		 /**  技能伤害系数（万分比分子）没启用 */
		public var q_hurt_correct_factor:int;
		 /**  技能附加伤害（为-1则通过技能编号_技能等级  去q_skill_ignore表中读取无视防御伤害值） */
		public var q_ignore_defence:int;
		 /**  生命值低于万分比 */
		public var q_underHp_per:int;
		 /**  生命值低于百分比后提高技能伤害万分比。 */
		public var q_underHP_Damage_per:int;
		 /**  是否可以注册快捷栏（1可以，0不可以） */
		public var q_shortcut:int;
		 /**  位置编号（0:不在人物面板,，1：人物主动技能面板，2：人物被动技能面板，3，抵抗技能） */
		public var q_index:int;
		 /**  召唤怪物ID（1是幻象分身） */
		public var q_summon_id:int;
		 /**  召唤距离（像素距离，距离当前朝向的距离，0在脚下，为负表示以选中坐标点） */
		public var q_summon_dist:int;
		 /**  召唤怪物数量 */
		public var q_summon_num:int;
		 /**  召唤怪上限 */
		public var q_summon_max:int;
		 /**  召唤物继承召唤者的生命值比例（万分比分子），如果不填，和档案表属性是叠加关系 */
		public var q_summon_hp:int;
		 /**  召唤的幻象分身，攻击力比例（万分比分子） */
		public var q_summon_attack:int;
		 /**  召唤的怪物/幻象分身持续时间（单位：秒） */
		public var q_summon_last:int;
		 /**  召唤类型，1为累加召唤，2为替换召唤3地面特效 */
		public var q_summon_type:int;
		 /**  BUFF触发器，JSON格式用于描述改技能释放后如如何触发各种BUFF。格式为:{t, id, max }{触发类型,作用目标，BuffID}t=触发类型: 1:命中，2:未命中,3:暴击 4:杀死 5攻击开始时触发被动技能，6技能释放后触发，7召唤触发BUFF , 8技能释放前触发，攻击目标id=buff的ID对应BUFF表。Max=一次攻击最多触发多少次.例子:[{t:1, id:1001, r:10000},{t:3, id:5040001, r:10000}]可以把里边值复制到http://www.json.cn.网站去查看 */
		public var q_buff_trigger:String;
		 /**  技能回复消耗触发（tt=触发类型(和BUFF触发一致),tv=触发值,（目前支持命中数量）rt=回复类型(可回复资源类型，)，,rv=回复数值（为负则为扣除）），可支持多个触发，[{tt:1, tv:1001, rt:1,rv:10}],回复类型：100=仇恨，101=血量上限回复比例，102=魔法（能量），怒气12，金针13，弩塔14 */
		public var q_recovers:String;
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
		 /**  是否触发一次战斗公式的伤害（0不触发，1触发，2造成 剩余生命值*q_hurt_correct_factor/10000 的伤害，3造成  总生命值*q_hurt_correct_factor/10000 的伤害） */
		public var q_trigger_figth_hurt:int;
		 /**  每次造成大怪(BOSS,精英)仇恨值 */
		public var q_enmity:int;
		 /**  地面魔法作用次数,0不限制,  大于0释放后执行触发效果的次数 (陷阱填1) */
		public var q_skill_act_num:int;
		 /**  地面魔法作用间隔时间（单位毫秒，500的倍数） */
		public var q_skill_ground_period:int;
		 /**  地面魔法持续时间/引导技能引导时间（毫秒） */
		public var q_skill_time:int;
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
		 /**  击退格子数 支持负数 */
		public var q_beat_distance:int;
		 /**  是否以目标点的中心击退  1是以目标 其他是以释放者 */
		public var q_is_beat_back_to_spell_effect_pos:int;
		 /**  击退速度，像素/秒 */
		public var q_beat_back_speed:int;
		 /**  死亡击退距离 */
		public var q_dead_beat_distance:int;
		 /**  死亡击退速度 */
		public var q_dead_beat_speed:int;
		 /**  击退概率 */
		public var q_dead_beat_probability:int;
		 /**  死亡击飞距离 */
		public var q_dead_launch_distance:int;
		 /**  死亡击飞速度 */
		public var q_dead_launch_speed:int;
		 /**  死亡击飞高度 */
		public var q_dead_launch_height:int;
		 /**  击飞概率 */
		public var q_dead_launch_probability:int;
		 /**  施法时是否要震屏 */
		public var q_shake_screen:int;
		 /**  扩展字段[dp：伤害加深比例，dr：伤害范围,为0表示必须指定目标，没有目标则没有伤害，dt,伤害时间间隔，受技能总的延迟时间影响，，dbt:BUFF触发方式，0伤害前触发，1伤害后触发，db:触发BUFF  id,dk:是否触发击退1击退] */
		public var q_other:String;

	}
}
		