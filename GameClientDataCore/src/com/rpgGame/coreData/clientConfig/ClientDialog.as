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
	public class ClientDialog
	{
		 /**  对话ID */
		public var id:uint;
		 /**  名字 */
		public var name:String;
		 /**  npc模板id，没填则为主角自己 */
		public var npcModelId:uint;
		 /**  NPC名字，<font color=' */
		public var npcName:String;
		 /**  下一个对话 */
		public var nextDialog:uint;
		 /**  内容，用|分割随机多句话 */
		public var content:String;
		 /**  内容权重，用|分割对应内容的权重，0到100，默认不填为100，总和小于等于100，按总占比划分 */
		public var contentWeight:String;
		 /**  持续时间 */
		public var duration:uint;
		 /**  是否冒泡类型 */
		public var isBubble:Boolean;
		 /**  UI样式，剧情对话界面：1为棕色，2为蓝色，默认为棕色 */
		public var uiStyle:uint;

	}
}
		