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
	public class Q_SpellEffect
	{
		 /**  id */
		public var id:int;
		 /**  名字 */
		public var name:String;
		 /**  延迟时间，单位毫秒，不配默认为0 */
		public var delay_time:int;
		 /**  波数，配置必须>1表示持续技能 */
		public var repeat_times:int;
		 /**  每一波的时间间隔，单位毫秒，波数>1时有效 */
		public var repeat_interval:int;
		 /**  施法时是否要震屏 */
		public var shake_screen:int;
		 /**  技能施法时长（主要用于怪物）. 施法后多久不能移动. 就是攻击动作的总时间，配置多个用分号隔开“;”(顺序释放的技能需要为每一个动作配置施法时间，随机释放时间只需要配置一个) */
		public var cast_time:int;
		 /**  动作权重，不填表示顺序释放，否则表示动作随机权 */
		public var motion_weight:int;
		 /**  能否边走边放，1表示可以，0或者不配表示不行，默认不行 */
		public var can_walk_release:int;
		 /**  保持间距，不配默认使用施法范围 */
		public var keep_spacing:int;
		 /**  配置格式为：【施法动作=施法动作速度;施法动作=施法动作速度...】，施法动作速度可以不填，默认为100，不填的话，配置格式为：【施法动作;施法动作】 */
		public var attack_motion:String;
		 /**  受击延迟时间(仅前端用到） */
		public var hurt_delay:int;
		 /**  配置格式为施法特效名字， 填写在animation.txt表中的名字，配置多个用分号隔开“;”，个数必须跟施法动作个数一致 */
		public var cast_animation:int;
		 /**  爆点特效，配置多个用分号隔开“;”，个数必须跟施法动作个数一致 */
		public var hurt_animation:int;
		 /**  目标点特效，配置多个用分号隔开“;”，个数必须跟施法动作个数一致 */
		public var dest_animation:int;
		 /**  自身效果 */
		public var self_dest_animation:int;
		 /**  飞行特效 */
		public var fly_animation:int;
		 /**  飞行特效的飞行速度。 有飞行特效才能填。 有飞行特效必须填 */
		public var fly_speed:int;
		 /**  飞行特效的飞行时间，单位毫秒 */
		public var fly_time:int;
		 /**  是否飞行穿越 */
		public var is_fly_cross:int;
		 /**  闪现类型，0-无 1-冲锋 2-跳劈 3-闪烁 */
		public var blink_type:int;
		 /**  闪现速度，填每秒飞行像素 */
		public var blink_speed:int;
		 /**  跳劈的高度，可以不配置 */
		public var blink_height:int;
		 /**  击退格子数 支持负数 */
		public var beat_distance:int;
		 /**  是否以目标点的中心击退  1是以目标 其他是以释放者 */
		public var is_beat_back_to_spell_effect_pos:int;
		 /**  击退速度，像素/秒 */
		public var beat_back_speed:int;
		 /**  施法音效 */
		public var cast_sound:int;
		 /**  爆点音效 */
		public var hit_sound:int;
		 /**  暴击爆点音效 */
		public var crit_sound:int;
		 /**  可打断帧时间 */
		public var break_frame_time:int;
		 /**  前端判定时间（飘字时间点） */
		public var hit_frame_time:int;
		 /**  连招起手时间 */
		public var carom_start_frame_time:int;
		 /**  凌空时间 */
		public var soar_frame_time:int;
		 /**  是否残影 */
		public var ghost_effect:int;
		 /**  投掷延迟时间，需小于等于可打断帧时间 */
		public var throw_delay_time:int;
		 /**  死亡击退距离 */
		public var dead_beat_distance:int;
		 /**  死亡击退速度 */
		public var dead_beat_speed:int;
		 /**  击退概率 */
		public var dead_beat_probability:int;
		 /**  死亡击飞距离 */
		public var dead_launch_distance:int;
		 /**  死亡击飞速度 */
		public var dead_launch_speed:int;
		 /**  死亡击飞高度 */
		public var dead_launch_height:int;
		 /**  击飞概率 */
		public var dead_launch_probability:int;
		 /**  是否跟踪目标 默认不跟踪 */
		public var is_track_target:int;
		 /**  最大生效次数，配0则取技能波数字段 */
		public var max_hurt_times:int;
		 /**  是否为陷阱技能 */
		public var is_trap_spell:int;
		 /**  溅射效果 */
		public var sputtering_hurt_animation:int;
		 /**  是否匹配目标高度 */
		public var is_adaptive_target_height:int;
		 /**  投掷高度有高度，没分量比时，按高度来；有高度，有分量比时，高度会随距离增加而增加；没高度，只有分量比时，分量比代表角度 */
		public var throw_height:int;
		 /**  投掷分量比有高度，没分量比时，按高度来；有高度，有分量比时，高度会随距离增加而增加；没高度，只有分量比时，分量比代表角度 */
		public var throw_weight_ratio:int;

	}
}
		