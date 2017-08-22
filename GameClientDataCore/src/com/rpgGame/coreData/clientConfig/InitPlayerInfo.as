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
	public class InitPlayerInfo
	{
		 /**  唯一ID */
		public var id:int;
		 /**  职业ID */
		public var job:int;
		 /**  名称 */
		public var name:String;
		 /**  性别 */
		public var sex:int;
		 /**  出生地图ID */
		public var mapId:int;
		 /**  出生坐标X */
		public var positionX:int;
		 /**  出生坐标Y */
		public var positionY:int;
		 /**  角色骨骼 */
		public var heroModel:int;
		 /**  初始衣服模型 */
		public var avatarClothesRes:int;
		 /**  初始头发资源 */
		public var avatarHairRes:int;
		 /**  初始技能 */
		public var skill:String;
		 /**  初始道具[道具ID1,个数,背包号,道具ID2,个数,背包号,道具ID3,个数,背包号]0号背包1号装备栏2号仓库 */
		public var item:String;
		 /**  初始背包格数 */
		public var bagNum:int;
		 /**  初始仓库格数 */
		public var storeNum:int;
		 /**  被攻击回复怒气 */
		public var beenAttackRec:int;
		 /**  血量丢失百分比回复怒气（丢失百分之一所回复怒气） */
		public var hpReduceRecPer:int;
		 /**  角色初始化任务id */
		public var q_task:int;

	}
}
		