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
	public class Q_activities
	{
		 /**  活动ID（不能重复，正式服上线后，数据需保留1个月才清理一次，活动ID为永久使用，使用过1次后永久不可继续使用）    每次更新活动检查：充值送，进阶送，折扣店，成就豪礼，战斗力飞升  每月检查：充值返利，累计充值，累计消费，神秘商店，累计登陆 */
		public var q_id:int;
		 /**  活动名称，显示在面板上的活动名字 */
		public var q_name:String;
		 /**  平台标识（不填表示不限，多个用分好隔开。例如：360wan;youxi) */
		public var q_pingtai:String;
		 /**  区别老新服（1新区：开服时间为新服才出现的活动。2旧：开服时间大于7天才出现的活动，0通用） */
		public var q_listimage:int;
		 /**  服务器限制，日期前（含日期）开启的服务器才显示该活动   20151212-000000 */
		public var q_serve_limit:String;
		 /**  领取类型：1表示活动期间每天领取2表示活动期间总共领取3表示活动期间每周领取，奖励领取次数-1无限领取,填其他的表示可以领取多少次,4每月q_reward_num的VIP等级） */
		public var q_reward_type:int;
		 /**  奖励领取次数-1无限领取,填其他的表示可以领取多少次  */
		public var q_reward_num:int;
		 /**  全服领取类型（服务器无限购填0）：1表示活动期间每天领取2表示活动期间总共领取3表示活动期间每周领取，奖励领取次数-1无限领取,填其他的表示可以领取多少次） */
		public var q_server_reward_type:int;
		 /**  全服奖励领取次数-1无限领取,填其他的表示可以领取多少次 */
		public var q_server_reward_num:int;
		 /**  活动类型（判断一类活动规则逻辑和面板显示无关后端）： */
		public var q_activity_type:int;
		 /**  活动面板类型(主面板类型及topbtn打开同类活动面板，前端) */
		public var q_mainpanel_type:int;
		 /**  主面板下子面板类型，可以不配 */
		public var q_subpanel_type:int;
		 /**  参与时间 &领取奖励时间 [[时间配置类型],[开始时间，结束时间]]    [[1],[yyyyMMddHHmmss，yyyyMMddHHmmss]]       [[2],[开服天数，开服天数]]    [[3],[合服天数，合开服天数，合服次数（-1表示每次合服生效，其他表示合服次数），合服规则(0表示等于前面配置的合服次数 1表示大于等于前面配置的合服次数,VIP活动用到)]] 永久填-1 */
		public var q_timingstart:String;
		 /**  显示时间   [[时间配置类型],[开始时间，结束时间]]    [[1],[yyyy-MM-dd HH:mm:ss，yyyy-MM-dd HH:mm:ss]]       [[2],[开服天数，开服天数]] */
		public var q_timingshow:String;
		 /**  活动内容介绍，显示在面板上的活动介绍，策划配置控制在22个字以内需要支持html代码 */
		public var q_info:String;
		 /**  奖励领取条件：活动期间，需要的累计登陆天数才可领取，0或者不填不判断。 */
		public var q_login_limit:int;
		 /**  奖励领取条件：需要单笔充值区间[最小值，最大值，返利百分比],[1000,-1,0]-1表示无上限 */
		public var q_recharge_oneoff:String;
		 /**  奖励领取条件：需要消费的元宝数。 */
		public var q_cost_gold:int;
		 /**  奖励领取条件：需要充值元宝数。 */
		public var q_recharge_gold:int;
		 /**  领取奖励所需累计充值天数（金额为q_recharge_gold)格式：充值天数,关联的上1档活动ID（没有填0） */
		public var q_recharge_day:int;
		 /**  奖励领取条件：兑换活动,格式：[[道具ID,数量],[道具ID，数量]] */
		public var q_change:String;
		 /**  阶数条件判断[[类型,阶数],[类型,阶数]]  （类型：-1 超级会员showgirlqq，1_等级，8_开服天数,10充值次数，11VIP等级,12令牌达成条件（1可以领），13团购人数;14战力巅峰；15等级巅峰；16坐骑巅峰；17神将巅峰；18强化巅峰；19战力；21神将；22坐骑；23强化;29每日首充,30当日充值元宝 */
		public var q_condition:String;
		 /**  成就配置[[类型,数量],[类型,数量]]  【坐骑：1】【骑兵2】【 美人3】【光翼4】【祥云5】【腰甲6】【一二7】【东风8】【重剑9】【山花10】【天使11】【恶魔12】【寻宝13】【杀怪数量14】【参加多人副本15】【竞技场16】【战斗力17】【挖掘BOSS18】【拜仙（都可）19】【继承装备次数20】【强化装备次数21】【合成宝石次数22】【神话进阶23】【合成装备（品）24】【使用魔化陨石个数25】【战印26】【入魔27】【披风28】【光武29】【脚印30】【飞行坐骑31】【如来神掌32】【影子33】【绿巨人34】【剑气35】【麒麟臂36】【37 全服充值人数】【神拳 38】【纹身 39】【40，海外占用】【41：灵猫】 【42：巨灵】 【43：入灵】 【44：宝殿】【45：修罗】【46：神农鼎】 【47：女娲石】【48：昆仑镜】 【49：崆峒印】【50：伏羲琴】【51：炼妖壶】【52：昊天塔】【53：盾牌】【54：送花】【55：东皇钟】 【56：吞天】【57：盘古斧】 */
		public var q_achievement:String;
		 /**  排行榜结算时间（不是排行榜活动不填） [[时间配置类型],[开始时间，结束时间]] */
		public var q_ranking_timing:String;
		 /**  排行榜活动条件（没有不填）[类型，开始排名，结束排名，参与条件资源线等阶] */
		public var q_ranking_condition:String;
		 /**  进入排行榜条件 */
		public var q_system:String;
		 /**  奖励数量（奖励的json字符串） */
		public var q_reward:String;
		 /**  resflag例子：[title:57.png,background:1.png,cellhead:meirendengji.png,cellname:dugulingke_0.png,cellnums:3jie.png]      ：title ：为置顶背景图 （image/other/openfun/head/ 程序已写）  zhuansheng:;   exchange:    右侧子界面上小tittle */
		public var q_resflag:String;
		 /**  面板左侧美术字：1：第1个位置是美术字图标名字2：第二个位置是ICON图标，如无则则留空如1;;dengji.png;2 */
		public var q_paging:String;
		 /**  第二个位置：界面标题图标资源路径 */
		public var q_icon:String;
		 /**  邮件补发未领取奖励 */
		public var q_mail:String;

	}
}
		