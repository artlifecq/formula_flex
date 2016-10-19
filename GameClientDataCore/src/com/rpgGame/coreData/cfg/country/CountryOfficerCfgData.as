package com.rpgGame.coreData.cfg.country
{
	import app.message.CountryOfficerDataProto;
	import app.message.CountryOfficerDatasProto;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 *
	 * 国家官职配置数据
	 * @author L.L.M.Sunny
	 * 创建时间：2015-12-28 上午10:30:12
	 *
	 */
	public class CountryOfficerCfgData
	{
		private static var _map : HashMap = new HashMap();

		public function CountryOfficerCfgData()
		{
		}

		public static function setConfig(cfg : CountryOfficerDatasProto) : void
		{
			for each (var dataProto : CountryOfficerDataProto in cfg.data)
			{
				addData(dataProto);
			}
		}

		public static function addData(dataProto : CountryOfficerDataProto) : void
		{
			_map.add(dataProto.pos, dataProto);
		}

		/**
		 * optional CountryOfficerPos pos = 1; // 官职
		 * optional string pos_name = 2; // 官职名
		 * optional int32 officer_count = 3; // 官员数量
		 * optional int32 strong_salary = 4; // 强国俸禄
		 * optional int32 normal_salary = 5; // 普国俸禄
		 * optional int32 weak_salary = 6; // 弱国俸禄
		 * optional bool can_declare_war = 7; // 能否宣战
		 * optional bool can_publish_country_task = 8; // 能否发布国家任务
		 * repeated CountryOfficerPos can_set_officer = 9; // 能够设置的官职
		 * optional int32 can_set_dont_talk_times = 10; // 能够设置禁言的次数 >0表示能够禁言
		 * optional int32 can_captivity_times = 11; // 能够囚禁别人的次数 >0表示能够囚禁
		 * optional bool can_use_wang_zhe = 12; // 能否使用王者印记
		 * optional bool can_use_jin_wei_fu = 13; // 能否使用禁卫军符
		 * optional bool is_pk_not_red = 14; // 是否pk不红名
		 * optional bool can_change_tax_rate = 15; // 能够更改税率
		 * optional bool can_change_military = 16; // 能够修改军费
		 * optional bool can_union_and_lift = 17; // 能够结盟/解盟
		 * optional bool can_country_donate = 18; // 能够募捐
		 * optional bool can_set_jin_wei_announcement = 19; // 能够设置禁卫公告
		 * optional bool can_set_country_announcement = 20; // 能够设置国家公告
		 * optional int32 seal = 21; // 官印物品id 
		 * optional bool can_use_king = 22; // 能否使用国王令
		 * optional bool can_use_hu_fu = 23; // 能否使用虎符
		 * optional bool can_start_duo_jing = 24; // 能够开启夺经
		 * optional bool can_start_mi_xin = 25; // 能够开启刺探
		 * @param pos
		 * @return 
		 * 
		 */		
		public static function getData(pos : int) : CountryOfficerDataProto
		{
			return _map.getValue(pos) as CountryOfficerDataProto;
		}
		
		public static function getAllData():Array
		{
			return _map.getValues();
		}
	}
}
