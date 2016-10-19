package com.rpgGame.coreData.lang
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
	public class LangBiaoJu
	{
		 /**  1、帮主权限：冲入本金（退位时返还）/薪水分配。 */
		public static const line0:String = "line0";
		 /**  2、开启条件：库存资金高于100锭。 */
		public static const line1:String = "line1";
		 /**  3、关闭条件：镖局开启超过30分钟。 */
		public static const line2:String = "line2";
		 /**  4、自动停运：运营资金<=4锭。 */
		public static const line3:String = "line3";
		 /**  5、利润不分配会自动累积，每天只能进行一次分配操作。 */
		public static const line4:String = "line4";
		 /**  6、2:00-14:00是镖局结算期，此期间无法投保。 */
		public static const line5:String = "line5";
		 /**  7、3:00-14:00帮主可进行分配薪水操作。 */
		public static const line6:String = "line6";
		 /**  1、边境军需任务经验值提升15%<br/>2、镖车受到攻击时会自动向官员求救。<br/>3、镖车被攻击至损毁时镖局会全额赔偿运镖押金。<br/>4、02:00-14:00是镖局停业结算时间。<br/>5、国王帮成员可查看镖局运营状况。<br/> */
		public static const toubaoInfo:String = "toubaoInfo";
		 /**  没有家族 */
		public static const biaoJuLogFail1:String = "biaoJuLogFail1";
		 /**  没有帮派 */
		public static const biaoJuLogFail2:String = "biaoJuLogFail2";
		 /**  您不是王帮成员或禁卫军，无法查看镖局信息。 */
		public static const biaoJuLogFail3:String = "biaoJuLogFail3";
		 /**  今日已经分配了 */
		public static const allocateSalaryFail1:String = "allocateSalaryFail1";
		 /**  当前无法分配 */
		public static const allocateSalaryFail2:String = "allocateSalaryFail2";
		 /**  对不起，你不是国王，无法开启镖局。 */
		public static const allocateSalaryFail3:String = "allocateSalaryFail3";
		 /**  有人不是官员 */
		public static const allocateSalaryFail4:String = "allocateSalaryFail4";
		 /**  利润不够,无法分配 */
		public static const allocateSalaryFail5:String = "allocateSalaryFail5";
		 /**  有人被分配了两次 */
		public static const allocateSalaryFail100:String = "allocateSalaryFail100";
		 /**  镖局没有开启,无法投保 */
		public static const onTouBaoFail1:String = "onTouBaoFail1";
		 /**  没有镖车,怎么投保 */
		public static const onTouBaoFail2:String = "onTouBaoFail2";
		 /**  破损镖车无法投保 */
		public static const onTouBaoFail3:String = "onTouBaoFail3";
		 /**  镖车已经投保了 */
		public static const onTouBaoFail4:String = "onTouBaoFail4";
		 /**  钱不够,无法投保 */
		public static const onTouBaoFail5:String = "onTouBaoFail5";
		 /**  镖车已经破损,无法投保。 */
		public static const onTouBaoFail6:String = "onTouBaoFail6";
		 /**  没有足够的运营资金去投保 */
		public static const onTouBaoFail7:String = "onTouBaoFail7";
		 /**  镖车距离npc过远 */
		public static const onTouBaoFail8:String = "onTouBaoFail8";
		 /**  该镖车当前无法投保 */
		public static const onTouBaoFail9:String = "onTouBaoFail9";
		 /**  服务器bug */
		public static const onTouBaoFail100:String = "onTouBaoFail100";
		 /**  对不起，你不是国王，无法开启镖局。 */
		public static const openBiaoJuFail1:String = "openBiaoJuFail1";
		 /**  镖局已经开启了 */
		public static const openBiaoJuFail2:String = "openBiaoJuFail2";
		 /**  对不起，当前时间段无法开启镖局（2:00-14:00） */
		public static const openBiaoJuFail3:String = "openBiaoJuFail3";
		 /**  对不起，镖局库存资金不足100锭，请充入本金。 */
		public static const openBiaoJuFail4:String = "openBiaoJuFail4";
		 /**  对不起，开启镖局未满30分钟，当前无法开启镖局。 */
		public static const openBiaoJuFail5:String = "openBiaoJuFail5";
		 /**  没有家族 */
		public static const rechargeBiaoJuMoneyFail1:String = "rechargeBiaoJuMoneyFail1";
		 /**  没有帮派 */
		public static const rechargeBiaoJuMoneyFail2:String = "rechargeBiaoJuMoneyFail2";
		 /**  对不起，你不是国王，无法开启镖局。 */
		public static const rechargeBiaoJuMoneyFail3:String = "rechargeBiaoJuMoneyFail3";
		 /**  捐的钱数量非法 */
		public static const rechargeBiaoJuMoneyFail4:String = "rechargeBiaoJuMoneyFail4";
		 /**  您身上没有这么多银两 */
		public static const rechargeBiaoJuMoneyFail5:String = "rechargeBiaoJuMoneyFail5";
		 /**  捐的太多了,溢出了。 */
		public static const rechargeBiaoJuMoneyFail100:String = "rechargeBiaoJuMoneyFail100";
		 /**  没有家族 */
		public static const getBiaoJuDataFail1:String = "getBiaoJuDataFail1";
		 /**  没有帮派 */
		public static const getBiaoJuDataFail2:String = "getBiaoJuDataFail2";
		 /**  您不是王帮成员或禁卫军，无法查看镖局信息。 */
		public static const getBiaoJuDataFail3:String = "getBiaoJuDataFail3";
		 /**  1、充入银子（非绑银）。<br/>2、充入的钱将进入镖局库存资金。<br/>3、充入的钱无法直接提取，在退位时会返还剩余的运营资金。<br/> */
		public static const biaoJuAddMoneyDes:String = "biaoJuAddMoneyDes";

	}
}
		