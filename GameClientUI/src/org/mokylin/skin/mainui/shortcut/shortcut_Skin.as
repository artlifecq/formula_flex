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
		public var Icons:feathers.controls.Group;

		public var btn_juexue:feathers.controls.Button;

		public var fangun:feathers.controls.Group;

		public var fangun_n1:feathers.controls.UIAsset;

		public var fangun_n2:feathers.controls.UIAsset;

		public var fangun_n3:feathers.controls.UIAsset;

		public var fangun_tiao:feathers.controls.UIAsset;

		public var fangun_tishi:feathers.controls.UIAsset;

		public var jingzhen_yijia:feathers.controls.Group;

		public var jinzhen_12:feathers.controls.UIAsset;

		public var jinzhen_22:feathers.controls.UIAsset;

		public var jinzhen_32:feathers.controls.UIAsset;

		public var jinzhen_42:feathers.controls.UIAsset;

		public var jinzhen_52:feathers.controls.UIAsset;

		public var jinzhen_bg2:feathers.controls.UIAsset;

		public var lbl_Num2:feathers.controls.Label;

		public var lbl_lastNum2:feathers.controls.Label;

		public var lbl_times:feathers.controls.Label;

		public var left_xuecao:feathers.controls.UIAsset;

		public var left_xuecaoMask:feathers.controls.UIAsset;

		public var right_nengliang:feathers.controls.UIAsset;

		public var right_nengliangMask:feathers.controls.UIAsset;

		public var wuping:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function shortcut_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 107;
			this.width = 783;
			this.elementsContent = [right_nengliangMask_i(),right_nengliang_i(),left_xuecaoMask_i(),left_xuecao_i(),__shortcut_Skin_UIAsset1_i(),Icons_i(),btn_juexue_i(),fangun_i(),wuping_i(),jingzhen_yijia_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.height = 66;
			temp.width = 451;
			temp.x = 166;
			temp.y = 39;
			temp.elementsContent = [];
			return temp;
		}

		private function __shortcut_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/bantoumingdi.png";
			temp.x = 2;
			temp.y = 46;
			return temp;
		}

		private function __shortcut_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/zhen.png";
			temp.width = 12;
			temp.x = 8;
			temp.y = 35;
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
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 189;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 229;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 270;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 38;
			temp.styleName = "ui/mainui/shortcut/kuang_1.png";
			temp.width = 38;
			temp.x = 310;
			temp.y = 0;
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
			temp.elementsContent = [fangun_n1_i(),fangun_n2_i(),fangun_n3_i(),fangun_tiao_i(),fangun_tishi_i(),lbl_times_i()];
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
			temp.width = 132;
			temp.x = 579;
			temp.y = 38;
			temp.elementsContent = [jinzhen_bg2_i(),jinzhen_12_i(),jinzhen_22_i(),jinzhen_32_i(),jinzhen_42_i(),jinzhen_52_i(),lbl_lastNum2_i(),__shortcut_Skin_UIAsset10_i(),__shortcut_Skin_UIAsset11_i(),lbl_Num2_i()];
			return temp;
		}

		private function jinzhen_12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_12 = temp;
			temp.name = "jinzhen_12";
			temp.height = 14;
			temp.styleName = "ui/mainui/shortcut/zhen_1.png";
			temp.x = 28;
			temp.y = 47;
			return temp;
		}

		private function jinzhen_22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_22 = temp;
			temp.name = "jinzhen_22";
			temp.height = 30;
			temp.styleName = "ui/mainui/shortcut/zhen_2.png";
			temp.width = 24;
			temp.x = 34;
			temp.y = 12;
			return temp;
		}

		private function jinzhen_32_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_32 = temp;
			temp.name = "jinzhen_32";
			temp.styleName = "ui/mainui/shortcut/zhen_3.png";
			temp.x = 74;
			temp.y = 1;
			return temp;
		}

		private function jinzhen_42_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_42 = temp;
			temp.name = "jinzhen_42";
			temp.height = 30;
			temp.styleName = "ui/mainui/shortcut/zhen_4.png";
			temp.width = 24;
			temp.x = 99;
			temp.y = 12;
			return temp;
		}

		private function jinzhen_52_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_52 = temp;
			temp.name = "jinzhen_52";
			temp.styleName = "ui/mainui/shortcut/zhen_5.png";
			temp.width = 36;
			temp.x = 95;
			temp.y = 47;
			return temp;
		}

		private function jinzhen_bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinzhen_bg2 = temp;
			temp.name = "jinzhen_bg2";
			temp.styleName = "ui/mainui/shortcut/zhenheibai.png";
			temp.width = 104;
			temp.x = 27;
			temp.y = 0;
			return temp;
		}

		private function lbl_Num2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_Num2 = temp;
			temp.name = "lbl_Num2";
			temp.fontSize = 12;
			temp.text = "x2";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 20;
			temp.x = 15;
			temp.y = 44;
			return temp;
		}

		private function lbl_lastNum2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lastNum2 = temp;
			temp.name = "lbl_lastNum2";
			temp.fontSize = 12;
			temp.text = "5/5";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 26;
			temp.x = 69;
			temp.y = 42;
			return temp;
		}

		private function lbl_times_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_times = temp;
			temp.name = "lbl_times";
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "15s";
			temp.textAlign = "center";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 0;
			temp.y = 29;
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

		private function wuping_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			wuping = temp;
			temp.name = "wuping";
			temp.x = 203;
			temp.y = 0;
			temp.elementsContent = [__shortcut_Skin_UIAsset2_i(),__shortcut_Skin_UIAsset3_i(),__shortcut_Skin_UIAsset4_i(),__shortcut_Skin_UIAsset5_i(),__shortcut_Skin_UIAsset6_i(),__shortcut_Skin_UIAsset7_i(),__shortcut_Skin_UIAsset8_i(),__shortcut_Skin_UIAsset9_i()];
			return temp;
		}

	}
}