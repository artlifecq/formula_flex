package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;
	import org.mokylin.skin.app.zuoqi.button.ButtonZuoqi;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipJieshu;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipZuoqiName;
	import org.mokylin.skin.app.zuoqi.progress_zhufuzhiSkin;
	import org.mokylin.skin.app.zuoqi.uinumber.UINumberZhanli;
	import org.mokylin.skin.common.yiji_panelbg_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zuoqi_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var bg_1:feathers.controls.UIAsset;

		public var bg_2:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_kaishi:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_zidong:feathers.controls.Button;

		public var chk_zidonggoumai:feathers.controls.Check;

		public var grid_1:feathers.controls.UIAsset;

		public var grid_2:feathers.controls.UIAsset;

		public var jinjie:feathers.controls.UIAsset;

		public var kuang_1:feathers.controls.UIAsset;

		public var kuang_2:feathers.controls.UIAsset;

		public var kuang_3:feathers.controls.UIAsset;

		public var lab_1:feathers.controls.SkinnableContainer;

		public var lab_2:feathers.controls.SkinnableContainer;

		public var lab_3:feathers.controls.SkinnableContainer;

		public var lab_4:feathers.controls.SkinnableContainer;

		public var lab_5:feathers.controls.SkinnableContainer;

		public var lab_6:feathers.controls.SkinnableContainer;

		public var lab_7:feathers.controls.SkinnableContainer;

		public var lab_8:feathers.controls.SkinnableContainer;

		public var lab_progressbar:feathers.controls.Label;

		public var lab_xuyaowupin:feathers.controls.Label;

		public var lab_zhufuzhi:feathers.controls.Label;

		public var mc_jieshu:feathers.controls.UIMovieClip;

		public var mc_name:feathers.controls.UIMovieClip;

		public var num_zhandouli:feathers.controls.UINumber;

		public var progressbar:feathers.controls.Group;

		public var zhandouli:feathers.controls.UIAsset;

		public var zuoqijineng:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zuoqi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),btnClose_i(),bg_1_i(),bg_2_i(),btn_kaishi_i(),btn_zidong_i(),__Zuoqi_Skin_Label1_i(),lab_xuyaowupin_i(),chk_zidonggoumai_i(),progressbar_i(),__Zuoqi_Skin_UIAsset3_i(),lab_zhufuzhi_i(),__Zuoqi_Skin_UIAsset4_i(),grid_1_i(),grid_2_i(),jinjie_i(),__Zuoqi_Skin_UIAsset5_i(),zhandouli_i(),num_zhandouli_i(),__Zuoqi_Skin_Group1_i(),__Zuoqi_Skin_UIAsset6_i(),__Zuoqi_Skin_UIAsset7_i(),zuoqijineng_i(),btn_prev_i(),btn_next_i(),mc_name_i(),mc_jieshu_i(),__Zuoqi_Skin_RadioButton1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Zuoqi_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 693;
			temp.y = 174;
			temp.elementsContent = [lab_1_i(),lab_2_i(),lab_3_i(),lab_4_i(),lab_5_i(),lab_6_i(),lab_7_i(),lab_8_i()];
			return temp;
		}

		private function __Zuoqi_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需要：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 686;
			temp.y = 460;
			return temp;
		}

		private function __Zuoqi_Skin_ProgressBar1_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			temp.height = 14;
			temp.maximum = 200;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.app.zuoqi.progress_zhufuzhiSkin;
			temp.value = 160;
			temp.width = 220;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function __Zuoqi_Skin_RadioButton1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			temp.styleClass = org.mokylin.skin.app.zuoqi.button.ButtonZuoqi;
			temp.x = 30;
			temp.y = 529;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jindutiao_kuang1.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/tiao.png";
			temp.x = 177;
			temp.y = 2;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jinjiezhufuzhi.png";
			temp.x = 690;
			temp.y = 408;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jinjiehaoli.png";
			temp.x = 690;
			temp.y = 365;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jiachengshuxing.png";
			temp.x = 713;
			temp.y = 152;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/zuoqidan.png";
			temp.x = 591;
			temp.y = 446;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/zuoqi/zuoqi.png";
			temp.x = 448;
			temp.y = 13;
			return temp;
		}

		private function __Zuoqi_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/zhongxiadiban.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_1 = temp;
			temp.name = "bg_1";
			temp.styleName = "ui/app/zuoqi/bg.jpg";
			temp.x = 669;
			temp.y = 75;
			return temp;
		}

		private function bg_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_2 = temp;
			temp.name = "bg_2";
			temp.styleName = "ui/app/zuoqi/bg2.jpg";
			temp.x = 18;
			temp.y = 75;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.common.yiji_panelbg_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 1246;
			temp.y = 28;
			return temp;
		}

		private function btn_kaishi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_kaishi = temp;
			temp.name = "btn_kaishi";
			temp.label = "开始进阶";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 107;
			temp.x = 685;
			temp.y = 479;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 605;
			temp.y = 350;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 88;
			temp.y = 350;
			return temp;
		}

		private function btn_zidong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zidong = temp;
			temp.name = "btn_zidong";
			temp.label = "自动进阶";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 107;
			temp.x = 808;
			temp.y = 479;
			return temp;
		}

		private function chk_zidonggoumai_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_zidonggoumai = temp;
			temp.name = "chk_zidonggoumai";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "自动购买";
			temp.labelOffsetX = -4;
			temp.labelOffsetY = -2;
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x8B8D7B;
			temp.x = 828;
			temp.y = 457;
			return temp;
		}

		private function grid_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_1 = temp;
			temp.name = "grid_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 801;
			temp.y = 343;
			return temp;
		}

		private function grid_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_2 = temp;
			temp.name = "grid_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 854;
			temp.y = 343;
			return temp;
		}

		private function jinjie_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinjie = temp;
			temp.name = "jinjie";
			temp.styleName = "ui/app/zuoqi/zuoqijinjie.png";
			temp.x = 713;
			temp.y = 323;
			return temp;
		}

		private function kuang_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			kuang_1 = temp;
			temp.name = "kuang_1";
			temp.styleName = "ui/app/zuoqi/daojukuang.png";
			temp.x = 62;
			temp.y = 39;
			return temp;
		}

		private function kuang_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			kuang_2 = temp;
			temp.name = "kuang_2";
			temp.styleName = "ui/app/zuoqi/daojukuang.png";
			temp.x = 137;
			temp.y = 39;
			return temp;
		}

		private function kuang_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			kuang_3 = temp;
			temp.name = "kuang_3";
			temp.styleName = "ui/app/zuoqi/daojukuang.png";
			temp.x = 212;
			temp.y = 39;
			return temp;
		}

		private function lab_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_1 = temp;
			temp.name = "lab_1";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lab_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_2 = temp;
			temp.name = "lab_2";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 18;
			return temp;
		}

		private function lab_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_3 = temp;
			temp.name = "lab_3";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 35;
			return temp;
		}

		private function lab_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_4 = temp;
			temp.name = "lab_4";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 53;
			return temp;
		}

		private function lab_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_5 = temp;
			temp.name = "lab_5";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 70;
			return temp;
		}

		private function lab_6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_6 = temp;
			temp.name = "lab_6";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 88;
			return temp;
		}

		private function lab_7_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_7 = temp;
			temp.name = "lab_7";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 106;
			return temp;
		}

		private function lab_8_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_8 = temp;
			temp.name = "lab_8";
			temp.height = 21;
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 0;
			temp.y = 123;
			return temp;
		}

		private function lab_progressbar_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_progressbar = temp;
			temp.name = "lab_progressbar";
			temp.text = "160/200";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 87;
			temp.y = 2;
			return temp;
		}

		private function lab_xuyaowupin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_xuyaowupin = temp;
			temp.name = "lab_xuyaowupin";
			temp.text = "坐骑进阶丹*1";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 728;
			temp.y = 460;
			return temp;
		}

		private function lab_zhufuzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_zhufuzhi = temp;
			temp.name = "lab_zhufuzhi";
			temp.text = "本阶祝福值不清零";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 797;
			temp.y = 405;
			return temp;
		}

		private function mc_jieshu_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_jieshu = temp;
			temp.name = "mc_jieshu";
			temp.autoPlay = false;
			temp.height = 59;
			temp.styleClass = org.mokylin.skin.app.zuoqi.mc.UIMovieClipJieshu;
			temp.width = 29;
			temp.x = 549;
			temp.y = 86;
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.height = 196;
			temp.styleClass = org.mokylin.skin.app.zuoqi.mc.UIMovieClipZuoqiName;
			temp.width = 83;
			temp.x = 581;
			temp.y = 75;
			return temp;
		}

		private function num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_zhandouli = temp;
			temp.name = "num_zhandouli";
			temp.gap = -4;
			temp.height = 38;
			temp.label = "31415";
			temp.styleClass = org.mokylin.skin.app.zuoqi.uinumber.UINumberZhanli;
			temp.width = 116;
			temp.x = 783;
			temp.y = 94;
			return temp;
		}

		private function progressbar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			progressbar = temp;
			temp.name = "progressbar";
			temp.x = 687;
			temp.y = 424;
			temp.elementsContent = [__Zuoqi_Skin_UIAsset1_i(),__Zuoqi_Skin_ProgressBar1_i(),__Zuoqi_Skin_UIAsset2_i(),lab_progressbar_i()];
			return temp;
		}

		private function zhandouli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhandouli = temp;
			temp.name = "zhandouli";
			temp.styleName = "ui/app/zuoqi/zhandouli.png";
			temp.x = 691;
			temp.y = 99;
			return temp;
		}

		private function zuoqijineng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			zuoqijineng = temp;
			temp.name = "zuoqijineng";
			temp.x = 178;
			temp.y = 415;
			temp.elementsContent = [__Zuoqi_Skin_UIAsset8_i(),kuang_1_i(),kuang_2_i(),kuang_3_i()];
			return temp;
		}

	}
}