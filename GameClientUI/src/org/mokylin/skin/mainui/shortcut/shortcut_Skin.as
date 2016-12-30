package org.mokylin.skin.mainui.shortcut
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.shortcut.button.ButtonSkin_jue;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class shortcut_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg1:feathers.controls.UIAsset;

		public var Icbg2:feathers.controls.UIAsset;

		public var Icbg3:feathers.controls.UIAsset;

		public var Icbg4:feathers.controls.UIAsset;

		public var Icbg5:feathers.controls.UIAsset;

		public var Icbg6:feathers.controls.UIAsset;

		public var Icbg7:feathers.controls.UIAsset;

		public var Icbg8:feathers.controls.UIAsset;

		public var Icons:feathers.controls.Group;

		public var btn_jx:feathers.controls.Button;

		public var fangun:feathers.controls.Group;

		public var fg_djs:feathers.controls.UIAsset;

		public var fg_n1:feathers.controls.UIAsset;

		public var fg_n2:feathers.controls.UIAsset;

		public var fg_n3:feathers.controls.UIAsset;

		public var fg_point:feathers.controls.UIAsset;

		public var fg_times:feathers.controls.UIAsset;

		public var jingzhen_yijia:feathers.controls.Group;

		public var jz2_Num:feathers.controls.Label;

		public var jz2_lastNum:feathers.controls.Label;

		public var jz2_q1:feathers.controls.UIAsset;

		public var jz2_q2:feathers.controls.UIAsset;

		public var jz2_q3:feathers.controls.UIAsset;

		public var jz2_q4:feathers.controls.UIAsset;

		public var jz2_q5:feathers.controls.UIAsset;

		public var jz2_qbg:feathers.controls.UIAsset;

		public var txt_djs:feathers.controls.Label;

		public var z_left:feathers.controls.UIAsset;

		public var z_leftMask:feathers.controls.UIAsset;

		public var z_right:feathers.controls.UIAsset;

		public var z_rightMask:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function shortcut_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 107;
			this.width = 783;
			this.elementsContent = [z_rightMask_i(),z_right_i(),z_leftMask_i(),z_left_i(),__shortcut_Skin_UIAsset1_i(),Icons_i(),btn_jx_i(),fangun_i(),__shortcut_Skin_Group1_i(),jingzhen_yijia_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg1 = temp;
			temp.name = "Icbg1";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 9;
			temp.y = 6;
			return temp;
		}

		private function Icbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg2 = temp;
			temp.name = "Icbg2";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 63;
			temp.y = 6;
			return temp;
		}

		private function Icbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg3 = temp;
			temp.name = "Icbg3";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 117;
			temp.y = 6;
			return temp;
		}

		private function Icbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg4 = temp;
			temp.name = "Icbg4";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 171;
			temp.y = 6;
			return temp;
		}

		private function Icbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg5 = temp;
			temp.name = "Icbg5";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 225;
			temp.y = 6;
			return temp;
		}

		private function Icbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg6 = temp;
			temp.name = "Icbg6";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 279;
			temp.y = 6;
			return temp;
		}

		private function Icbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg7 = temp;
			temp.name = "Icbg7";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 333;
			temp.y = 6;
			return temp;
		}

		private function Icbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg8 = temp;
			temp.name = "Icbg8";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 387;
			temp.y = 6;
			return temp;
		}

		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.height = 66;
			temp.width = 451;
			temp.x = 166;
			temp.y = 39;
			temp.elementsContent = [Icbg1_i(),Icbg2_i(),Icbg3_i(),Icbg4_i(),Icbg5_i(),Icbg6_i(),Icbg7_i(),Icbg8_i(),__shortcut_Skin_Label1_i(),__shortcut_Skin_Label2_i(),__shortcut_Skin_Label3_i(),__shortcut_Skin_Label4_i(),__shortcut_Skin_Label5_i(),__shortcut_Skin_Label6_i(),__shortcut_Skin_Label7_i(),__shortcut_Skin_Label8_i()];
			return temp;
		}

		private function __shortcut_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 203;
			temp.y = 0;
			temp.elementsContent = [__shortcut_Skin_UIAsset2_i(),__shortcut_Skin_UIAsset3_i(),__shortcut_Skin_UIAsset4_i(),__shortcut_Skin_UIAsset5_i()];
			return temp;
		}

		private function __shortcut_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "1";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 12;
			temp.x = 11;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "2";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 12;
			temp.x = 66;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "3";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 12;
			temp.x = 119;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "4";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 12;
			temp.x = 175;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "Q";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 15;
			temp.x = 229;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "W";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 20;
			temp.x = 284;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "E";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 12;
			temp.x = 335;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "R";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 12;
			temp.x = 390;
			temp.y = 7;
			return temp;
		}

		private function __shortcut_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/shortcut/dikuang.png";
			temp.x = 0;
			temp.y = 14;
			return temp;
		}

		private function __shortcut_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 81;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 121;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/bantoumingdi.png";
			temp.x = 13;
			temp.y = 36;
			return temp;
		}

		private function __shortcut_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/zhen.png";
			temp.width = 36;
			temp.x = 4;
			temp.y = 25;
			return temp;
		}

		private function btn_jx_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jx = temp;
			temp.name = "btn_jx";
			temp.styleClass = org.mokylin.skin.mainui.shortcut.button.ButtonSkin_jue;
			temp.x = 730;
			temp.y = 37;
			return temp;
		}

		private function fangun_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			fangun = temp;
			temp.name = "fangun";
			temp.height = 48;
			temp.width = 80;
			temp.x = 88;
			temp.y = 54;
			temp.elementsContent = [fg_n1_i(),fg_n2_i(),fg_n3_i(),fg_times_i(),fg_point_i(),fg_djs_i(),txt_djs_i()];
			return temp;
		}

		private function fg_djs_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fg_djs = temp;
			temp.name = "fg_djs";
			temp.styleName = "ui/mainui/shortcut/jiao.png";
			temp.visible = false;
			temp.x = 32;
			temp.y = 27;
			return temp;
		}

		private function fg_n1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fg_n1 = temp;
			temp.name = "fg_n1";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_1.png";
			temp.x = 2;
			temp.y = 13;
			return temp;
		}

		private function fg_n2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fg_n2 = temp;
			temp.name = "fg_n2";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_2.png";
			temp.x = 17;
			temp.y = 5;
			return temp;
		}

		private function fg_n3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fg_n3 = temp;
			temp.name = "fg_n3";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_3.png";
			temp.x = 59;
			temp.y = 13;
			return temp;
		}

		private function fg_point_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fg_point = temp;
			temp.name = "fg_point";
			temp.styleName = "ui/mainui/shortcut/chengguang.png";
			temp.x = 62;
			temp.y = 41;
			return temp;
		}

		private function fg_times_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fg_times = temp;
			temp.name = "fg_times";
			temp.styleName = "ui/mainui/shortcut/chengbanyuan.png";
			temp.x = 14;
			temp.y = 17;
			return temp;
		}

		private function jingzhen_yijia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			jingzhen_yijia = temp;
			temp.name = "jingzhen_yijia";
			temp.height = 54;
			temp.width = 130;
			temp.x = 568;
			temp.y = 48;
			temp.elementsContent = [jz2_qbg_i(),jz2_q1_i(),jz2_q2_i(),jz2_q3_i(),jz2_q4_i(),jz2_q5_i(),jz2_lastNum_i(),__shortcut_Skin_UIAsset6_i(),__shortcut_Skin_UIAsset7_i(),jz2_Num_i()];
			return temp;
		}

		private function jz2_Num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jz2_Num = temp;
			temp.name = "jz2_Num";
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "x2";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 18;
			temp.x = 26;
			temp.y = 35;
			return temp;
		}

		private function jz2_lastNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jz2_lastNum = temp;
			temp.name = "jz2_lastNum";
			temp.bold = false;
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "5/5";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 28;
			temp.x = 80;
			temp.y = 32;
			return temp;
		}

		private function jz2_q1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jz2_q1 = temp;
			temp.name = "jz2_q1";
			temp.styleName = "ui/mainui/shortcut/zhen_1.png";
			temp.width = 36;
			temp.x = 37;
			temp.y = 27;
			return temp;
		}

		private function jz2_q2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jz2_q2 = temp;
			temp.name = "jz2_q2";
			temp.styleName = "ui/mainui/shortcut/zhen_2.png";
			temp.width = 36;
			temp.x = 39;
			temp.y = 0;
			return temp;
		}

		private function jz2_q3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jz2_q3 = temp;
			temp.name = "jz2_q3";
			temp.styleName = "ui/mainui/shortcut/zhen_3.png";
			temp.width = 36;
			temp.x = 72;
			temp.y = -10;
			return temp;
		}

		private function jz2_q4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jz2_q4 = temp;
			temp.name = "jz2_q4";
			temp.styleName = "ui/mainui/shortcut/zhen_4.png";
			temp.width = 36;
			temp.x = 105;
			temp.y = -1;
			return temp;
		}

		private function jz2_q5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jz2_q5 = temp;
			temp.name = "jz2_q5";
			temp.styleName = "ui/mainui/shortcut/zhen_5.png";
			temp.width = 36;
			temp.x = 106;
			temp.y = 27;
			return temp;
		}

		private function jz2_qbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jz2_qbg = temp;
			temp.name = "jz2_qbg";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/shortcut/zhenheibai.png";
			temp.width = 104;
			temp.x = 38;
			temp.y = -10;
			return temp;
		}

		private function txt_djs_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_djs = temp;
			temp.name = "txt_djs";
			temp.fontSize = 12;
			temp.text = "15s";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 27;
			temp.y = 27;
			return temp;
		}

		private function z_leftMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			z_leftMask = temp;
			temp.name = "z_leftMask";
			temp.styleName = "ui/mainui/shortcut/hongdi.png";
			temp.width = 122;
			temp.x = 52;
			temp.y = 15;
			return temp;
		}

		private function z_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			z_left = temp;
			temp.name = "z_left";
			temp.styleName = "ui/mainui/shortcut/hongtiao.png";
			temp.width = 122;
			temp.x = 50;
			temp.y = 17;
			return temp;
		}

		private function z_rightMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			z_rightMask = temp;
			temp.name = "z_rightMask";
			temp.styleName = "ui/mainui/shortcut/landi.png";
			temp.width = 122;
			temp.x = 613;
			temp.y = 14;
			return temp;
		}

		private function z_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			z_right = temp;
			temp.name = "z_right";
			temp.styleName = "ui/mainui/shortcut/lantiao.png";
			temp.width = 122;
			temp.x = 613;
			temp.y = 16;
			return temp;
		}

	}
}