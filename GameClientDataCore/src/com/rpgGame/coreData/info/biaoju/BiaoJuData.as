package com.rpgGame.coreData.info.biaoju
{
	import app.message.BiaoJuProto;

	public class BiaoJuData
	{
		public function BiaoJuData()
		{
		}
		/**当前库存资金**/
		public  var total_money : Number; // 
		/**当前总共利润**/
		public  var profit : Number ; // 
		/**当前总共赔付**/
		public  var reparation : Number ; // 
		/**当前投保镖车数量**/
		public  var tou_bao_biao_num : Number ; // 
		/**当前玩家投保资金,根据这个跟库存资金,可以算出来运营资金**/
		public  var tou_bao_money : Number; // 
		/**今日剩余系统补偿额度**/
		public  var left_system_compensate_money : Number ; // 
		/**今日护镖成功的次数**/
		public  var total_hu_biao_success_times : Number ; // 
		/**今日投镖的次数,这里可以算出护镖成功率**/
		public  var total_tou_biao_times : Number; // 
		
		/**﻿累计冲入本金**/
		public  var accum_recharge_money : Number; // 
		/**﻿累计发放薪水**/
		public  var accum_salary : Number; // 
		/**﻿累计赔付金额**/
		public  var accum_reparation : Number; // 
		/**累计护镖成功次数**/
		public var accum_hu_biao_success_times : int;
		/**累计投保次数**/
		public var accum_tou_biao_times : int ;

		/**是否手动停止的,用于客户端在非开启时间段关闭**/
		public var is_manual_stop : Boolean;
		/**今天是否分配过薪水**/
		public var today_allocate_salary : Boolean;
		
		
		
		public function setData(data:BiaoJuProto):void
		{
			total_money = data.totalMoney?data.totalMoney.toNumber():0;
			profit = data.profit?data.profit.toNumber():0;
			reparation = data.reparation?data.reparation.toNumber():0;
			tou_bao_biao_num = data.touBaoBiaoNum;
			tou_bao_money = data.touBaoPrepareMoney?data.touBaoPrepareMoney.toNumber():0;
			left_system_compensate_money = data.leftSystemCompensateMoney?data.leftSystemCompensateMoney.toNumber():0;
			total_hu_biao_success_times = data.totalHuBiaoSuccessTimes;
			total_tou_biao_times = data.totalMoney?data.totalMoney.toNumber():0;
			accum_recharge_money = data.accumRechargeMoney?data.accumRechargeMoney.toNumber():0;
			accum_reparation = data.accumReparation?data.accumReparation.toNumber():0;
			accum_salary = data.accumSalary?data.accumSalary.toNumber():0;
			is_manual_stop = data.isManualStop;
			today_allocate_salary = data.todayAllocateSalary;
		}
	}
}