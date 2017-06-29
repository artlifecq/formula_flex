package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zuoqi.Shuxing_Item;
	import org.mokylin.skin.app.zuoqi.button.ButtonZhanqijinjiedan;
	import org.mokylin.skin.app.zuoqi.button.ButtonZhanqizizhidan;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipJieshu;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipZhanqiName;
	import org.mokylin.skin.app.zuoqi.progress_zhufuzhiSkin;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhanqi_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var bg_1:feathers.controls.UIAsset;

		public var bg_2:feathers.controls.UIAsset;

		public var btn_chengzhangdan:feathers.controls.Button;

		public var btn_kaishi:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_tingzhi:feathers.controls.Button;

		public var btn_zidong:feathers.controls.Button;

		public var btn_zizhidan:feathers.controls.Button;

		public var chk_zidonggoumai:feathers.controls.Check;

		public var expgroup:feathers.controls.Group;

		public var grid_1:feathers.controls.UIAsset;

		public var grid_2:feathers.controls.UIAsset;

		public var grp_jinjie:feathers.controls.Group;

		public var jinjie:feathers.controls.UIAsset;

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

		public var maximg:feathers.controls.UIAsset;

		public var mc_jieshu:feathers.controls.UIMovieClip;

		public var mc_name:feathers.controls.UIMovieClip;

		public var progressbar:feathers.controls.ProgressBar;

		public var progressbar_light:feathers.controls.UIAsset;

		public var uplevelgroup:feathers.controls.Group;

		public var zuoqijineng:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhanqi_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_1_i(),bg_2_i(),uplevelgroup_i(),__Zhanqi_Skin_UIAsset6_i(),__Zhanqi_Skin_UIAsset7_i(),NumZhanli_i(),__Zhanqi_Skin_Group1_i(),btn_zizhidan_i(),btn_chengzhangdan_i(),zuoqijineng_i(),btn_prev_i(),btn_next_i(),mc_name_i(),mc_jieshu_i(),maximg_i(),grp_jinjie_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -13;
			temp.height = 33;
			temp.label = "1364364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 148;
			temp.x = 759;
			temp.y = 109;
			return temp;
		}

		private function __Zhanqi_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 697;
			temp.y = 184;
			temp.elementsContent = [lab_1_i(),lab_2_i(),lab_3_i(),lab_4_i(),lab_5_i(),lab_6_i(),lab_7_i(),lab_8_i()];
			return temp;
		}

		private function __Zhanqi_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需要：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __Zhanqi_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动购买";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 186;
			temp.y = 1;
			return temp;
		}

		private function __Zhanqi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/huidi.png";
			temp.x = 0;
			temp.y = 75;
			return temp;
		}

		private function __Zhanqi_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jindutiao_kuang1.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanqi_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jinjiezhufuzhi.png";
			temp.x = 3;
			temp.y = 85;
			return temp;
		}

		private function __Zhanqi_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jinjiehaoli.png";
			temp.x = 3;
			temp.y = 42;
			return temp;
		}

		private function __Zhanqi_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jiachengshuxing.png";
			temp.x = 717;
			temp.y = 162;
			return temp;
		}

		private function __Zhanqi_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 688;
			temp.y = 99;
			return temp;
		}

		private function bg_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_1 = temp;
			temp.name = "bg_1";
			temp.styleName = "ui/big_bg/zuoqi/bg.jpg";
			temp.x = 673;
			temp.y = 85;
			return temp;
		}

		private function bg_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_2 = temp;
			temp.name = "bg_2";
			temp.styleName = "ui/big_bg/zuoqi/zhanqi_bg.jpg";
			temp.x = 22;
			temp.y = 85;
			return temp;
		}

		private function btn_chengzhangdan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chengzhangdan = temp;
			temp.name = "btn_chengzhangdan";
			temp.styleClass = org.mokylin.skin.app.zuoqi.button.ButtonZhanqijinjiedan;
			temp.x = 513;
			temp.y = 456;
			return temp;
		}

		private function btn_kaishi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_kaishi = temp;
			temp.name = "btn_kaishi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "开始进阶";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 8;
			temp.y = 22;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 609;
			temp.y = 300;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 92;
			temp.y = 300;
			return temp;
		}

		private function btn_tingzhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_tingzhi = temp;
			temp.name = "btn_tingzhi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 37;
			temp.label = "停止进阶";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 59;
			temp.y = 22;
			return temp;
		}

		private function btn_zidong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zidong = temp;
			temp.name = "btn_zidong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "自动进阶";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 110;
			temp.x = 131;
			temp.y = 22;
			return temp;
		}

		private function btn_zizhidan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zizhidan = temp;
			temp.name = "btn_zizhidan";
			temp.styleClass = org.mokylin.skin.app.zuoqi.button.ButtonZhanqizizhidan;
			temp.x = 587;
			temp.y = 456;
			return temp;
		}

		private function chk_zidonggoumai_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_zidonggoumai = temp;
			temp.name = "chk_zidonggoumai";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.labelOffsetX = -4;
			temp.labelOffsetY = -2;
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0x8B8D7B;
			temp.x = 164;
			temp.y = 0;
			return temp;
		}

		private function expgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			expgroup = temp;
			temp.name = "expgroup";
			temp.x = 0;
			temp.y = 101;
			temp.elementsContent = [__Zhanqi_Skin_UIAsset3_i(),progressbar_i(),progressbar_light_i(),lab_progressbar_i()];
			return temp;
		}

		private function grid_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_1 = temp;
			temp.name = "grid_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 114;
			temp.y = 20;
			return temp;
		}

		private function grid_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_2 = temp;
			temp.name = "grid_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 167;
			temp.y = 20;
			return temp;
		}

		private function grp_jinjie_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jinjie = temp;
			temp.name = "grp_jinjie";
			temp.x = 681;
			temp.y = 467;
			temp.elementsContent = [btn_kaishi_i(),btn_zidong_i(),__Zhanqi_Skin_Label1_i(),lab_xuyaowupin_i(),chk_zidonggoumai_i(),__Zhanqi_Skin_Label2_i(),btn_tingzhi_i()];
			return temp;
		}

		private function jinjie_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jinjie = temp;
			temp.name = "jinjie";
			temp.styleName = "ui/app/zuoqi/zhanqijinjie.png";
			temp.x = 26;
			temp.y = 0;
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
			temp.height = 19;
			temp.text = "战旗进阶丹*10(999)";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 137;
			temp.x = 35;
			temp.y = 3;
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
			temp.x = 110;
			temp.y = 82;
			return temp;
		}

		private function maximg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			maximg = temp;
			temp.name = "maximg";
			temp.styleName = "ui/app/zuoqi/yimanji.png";
			temp.x = 742;
			temp.y = 471;
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
			temp.x = 553;
			temp.y = 96;
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.autoPlay = false;
			temp.height = 196;
			temp.styleClass = org.mokylin.skin.app.zuoqi.mc.UIMovieClipZhanqiName;
			temp.width = 83;
			temp.x = 585;
			temp.y = 85;
			return temp;
		}

		private function progressbar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			progressbar = temp;
			temp.name = "progressbar";
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

		private function progressbar_light_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			progressbar_light = temp;
			temp.name = "progressbar_light";
			temp.styleName = "ui/app/zuoqi/tiao.png";
			temp.x = 177;
			temp.y = 2;
			return temp;
		}

		private function uplevelgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			uplevelgroup = temp;
			temp.name = "uplevelgroup";
			temp.x = 691;
			temp.y = 333;
			temp.elementsContent = [__Zhanqi_Skin_UIAsset2_i(),expgroup_i(),__Zhanqi_Skin_UIAsset4_i(),lab_zhufuzhi_i(),__Zhanqi_Skin_UIAsset5_i(),grid_1_i(),grid_2_i(),jinjie_i()];
			return temp;
		}

		private function zuoqijineng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			zuoqijineng = temp;
			temp.name = "zuoqijineng";
			temp.x = 182;
			temp.y = 425;
			return temp;
		}

	}
}