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
	public class ClientTrigger
	{
		 /**  触发ID */
		public var id:uint;
		 /**  名字 */
		public var name:String;
		/**  场景id */
		public var sceneId:uint;
		/**  场景id */
		public var zoneId:int;
		/**  触发类型，1.场景动态生成一些实体；2.给目标加上特效等；3.触发剧情对话；4.添加NPC；5.移除NPC；6.区域触发；7.击杀统计；8.场景动态生成采集物；9.冒泡对话 */
		public var triggerType:uint;
		/**  区域id */
		public var areaId:uint;
		/**  场景特效ID组，用,号相隔 */
		public var sceneEffectIds:Array;
		/**  前置触发条件ID1,2,3 */
		public var preTrigger:Array;
		/**  生成区域阻挡ID列表20103,20104 */
		public var obstacleArea:Array;
		/**  移除场景特效ID组，用,号相隔 */
		public var sceneEffectRemove:Array;
		/**  移除区域阻挡ID列表20103,20104 */
		public var obstacleAreaRemove:Array;
		
		
		 /**  链条触发ID，触发当前触发器时同时触发。 */
		public var chainTriggerId:uint;
		 /**  链条触发延迟 */
		public var chainTriggerDelay:uint;
		 /**  下一个触发ID，如完成对话后触发下一个触发器。 */
		public var nextTriggerId:uint;
		 /**  下一个触发延迟。 */
		public var nextTriggerDelay:uint;
		 /**  触发命令 */
		public var triggerCommand:String;
		
		 /**  目标增加特效资源 */
		public var targetAddEffectRes:String;
		 /**  目标类型，如采集物则为采集物类型，添加、移除的npc模板id */
		public var targetType:uint;
		
		 /**  对话id */
		public var dialogId:uint;
		
		 /**  击杀数量 */
		public var killedCount:uint;
		 /**  触发服务器ID */
		public var serverTriggerId:uint;

	}
}
		