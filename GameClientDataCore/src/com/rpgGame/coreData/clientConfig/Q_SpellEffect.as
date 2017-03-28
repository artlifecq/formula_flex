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
		 /**  是否残影（0没有残影；1表示有残影） */
		public var ghost_effect:int;
		 /**  施法时长（填多久就锁定多久不能移动，不填等动作播完） */
		public var cast_time:int;
		 /**  刀光特效（和武器相关需要根据动作调整特效出现时间） */
		public var cast_animation:int;
		 /**  抬手特效（与自身施法相关） */
		public var self_dest_animation:int;
		 /**  受击特效（攻击/加血目标身上释放的特效） */
		public var hurt_animation:int;
		 /**  溅射效果 */
		public var sputtering_hurt_animation:int;
		 /**  对地效果  （特效位置：锁定目标或鼠标点施放，） */
		public var dest_animation:int;
		 /**  飞行弹道特效 */
		public var fly_animation:int;
		 /**  形成带状的图片素材（给图片名字就行了） */
		public var ribbon_img:String;
		 /**  暂时没用 */
		public var delay_time:int;
		 /**  抬手特效出现时间（若不填则直接播放特效） */
		public var start_frame_time:int;
		 /**  地面特效出现时间（1.若为动点飞行弹道相关的对地击中点特效，则不需要配置出现时间2.若不配延迟时间，则动作播放完后才开始播特效） */
		public var hit_frame_time:int;
		 /**  动作的起始时间（可以定义从动作的某帧开始播放，前面的帧自动被跳过） */
		public var carom_start_frame_time:int;
		 /**  受击飘字延迟时间(必须比hit_frame_time大，否则则以hit_frame_time的时间为准） */
		public var hurt_delay:int;
		 /**  凌空时间 */
		public var soar_frame_time:int;
		 /**  施法音效 */
		public var cast_sound:int;
		 /**  爆点音效 */
		public var hit_sound:int;
		 /**  暴击爆点音效 */
		public var crit_sound:int;
		 /**  这个时间主要用来控制弹道出现时间，及位移时，执行动作的开始时间 */
		public var throw_delay_time:int;
		 /**  是否匹配目标高度 */
		public var is_adaptive_target_height:int;
		 /**  投掷高度，有高度，没分量比时，按高度来；有高度，有分量比时，高度会随距离增加而增加；没高度，只有分量比时，分量比代表角度 */
		public var throw_height:int;
		 /**  投掷分量比有高度，没分量比时，按高度来；有高度，有分量比时，高度会随距离增加而增加；没高度，只有分量比时，分量比代表角度 */
		public var throw_weight_ratio:int;

	}
}
		