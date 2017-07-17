package org.mokylin.skin.app.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.common.Flip2_Skin;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHangBangTotal_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg0:feathers.controls.UIAsset;

		public var Icbg1:feathers.controls.UIAsset;

		public var Icbg10:feathers.controls.UIAsset;

		public var Icbg11:feathers.controls.UIAsset;

		public var Icbg2:feathers.controls.UIAsset;

		public var Icbg3:feathers.controls.UIAsset;

		public var Icbg4:feathers.controls.UIAsset;

		public var Icbg5:feathers.controls.UIAsset;

		public var Icbg6:feathers.controls.UIAsset;

		public var Icbg7:feathers.controls.UIAsset;

		public var Icbg8:feathers.controls.UIAsset;

		public var Icbg9:feathers.controls.UIAsset;

		public var NumZhanli:feathers.controls.UINumber;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnLinQu:feathers.controls.Button;

		public var gprNo:feathers.controls.Group;

		public var grpHead:feathers.controls.Group;

		public var grpZhanli:feathers.controls.Group;

		public var headbg:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var lbMiaosu:feathers.controls.Label;

		public var lbMsg:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiLevelName:feathers.controls.UIAsset;

		public var uiTongjizhong:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHangBangTotal_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__PaiHangBangTotal_Skin_UIAsset1_i(),__PaiHangBangTotal_Skin_UIAsset2_i(),__PaiHangBangTotal_Skin_UIAsset3_i(),__PaiHangBangTotal_Skin_UIAsset4_i(),__PaiHangBangTotal_Skin_UIAsset5_i(),skinFlip_i(),grpZhanli_i(),__PaiHangBangTotal_Skin_UIAsset6_i(),btnLinQu_i(),__PaiHangBangTotal_Skin_UIAsset7_i(),__PaiHangBangTotal_Skin_UIAsset8_i(),icon1_i(),uiLevel_i(),uiLevelName_i(),__PaiHangBangTotal_Skin_Label1_i(),lbMsg_i(),gprNo_i(),grpHead_i(),weapons_i(),__PaiHangBangTotal_Skin_Group1_i(),__PaiHangBangTotal_Skin_Group2_i(),__PaiHangBangTotal_Skin_Group3_i(),uiTongjizhong_i(),lbMiaosu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icbg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg0 = temp;
			temp.name = "Icbg0";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 0;
			return temp;
		}

		private function Icbg10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg10 = temp;
			temp.name = "Icbg10";
			temp.styleName = "ui/common/grid/equip/11hunjie.png";
			temp.x = 0;
			temp.y = 296;
			return temp;
		}

		private function Icbg11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg11 = temp;
			temp.name = "Icbg11";
			temp.styleName = "ui/common/grid/equip/12lingpai.png";
			temp.x = 294;
			temp.y = 296;
			return temp;
		}

		private function Icbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg1 = temp;
			temp.name = "Icbg1";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 59;
			return temp;
		}

		private function Icbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg2 = temp;
			temp.name = "Icbg2";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 119;
			return temp;
		}

		private function Icbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg3 = temp;
			temp.name = "Icbg3";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 178;
			return temp;
		}

		private function Icbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg4 = temp;
			temp.name = "Icbg4";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 7;
			temp.y = 237;
			return temp;
		}

		private function Icbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg5 = temp;
			temp.name = "Icbg5";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 0;
			return temp;
		}

		private function Icbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg6 = temp;
			temp.name = "Icbg6";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 59;
			return temp;
		}

		private function Icbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg7 = temp;
			temp.name = "Icbg7";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 119;
			return temp;
		}

		private function Icbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg8 = temp;
			temp.name = "Icbg8";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 178;
			return temp;
		}

		private function Icbg9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg9 = temp;
			temp.name = "Icbg9";
			temp.styleName = "ui/common/grid/equip/07hutui.png";
			temp.x = 301;
			temp.y = 237;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "629845899";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 209;
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 22;
			temp.y = 393;
			temp.elementsContent = [__PaiHangBangTotal_Skin_UIAsset11_i(),__PaiHangBangTotal_Skin_UIAsset12_i()];
			return temp;
		}

		private function __PaiHangBangTotal_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 22;
			temp.y = 87;
			temp.elementsContent = [__PaiHangBangTotal_Skin_UIAsset13_i(),__PaiHangBangTotal_Skin_UIAsset14_i(),__PaiHangBangTotal_Skin_UIAsset15_i(),__PaiHangBangTotal_Skin_UIAsset16_i(),__PaiHangBangTotal_Skin_UIAsset17_i(),__PaiHangBangTotal_Skin_UIAsset18_i(),__PaiHangBangTotal_Skin_UIAsset19_i(),__PaiHangBangTotal_Skin_UIAsset20_i(),__PaiHangBangTotal_Skin_UIAsset21_i(),__PaiHangBangTotal_Skin_UIAsset22_i()];
			return temp;
		}

		private function __PaiHangBangTotal_Skin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 22;
			temp.y = 114;
			temp.elementsContent = [__PaiHangBangTotal_Skin_UIAsset23_i(),__PaiHangBangTotal_Skin_UIAsset24_i(),__PaiHangBangTotal_Skin_UIAsset25_i(),__PaiHangBangTotal_Skin_UIAsset26_i(),__PaiHangBangTotal_Skin_UIAsset27_i(),__PaiHangBangTotal_Skin_UIAsset28_i(),__PaiHangBangTotal_Skin_UIAsset29_i(),__PaiHangBangTotal_Skin_UIAsset30_i(),__PaiHangBangTotal_Skin_UIAsset31_i(),__PaiHangBangTotal_Skin_UIAsset32_i()];
			return temp;
		}

		private function __PaiHangBangTotal_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "(今日可领取昨日的段位奖励)";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 246;
			temp.y = 510;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xuweiyidai.png";
			temp.x = 84;
			temp.y = 102;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/wodepaiming.png";
			temp.x = 245;
			temp.y = 4;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 86;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 151;
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 79;
			temp.x = 237;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 79;
			temp.x = 316;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 151;
			temp.x = 395;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/paiming.png";
			temp.x = 29;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xingming.png";
			temp.x = 148;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/dengji.png";
			temp.x = 262;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhiye.png";
			temp.x = 341;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhanli.png";
			temp.x = 456;
			temp.y = 5;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 31;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset26_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 93;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset27_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 124;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset28_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset29_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 186;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 502;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 369;
			temp.x = 569;
			temp.y = 84;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset30_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 217;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset31_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 248;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset32_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 304;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/bg2.png";
			temp.x = 569;
			temp.y = 540;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg0.png";
			temp.x = 574;
			temp.y = 89;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/paihangbang/word/quanpingtaipaihangbang.png";
			temp.x = 413;
			temp.y = 18;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/bg1.png";
			temp.x = 21;
			temp.y = 480;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zuoripaiwei.png";
			temp.x = 58;
			temp.y = 510;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/meiripaiwei.png";
			temp.x = 58;
			temp.y = 556;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnLinQu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLinQu = temp;
			temp.name = "btnLinQu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "排行奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 439;
			temp.y = 547;
			return temp;
		}

		private function gprNo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gprNo = temp;
			temp.name = "gprNo";
			temp.x = 643;
			temp.y = 155;
			temp.elementsContent = [__PaiHangBangTotal_Skin_UIAsset9_i(),__PaiHangBangTotal_Skin_UIAsset10_i()];
			return temp;
		}

		private function grpHead_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHead = temp;
			temp.name = "grpHead";
			temp.x = 645;
			temp.y = 69;
			temp.elementsContent = [headbg_i(),lbName_i()];
			return temp;
		}

		private function grpZhanli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhanli = temp;
			temp.name = "grpZhanli";
			temp.x = 632;
			temp.y = 548;
			temp.elementsContent = [NumZhanli_i(),ui_zhandou_i()];
			return temp;
		}

		private function headbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headbg = temp;
			temp.name = "headbg";
			temp.styleName = "ui/app/paihangbang/mingzikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 159;
			temp.y = 547;
			return temp;
		}

		private function lbMiaosu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMiaosu = temp;
			temp.name = "lbMiaosu";
			temp.htmlText = "在提升<font color='#00ff33'>400000</font>战力即可上榜，一览纵英雄风采！";
			temp.textAlign = "center";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 408;
			temp.x = 94;
			temp.y = 269;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "段位奖励详情";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 439;
			temp.y = 510;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "姓名六个字的";
			temp.textAlign = "center";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 151;
			temp.x = 35;
			temp.y = 8;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			var skin:StateSkin = new org.mokylin.skin.common.Flip2_Skin()
			temp.skin = skin
			temp.width = 169;
			temp.x = 211;
			temp.y = 452;
			return temp;
		}

		private function uiLevelName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevelName = temp;
			temp.name = "uiLevelName";
			temp.styleName = "ui/app/paihangbang/icon/name2/1001.png";
			temp.x = 146;
			temp.y = 525;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/paihangbang/icon/1001_min.png";
			temp.x = 141;
			temp.y = 479;
			return temp;
		}

		private function uiTongjizhong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTongjizhong = temp;
			temp.name = "uiTongjizhong";
			temp.styleName = "ui/app/paihangbang/word/niweishangbang.png";
			temp.x = 146;
			temp.y = 219;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/app/paihangbang/word/zongzhanli.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.height = 364;
			temp.width = 368;
			temp.x = 571;
			temp.y = 134;
			temp.elementsContent = [Icbg0_i(),Icbg5_i(),Icbg1_i(),Icbg6_i(),Icbg2_i(),Icbg7_i(),Icbg3_i(),Icbg8_i(),Icbg4_i(),Icbg10_i(),Icbg9_i(),Icbg11_i()];
			return temp;
		}

	}
}