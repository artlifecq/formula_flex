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
	public class Q_SpellAnimation
	{
		 /**  id */
		public var id:int;
		 /**  名字 */
		public var name:String;
		 /**  场景特效 */
		public var scene_res:String;
		 /**  角色身上的特效 */
		public var role_res:String;
		 /**  武器特效 */
		public var weapon_res:String;
		 /**  特效绑定点 */
		public var bind_bone:String;
		 /**  特效表现效果类型 0：无特殊效果 1：暴风雪类型，对应排云掌，悲天剑雨 2：龙卷风类型，对应风神腿，断情七绝 */
		public var special_effect:int;
		 /**  偏移量 */
		public var offset_x:int;
		 /**   */
		public var offset_y:int;
		 /**   */
		public var offset_z:int;
		 /**  缩放量 */
		public var scale_x:int;
		 /**   */
		public var scale_y:int;
		 /**   */
		public var scale_z:int;
		 /**  第一次播放延时 */
		public var delay:int;
		 /**  循环播放次数(0表示无限次, 状态不需要配, 默认就是循环播放到状态时间结束) */
		public var loop_count:int;
		 /**  特效是否跟着角色移动.同样一个旋风斩特效, 如果跟角色, 则人物移动特效也移动, 感觉是人物不停在伤害周围的人.如果不跟角色, 则是固定坐标 */
		public var is_on_role:int;
		 /**  特效是否需要旋转 */
		public var need_rotation:int;
		 /**  是否需要在范围内随机多个, 做出类似暴风雪的效果. 0表示不需要. 大于0表示要在多少乘多少的范围内随机 */
		public var random_range:int;
		 /**  播放这个动画时需要播放的音效名 (美术资源目录/sound/effect/音效名.mp3) */
		public var sound_name:int;
		 /**  特效是否是多方向，刀光填1 */
		public var is_multi_direction:int;

	}
}
		