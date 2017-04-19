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

		public var grp_label:feathers.controls.Group;

		public var grp_line:feathers.controls.Group;

		public var ico_1:feathers.controls.UIAsset;

		public var ico_10:feathers.controls.UIAsset;

		public var ico_11:feathers.controls.UIAsset;

		public var ico_12:feathers.controls.UIAsset;

		public var ico_13:feathers.controls.UIAsset;

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

		public var l_2:feathers.controls.UIAsset;

		public var l_3:feathers.controls.UIAsset;

		public var l_4:feathers.controls.UIAsset;

		public var l_5:feathers.controls.UIAsset;

		public var l_6:feathers.controls.UIAsset;

		public var l_7:feathers.controls.UIAsset;

		public var l_8:feathers.controls.UIAsset;

		public var l_9:feathers.controls.UIAsset;

		public var lb_q1:feathers.controls.Label;

		public var lb_q10:feathers.controls.Label;

		public var lb_q11:feathers.controls.Label;

		public var lb_q12:feathers.controls.Label;

		public var lb_q13:feathers.controls.Label;

		public var lb_q2:feathers.controls.Label;

		public var lb_q3:feathers.controls.Label;

		public var lb_q4:feathers.controls.Label;

		public var lb_q5:feathers.controls.Label;

		public var lb_q6:feathers.controls.Label;

		public var lb_q7:feathers.controls.Label;

		public var lb_q8:feathers.controls.Label;

		public var lb_q9:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Renmai_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 325;
			this.width = 325;
			this.elementsContent = [__Renmai_Skin_UIAsset1_i(),grp_label_i(),grp_line_i(),grp_icon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Renmai_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/renmai.png";
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
			temp.elementsContent = [ico_1_i(),ico_2_i(),ico_3_i(),ico_4_i(),ico_5_i(),ico_6_i(),ico_7_i(),ico_8_i(),ico_9_i(),ico_10_i(),ico_11_i(),ico_12_i(),ico_13_i()];
			return temp;
		}

		private function grp_label_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_label = temp;
			temp.name = "grp_label";
			temp.x = 18;
			temp.y = 10;
			temp.elementsContent = [lb_q1_i(),lb_q2_i(),lb_q3_i(),lb_q4_i(),lb_q5_i(),lb_q6_i(),lb_q7_i(),lb_q8_i(),lb_q9_i(),lb_q10_i(),lb_q11_i(),lb_q12_i(),lb_q13_i()];
			return temp;
		}

		private function grp_line_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_line = temp;
			temp.name = "grp_line";
			temp.x = 44;
			temp.y = 37;
			temp.elementsContent = [l_1_i(),l_2_i(),l_3_i(),l_4_i(),l_5_i(),l_6_i(),l_7_i(),l_8_i(),l_9_i(),l_10_i(),l_11_i(),l_12_i()];
			return temp;
		}

		private function ico_10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_10 = temp;
			temp.name = "ico_10";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 124;
			temp.y = 0;
			return temp;
		}

		private function ico_11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_11 = temp;
			temp.name = "ico_11";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 212;
			temp.y = 36;
			return temp;
		}

		private function ico_12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_12 = temp;
			temp.name = "ico_12";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 246;
			temp.y = 124;
			return temp;
		}

		private function ico_13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_13 = temp;
			temp.name = "ico_13";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 213;
			temp.y = 209;
			return temp;
		}

		private function ico_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_1 = temp;
			temp.name = "ico_1";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 124;
			temp.y = 123;
			return temp;
		}

		private function ico_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_2 = temp;
			temp.name = "ico_2";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 190;
			temp.y = 123;
			return temp;
		}

		private function ico_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_3 = temp;
			temp.name = "ico_3";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 124;
			temp.y = 59;
			return temp;
		}

		private function ico_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_4 = temp;
			temp.name = "ico_4";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 59;
			temp.y = 123;
			return temp;
		}

		private function ico_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_5 = temp;
			temp.name = "ico_5";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 124;
			temp.y = 189;
			return temp;
		}

		private function ico_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_6 = temp;
			temp.name = "ico_6";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 124;
			temp.y = 248;
			return temp;
		}

		private function ico_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_7 = temp;
			temp.name = "ico_7";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 39;
			temp.y = 209;
			return temp;
		}

		private function ico_8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_8 = temp;
			temp.name = "ico_8";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 0;
			temp.y = 124;
			return temp;
		}

		private function ico_9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_9 = temp;
			temp.name = "ico_9";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 39;
			temp.y = 35;
			return temp;
		}

		private function l_10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_10 = temp;
			temp.name = "l_10";
			temp.styleName = "ui/app/beibao/jingmai/remai/10.png";
			temp.x = 138;
			temp.y = 0;
			return temp;
		}

		private function l_11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_11 = temp;
			temp.name = "l_11";
			temp.styleName = "ui/app/beibao/jingmai/remai/11.png";
			temp.x = 218;
			temp.y = 49;
			return temp;
		}

		private function l_12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_12 = temp;
			temp.name = "l_12";
			temp.styleName = "ui/app/beibao/jingmai/remai/12.png";
			temp.x = 203;
			temp.y = 137;
			return temp;
		}

		private function l_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_1 = temp;
			temp.name = "l_1";
			temp.styleName = "ui/app/beibao/jingmai/remai/1.png";
			temp.x = 137;
			temp.y = 124;
			return temp;
		}

		private function l_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_2 = temp;
			temp.name = "l_2";
			temp.styleName = "ui/app/beibao/jingmai/remai/2.png";
			temp.x = 138;
			temp.y = 55;
			return temp;
		}

		private function l_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_3 = temp;
			temp.name = "l_3";
			temp.styleName = "ui/app/beibao/jingmai/remai/3.png";
			temp.x = 57;
			temp.y = 57;
			return temp;
		}

		private function l_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_4 = temp;
			temp.name = "l_4";
			temp.styleName = "ui/app/beibao/jingmai/remai/4.png";
			temp.x = 53;
			temp.y = 142;
			return temp;
		}

		private function l_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_5 = temp;
			temp.name = "l_5";
			temp.styleName = "ui/app/beibao/jingmai/remai/5.png";
			temp.x = 119;
			temp.y = 207;
			return temp;
		}

		private function l_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_6 = temp;
			temp.name = "l_6";
			temp.styleName = "ui/app/beibao/jingmai/remai/6.png";
			temp.x = 50;
			temp.y = 216;
			return temp;
		}

		private function l_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_7 = temp;
			temp.name = "l_7";
			temp.styleName = "ui/app/beibao/jingmai/remai/7.png";
			temp.x = 0;
			temp.y = 140;
			return temp;
		}

		private function l_8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_8 = temp;
			temp.name = "l_8";
			temp.styleName = "ui/app/beibao/jingmai/remai/8.png";
			temp.x = 1;
			temp.y = 49;
			return temp;
		}

		private function l_9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			l_9 = temp;
			temp.name = "l_9";
			temp.styleName = "ui/app/beibao/jingmai/remai/9.png";
			temp.x = 50;
			temp.y = 4;
			return temp;
		}

		private function lb_q10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q10 = temp;
			temp.name = "lb_q10";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 157;
			temp.y = 35;
			return temp;
		}

		private function lb_q11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q11 = temp;
			temp.name = "lb_q11";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 230;
			temp.y = 81;
			return temp;
		}

		private function lb_q12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q12 = temp;
			temp.name = "lb_q12";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 266;
			temp.y = 170;
			return temp;
		}

		private function lb_q13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q13 = temp;
			temp.name = "lb_q13";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 218;
			temp.y = 253;
			return temp;
		}

		private function lb_q1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q1 = temp;
			temp.name = "lb_q1";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 160;
			temp.y = 157;
			return temp;
		}

		private function lb_q2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q2 = temp;
			temp.name = "lb_q2";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 217;
			temp.y = 115;
			return temp;
		}

		private function lb_q3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q3 = temp;
			temp.name = "lb_q3";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 163;
			temp.y = 61;
			return temp;
		}

		private function lb_q4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q4 = temp;
			temp.name = "lb_q4";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 93;
			temp.y = 163;
			return temp;
		}

		private function lb_q5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q5 = temp;
			temp.name = "lb_q5";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 160;
			temp.y = 226;
			return temp;
		}

		private function lb_q6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q6 = temp;
			temp.name = "lb_q6";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 162;
			temp.y = 275;
			return temp;
		}

		private function lb_q7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q7 = temp;
			temp.name = "lb_q7";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 67;
			temp.y = 253;
			return temp;
		}

		private function lb_q8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q8 = temp;
			temp.name = "lb_q8";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 8;
			temp.y = 170;
			return temp;
		}

		private function lb_q9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_q9 = temp;
			temp.name = "lb_q9";
			temp.fontSize = 16;
			temp.text = "2";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 57;
			temp.y = 80;
			return temp;
		}

	}
}