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

		public var dian1:feathers.controls.UIAsset;

		public var dian2:feathers.controls.UIAsset;

		public var dian3:feathers.controls.UIAsset;

		public var dian4:feathers.controls.UIAsset;

		public var dian5:feathers.controls.UIAsset;

		public var dian6:feathers.controls.UIAsset;

		public var dian7:feathers.controls.UIAsset;

		public var dian8:feathers.controls.UIAsset;

		public var fangun:feathers.controls.Group;

		public var fangun_n1:feathers.controls.UIAsset;

		public var fangun_n2:feathers.controls.UIAsset;

		public var fangun_n3:feathers.controls.UIAsset;

		public var fangun_tiao:feathers.controls.UIAsset;

		public var fangun_tishi:feathers.controls.UIAsset;

		public var grp_buff:feathers.controls.Group;

		public var jingzhen_yijia:feathers.controls.Group;

		public var lbl_lastNum:feathers.controls.Label;

		public var lbl_times:feathers.controls.Label;

		public var left_xuecao:feathers.controls.UIAsset;

		public var left_xuecaoMask:feathers.controls.UIAsset;

		public var mask_blue:feathers.controls.UIAsset;

		public var mask_red:feathers.controls.UIAsset;

		public var right_jintiao:feathers.controls.UIAsset;

		public var right_nengliang:feathers.controls.UIAsset;

		public var right_nengliangMask:feathers.controls.UIAsset;

		public var zhenhei_1:feathers.controls.UIAsset;

		public var zhenhei_2:feathers.controls.UIAsset;

		public var zhenhei_3:feathers.controls.UIAsset;

		public var zhenhei_4:feathers.controls.UIAsset;

		public var zhenhei_5:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function shortcut_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 127;
			this.width = 809;
			this.elementsContent = [right_nengliang_i(),right_jintiao_i(),right_nengliangMask_i(),mask_blue_i(),left_xuecao_i(),left_xuecaoMask_i(),mask_red_i(),__shortcut_Skin_UIAsset1_i(),__shortcut_Skin_UIAsset2_i(),Icons_i(),btn_juexue_i(),fangun_i(),grp_buff_i(),jingzhen_yijia_i()];
			
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
			temp.x = 179;
			temp.y = 58;
			temp.elementsContent = [dian1_i(),dian2_i(),dian3_i(),dian4_i(),dian5_i(),dian6_i(),dian7_i(),dian8_i(),__shortcut_Skin_Label1_i(),__shortcut_Skin_Label2_i(),__shortcut_Skin_Label3_i(),__shortcut_Skin_Label4_i(),__shortcut_Skin_Label5_i(),__shortcut_Skin_Label6_i(),__shortcut_Skin_Label7_i(),__shortcut_Skin_Label8_i()];
			return temp;
		}

		private function __shortcut_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "1";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 12;
			temp.x = 31;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "2";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 12;
			temp.x = 86;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "3";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 12;
			temp.x = 140;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "4";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 12;
			temp.x = 194;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "Q";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 15;
			temp.x = 249;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "W";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 20;
			temp.x = 303;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "E";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 12;
			temp.x = 357;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 12;
			temp.text = "R";
			temp.color = 0xb8b2a4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 12;
			temp.x = 412;
			temp.y = 53;
			return temp;
		}

		private function __shortcut_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 16;
			temp.letterSpacing = -1;
			temp.fontSize = 12;
			temp.text = "F1";
			temp.textAlign = "center";
			temp.color = 0xB8B2A4;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack2"];
			temp.width = 17;
			temp.x = 160;
			temp.y = 38;
			return temp;
		}

		private function __shortcut_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 159;
			temp.y = 37;
			return temp;
		}

		private function __shortcut_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/mainui/shortcut/dikuang.png";
			temp.x = 0;
			temp.y = 35;
			return temp;
		}

		private function __shortcut_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/zhaungshi.png";
			temp.x = 236;
			temp.y = 56;
			return temp;
		}

		private function __shortcut_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/buffkuang.png";
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

		private function __shortcut_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/buffkuang.png";
			temp.x = 46;
			temp.y = 10;
			return temp;
		}

		private function __shortcut_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/buffkuang.png";
			temp.x = 92;
			temp.y = 10;
			return temp;
		}

		private function __shortcut_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/yaoshuikuang.png";
			temp.x = 143;
			temp.y = 0;
			return temp;
		}

		private function __shortcut_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/buffkuang.png";
			temp.x = 200;
			temp.y = 10;
			return temp;
		}

		private function __shortcut_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/buffkuang.png";
			temp.x = 246;
			temp.y = 10;
			return temp;
		}

		private function __shortcut_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/buffkuang.png";
			temp.x = 292;
			temp.y = 10;
			return temp;
		}

		private function btn_juexue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_juexue = temp;
			temp.name = "btn_juexue";
			temp.styleClass = org.mokylin.skin.mainui.shortcut.button.ButtonSkin_jue;
			temp.x = 754;
			temp.y = 59;
			return temp;
		}

		private function dian1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian1 = temp;
			temp.name = "dian1";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 27;
			temp.y = 52;
			return temp;
		}

		private function dian2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian2 = temp;
			temp.name = "dian2";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 82;
			temp.y = 52;
			return temp;
		}

		private function dian3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian3 = temp;
			temp.name = "dian3";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 137;
			temp.y = 52;
			return temp;
		}

		private function dian4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian4 = temp;
			temp.name = "dian4";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 191;
			temp.y = 52;
			return temp;
		}

		private function dian5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian5 = temp;
			temp.name = "dian5";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 245;
			temp.y = 52;
			return temp;
		}

		private function dian6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian6 = temp;
			temp.name = "dian6";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 299;
			temp.y = 52;
			return temp;
		}

		private function dian7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian7 = temp;
			temp.name = "dian7";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 354;
			temp.y = 52;
			return temp;
		}

		private function dian8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dian8 = temp;
			temp.name = "dian8";
			temp.styleName = "ui/mainui/shortcut/tishiyuandi.png";
			temp.x = 408;
			temp.y = 52;
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
			temp.y = 75;
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

		private function grp_buff_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_buff = temp;
			temp.name = "grp_buff";
			temp.x = 236;
			temp.y = 0;
			temp.elementsContent = [__shortcut_Skin_UIAsset3_i(),__shortcut_Skin_UIAsset4_i(),__shortcut_Skin_UIAsset5_i(),__shortcut_Skin_UIAsset6_i(),__shortcut_Skin_UIAsset7_i(),__shortcut_Skin_UIAsset8_i(),__shortcut_Skin_UIAsset9_i(),__shortcut_Skin_UIAsset10_i(),__shortcut_Skin_Label9_i()];
			return temp;
		}

		private function jingzhen_yijia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			jingzhen_yijia = temp;
			temp.name = "jingzhen_yijia";
			temp.width = 132;
			temp.x = 603;
			temp.y = 59;
			temp.elementsContent = [zhenhei_1_i(),zhenhei_2_i(),zhenhei_3_i(),zhenhei_4_i(),zhenhei_5_i(),lbl_lastNum_i()];
			return temp;
		}

		private function lbl_lastNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lastNum = temp;
			temp.name = "lbl_lastNum";
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
			temp.x = 50;
			temp.y = 36;
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
			temp.y = 36;
			return temp;
		}

		private function mask_blue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mask_blue = temp;
			temp.name = "mask_blue";
			temp.styleName = "ui/mainui/shortcut/lanzezhao.png";
			temp.x = 637;
			temp.y = 36;
			return temp;
		}

		private function mask_red_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mask_red = temp;
			temp.name = "mask_red";
			temp.styleName = "ui/mainui/shortcut/hongzezhao.png";
			temp.x = 50;
			temp.y = 36;
			return temp;
		}

		private function right_jintiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_jintiao = temp;
			temp.name = "right_jintiao";
			temp.styleName = "ui/mainui/shortcut/jingtiao.png";
			temp.x = 637;
			temp.y = 36;
			return temp;
		}

		private function right_nengliangMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_nengliangMask = temp;
			temp.name = "right_nengliangMask";
			temp.styleName = "ui/mainui/shortcut/landi.png";
			temp.width = 122;
			temp.x = 637;
			temp.y = 36;
			return temp;
		}

		private function right_nengliang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_nengliang = temp;
			temp.name = "right_nengliang";
			temp.styleName = "ui/mainui/shortcut/lantiao.png";
			temp.width = 122;
			temp.x = 637;
			temp.y = 36;
			return temp;
		}

		private function zhenhei_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhenhei_1 = temp;
			temp.name = "zhenhei_1";
			temp.height = 14;
			temp.styleName = "ui/mainui/shortcut/zhenhei_1.png";
			temp.x = 27;
			temp.y = 47;
			return temp;
		}

		private function zhenhei_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhenhei_2 = temp;
			temp.name = "zhenhei_2";
			temp.height = 30;
			temp.styleName = "ui/mainui/shortcut/zhenhei_2.png";
			temp.width = 24;
			temp.x = 34;
			temp.y = 12;
			return temp;
		}

		private function zhenhei_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhenhei_3 = temp;
			temp.name = "zhenhei_3";
			temp.styleName = "ui/mainui/shortcut/zhenhei_3.png";
			temp.x = 73;
			temp.y = 0;
			return temp;
		}

		private function zhenhei_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhenhei_4 = temp;
			temp.name = "zhenhei_4";
			temp.styleName = "ui/mainui/shortcut/zhenhei_4.png";
			temp.x = 100;
			temp.y = 12;
			return temp;
		}

		private function zhenhei_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhenhei_5 = temp;
			temp.name = "zhenhei_5";
			temp.styleName = "ui/mainui/shortcut/zhenhei_5.png";
			temp.x = 96;
			temp.y = 47;
			return temp;
		}

	}
}