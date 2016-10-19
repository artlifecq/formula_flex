package com.rpgGame.coreData.clientConfig
{
	/**
	* 
	*  根据模块config 文件设置自动生成的代码
	*	
	* 【**不可手动修改此类**】，
	*	
	* 【任何修改都将被生成工具覆盖，如需修改请直接修改具体的config文件】
	* @author fly.AutoUICreater
	* @modifier L.L.M.Sunny
	* 修改时间：2015-7-2 上午10:05:12
	* 
	*/
	public class SceneCharPatrolInfo
	{
		 /**  名字(可不填) */
		public var name:String;
		 /**  称号(可不填) */
		public var title:String;
		 /**  换装资源(穿的衣服资源名) */
		public var avatarRes:String;
		 /**  巡逻的坐标点(按,分隔XY,按;号分隔点) */
		public var patroPos:String;
		 /**  场景ID */
		public var sceneID:uint;
		 /**  移动速度(不填默认为150) */
		public var moveSpeed:uint;
		 /**  随机说的话,如果要从多句中随机说,用;号分隔,可以配表情符,:ab */
		public var randomTalkDes:String;
		 /**  是否可点击(可点击的时候,点它可以停下来),0为不可,1为可 */
		public var mouseEnabled:uint;
		 /**  武器资源(拿的武器资源名) */
		public var weaponRes:String;
		 /**  骑的坐骑资源(骑的坐骑资源名) */
		public var mountRes:String;
		 /**  身后背的古剑资源(多个古剑资源名用;号分隔) */
		public var gjRes:String;

	}
}
		