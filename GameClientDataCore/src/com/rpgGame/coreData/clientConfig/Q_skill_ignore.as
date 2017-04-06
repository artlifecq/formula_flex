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
	public class Q_skill_ignore
	{
		 /**  技能编号_技能等级 */
		public var q_skillID_q_grade:String;
		 /**  技能编号 */
		public var q_skillID:int;
		 /**  技能等级 */
		public var q_grade:int;
		 /**  策划备注2 */
		public var q_skillpanel_description:String;
		 /**  内力值消耗(若不需要根据等级增加消耗可以在基本数据库中控制) */
		public var q_mp:int;
		 /**  升级消耗银两(从本级升至下一级) */
		public var q_copper:int;
		 /**  升级消耗真气(从本级升至下一级) */
		public var q_energy:int;
		 /**  伤害加深值(伤害+加血) */
		public var q_increDamage:int;
		 /**  伤害加深百分比(填万分比) */
		public var q_increaDamagePer:int;
		 /**  升级所需人物等级(从本级升至下一级) */
		public var q_playerlevel:int;
		 /**  召唤物继承召唤者的生命值比例（万分比分子），如果不填，和档案表属性是叠加关系 */
		public var q_summon_hp:int;
		 /**  召唤的幻象分身秒伤比例（万分比分子） */
		public var q_summon_shang:int;
		 /**  仇恨值 */
		public var q_hatred:int;
		 /**  血量上限比例(万分比) */
		public var q_maxhp_per:int;
		 /**  升级所需军衔等级(从本级升至下一级) */
		public var q_militaryrank:int;
		 /**  BUFF触发率额外系数(万分比) */
		public var q_trigger_extra_prob:int;
		 /**  BUFF持续时间额外系数(毫秒) */
		public var q_extra_time:int;
		 /**  战斗力加成 */
		public var q_fight_bonus:int;

	}
}
		