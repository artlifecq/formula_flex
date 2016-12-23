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
	public class Q_summon
	{
		 /**  id */
		public var id:int;
		 /**  召唤怪名字，下划线后面的客户端不会展示出来 */
		public var name:String;
		 /**  资源 */
		public var res:String;
		 /**  头像资源 */
		public var head:String;
		 /**  固定减血 */
		public var static_hurt:int;
		 /**  属性，跟宠物配置一样，固定值+百分比 */
		public var stat:int;
		 /**  怪物战斗使用的技能，多个用分号隔开 */
		public var battle_spells:int;
		 /**  跟随最小距离 */
		public var follow_min_distance:int;
		 /**  跟随最大距离 */
		public var follow_max_distance:int;
		 /**  传送距离 */
		public var transport_distance:int;
		 /**  持续时间，怪物召唤出来持续多久，单位毫秒 */
		public var duration:int;
		 /**  出现类型 */
		public var appear_type:int;
		 /**  消失类型 */
		public var disappear_type:int;

	}
}
		