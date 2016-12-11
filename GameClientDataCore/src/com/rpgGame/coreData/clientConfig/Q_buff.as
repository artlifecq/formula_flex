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
	public class Q_buff
	{
		 /**  ID */
		public var id:int;
		 /**  名字 */
		public var name:String;
		 /**  组。 相同组且相同堆叠类型的特效不会共存 */
		public var group:int;
		 /**  优先级。要顶掉相同组的buff时， 高等级的会留下 */
		public var level:int;
		 /**  客户端显示的图标 */
		public var icon:String;
		 /**  是否buff，增益填1，减益填0或不填 */
		public var is_buff:int;
		 /**  免疫的状态组，配置格式为：状态group1;状态group2..... */
		public var immune_state_groups:int;
		 /**  总共生效的次数。 如果是直接加血并只加这一次的， 填0. 如果是多次加血的，填生效的次数。 其他全部填1 */
		public var total_tick:int;
		 /**  每次生效的间隔 只对加减血类的 total_tick >= 1的效果有效 */
		public var frame_time:int;
		 /**  描述 */
		public var description:String;
		 /**  中招时客户端会收到的提示 */
		public var notice_on_add:int;
		 /**  获得状态的初始化动画 */
		public var init_animation:int;
		 /**  角色中了buff后， 身上的特效。 填animation表中的名字 */
		public var animation:int;
		 /**  状态消失后的动画 */
		public var disappear_animation:int;
		 /**  角色中了buff后被攻击， 身上的特效。 填animation表中的名字 */
		public var been_hurt_animation:int;
		 /**  每次改变的血量值 负表示扣血 */
		public var each_life:int;
		 /**  每次改变的血量万分比 负的表示扣血 按最大血量乘 */
		public var each_life_per:int;
		 /**  每次改变的当前血量万分比 负的表示扣血 按当前血量乘 */
		public var each_cur_life_per:int;
		 /**  每次改变的魔法值 负表示扣蓝 */
		public var each_mana:int;
		 /**  每次改变的魔法万分比 负的表示扣魔法 按最大魔法量乘 */
		public var each_mana_per:int;
		 /**  每次改变的当前魔法万分比 负的表示扣魔法 按当前魔法量乘 */
		public var each_cur_mana_per:int;
		 /**  每次改变的跳闪值 负表示扣跳闪值 */
		public var each_jump_shield:int;
		 /**  附加的属性 */
		public var sprite_stat:int;
		 /**  额外加成属性， 配置 属性加成.txt 中的id */
		public var additional_sprite_stat_id:int;
		 /**  伤害吸收量 */
		public var absorb_hurt_amount:int;
		 /**  经验倍率，30%经验丹填30，双倍经验填100,三倍经验填200 */
		public var exp_multiple:int;
		 /**  是否物理攻击免疫 */
		public var is_physical_immune:int;
		 /**  是否法术攻击免疫 */
		public var is_magical_immune:int;
		 /**  是否不死，玩家永远1滴血 */
		public var is_immortal:int;
		 /**  是否是缴械状态，1表示是，0表示不是 */
		public var is_jiao_xie:int;
		 /**  是否附带晕眩 */
		public var is_stun:int;
		 /**  是否不能移动 */
		public var is_unmovable:int;
		 /**  是否不能跳跃 */
		public var is_unjumpable:int;
		 /**  是否沉默 */
		public var is_hush:int;
		 /**  是否致盲 */
		public var is_blinding:int;
		 /**  是否不可见 */
		public var is_invisible:int;
		 /**  是否具有真视能力 */
		public var is_true_sight:int;
		 /**  是否射马 */
		public var is_shoot_mount:int;
		 /**  是否混乱 */
		public var is_hun_luan:int;
		 /**  是否无敌 */
		public var is_invincible:int;
		 /**  死亡消失 */
		public var is_death_dispel:int;
		 /**  下线消失 */
		public var is_offline_dispel:int;
		 /**  是否切换场景消失 */
		public var is_change_scene_dispel:int;
		 /**  移动消失，目前只支持英雄 */
		public var is_move_dispel:int;
		 /**  跳跃消失 */
		public var is_jump_dispel:int;
		 /**  上马消失 */
		public var is_up_mount_dispel:int;
		 /**  打坐消失 */
		public var is_meditate_dispel:int;
		 /**  被攻击多少次后消失 */
		public var been_attack_times_dispel:int;
		 /**  攻击他人多少次以后消失，这个次数是打到一个目标算一次 */
		public var attack_other_times_dispel:int;
		 /**  释放N次攻击技能消失 */
		public var release_spell_times_dispel:int;
		 /**  是否对玩家不生效 */
		public var is_not_affect_hero:int;
		 /**  是否对普通怪物不生效 */
		public var is_not_affect_normal_monster:int;
		 /**  是否对精英怪物不生效 */
		public var is_not_affect_elite_monster:int;
		 /**  是否对BOSS怪物不生效 */
		public var is_not_affect_boss:int;
		 /**  是否对宠物不生效 */
		public var is_not_affect_pet:int;
		 /**  是否对镖车不生效 */
		public var is_not_affect_biao:int;
		 /**  最大堆叠层数 */
		public var max_stack_count:int;
		 /**  堆叠层数触发的技能，只有stack_type=1才会生效，配置规则如下：层级=触发技能(必须是type=ground的技能)，分号分隔多个层级。例子如下:1=112;2=112表示1层的时候触发112技能，2层的时候触发112技能 */
		public var stack_count_trigger_spell:int;
		 /**  堆叠类型（一次性生效的状态，不用配置） 1. 叠加效果, 时间刷新 2. 不叠加效果, 只刷新时间 3. 重复无效, 不给加 4. 时间叠加, 效果不叠加, 层数概念还是有, 但是客户端不显示层数 */
		public var stack_type:int;
		 /**  是否是进出副本消失的状态，1表示是进出副本消失的状态，不配置或者配置0表示不是进出副本消失的状态 */
		public var is_enter_or_leave_dungeon_dispel:int;

	}
}
		