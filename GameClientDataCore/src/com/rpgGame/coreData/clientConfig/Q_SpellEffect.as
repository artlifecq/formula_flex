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
		 /**  施法动作 */
		public var attack_motion:String;
		 /**  是否残影 */
		public var ghost_effect:int;
		 /**  延迟时间（跟弹道有关），单位毫秒，不配默认为0,跟弹道有关系 */
		public var delay_time:int;
		 /**  技能施法时长（主要用于怪物）. 施法后多久不能移动. 就是攻击动作的总时间，配置多个用分号隔开“;”(顺序释放的技能需要为每一个动作配置施法时间，随机释放时间只需要配置一个) */
		public var cast_time:int;
		 /**  施法特效              配置格式为施法特效名字， 填写在animation.txt表中的名字，配置多个用分号隔开“;”，个数必须跟施法动作个数一致 */
		public var cast_animation:int;
		 /**  自身效果 */
		public var self_dest_animation:int;
		 /**  受击特效，爆点特效，配置多个用分号隔开“;”，个数必须跟施法动作个数一致 */
		public var hurt_animation:int;
		 /**  溅射效果 */
		public var sputtering_hurt_animation:int;
		 /**  对地效果            目标点特效，配置多个用分号隔开“;”，个数必须跟施法动作个数一致 */
		public var dest_animation:int;
		 /**  飞行特效 */
		public var fly_animation:int;
		 /**  可打断帧时间 */
		public var break_frame_time:int;
		 /**  受击延迟时间(必须比hit_time大，否则则以hit_time的时间为准） */
		public var hurt_delay:int;
		 /**  前端判定时间（飘字时间点） */
		public var hit_frame_time:int;
		 /**  连招起手时间 */
		public var carom_start_frame_time:int;
		 /**  凌空时间 */
		public var soar_frame_time:int;
		 /**  投掷延迟时间，需小于等于可打断帧时间 */
		public var throw_delay_time:int;
		 /**  施法音效 */
		public var cast_sound:int;
		 /**  爆点音效 */
		public var hit_sound:int;
		 /**  暴击爆点音效 */
		public var crit_sound:int;
		 /**  是否跟踪目标 默认不跟踪 */
		public var is_track_target:int;
		 /**  是否匹配目标高度 */
		public var is_adaptive_target_height:int;
		 /**  投掷高度有高度，没分量比时，按高度来；有高度，有分量比时，高度会随距离增加而增加；没高度，只有分量比时，分量比代表角度 */
		public var throw_height:int;
		 /**  投掷分量比有高度，没分量比时，按高度来；有高度，有分量比时，高度会随距离增加而增加；没高度，只有分量比时，分量比代表角度 */
		public var throw_weight_ratio:int;

	}
}
		