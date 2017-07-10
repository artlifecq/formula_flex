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
	public class Q_npc
	{
		 /**  采集物编号 */
		public var q_id:int;
		 /**  NPC上绑定的功能列表（格式：功能类型|选项文字描述;功能类型|选项文字描述;） */
		public var q_function:String;
		 /**  NPC功能描述（小地图tips描述，支持html） */
		public var q_npcdesc:String;
		 /**  NPC绑定的商店出售模板编号 */
		public var q_shop:int;
		 /**  NPC传送序列（文字描述|MAPid,X,Y,半径|等级|元宝=Y金币=G|价格;文字描述|MAPid,X,Y,半径|等级|元宝=Y金币=G|价格） */
		public var q_transfer:String;
		 /**  NPC身上绑定的任务编号列表,多个任务用；隔开 */
		public var q_task:String;
		 /**  NPC功能面板上的简单对白（需支持基本的Html语法） */
		public var q_dialog:String;
		 /**  任务接取播放（任务ID+动作名） */
		public var q_access_play:String;
		 /**  任务完成播放（任务号+动作名） */
		public var q_complete_play:String;
		 /**  NPC默认行为(42是采集) */
		public var q_behavior:int;
		 /**  是否跟随玩家 */
		public var q_follow:int;
		 /**  点击播放动作 */
		public var q_clickplay:int;
		 /**  玩家状态 */
		public var q_playerstate:int;
		 /**  点击触发脚本编号 */
		public var q_clickscriptid:int;
		 /**  进入视野播放动作 */
		public var q_viewplay:int;
		 /**  npc视野范围 */
		public var q_field:int;
		 /**  采集后触发脚本编号(47默认编号） */
		public var q_collectscript:int;
		 /**  采集时间（毫秒） */
		public var q_collecttime:int;
		 /**  最大采集上限 */
		public var q_collectup:int;
		 /**  采集是否移除(0不移除，1移除) */
		public var q_collectremove:int;
		 /**  是否显示NPC */
		public var q_displaynpc:String;
		 /**  采集道具冷却时间（不填为没有CD时间，CD时间毫秒计算） */
		public var q_cdtime:int;
		 /**  采集获得物品 */
		public var q_acquisition_item:int;
		 /**  采集完成任务 */
		public var q_acquisition_task:int;
		 /**  npc交互距离(格子) */
		public var q_Interactive:int;
		 /**  NPC对话音效 */
		public var q_npctalk:int;
		 /**  领取的钻石数量(0表示不可领取钻石) */
		public var q_diamond:int;
		 /**  冷却时间(秒) */
		public var q_cooldown:int;

	}
}
		