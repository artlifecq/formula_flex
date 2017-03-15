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
	public class Q_monster
	{
		 /**  怪物ID */
		public var q_id:int;
		 /**  怪物名字 */
		public var q_name:String;
		 /**  身体资源 */
		public var q_body_res:String;
		 /**  怪物等级 */
		public var q_level:int;
		 /**  坐骑资源 */
		public var q_mount_res:String;
		 /**  怪物头顶血条偏移 */
		public var q_life_bar_offset:int;
		 /**  模型半径像素（左右各一半），最低25，左右各25，最大250 */
		public var q_body_radius_pixel:int;
		 /**  出生特效 */
		public var q_born_animation:int;
		 /**  特效 */
		public var q_animation:int;
		 /**  受击特效，如果配置了此处，那么怪物受到攻击时只会播放这个特效，而忽略本来的受击特效 */
		public var q_been_hurt_animation:int;
		 /**  默认是否显示名字（1是，0否）显示名字会默认显示血条非BOSS类不要显示 */
		public var q_monster_dropdesc:String;
		 /**  怪物朝向角度，配置0-359 */
		public var q_direction:int;
		 /**  是否在小地图中显示（1是，2否） */
		public var q_isminimap:int;
		 /**  怪物类型(1普通小怪,2精英,3BOSS) */
		public var q_monster_type:int;
		 /**  怪物掉落归属（0：最后一击，1：伤害排行最高玩家，2：无主掉落） */
		public var q_drop_type:int;
		 /**  怪物攻击模式(1主动攻击,2被动攻击，3木桩类怪物,4木桩主动攻击) */
		public var q_evasive_style:int;
		 /**  怪物头像资源编号 */
		public var q_head:String;
		 /**  控制怪物模型大小参数为百分比，100为标准体型不填为原始大小 */
		public var q_scale:int;
		 /**  怪物材质（用于处理被攻击时的音效） */
		public var q_matrial:int;
		 /**  设定包围宽(控制鼠标感应范围) */
		public var q_width:int;
		 /**  设定包围高(控制鼠标感应范围和血条高度) */
		public var q_height:int;
		 /**  方向是否固定(-2固定方向前端控制,-1随机方向，怪物朝向角度，配置0-359) */
		public var q_is_direction_fixed:int;
		 /**  怪物在场景中的发言频率间隔(单位：毫秒) */
		public var q_tosay_timeinterval:int;
		 /**  怪物在场景中的发言内容([{id:标识ID,content:说话内容,sound:音效编号,patrol:是否巡逻时说的},{...}]) */
		public var q_say_condition:String;
		 /**  怪物血量倍数（0：不加倍，1：加1倍，2：加2倍，类推）处理大于20Y血量的情况 */
		public var q_hprate:int;
		 /**  总属性ID */
		public var q_att_type:int;
		 /**  阵营关系 */
		public var q_relation:int;
		 /**  装备属性占比（万分比） */
		public var q_equip_ratio:int;
		 /**  BUFF免疫类型（格式：[类型1，类型2] */
		public var q_immunity_buff:String;
		 /**  怪物生命恢复方式（0不恢复，1脱离战斗恢复，2掉血后就持续恢复,3表示脱离战斗后持续恢复生命） */
		public var q_recover_hp_type:int;
		 /**  怪物恢复血量的间隔(单位：毫秒） */
		public var q_recover_hp_period:int;
		 /**  怪物间隔时间恢复的生命值 */
		public var q_auto_recover_hp:int;
		 /**  视野距离半径(单位：格子数)，-1为全地图 */
		public var q_eyeshot:int;
		 /**  巡逻距离半径(单位：格子数) */
		public var q_patrol:int;
		 /**  巡逻间隔时间（毫秒） */
		public var q_patrol_time:int;
		 /**  巡逻几率（万分比）最高不能超过2000 */
		public var q_patrol_pro:int;
		 /**  追击距离半径(单位：格子数)本距离值不得小于怪物的巡逻距离值 */
		public var q_pursuit:int;
		 /**  怪物攻击时使用的默认技能(格式：技能ID_技能等级） */
		public var q_default_skill:String;
		 /**  怪物使用的特殊技能ID与触发几率列表（格式：[[技能ID,技能等级,触发权重],[技能ID,技能等级,触发权重]]）（顺序不能变） */
		public var q_special_skill:String;
		 /**  怪物AI关联的BUFF ID（顺序不能变） */
		public var q_special_buff:String;
		 /**  怪物AI关联的NPCID（顺序不能变） */
		public var q_special_npc:String;
		 /**  怪物AI关联的怪物ID（顺序不能变） */
		public var q_special_monster:String;
		 /**  怪物被攻击时是否固定少血(0否,1是) */
		public var q_fixed_hurt:int;
		 /**  怪物被攻击时固定少血值 */
		public var q_fiexd_value:int;
		 /**  怪物携带经验 */
		public var q_carry_exp:int;
		 /**  是否排除在经验衰减规则之外（1不排除，0排除在经验衰减规则之外） */
		public var q_isexclude:int;
		 /**  BOSS类怪物，固定刷新时间定义[年][月][日][周][11:10-12:00] */
		public var q_refreshtime:String;
		 /**  怪物的重生时间(单位：秒) */
		public var q_revive_time:int;
		 /**  怪物存活时间 */
		public var q_survival_time:int;
		 /**  关联的AI脚本ID */
		public var q_script_id:int;
		 /**  脚本ID索引 */
		public var q_script_index:int;
		 /**  是否同步显示详细信息（0不显示 1世界BOSS 2统领BOSS） */
		public var q_info_sync:int;
		 /**  是否显示伤害排行榜及奖励信息(0:不显示，1：显示） */
		public var q_rank_show:int;
		 /**  是否计入排行榜BOSS击杀(0:不，1：是） （大于0为BOSSID，在帮会新鲜事中记录被这个字段配置的怪打死的） */
		public var q_kill:int;
		 /**  造型是否翻转（0：否，1：是） */
		public var q_exchange:int;
		 /**  BOSS技能AI */
		public var q_ai:int;
		 /**  怪物的属性强度万分比显示[攻击,防御,血量] （BOSS刷新面板的3个属性条长度） */
		public var q_attribute_strength:String;
		 /**  是否可挖掘(0: 不可，：可） */
		public var q_mining:int;
		 /**  是否周末掉落双倍(0:不，1：是） */
		public var q_double_weakend:int;
		 /**  怪物史记类型[勋章类型,单次伤害值,每次产出勋章个数] */
		public var q_redord_type:String;
		 /**  推荐战斗(只有精英和BOSS显示) */
		public var q_fighting:int;

	}
}
		