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
		public var Iconbg1:feathers.controls.UIAsset;

		public var Iconbg2:feathers.controls.UIAsset;

		public var Iconbg3:feathers.controls.UIAsset;

		public var Iconbg4:feathers.controls.UIAsset;

		public var Iconbg5:feathers.controls.UIAsset;

		public var Iconbg6:feathers.controls.UIAsset;

		public var Iconbg7:feathers.controls.UIAsset;

		public var Iconbg8:feathers.controls.UIAsset;

		public var Icons:feathers.controls.Group;

		public var btn_juexue:feathers.controls.Button;

		public var fangun:feathers.controls.Group;

		public var fangun_n1:feathers.controls.UIAsset;

		public var fangun_n2:feathers.controls.UIAsset;

		public var fangun_n3:feathers.controls.UIAsset;

		public var fangun_point:feathers.controls.UIAsset;

		public var fangun_tiao:feathers.controls.UIAsset;

		public var fangun_tishi:feathers.controls.UIAsset;

		public var jingzhen_yijia:feathers.controls.Group;

		public var jinzhen_1:feathers.controls.UIAsset;

		public var jinzhen_2:feathers.controls.UIAsset;

		public var jinzhen_3:feathers.controls.UIAsset;

		public var jinzhen_4:feathers.controls.UIAsset;

		public var jinzhen_5:feathers.controls.UIAsset;

		public var jinzhen_bg:feathers.controls.UIAsset;

		public var lbl_Num:feathers.controls.Label;

		public var lbl_lastNum:feathers.controls.Label;

		public var lbl_times:feathers.controls.Label;

		public var left_xuecao:feathers.controls.UIAsset;

		public var left_xuecaoMask:feathers.controls.UIAsset;

		public var right_nengliang:feathers.controls.UIAsset;

		public var right_nengliangMask:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function shortcut_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 107;
			this.width = 783;
			this.elementsContent = [right_nengliangMask_i(),right_nengliang_i(),left_xuecaoMask_i(),left_xuecao_i(),__shortcut_Skin_UIAsset1_i(),Icons_i(),btn_juexue_i(),fangun_i(),jingzhen_yijia_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Iconbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg1 = temp;
			temp.name = "Iconbg1";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 9;
			temp.y = 6;
			return temp;
		}

		private function Iconbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg2 = temp;
			temp.name = "Iconbg2";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 63;
			temp.y = 6;
			return temp;
		}

		private function Iconbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg3 = temp;
			temp.name = "Iconbg3";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 117;
			temp.y = 6;
			return temp;
		}

		private function Iconbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg4 = temp;
			temp.name = "Iconbg4";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 171;
			temp.y = 6;
			return temp;
		}

		private function Iconbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg5 = temp;
			temp.name = "Iconbg5";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 225;
			temp.y = 6;
			return temp;
		}

		private function Iconbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg6 = temp;
			temp.name = "Iconbg6";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 279;
			temp.y = 6;
			return temp;
		}

		private function Iconbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg7 = temp;
			temp.name = "Iconbg7";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 333;
			temp.y = 6;
			return temp;
		}

		private function Iconbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg8 = temp;
			temp.name = "Iconbg8";
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
			temp.elementsContent = [Iconbg1_i(),Iconbg2_i(),Iconbg3_i(),Iconbg4_i(),Iconbg5_i(),Iconbg6_i(),Iconbg7_i(),Iconbg8_i(),__shortcut_Skin_Label1_i(),__shortcut_Skin_Label2_i(),__shortcut_Skin_Label3_i(),__shortcut_Skin_Label4_i(),__shortcut_Skin_Label5_i(),__shortcut_Skin_Label6_i(),__shortcut_Skin_Label7_i(),__shortcut_Skin_Label8_i()];
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

		private function __shortcut_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/bantoumingdi.png";
			temp.x = 13;
			temp.y = 36;
			return temp;
		}

		private function __shortcut_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/zhen.png";
			temp.width = 36;
			temp.x = 4;
			temp.y = 25;
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

		private function btn_juexue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_juexue = temp;
			temp.name = "btn_juexue";
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
			temp.elementsContent = [fangun_n1_i(),fangun_n2_i(),fangun_n3_i(),fangun_tiao_i(),fangun_point_i(),fangun_tishi_i(),lbl_times_i()];
			return temp;
		}

		private function fangun_n1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_n1 = temp;
			temp.name = "fangun_n1";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_1.png";
			temp.x = 2;
			temp.y = 13;
			return temp;
		}

		private function fangun_n2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_n2 = temp;
			temp.name = "fangun_n2";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_2.png";
			temp.x = 17;
			temp.y = 5;
			return temp;
		}

		private function fangun_n3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_n3 = temp;
			temp.name = "fangun_n3";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_3.png";
			temp.x = 59;
			temp.y = 13;
			return temp;
		}

		private function fangun_point_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_point = temp;
			temp.name = "fangun_point";
			temp.styleName = "ui/mainui/shortcut/chengguang.png";
			temp.x = 62;
			temp.y = 41;
			return temp;
		}

		private function fangun_tiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_tiao = temp;
			temp.name = "fangun_tiao";
			temp.styleName = "ui/mainui/shortcut/chengbanyuan.png";
			temp.x = 14;
			temp.y = 17;
			return temp;
		}

		private function fangun_tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_tishi = temp;
			temp.name = "fangun_tishi";
			temp.styleName = "ui/mainui/shortcut/jiao.png";
			temp.x = 32;
			temp.y = 27;
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
			temp.elementsContent = [jinzhen_bg_i(),jinzhen_1_i(),jinzhen_2_i(),jinzhen_3_i(),jinzhen_4_i(),jinzhen_5_i(),lbl_lastNum_i(),__shortcut_Skin_UIAsset10_i(),__shortcut_Skin_UIAsset11_i(),lbl_Num_i()];
			return temp;
		}

		private function jinzhen_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_1 = temp;
			temp.name = "jinzhen_1";
			temp.styleName = "ui/mainui/shortcut/zhen_1.png";
			temp.width = 36;
			temp.x = 37;
			temp.y = 27;
			return temp;
		}

		private function jinzhen_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_2 = temp;
			temp.name = "jinzhen_2";
			temp.styleName = "ui/mainui/shortcut/zhen_2.png";
			temp.width = 36;
			temp.x = 39;
			temp.y = 0;
			return temp;
		}

		private function jinzhen_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_3 = temp;
			temp.name = "jinzhen_3";
			temp.styleName = "ui/mainui/shortcut/zhen_3.png";
			temp.width = 36;
			temp.x = 72;
			temp.y = -10;
			return temp;
		}

		private function jinzhen_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_4 = temp;
			temp.name = "jinzhen_4";
			temp.styleName = "ui/mainui/shortcut/zhen_4.png";
			temp.width = 36;
			temp.x = 105;
			temp.y = -1;
			return temp;
		}

		private function jinzhen_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_5 = temp;
			temp.name = "jinzhen_5";
			temp.styleName = "ui/mainui/shortcut/zhen_5.png";
			temp.width = 36;
			temp.x = 106;
			temp.y = 27;
			return temp;
		}

		private function jinzhen_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_bg = temp;
			temp.name = "jinzhen_bg";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/shortcut/zhenheibai.png";
			temp.width = 104;
			temp.x = 38;
			temp.y = -10;
			return temp;
		}

		private function lbl_Num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_Num = temp;
			temp.name = "lbl_Num";
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

		private function lbl_lastNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lastNum = temp;
			temp.name = "lbl_lastNum";
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

		private function lbl_times_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_times = temp;
			temp.name = "lbl_times";
			temp.fontSize = 12;
			temp.text = "15s";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 27;
			temp.y = 27;
			return temp;
		}

		private function left_xuecaoMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			left_xuecaoMask = temp;
			temp.name = "left_xuecaoMask";
			temp.styleName = "ui/mainui/shortcut/hongdi.png";
			temp.width = 122;
			temp.x = 52;
			temp.y = 15;
			return temp;
		}

		private function left_xuecao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			left_xuecao = temp;
			temp.name = "left_xuecao";
			temp.styleName = "ui/mainui/shortcut/hongtiao.png";
			temp.width = 122;
			temp.x = 50;
			temp.y = 17;
			return temp;
		}

		private function right_nengliangMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_nengliangMask = temp;
			temp.name = "right_nengliangMask";
			temp.styleName = "ui/mainui/shortcut/landi.png";
			temp.width = 122;
			temp.x = 613;
			temp.y = 14;
			return temp;
		}

		private function right_nengliang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_nengliang = temp;
			temp.name = "right_nengliang";
			temp.styleName = "ui/mainui/shortcut/lantiao.png";
			temp.width = 122;
			temp.x = 613;
			temp.y = 16;
			return temp;
		}

	}
}