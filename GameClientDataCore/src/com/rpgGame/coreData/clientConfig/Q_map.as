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
	public class Q_map
	{
		 /**  地图ID */
		public var q_map_id:int;
		 /**  地图中文名 */
		public var q_map_name:String;
		 /**  地图资源路径 */
		public var q_mapres:String;
		 /**  地图宽度 */
		public var q_map_width:int;
		 /**  地图高度 */
		public var q_map_height:int;
		 /**  进入等级下限 */
		public var q_map_min_level:int;
		 /**  进入等级上限 */
		public var q_map_max_level:int;
		 /**  是否安全区(0战斗区域,1安全区域) */
		public var q_map_safe:int;
		 /**  脚本ID */
		public var q_script:int;
		 /**  地图默认PK类型（-1为不设置PK类型,0和平，1组队，2帮会，3全体，4阵营，5善恶（暂时没用）） */
		public var q_default_pk:int;
		 /**  是否允许手动切换PK状态（0不可以，1可以） */
		public var q_allow_change_pk:int;
		 /**  是否可打坐(0不可打坐,1可打坐) */
		public var q_map_sit:int;
		 /**  是否可跳跃(0不可跳跃,1可跳跃) */
		public var q_map_jump:int;
		 /**  是否可骑乘(0不可骑乘,1可骑乘) */
		public var q_map_ride:int;
		 /**  是否可展示坐骑(0不允许,1允许) */
		public var q_map_show:int;
		 /**  被PK死亡后是否给予和平保护BUFF（0给予，1不给予） */
		public var q_map_buff:int;
		 /**  等级差距过大是否可PK（0可PK，1不可PK） */
		public var q_map_pk:int;
		 /**  是否可以PK新人（0可PK，1不可PK） */
		public var q_map_pkprotection:int;
		 /**  夜晚挂机是否开启挂机保护（0不开启，1开启） */
		public var q_map_hangprotection:int;
		 /**  死亡回到地图ID */
		public var q_map_die:int;
		 /**  回到X坐标 */
		public var q_map_die_x:int;
		 /**  回到Y坐标 */
		public var q_map_die_y:int;
		 /**  死亡随机回城坐标（x_y,x_y） */
		public var q_rnd_die_xy:String;
		 /**  下线回到地图ID */
		public var q_map_quit:int;
		 /**  下线回到X坐标 */
		public var q_map_quit_x:int;
		 /**  下线回到Y坐标 */
		public var q_map_quit_y:int;
		 /**  退出随机回城坐标（x_y;x_y） */
		public var q_rnd_quit_xy:String;
		 /**  地图最大开放线路数 */
		public var q_map_lines:int;
		 /**  是否为公共区地图（1普通?2中立区?4跨服地图?3普通+中立?5普通+跨服?7所有（副本都填3）） */
		public var q_map_public:int;
		 /**  是否为副本（0普通 1副本）（副本地图不能直接传送） */
		public var q_map_zones:int;
		 /**  是否为“假副本”（1是 0否）（无传送点连通，实际为公共地图但玩家认为是副本的地图）（用于处理进入后需要记录进入时的坐标，离开时返回远处） */
		public var q_bogus_zones:int;
		 /**  一条线路承载的最大人数 */
		public var q_max_online:int;
		 /**  地图PK类型（0普通，1PK无惩罚区） */
		public var q_pk_type:int;
		 /**  死亡是否掉落身上装备（1是 0否） */
		public var q_drop_equip:int;
		 /**  死亡是否掉落背包装备（1是 0否） */
		public var q_drop_bag:int;
		 /**  本地图默认帮旗，0不可插，其他填指定怪物ID */
		public var q_default_flag:int;
		 /**  帮旗坐标[x,y] */
		public var q_flag_pos:String;
		 /**  启动服务器时默认开启的线路数 */
		public var q_default_line:int;
		 /**  轮询人数 */
		public var q_poll_num:int;
		 /**  有效玩家的等级范围区间(闭区间) */
		public var q_effective_player:String;
		 /**  场景雾配色 */
		public var q_fogcolor:String;
		 /**  是否全地图同步（0默认不1全地图） */
		public var q_map_round_map:int;
		 /**  脚底光类型 (0默认无，1弱光，2正常光) */
		public var q_map_footlight:int;
		 /**  是否开启格子热度记录(0默认无1开启）（主要用于新手地图让怪简单分散站） */
		public var q_map_hotvalue:int;
		 /**  遮盖物件层视角偏移量 */
		public var q_coverpivotoffset:String;
		 /**  音乐关联（音乐资源编号_播放完后空闲秒数;音乐资源编号_播放完后空闲秒数) */
		public var q_music:String;
		 /**  地图是否是附属地图（1是，0否） */
		public var q_map_subsidiary:int;
		 /**  附属地图的主地图id */
		public var q_subsidiary_main:int;
		 /**  关联BOSSid（寻径时，找有BOSS的地图） */
		public var q_boss_id:int;
		 /**  是否可用玫瑰复活（0是，1否） */
		public var q_rose_resurrection:int;
		 /**  开区X天合并线程 */
		public var q_merge_thread_day:int;
		 /**  合并到目标地图线程 */
		public var q_target_mapid:int;
		 /**  地图环境光效（0是正常显示，有太阳，1限制视线，无灯） */
		public var q_dark_fog:int;
		 /**  掉落金币是否可多倍（0可以，1不可以） */
		public var q_fortune:int;
		 /**  地图类型(1论剑,2多人副本,3真气副本,4装备副本,5经验副本,6巅峰,10:天降元宝,11战场类型，12秦陵秘宝,13夫妻副本) */
		public var q_map_type:int;
		 /**  跳跃连接点 */
		public var q_jump_link:String;
		 /**  地图复活区域 */
		public var q_revive_area:int;
		 /**  地图特殊区域[{t:0,areaIds:[1,2,3]},{t:1,areaIds:[1,2,3]}] */
		public var q_special_area:String;

	}
}
		