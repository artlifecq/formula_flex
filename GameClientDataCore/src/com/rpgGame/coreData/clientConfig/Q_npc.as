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
		 /**  NPC编号10000-39990任务NPC、40000-49990功能NPC、50000-55000特殊类、59010-59990采集类 */
		public var q_id:int;
		 /**  刷新地图ID */
		public var q_map:int;
		 /**  刷新X坐标 */
		public var q_x:int;
		 /**  刷新Y坐标 */
		public var q_y:int;
		 /**  刷新NPC坐标集合[11,22],[22,33] */
		public var q_pos:String;
		 /**  NPC名字 */
		public var q_name:String;
		 /**  NPC称号 */
		public var q_title:String;
		 /**  NPC上绑定的功能列表（格式：功能类型|选项文字描述;功能类型|选项文字描述;） */
		public var q_function:String;
		 /**  NPC功能描述（小地图tips描述，支持html） */
		public var q_npcdesc:String;
		 /**  0在小地图和列表显示，1只在小地图显示，2只在列表显示，3都不显示 */
		public var q_isminimap:int;
		 /**  NPC绑定的商店出售模板编号 */
		public var q_shop:int;
		 /**  NPC传送序列（文字描述|MAPid,X,Y,半径|等级|元宝=Y金币=G|价格;文字描述|MAPid,X,Y,半径|等级|元宝=Y金币=G|价格） */
		public var q_transfer:String;
		 /**  NPC身上绑定的任务编号列表,多个任务用；隔开 */
		public var q_task:String;
		 /**  NPC功能面板上的简单对白（需支持基本的Html语法） */
		public var q_dialog:String;
		 /**  NPC在场景中的发言内容(多句以分号分隔) */
		public var q_speak:String;
		 /**  发言频率间隔(单位：毫秒) */
		public var q_speak_time:int;
		 /**  资源类型（0默认，1怪物，2侍宠，3主角） */
		public var q_resources:int;
		 /**  造型是否翻转（0否，1是） */
		public var q_isturn:int;
		 /**  默认朝向（0开始，顺时针转到7） */
		public var q_direction:int;
		 /**  造型资源编号（资源使用：单方向6帧） */
		public var q_resource:String;
		 /**  头像资源编号 */
		public var q_head:String;
		 /**  任务接取播放（任务ID+动作名） */
		public var q_access_play:String;
		 /**  任务完成播放（任务号+动作名） */
		public var q_complete_play:String;
		 /**  是否可见（0不可见，1可见） */
		public var q_isvisible:int;
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
		 /**  是否显示NPC */
		public var q_displaynpc:String;
		 /**  采集道具冷却时间（不填为没有CD时间，CD时间毫秒计算） */
		public var q_cdtime:int;
		 /**  采集获得物品 */
		public var q_acquisition_item:int;
		 /**  npc类型（1：代表采集类NPC，没有影子，会出现呼吸提升光效） */
		public var q_type:int;
		 /**  像素X坐标 */
		public var q_px:int;
		 /**  像素Y坐标 */
		public var q_py:int;
		 /**  采集完成任务 */
		public var q_acquisition_task:int;
		 /**  npc交互距离(格子) */
		public var q_Interactive:int;
		 /**  npcAI */
		public var q_ai:int;
		 /**  NPC对话音效 */
		public var q_npctalk:int;
		 /**  每次行走格子数量(0不走,最高6格) */
		public var q_patrolgrid:int;
		 /**  巡逻几率(万分比,0永远不走) */
		public var q_patrolPro:int;
		 /**  移动速度 */
		public var q_speed:int;
		 /**  行走后冷却时间(至少大于1000毫秒) */
		public var q_patrolcd:int;
		 /**  领取的钻石数量(0表示不可领取钻石) */
		public var q_diamond:int;
		 /**  冷却时间(秒) */
		public var q_cooldown:int;

	}
}
		