package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Renmai_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_icon:feathers.controls.Group;

		public var grp_icondi:feathers.controls.Group;

		public var grp_label:feathers.controls.Group;

		public var icd1:feathers.controls.UIAsset;

		public var icd10:feathers.controls.UIAsset;

		public var icd11:feathers.controls.UIAsset;

		public var icd12:feathers.controls.UIAsset;

		public var icd13:feathers.controls.UIAsset;

		public var icd2:feathers.controls.UIAsset;

		public var icd3:feathers.controls.UIAsset;

		public var icd4:feathers.controls.UIAsset;

		public var icd5:feathers.controls.UIAsset;

		public var icd6:feathers.controls.UIAsset;

		public var icd7:feathers.controls.UIAsset;

		public var icd8:feathers.controls.UIAsset;

		public var icd9:feathers.controls.UIAsset;

		public var ico1:feathers.controls.UIAsset;

		public var ico10:feathers.controls.UIAsset;

		public var ico11:feathers.controls.UIAsset;

		public var ico12:feathers.controls.UIAsset;

		public var ico13:feathers.controls.UIAsset;

		public var ico2:feathers.controls.UIAsset;

		public var ico3:feathers.controls.UIAsset;

		public var ico4:feathers.controls.UIAsset;

		public var ico5:feathers.controls.UIAsset;

		public var ico6:feathers.controls.UIAsset;

		public var ico7:feathers.controls.UIAsset;

		public var ico8:feathers.controls.UIAsset;

		public var ico9:feathers.controls.UIAsset;

		public var lb_1:feathers.controls.Label;

		public var lb_10:feathers.controls.Label;

		public var lb_11:feathers.controls.Label;

		public var lb_12:feathers.controls.Label;

		public var lb_13:feathers.controls.Label;

		public var lb_2:feathers.controls.Label;

		public var lb_3:feathers.controls.Label;

		public var lb_4:feathers.controls.Label;

		public var lb_5:feathers.controls.Label;

		public var lb_6:feathers.controls.Label;

		public var lb_7:feathers.controls.Label;

		public var lb_8:feathers.controls.Label;

		public var lb_9:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Renmai_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 431;
			this.width = 431;
			this.elementsContent = [grp_icondi_i(),grp_icon_i(),grp_label_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 72;
			temp.y = 39;
			temp.elementsContent = [ico1_i(),ico2_i(),ico3_i(),ico4_i(),ico5_i(),ico6_i(),ico7_i(),ico8_i(),ico9_i(),ico10_i(),ico11_i(),ico12_i(),ico13_i()];
			return temp;
		}

		private function grp_icondi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icondi = temp;
			temp.name = "grp_icondi";
			temp.x = 67;
			temp.y = 34;
			temp.elementsContent = [icd1_i(),icd2_i(),icd3_i(),icd4_i(),icd5_i(),icd6_i(),icd7_i(),icd8_i(),icd9_i(),icd10_i(),icd11_i(),icd12_i(),icd13_i()];
			return temp;
		}

		private function grp_label_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_label = temp;
			temp.name = "grp_label";
			temp.x = 69;
			temp.y = 31;
			temp.elementsContent = [lb_1_i(),lb_2_i(),lb_3_i(),lb_4_i(),lb_5_i(),lb_6_i(),lb_7_i(),lb_8_i(),lb_9_i(),lb_10_i(),lb_11_i(),lb_12_i(),lb_13_i()];
			return temp;
		}

		private function icd10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd10 = temp;
			temp.name = "icd10";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 125;
			temp.y = 2;
			return temp;
		}

		private function icd11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd11 = temp;
			temp.name = "icd11";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 214;
			temp.y = 37;
			return temp;
		}

		private function icd12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd12 = temp;
			temp.name = "icd12";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 247;
			temp.y = 125;
			return temp;
		}

		private function icd13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd13 = temp;
			temp.name = "icd13";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 214;
			temp.y = 210;
			return temp;
		}

		private function icd1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd1 = temp;
			temp.name = "icd1";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 125;
			temp.y = 125;
			return temp;
		}

		private function icd2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd2 = temp;
			temp.name = "icd2";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 191;
			temp.y = 125;
			return temp;
		}

		private function icd3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd3 = temp;
			temp.name = "icd3";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 125;
			temp.y = 61;
			return temp;
		}

		private function icd4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd4 = temp;
			temp.name = "icd4";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 60;
			temp.y = 125;
			return temp;
		}

		private function icd5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd5 = temp;
			temp.name = "icd5";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 125;
			temp.y = 190;
			return temp;
		}

		private function icd6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd6 = temp;
			temp.name = "icd6";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 125;
			temp.y = 249;
			return temp;
		}

		private function icd7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd7 = temp;
			temp.name = "icd7";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 40;
			temp.y = 210;
			return temp;
		}

		private function icd8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd8 = temp;
			temp.name = "icd8";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 1;
			temp.y = 125;
			return temp;
		}

		private function icd9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icd9 = temp;
			temp.name = "icd9";
			temp.styleName = "ui/app/beibao/icons/bianxian/cheng/an/0.png";
			temp.x = 40;
			temp.y = 37;
			return temp;
		}

		private function ico10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico10 = temp;
			temp.name = "ico10";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 125;
			temp.y = 2;
			return temp;
		}

		private function ico11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico11 = temp;
			temp.name = "ico11";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 214;
			temp.y = 37;
			return temp;
		}

		private function ico12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico12 = temp;
			temp.name = "ico12";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 247;
			temp.y = 125;
			return temp;
		}

		private function ico13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico13 = temp;
			temp.name = "ico13";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 214;
			temp.y = 210;
			return temp;
		}

		private function ico1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico1 = temp;
			temp.name = "ico1";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 125;
			temp.y = 125;
			return temp;
		}

		private function ico2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico2 = temp;
			temp.name = "ico2";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 191;
			temp.y = 125;
			return temp;
		}

		private function ico3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico3 = temp;
			temp.name = "ico3";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 125;
			temp.y = 61;
			return temp;
		}

		private function ico4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico4 = temp;
			temp.name = "ico4";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 60;
			temp.y = 125;
			return temp;
		}

		private function ico5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico5 = temp;
			temp.name = "ico5";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 125;
			temp.y = 190;
			return temp;
		}

		private function ico6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico6 = temp;
			temp.name = "ico6";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 125;
			temp.y = 249;
			return temp;
		}

		private function ico7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico7 = temp;
			temp.name = "ico7";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 40;
			temp.y = 210;
			return temp;
		}

		private function ico8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico8 = temp;
			temp.name = "ico8";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 1;
			temp.y = 125;
			return temp;
		}

		private function ico9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico9 = temp;
			temp.name = "ico9";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 40;
			temp.y = 37;
			return temp;
		}

		private function lb_10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_10 = temp;
			temp.name = "lb_10";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 157;
			temp.y = 35;
			return temp;
		}

		private function lb_11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_11 = temp;
			temp.name = "lb_11";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 230;
			temp.y = 81;
			return temp;
		}

		private function lb_12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_12 = temp;
			temp.name = "lb_12";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 266;
			temp.y = 170;
			return temp;
		}

		private function lb_13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_13 = temp;
			temp.name = "lb_13";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 218;
			temp.y = 253;
			return temp;
		}

		private function lb_1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_1 = temp;
			temp.name = "lb_1";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 160;
			temp.y = 157;
			return temp;
		}

		private function lb_2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_2 = temp;
			temp.name = "lb_2";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 217;
			temp.y = 115;
			return temp;
		}

		private function lb_3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_3 = temp;
			temp.name = "lb_3";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 163;
			temp.y = 61;
			return temp;
		}

		private function lb_4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_4 = temp;
			temp.name = "lb_4";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 93;
			temp.y = 163;
			return temp;
		}

		private function lb_5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_5 = temp;
			temp.name = "lb_5";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 160;
			temp.y = 226;
			return temp;
		}

		private function lb_6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_6 = temp;
			temp.name = "lb_6";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 162;
			temp.y = 275;
			return temp;
		}

		private function lb_7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_7 = temp;
			temp.name = "lb_7";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 67;
			temp.y = 253;
			return temp;
		}

		private function lb_8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_8 = temp;
			temp.name = "lb_8";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 8;
			temp.y = 170;
			return temp;
		}

		private function lb_9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_9 = temp;
			temp.name = "lb_9";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 57;
			temp.y = 80;
			return temp;
		}

	}
}