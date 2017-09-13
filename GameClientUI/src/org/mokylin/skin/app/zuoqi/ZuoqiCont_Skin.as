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
	import org.mokylin.skin.app.zuoqi.button.ButtonZuoqichengzhangdan;
	import org.mokylin.skin.app.zuoqi.button.ButtonZuoqidan;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipJieshu;
	import org.mokylin.skin.app.zuoqi.mc.UIMovieClipZuoqiName;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.progress.progress_jindutiao2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZuoqiCont_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var bg_2:feathers.controls.UIAsset;

		public var btn_chengzhangdan:feathers.controls.Button;

		public var btn_kaishi:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_tingzhi:feathers.controls.Button;

		public var btn_zidong:feathers.controls.Button;

		public var btn_zizhidan:feathers.controls.Button;

		public var chk_zidonggoumai:feathers.controls.Check;

		public var currentAvatar:feathers.controls.Group;

		public var expgroup:feathers.controls.Group;

		public var gprShuxing:feathers.controls.Group;

		public var grid_1:feathers.controls.UIAsset;

		public var grid_2:feathers.controls.UIAsset;

		public var grpFoot:feathers.controls.Group;

		public var grpZhanli:feathers.controls.Group;

		public var grp_jinjie:feathers.controls.Group;

		public var ico_up:feathers.controls.UIAsset;

		public var kuang_1:feathers.controls.UIAsset;

		public var kuang_2:feathers.controls.UIAsset;

		public var kuang_3:feathers.controls.UIAsset;

		public var lab_1:feathers.controls.SkinnableContainer;

		public var lab_2:feathers.controls.SkinnableContainer;

		public var lab_3:feathers.controls.SkinnableContainer;

		public var lab_4:feathers.controls.SkinnableContainer;

		public var lab_5:feathers.controls.SkinnableContainer;

		public var lab_progressbar:feathers.controls.Label;

		public var lab_xuyaowupin:feathers.controls.Label;

		public var lab_zhufuzhi:feathers.controls.Label;

		public var lbJinjie:feathers.controls.Label;

		public var lbZhizi:feathers.controls.Label;

		public var lberror:feathers.controls.UIAsset;

		public var maximg:feathers.controls.UIAsset;

		public var mc_jieshu:feathers.controls.UIMovieClip;

		public var mc_name:feathers.controls.UIMovieClip;

		public var nextAvatar:feathers.controls.Group;

		public var num_lv:feathers.controls.UINumber;

		public var progressbar:feathers.controls.ProgressBar;

		public var ui_zhandou:feathers.controls.UIAsset;

		public var uplevelgroup:feathers.controls.Group;

		public var zuoqijineng:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZuoqiCont_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__ZuoqiCont_Skin_Group1_i(),bg_2_i(),grpFoot_i(),__ZuoqiCont_Skin_UIAsset12_i(),__ZuoqiCont_Skin_UIAsset13_i(),grpZhanli_i(),gprShuxing_i(),lberror_i(),currentAvatar_i(),nextAvatar_i(),btn_zizhidan_i(),btn_chengzhangdan_i(),lbZhizi_i(),lbJinjie_i(),zuoqijineng_i(),btn_prev_i(),btn_next_i(),mc_name_i(),mc_jieshu_i(),maximg_i()];
			
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
			temp.gap = -15;
			temp.height = 40;
			temp.label = "62984567";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.textAlign = "center";
			temp.width = 162;
			temp.x = -6;
			temp.y = 36;
			return temp;
		}

		private function __ZuoqiCont_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 688;
			temp.y = 86;
			temp.elementsContent = [__ZuoqiCont_Skin_UIAsset2_i(),__ZuoqiCont_Skin_UIAsset3_i(),__ZuoqiCont_Skin_UIAsset4_i(),__ZuoqiCont_Skin_UIAsset5_i(),__ZuoqiCont_Skin_UIAsset6_i(),__ZuoqiCont_Skin_UIAsset7_i()];
			return temp;
		}

		private function __ZuoqiCont_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "需要：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function __ZuoqiCont_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动购买";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 165;
			temp.y = 3;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao2/jdt_di.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jinjiehaoli.png";
			temp.x = 21;
			temp.y = 21;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jiachengshuxing.png";
			temp.x = 789;
			temp.y = 170;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/zqjj.png";
			temp.x = 789;
			temp.y = 324;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 165;
			temp.x = 51;
			temp.y = 10;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 165;
			temp.x = 51;
			temp.y = 35;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 165;
			temp.x = 51;
			temp.y = 61;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 165;
			temp.x = 51;
			temp.y = 86;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 164;
			temp.x = 51;
			temp.y = 111;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/gj.png";
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/sf.png";
			temp.x = 0;
			temp.y = 37;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/qx.png";
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/fy.png";
			temp.x = 0;
			temp.y = 88;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/mz.png";
			temp.x = 0;
			temp.y = 113;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 102;
			temp.styleName = "ui/app/zuoqi/zuoqijineng.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/mzd.png";
			temp.x = 3;
			temp.y = 79;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/fenyexian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 69;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/fenyexian.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 222;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/mzd.png";
			temp.x = 3;
			temp.y = 233;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/zdldi.jpg";
			temp.x = 3;
			temp.y = 3;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 58;
			temp.styleName = "ui/app/zuoqi/guangdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZuoqiCont_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zuoqi/jinjiezhufuzhi.png";
			temp.x = 11;
			temp.y = 68;
			return temp;
		}

		private function bg_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg_2 = temp;
			temp.name = "bg_2";
			temp.styleName = "ui/big_bg/zuoqi/zuoqi_bg.jpg";
			temp.x = 20;
			temp.y = 84;
			return temp;
		}

		private function btn_chengzhangdan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chengzhangdan = temp;
			temp.name = "btn_chengzhangdan";
			temp.styleClass = org.mokylin.skin.app.zuoqi.button.ButtonZuoqichengzhangdan;
			temp.x = 614;
			temp.y = 440;
			return temp;
		}

		private function btn_kaishi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_kaishi = temp;
			temp.name = "btn_kaishi";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "进  阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 2;
			temp.y = 27;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 644;
			temp.y = 283;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 72;
			temp.y = 283;
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
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 59;
			temp.y = 27;
			return temp;
		}

		private function btn_zidong_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zidong = temp;
			temp.name = "btn_zidong";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "自动进阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 117;
			temp.y = 27;
			return temp;
		}

		private function btn_zizhidan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zizhidan = temp;
			temp.name = "btn_zizhidan";
			temp.styleClass = org.mokylin.skin.app.zuoqi.button.ButtonZuoqidan;
			temp.x = 538;
			temp.y = 440;
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
			temp.textAlign = "left";
			temp.color = 0x8B8D7B;
			temp.width = 20;
			temp.x = 143;
			temp.y = 1;
			return temp;
		}

		private function currentAvatar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			currentAvatar = temp;
			temp.name = "currentAvatar";
			temp.height = 372;
			temp.width = 542;
			temp.x = 81;
			temp.y = 86;
			return temp;
		}

		private function expgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			expgroup = temp;
			temp.name = "expgroup";
			temp.x = 6;
			temp.y = 87;
			temp.elementsContent = [__ZuoqiCont_Skin_UIAsset10_i(),progressbar_i(),lab_progressbar_i()];
			return temp;
		}

		private function gprShuxing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gprShuxing = temp;
			temp.name = "gprShuxing";
			temp.x = 704;
			temp.y = 184;
			temp.elementsContent = [__ZuoqiCont_Skin_UIAsset14_i(),__ZuoqiCont_Skin_UIAsset15_i(),__ZuoqiCont_Skin_UIAsset16_i(),__ZuoqiCont_Skin_UIAsset17_i(),__ZuoqiCont_Skin_UIAsset18_i(),lab_1_i(),lab_2_i(),lab_3_i(),lab_4_i(),lab_5_i(),__ZuoqiCont_Skin_UIAsset19_i(),__ZuoqiCont_Skin_UIAsset20_i(),__ZuoqiCont_Skin_UIAsset21_i(),__ZuoqiCont_Skin_UIAsset22_i(),__ZuoqiCont_Skin_UIAsset23_i()];
			return temp;
		}

		private function grid_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_1 = temp;
			temp.name = "grid_1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 94;
			temp.y = 4;
			return temp;
		}

		private function grid_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_2 = temp;
			temp.name = "grid_2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 149;
			temp.y = 4;
			return temp;
		}

		private function grpFoot_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFoot = temp;
			temp.name = "grpFoot";
			temp.x = 691;
			temp.y = 346;
			temp.elementsContent = [uplevelgroup_i(),grp_jinjie_i()];
			return temp;
		}

		private function grpZhanli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhanli = temp;
			temp.name = "grpZhanli";
			temp.x = 729;
			temp.y = 89;
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i(),ico_up_i(),num_lv_i()];
			return temp;
		}

		private function grp_jinjie_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jinjie = temp;
			temp.name = "grp_jinjie";
			temp.x = 8;
			temp.y = 114;
			temp.elementsContent = [btn_kaishi_i(),btn_zidong_i(),__ZuoqiCont_Skin_Label1_i(),lab_xuyaowupin_i(),chk_zidonggoumai_i(),__ZuoqiCont_Skin_Label2_i(),btn_tingzhi_i()];
			return temp;
		}

		private function ico_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_up = temp;
			temp.name = "ico_up";
			temp.height = 14;
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.width = 14;
			temp.x = 136;
			temp.y = 50;
			return temp;
		}

		private function kuang_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			kuang_1 = temp;
			temp.name = "kuang_1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 58;
			temp.y = 41;
			return temp;
		}

		private function kuang_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			kuang_2 = temp;
			temp.name = "kuang_2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 124;
			temp.y = 41;
			return temp;
		}

		private function kuang_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			kuang_3 = temp;
			temp.name = "kuang_3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 189;
			temp.y = 41;
			return temp;
		}

		private function lab_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_1 = temp;
			temp.name = "lab_1";
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.x = 62;
			temp.y = 9;
			return temp;
		}

		private function lab_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_2 = temp;
			temp.name = "lab_2";
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.x = 62;
			temp.y = 34;
			return temp;
		}

		private function lab_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_3 = temp;
			temp.name = "lab_3";
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.x = 62;
			temp.y = 60;
			return temp;
		}

		private function lab_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_4 = temp;
			temp.name = "lab_4";
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.x = 62;
			temp.y = 85;
			return temp;
		}

		private function lab_5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_5 = temp;
			temp.name = "lab_5";
			var skin:StateSkin = new org.mokylin.skin.app.zuoqi.Shuxing_Item()
			temp.skin = skin
			temp.x = 62;
			temp.y = 110;
			return temp;
		}

		private function lab_progressbar_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_progressbar = temp;
			temp.name = "lab_progressbar";
			temp.text = "160/200";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 166;
			temp.x = 36;
			temp.y = 3;
			return temp;
		}

		private function lab_xuyaowupin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_xuyaowupin = temp;
			temp.name = "lab_xuyaowupin";
			temp.height = 19;
			temp.text = "坐骑进阶丹*1";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 137;
			temp.x = 41;
			temp.y = 3;
			return temp;
		}

		private function lab_zhufuzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_zhufuzhi = temp;
			temp.name = "lab_zhufuzhi";
			temp.text = "本阶祝福值不清零";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 105;
			temp.y = 65;
			return temp;
		}

		private function lbJinjie_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJinjie = temp;
			temp.name = "lbJinjie";
			temp.fontSize = 11;
			temp.text = "100";
			temp.textAlign = "right";
			temp.color = 0xEEEEEE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 619;
			temp.y = 490;
			return temp;
		}

		private function lbZhizi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhizi = temp;
			temp.name = "lbZhizi";
			temp.fontSize = 11;
			temp.text = "100";
			temp.textAlign = "right";
			temp.color = 0xEEEEEE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 60;
			temp.x = 544;
			temp.y = 490;
			return temp;
		}

		private function lberror_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lberror = temp;
			temp.name = "lberror";
			temp.styleName = "ui/app/zuoqi/dianjidanyao.png";
			temp.x = 535;
			temp.y = 510;
			return temp;
		}

		private function maximg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			maximg = temp;
			temp.name = "maximg";
			temp.styleName = "ui/app/zuoqi/yimianjie.png";
			temp.x = 762;
			temp.y = 411;
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
			temp.x = 609;
			temp.y = 101;
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.autoPlay = false;
			temp.styleClass = org.mokylin.skin.app.zuoqi.mc.UIMovieClipZuoqiName;
			temp.x = 629;
			temp.y = 87;
			return temp;
		}

		private function nextAvatar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			nextAvatar = temp;
			temp.name = "nextAvatar";
			temp.height = 372;
			temp.width = 542;
			temp.x = 81;
			temp.y = 86;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "1000";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;
			temp.width = 75;
			temp.x = 156;
			temp.y = 46;
			return temp;
		}

		private function progressbar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			progressbar = temp;
			temp.name = "progressbar";
			temp.maximum = 200;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.component.progress.progress_jindutiao2;
			temp.value = 50;
			temp.x = 21;
			temp.y = 3;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/art_txt/common/zhandouli1.png";
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function uplevelgroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			uplevelgroup = temp;
			temp.name = "uplevelgroup";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__ZuoqiCont_Skin_UIAsset8_i(),__ZuoqiCont_Skin_UIAsset9_i(),expgroup_i(),lab_zhufuzhi_i(),__ZuoqiCont_Skin_UIAsset11_i(),grid_1_i(),grid_2_i()];
			return temp;
		}

		private function zuoqijineng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			zuoqijineng = temp;
			temp.name = "zuoqijineng";
			temp.x = 197;
			temp.y = 425;
			temp.elementsContent = [__ZuoqiCont_Skin_UIAsset24_i(),kuang_1_i(),kuang_2_i(),kuang_3_i()];
			return temp;
		}

	}
}