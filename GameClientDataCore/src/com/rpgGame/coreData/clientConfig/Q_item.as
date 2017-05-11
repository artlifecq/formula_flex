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
	public class Q_item
	{
		 /**  物品ID */
		public var q_id:int;
		 /**  物品名称 */
		public var q_name:String;
		 /**  物品描述信息（本处需要支持html标记）<font color= */
		public var q_describe:String;
		 /**  物品类型(根据物品类型说明填) */
		public var q_type:int;
		 /**  物品子类型 */
		public var q_location:int;
		 /**  装备阶数 */
		public var q_levelnum:int;
		 /**  物品品质（0白色，1绿色，2蓝色，3紫色，4金色） */
		public var q_default:int;
		 /**  佩戴职业需求（0通用 1兵家 2墨家4 医家） */
		public var q_job:int;
		 /**  需要性别(0通用 1男 2女) */
		public var q_sex:int;
		 /**  佩戴部位 */
		public var q_kind:int;
		 /**  产出途径描述 */
		public var q_output:String;
		 /**  物品产出（显示产出文字描述） */
		public var q_itemsofoutput:int;
		 /**  最低使用等级需求 */
		public var q_level:int;
		 /**  等级上限需求 */
		public var q_requiremaxlevel:int;
		 /**  绑定类型（0不绑定；1获得时绑定；2使用后绑定） */
		public var q_bind:int;
		 /**  最大叠加数量（0或1均为不可叠加，最大可以填9999） */
		public var q_max:int;
		 /**  最大拥有数（0表示无限制） */
		public var q_maxownnum:int;
		 /**  该道具最大的使用次数(个数|时间类型|参数(当前只能为1)，如10|1|1，即为1天可以使用10个，如21|2|1，则代表每1周可以用21个，如30|3|1则代表每月能用30个，时间类型1为自然天，2为自然周，3为自然月，4为自然年；参数为具体单位 */
		public var q_item_limit:String;
		 /**  怪物爆出后是同步类型（0全部同步，1如果是小怪爆出的，则只同步给有拾取权的人（JY BOSS无视此规则）） */
		public var q_issyn:int;
		 /**  商店中的购买价格 */
		public var q_buy_price:int;
		 /**  商店是否回收（0不回收，1回收） */
		public var q_sell:int;
		 /**  出售给商店价格 */
		public var q_sell_price:int;
		 /**  出售时是否弹出二次确认面板（0不弹出，1弹出） */
		public var q_sell_confirm:int;
		 /**  回收价格（在商店最近出售列表里重新购回价格） */
		public var q_recycle:int;
		 /**  道具不足时弹框（0表示不弹框 1表示弹框） */
		public var q_notEnough:int;
		 /**  是否可丢弃（0不可丢弃，1可丢弃） */
		public var q_drop:int;
		 /**  丢弃时是否弹出二次确认面板（0不弹出，1弹出） */
		public var q_drop_confirm:int;
		 /**  是否允许被拖放至物品快捷栏（0不允许，1允许） */
		public var q_shortcut:int;
		 /**  药品公共冷却层级（使用某类物品可造成同级物品全部进入冷却时间） */
		public var q_cooldown_level:int;
		 /**  药品使用冷却时间（单位：毫秒） */
		public var q_cooldown:int;
		 /**  公共冷却时间（毫秒） */
		public var q_cooldown_type:int;
		 /**  使用后学会技能编号 */
		public var q_skill:int;
		 /**  使用后打开礼包表编号 */
		public var q_gift:int;
		 /**  使用后打开面板编号 */
		public var q_ui:int;
		 /**  掉落时是否默认显示名字(0不显示；1显示) */
		public var q_showDrop_name:int;
		 /**  装备掉落数量阈值：【从开服/合服开始计算，在一个hour周期内，所有登陆过的等级不低于level的玩家均视为活跃玩家，max(int(活跃玩家数 * pro) , min)为最大掉落数量   】【程序上最小为2小时，建议最小为24小时，误差为1小时】 */
		public var q_max_create:String;
		 /**  掉出时发送的公告类型（0不发送公告；1面向个人发送聊天框内公告；2面向个人发送聊天框内与屏幕上方双重公告；3面向全服发送聊天框内公告；4面向全服发送聊天框内与屏幕上方双重公告）【1和2暂时未做，目前只有功能3和4】 */
		public var q_notice:int;
		 /**  是否记录产出与操作日志（0不记录；1记录） */
		public var q_log:int;
		 /**  物品默认图标（42*42） */
		public var q_icon:int;
		 /**  物品换装资源编号（装备类物品使用）模型ID */
		public var q_drop_model:String;
		 /**  是否自动使用（1是，0否） */
		public var q_auto_use:int;
		 /**  是否弹出使用提示(背包中的道具数量>=此数值时弹出提示， 0不弹提示) */
		public var q_use_prompt:int;
		 /**  道具是否可批量使用(0否，1是) */
		public var q_whether_batch:int;
		 /**  道具是否可进入仓库（1否，0是） */
		public var q_save_warehouse:int;
		 /**  拾取优先级(数字越小优先级越高) */
		public var q_loot_priority:int;
		 /**  是否允许注册快捷栏(0不允许 1允许) */
		public var q_isitembar:int;
		 /**  使用后关联buff的ID,格式 [xxx,xxx,xxx] */
		public var q_buff:String;
		 /**  使用后触发技能 */
		public var q_sparkskill:int;
		 /**  特殊物品使用类型 */
		public var q_specialUseType:int;
		 /**  特殊使用参数1 */
		public var q_specialUseValue1:int;
		 /**  特殊使用参数2 */
		public var q_specialUseValue2:int;
		 /**  特殊使用参数3 */
		public var q_specialUseValue3:int;
		 /**  特殊使用参数4 */
		public var q_specialUseValue4:String;
		 /**  是否显示获得和销毁时间（0显示 1不显示） */
		public var q_isdisplaytime:int;
		 /**  属性ID */
		public var q_att_type:int;
		 /**  使用的场景ID限制 */
		public var q_sceneid:int;
		 /**  敏感道具数量异常数值 */
		public var q_abnormal_num:int;
		 /**  物品回收时间(掉落地面物品系统回收时间)单位秒 */
		public var q_recoverytime:int;
		 /**  道具穿戴身上时获得额外buff效果 */
		public var q_item_equip_buff:int;
		 /**  道具穿戴身上时的额外特效效果编号 */
		public var q_item_equip_effects:int;
		 /**  道具存在包裹时获得buff效果 */
		public var q_item_pack_buff:int;
		 /**  道具存在包裹时获得特效效果 */
		public var q_item_bag_effects:int;
		 /**  是否可被搜索（0可以被搜索 1表示不可以） */
		public var q_cansearch:int;
		 /**  阵营限制(0表示无限制 ) */
		public var q_grouplimit:int;
		 /**  是否显示转框特效（0显示 1不显示） */
		public var q_isshoweffects:int;
		 /**  使用后触发任务id */
		public var q_task:int;
		 /**  使用后触发脚本编号 */
		public var q_script:int;
		 /**  装备最大可强化等级 */
		public var q_max_strengthen:int;
		 /**  消耗获得强化值 */
		public var q_strengthen_num:int;
		 /**  消耗获得琢磨值 */
		public var q_polish_num:int;
		 /**  是否能被转移（1是 0否） */
		public var q_could_transfer:int;
		 /**  转移需要的元宝 */
		public var q_gold:int;
		 /**  0默认,1跨服优先,2原服跨服都执行 */
		public var q_crossUse:int;
		 /**  物品材质（用于处理穿戴某件装备进行[攻击]、[被攻击]、[走路]时的音效（武器、衣服、鞋子）） */
		public var q_matrial:int;
		 /**  物品类型描述 */
		public var q_append:String;
		 /**  熔炼可获得熔炼经验 */
		public var q_smelting_exp:int;
		 /**  出售获得熔炼值 */
		public var q_sell_smelting:String;
		 /**  回购需要熔炼值 */
		public var q_recycle_smelting:int;
		 /**  物品拖拽时的音效编号（0无声音 1通用 2武器 3项链、戒指、宝石 4其他装备 5药水 6卷轴 7箱子盒子 8货币 */
		public var q_drag_music:int;
		 /**  物品掉出时播放的音效资源编号 */
		public var q_drop_music:int;
		 /**  物品使用时播放的音效资源编号 */
		public var q_use_music:int;
		 /**  物品脱下时播放的音效资源编号 */
		public var q_unuse_music:int;
		 /**  装备最大可觉醒等级 */
		public var q_max_awaken:int;
		 /**  装备最大可注灵等级 */
		public var q_max_soul:int;
		 /**  帮会捐献/兑换贡献度 */
		public var q_contribution:int;

	}
}
		