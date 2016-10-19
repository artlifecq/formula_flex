package org.mokylin.skin.app.biaoju
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuXiangXiShuJuItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var accum_hu_biao_complete_rate:feathers.controls.Label;

		public var accum_recharge_money:feathers.controls.Label;

		public var accum_reparation:feathers.controls.Label;

		public var accum_salary:feathers.controls.Label;

		public var compensate:feathers.controls.Label;

		public var left_system_compensate_money:feathers.controls.Label;

		public var profit:feathers.controls.Label;

		public var reparation:feathers.controls.Label;

		public var runing_money:feathers.controls.Label;

		public var total_hu_biao_complete_rate:feathers.controls.Label;

		public var total_money:feathers.controls.Label;

		public var tou_bao_biao_num:feathers.controls.Label;

		public var tou_bao_money:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuXiangXiShuJuItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 416;
			this.elementsContent = [__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset1_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset2_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset3_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset4_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset5_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset6_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset7_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset8_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset9_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset10_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset11_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset12_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset13_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset14_i(),__BiaoJuXiangXiShuJuItemRenderSkin_UIAsset15_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label1_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label2_i(),total_money_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label3_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label4_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label5_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label6_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label7_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label8_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label9_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label10_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label11_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label12_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label13_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label14_i(),__BiaoJuXiangXiShuJuItemRenderSkin_Label15_i(),runing_money_i(),compensate_i(),tou_bao_money_i(),accum_recharge_money_i(),accum_salary_i(),accum_reparation_i(),accum_hu_biao_complete_rate_i(),tou_bao_biao_num_i(),reparation_i(),profit_i(),left_system_compensate_money_i(),total_hu_biao_complete_rate_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "累计护镖成功率";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 372;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "在保镖数";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 135;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "偿付金额";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 161;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "镖局利润";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 187;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "剩余系统补助";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 241;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "护镖成功率";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 213;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "本日数据";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 32;
			temp.y = 3;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "库存资金";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 29;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "运营资金";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 55;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "偿付能力";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 81;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "玩家投保";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 107;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "累计数据";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 32;
			temp.y = 268;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "累计充入本金";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 294;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "累计发放薪水";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 320;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.text = "累计赔付金额";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 59;
			temp.y = 346;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 263;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 288;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 315;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 340;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 367;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 394;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 24;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 51;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 76;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 103;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 128;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 180;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 0;
			temp.y = 207;
			return temp;
		}

		private function __BiaoJuXiangXiShuJuItemRenderSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 2;
			temp.styleName = "ui/app/biaoju/heng_xian.png";
			temp.x = 1;
			temp.y = 236;
			return temp;
		}

		private function accum_hu_biao_complete_rate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			accum_hu_biao_complete_rate = temp;
			temp.name = "accum_hu_biao_complete_rate";
			temp.bold = false;
			temp.text = "100%";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 372;
			return temp;
		}

		private function accum_recharge_money_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			accum_recharge_money = temp;
			temp.name = "accum_recharge_money";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 294;
			return temp;
		}

		private function accum_reparation_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			accum_reparation = temp;
			temp.name = "accum_reparation";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 346;
			return temp;
		}

		private function accum_salary_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			accum_salary = temp;
			temp.name = "accum_salary";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 320;
			return temp;
		}

		private function compensate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			compensate = temp;
			temp.name = "compensate";
			temp.bold = false;
			temp.text = "100%";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 81;
			return temp;
		}

		private function left_system_compensate_money_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			left_system_compensate_money = temp;
			temp.name = "left_system_compensate_money";
			temp.bold = false;
			temp.text = "90锭";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 241;
			return temp;
		}

		private function profit_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			profit = temp;
			temp.name = "profit";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 187;
			return temp;
		}

		private function reparation_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reparation = temp;
			temp.name = "reparation";
			temp.bold = false;
			temp.text = "30锭";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 161;
			return temp;
		}

		private function runing_money_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			runing_money = temp;
			temp.name = "runing_money";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 55;
			return temp;
		}

		private function total_hu_biao_complete_rate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			total_hu_biao_complete_rate = temp;
			temp.name = "total_hu_biao_complete_rate";
			temp.bold = false;
			temp.text = "100%";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 213;
			return temp;
		}

		private function total_money_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			total_money = temp;
			temp.name = "total_money";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 29;
			return temp;
		}

		private function tou_bao_biao_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tou_bao_biao_num = temp;
			temp.name = "tou_bao_biao_num";
			temp.bold = false;
			temp.text = "10";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 135;
			return temp;
		}

		private function tou_bao_money_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tou_bao_money = temp;
			temp.name = "tou_bao_money";
			temp.bold = false;
			temp.text = "999锭 99两";
			temp.color = 0x6E3117;
			temp.width = 150;
			temp.x = 170;
			temp.y = 107;
			return temp;
		}

	}
}