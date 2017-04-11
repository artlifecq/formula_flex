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
		 /**  BUFF编号（类型编号*1000+N） */
		public var q_buff_id:int;
		 /**  BUFF名称 */
		public var q_buff_name:String;
		 /**  客户端显示的图标资源 */
		public var q_icon:String;
		 /**  UI上是否展示图标0不显示 1显示 */
		public var q_icon_show:int;
		 /**  描述 */
		public var q_description:String;
		 /**  获得状态的初始化动画 */
		public var q_init_animation:int;
		 /**  角色中了buff后， 身上的特效。 填animation表中的名字 */
		public var q_animation:String;
		 /**  状态消失后的动画 */
		public var q_disappear_animation:int;
		 /**  角色中了buff后被攻击， 身上的特效。 填animation表中的名字 */
		public var q_been_hurt_animation:int;
		 /**  作用目标（1自己，2目标，3自己与目标，4自己和队友,5主人） */
		public var q_target:int;
		 /**  BUFF广播类型（0隐藏式BUFF，1显示给自己知道的BUFF，2在地图同步给周围玩家的BUFF , 3其他玩家选中后,前端请求查看的BUFF） */
		public var q_cast_type:int;
		 /**  损益类型（0无所谓，1正面BUFF，2负面BUFF,3不受内力盾影响） */
		public var q_effect_type:int;
		 /**  效果类型 */
		public var q_action_type:String;
		 /**  效果添加成功几率（本处填万分比的分子） */
		public var q_trigger_prob:int;
		 /**  满足对应条件则增加BUFF添加几率。参考“效果类型”,例: 在眩晕状态下，加速BUFF添加几率提高10%，这里这个值就填101. */
		public var q_state_condition:int;
		 /**  添加此BUFF时需要BUFF施加者需要学会的技能ID */
		public var q_need_skill_condition:String;
		 /**  条件满足额外附加成功率（负数为减概率） */
		public var q_state_condition_prob:int;
		 /**  效果作用数值（允许负值） 对应action_type字段 */
		public var q_effect_value:String;
		 /**  效果作用比例（本处填万分比的分子）（允许负值）  对应action_type字段 */
		public var q_effect_ratio:String;
		 /**  在指定时间内，对同一个对象添加BUFF的冷却时间，在这个时间内，添加将失败。单位毫秒 */
		public var q_add_cd:int;
		 /**  是否针对死亡单位（0否，1是） */
		public var q_die:int;
		 /**  效果的总持续时间（单位：毫秒）（填-1为永久生效） */
		public var q_effect_time:int;
		 /**  BUFF触发次数，配置后，触发次数用完就会删除该BUFF,{ 触发类型,触发条件,剩余次数 }; t=触发类型 1:命中 2:受伤 3:躲闪 4,暴击 5:死亡 6使用指定技能。 c=触发条件:部分需要触发类型需要配置条件(t=1 时 c=技能id),如:使用指定技能这类。r=剩余次数.例:{t:1,c:0,r:1} */
		public var q_effect_remain:String;
		 /**  效果的总容量 */
		public var q_effect_maxvalue:int;
		 /**  效果分次作用间隔时间（单位：毫秒） */
		public var q_effect_cooldown:int;
		 /**  效果重复选项（1效果叠加，2效果替换，3容量叠加(属性,层数）,4时间叠加，5重复无效） */
		public var q_overlay:int;
		 /**  叠加次数上限（-1为无限） */
		public var q_overlay_maxcount:int;
		 /**  叠加到达上限后，触发BUFF ID，（触发成功后根据q_is_delete_old_buff字段判断是否移除当前BUFF。）******当叠加次数为0时，这里也填值，就说明是添加这个BUFF成功后则触发另外一个BUFF的添加 */
		public var q_overlay_max_trigger:String;
		 /**  q_overlay_max_trigger字段中BUFF添加成功后是否删除原BUFF（1删除 0不删除） */
		public var q_is_delete_old_buff:int;
		 /**  替换类型（类型相同的才会替换） */
		public var q_replace_type:int;
		 /**  替换层级（高层级的将可替换低层级） */
		public var q_replace_level:int;
		 /**  获得者死亡或下线后是否清除（0不清除，1清除，2切换地图清除，3仅下线清除） */
		public var q_effect_dieordown_clear:int;
		 /**  BUFF加属性，格式【格式:力道:X,根骨:X,身法:X,慧根:X,气血:X,能量:X,最大气血:X,最大能量:X,外功:X,内功:X,防御百分比:X,暴击率:X,暴击伤害:X,暴击抗性:X,生命回复:X,能量回复:X,效果抵抗:X,命中率:X,闪避:X,移动速度:X,攻击速度:X,角色等级:X,治疗技能效果提升:X,减少技能CD百分比:X,伤害加深百分比:X,伤害加深:X,无视防御伤害:X,伤害减免百分比:X,力道百分比:X,根骨百分比:X,身法百分比:X,慧根百分比:X,最大气血百分比:X,最大能量百分比:X,外功百分比:X,内功百分比:X,移动速度百分比:X,攻击速度百分比:X,气血百分比:X,能量百分比:X】 */
		public var q_attribute:String;
		 /**  BUFF参数，技能ID、技能ID */
		public var q_Bonus_skill:String;
		 /**  下线是否计时（0不是，1是） */
		public var q_Line_time:int;
		 /**  脚本BUFFID */
		public var q_script_id:int;
		 /**  针对目标（1玩家） */
		public var q_target_type:int;
		 /**  拥有BUFF者是否变色（0否，1是） */
		public var q_colour:int;
		 /**  是否加成战斗力（1加成，0不加成） */
		public var q_fihgt:int;
		 /**  关联buff技能（填技能ID） */
		public var q_other:String;
		 /**  客户端other（上升时间:up；受击时间：hit;被同步的技能ID：skill；浮空时间：stay；落地时间：down；离地高度：h；变身：model） */
		public var q_client_other:String;

	}
}
		