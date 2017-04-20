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
	public class Yangqiaomai_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grp_icon:feathers.controls.Group;

		public var grp_label:feathers.controls.Group;

		public var grp_line:feathers.controls.Group;

		public var ico_1:feathers.controls.UIAsset;

		public var ico_10:feathers.controls.UIAsset;

		public var ico_11:feathers.controls.UIAsset;

		public var ico_12:feathers.controls.UIAsset;

		public var ico_13:feathers.controls.UIAsset;

		public var ico_14:feathers.controls.UIAsset;

		public var ico_15:feathers.controls.UIAsset;

		public var ico_16:feathers.controls.UIAsset;

		public var ico_17:feathers.controls.UIAsset;

		public var ico_2:feathers.controls.UIAsset;

		public var ico_3:feathers.controls.UIAsset;

		public var ico_4:feathers.controls.UIAsset;

		public var ico_5:feathers.controls.UIAsset;

		public var ico_6:feathers.controls.UIAsset;

		public var ico_7:feathers.controls.UIAsset;

		public var ico_8:feathers.controls.UIAsset;

		public var ico_9:feathers.controls.UIAsset;

		public var l_1:feathers.controls.UIAsset;

		public var l_10:feathers.controls.UIAsset;

		public var l_11:feathers.controls.UIAsset;

		public var l_12:feathers.controls.UIAsset;

		public var l_13:feathers.controls.UIAsset;

		public var l_14:feathers.controls.UIAsset;

		public var l_15:feathers.controls.UIAsset;

		public var l_16:feathers.controls.UIAsset;

		public var l_2:feathers.controls.UIAsset;

		public var l_3:feathers.controls.UIAsset;

		public var l_4:feathers.controls.UIAsset;

		public var l_5:feathers.controls.UIAsset;

		public var l_6:feathers.controls.UIAsset;

		public var l_7:feathers.controls.UIAsset;

		public var l_8:feathers.controls.UIAsset;

		public var l_9:feathers.controls.UIAsset;

		public var lb_1:feathers.controls.Label;

		public var lb_10:feathers.controls.Label;

		public var lb_11:feathers.controls.Label;

		public var lb_12:feathers.controls.Label;

		public var lb_13:feathers.controls.Label;

		public var lb_14:feathers.controls.Label;

		public var lb_15:feathers.controls.Label;

		public var lb_16:feathers.controls.Label;

		public var lb_17:feathers.controls.Label;

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
		public function Yangqiaomai_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 325;
			this.width = 325;
			this.elementsContent = [__Yangqiaomai_Skin_UIAsset1_i(),grp_line_i(),grp_icon_i(),grp_label_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Yangqiaomai_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_icon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_icon = temp;
			temp.name = "grp_icon";
			temp.x = 22;
			temp.y = 19;
			temp.elementsContent = [ico_1_i(),ico_16_i(),ico_3_i(),ico_2_i(),ico_7_i(),ico_11_i(),ico_8_i(),ico_12_i(),ico_13_i(),ico_10_i(),ico_9_i(),ico_6_i(),ico_5_i(),ico_4_i(),ico_17_i(),ico_14_i(),ico_15_i()];
			return temp;
		}

		private function grp_label_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_label = temp;
			temp.name = "grp_label";
			temp.x = 18;
			temp.y = 10;
			temp.elementsContent = [lb_1_i(),lb_16_i(),lb_3_i(),lb_2_i(),lb_8_i(),lb_11_i(),lb_7_i(),lb_12_i(),lb_13_i(),lb_10_i(),lb_9_i(),lb_6_i(),lb_5_i(),lb_4_i(),lb_17_i(),lb_14_i(),lb_15_i()];
			return temp;
		}

		private function grp_line_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_line = temp;
			temp.name = "grp_line";
			temp.x = 43;
			temp.y = 37;
			temp.elementsContent = [l_1_i(),l_2_i(),l_3_i(),l_4_i(),l_5_i(),l_6_i(),l_7_i(),l_8_i(),l_9_i(),l_10_i(),l_11_i(),l_12_i(),l_13_i(),l_14_i(),l_15_i(),l_16_i()];
			return temp;
		}

		private function ico_10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_10 = temp;
			temp.name = "ico_10";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 40;
			temp.y = 210;
			return temp;
		}

		private function ico_11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_11 = temp;
			temp.name = "ico_11";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 78;
			temp.y = 171;
			return temp;
		}

		private function ico_12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_12 = temp;
			temp.name = "ico_12";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 125;
			temp.y = 190;
			return temp;
		}

		private function ico_13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_13 = temp;
			temp.name = "ico_13";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 125;
			temp.y = 249;
			return temp;
		}

		private function ico_14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_14 = temp;
			temp.name = "ico_14";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 214;
			temp.y = 210;
			return temp;
		}

		private function ico_15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_15 = temp;
			temp.name = "ico_15";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 172;
			temp.y = 169;
			return temp;
		}

		private function ico_16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_16 = temp;
			temp.name = "ico_16";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 189;
			temp.y = 125;
			return temp;
		}

		private function ico_17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_17 = temp;
			temp.name = "ico_17";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 247;
			temp.y = 125;
			return temp;
		}

		private function ico_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_1 = temp;
			temp.name = "ico_1";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 125;
			temp.y = 125;
			return temp;
		}

		private function ico_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_2 = temp;
			temp.name = "ico_2";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 125;
			temp.y = 63;
			return temp;
		}

		private function ico_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_3 = temp;
			temp.name = "ico_3";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 170;
			temp.y = 81;
			return temp;
		}

		private function ico_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_4 = temp;
			temp.name = "ico_4";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 214;
			temp.y = 38;
			return temp;
		}

		private function ico_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_5 = temp;
			temp.name = "ico_5";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 125;
			temp.y = 2;
			return temp;
		}

		private function ico_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_6 = temp;
			temp.name = "ico_6";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 40;
			temp.y = 37;
			return temp;
		}

		private function ico_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_7 = temp;
			temp.name = "ico_7";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 79;
			temp.y = 81;
			return temp;
		}

		private function ico_8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_8 = temp;
			temp.name = "ico_8";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 60;
			temp.y = 125;
			return temp;
		}

		private function ico_9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_9 = temp;
			temp.name = "ico_9";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 1;
			temp.y = 125;
			return temp;
		}

		private function l_10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_10 = temp;
			temp.name = "l_10";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/10.png";
			temp.x = 44;
			temp.y = 179;
			return temp;
		}

		private function l_11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_11 = temp;
			temp.name = "l_11";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/11.png";
			temp.x = 89;
			temp.y = 176;
			return temp;
		}

		private function l_12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_12 = temp;
			temp.name = "l_12";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/12.png";
			temp.x = 119;
			temp.y = 206;
			return temp;
		}

		private function l_13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_13 = temp;
			temp.name = "l_13";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/13.png";
			temp.x = 137;
			temp.y = 215;
			return temp;
		}

		private function l_14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_14 = temp;
			temp.name = "l_14";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/14.png";
			temp.x = 181;
			temp.y = 177;
			return temp;
		}

		private function l_15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_15 = temp;
			temp.name = "l_15";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/15.png";
			temp.x = 174;
			temp.y = 141;
			return temp;
		}

		private function l_16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_16 = temp;
			temp.name = "l_16";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/16.png";
			temp.x = 202;
			temp.y = 123;
			return temp;
		}

		private function l_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_1 = temp;
			temp.name = "l_1";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/1.png";
			temp.x = 119;
			temp.y = 79;
			return temp;
		}

		private function l_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_2 = temp;
			temp.name = "l_2";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/2.png";
			temp.x = 138;
			temp.y = 62;
			return temp;
		}

		private function l_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_3 = temp;
			temp.name = "l_3";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/3.png";
			temp.x = 177;
			temp.y = 47;
			return temp;
		}

		private function l_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_4 = temp;
			temp.name = "l_4";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/4.png";
			temp.x = 138;
			temp.y = 0;
			return temp;
		}

		private function l_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_5 = temp;
			temp.name = "l_5";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/5.png";
			temp.x = 49;
			temp.y = 2;
			return temp;
		}

		private function l_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_6 = temp;
			temp.name = "l_6";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/6.png";
			temp.x = 46;
			temp.y = 47;
			return temp;
		}

		private function l_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_7 = temp;
			temp.name = "l_7";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/7.png";
			temp.x = 60;
			temp.y = 96;
			return temp;
		}

		private function l_8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_8 = temp;
			temp.name = "l_8";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/8.png";
			temp.x = 14;
			temp.y = 123;
			return temp;
		}

		private function l_9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_9 = temp;
			temp.name = "l_9";
			temp.styleName = "ui/app/beibao/jingmai/yangqiaomai/9.png";
			temp.x = 0;
			temp.y = 139;
			return temp;
		}

		private function lb_10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_10 = temp;
			temp.name = "lb_10";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 67;
			temp.y = 253;
			return temp;
		}

		private function lb_11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_11 = temp;
			temp.name = "lb_11";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 117;
			temp.y = 176;
			return temp;
		}

		private function lb_12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_12 = temp;
			temp.name = "lb_12";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 157;
			temp.y = 230;
			return temp;
		}

		private function lb_13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_13 = temp;
			temp.name = "lb_13";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 166;
			temp.y = 275;
			return temp;
		}

		private function lb_14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_14 = temp;
			temp.name = "lb_14";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 218;
			temp.y = 253;
			return temp;
		}

		private function lb_15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_15 = temp;
			temp.name = "lb_15";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 215;
			temp.y = 188;
			return temp;
		}

		private function lb_16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_16 = temp;
			temp.name = "lb_16";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 224;
			temp.y = 119;
			return temp;
		}

		private function lb_17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_17 = temp;
			temp.name = "lb_17";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 266;
			temp.y = 170;
			return temp;
		}

		private function lb_1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_1 = temp;
			temp.name = "lb_1";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 160;
			temp.y = 158;
			return temp;
		}

		private function lb_2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_2 = temp;
			temp.name = "lb_2";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 157;
			temp.y = 58;
			return temp;
		}

		private function lb_3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_3 = temp;
			temp.name = "lb_3";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 213;
			temp.y = 99;
			return temp;
		}

		private function lb_4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_4 = temp;
			temp.name = "lb_4";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 246;
			temp.y = 75;
			return temp;
		}

		private function lb_5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_5 = temp;
			temp.name = "lb_5";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 167;
			temp.y = 6;
			return temp;
		}

		private function lb_6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_6 = temp;
			temp.name = "lb_6";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 36;
			temp.y = 76;
			return temp;
		}

		private function lb_7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_7 = temp;
			temp.name = "lb_7";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 100;
			temp.y = 122;
			return temp;
		}

		private function lb_8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_8 = temp;
			temp.name = "lb_8";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 99;
			temp.y = 147;
			return temp;
		}

		private function lb_9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_9 = temp;
			temp.name = "lb_9";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 8;
			temp.y = 170;
			return temp;
		}

	}
}