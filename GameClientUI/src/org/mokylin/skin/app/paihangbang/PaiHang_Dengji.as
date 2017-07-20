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
	import org.mokylin.skin.common.Flip1_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHang_Dengji extends feathers.controls.StateSkin
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

		public var btnAll:feathers.controls.Button;

		public var gprNo:feathers.controls.Group;

		public var grpHead:feathers.controls.Group;

		public var grpKillIcon:feathers.controls.Group;

		public var grpRight:feathers.controls.Group;

		public var grpZhanli:feathers.controls.Group;

		public var headbg:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var uiTongjizhong:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHang_Dengji()
		{
			super();
			
			this.currentState = "normal";
			this.height = 522;
			this.width = 766;
			this.elementsContent = [grpRight_i(),btnAll_i(),skinFlip_i(),__PaiHang_Dengji_Group1_i(),__PaiHang_Dengji_Group2_i(),__PaiHang_Dengji_Group3_i(),uiTongjizhong_i()];
			
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

		private function __PaiHang_Dengji_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 417;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset5_i(),__PaiHang_Dengji_UIAsset6_i()];
			return temp;
		}

		private function __PaiHang_Dengji_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 45;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset7_i(),__PaiHang_Dengji_UIAsset8_i(),__PaiHang_Dengji_UIAsset9_i(),__PaiHang_Dengji_UIAsset10_i(),__PaiHang_Dengji_UIAsset11_i(),__PaiHang_Dengji_UIAsset12_i(),__PaiHang_Dengji_UIAsset13_i(),__PaiHang_Dengji_UIAsset14_i(),__PaiHang_Dengji_UIAsset15_i(),__PaiHang_Dengji_UIAsset16_i(),__PaiHang_Dengji_UIAsset17_i(),__PaiHang_Dengji_UIAsset18_i(),__PaiHang_Dengji_UIAsset19_i()];
			return temp;
		}

		private function __PaiHang_Dengji_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 18;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset20_i(),__PaiHang_Dengji_UIAsset21_i(),__PaiHang_Dengji_UIAsset22_i(),__PaiHang_Dengji_UIAsset23_i(),__PaiHang_Dengji_UIAsset24_i(),__PaiHang_Dengji_UIAsset25_i(),__PaiHang_Dengji_UIAsset26_i(),__PaiHang_Dengji_UIAsset27_i()];
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 93;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 124;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 186;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 217;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 248;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 279;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 310;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 341;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 397;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/bg2.png";
			temp.x = 0;
			temp.y = 471;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 61;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 131;
			temp.x = 61;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 61;
			temp.x = 192;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 141;
			temp.x = 253;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/paiming.png";
			temp.x = 17;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xingming.png";
			temp.x = 113;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset26_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/zhiye.png";
			temp.x = 208;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset27_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/dengji.png";
			temp.x = 309;
			temp.y = 5;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg0.png";
			temp.x = 5;
			temp.y = 20;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/paihangbang/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/xuweiyidai.png";
			temp.x = 84;
			temp.y = 102;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/word/wodepaiming.png";
			temp.x = 170;
			temp.y = 4;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 31;
			return temp;
		}

		private function __PaiHang_Dengji_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 394;
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function btnAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAll = temp;
			temp.name = "btnAll";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "全平台排行榜";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 121;
			temp.x = 260;
			temp.y = 479;
			return temp;
		}

		private function gprNo_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gprNo = temp;
			temp.name = "gprNo";
			temp.x = 74;
			temp.y = 86;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset3_i(),__PaiHang_Dengji_UIAsset4_i()];
			return temp;
		}

		private function grpHead_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHead = temp;
			temp.name = "grpHead";
			temp.x = 76;
			temp.y = 0;
			temp.elementsContent = [headbg_i(),lbName_i()];
			return temp;
		}

		private function grpKillIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpKillIcon = temp;
			temp.name = "grpKillIcon";
			temp.x = 9;
			temp.y = 410;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i()];
			return temp;
		}

		private function grpRight_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpRight = temp;
			temp.name = "grpRight";
			temp.x = 396;
			temp.y = 0;
			temp.elementsContent = [__PaiHang_Dengji_UIAsset1_i(),__PaiHang_Dengji_UIAsset2_i(),grpHead_i(),gprNo_i(),grpZhanli_i(),grpKillIcon_i(),weapons_i()];
			return temp;
		}

		private function grpZhanli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhanli = temp;
			temp.name = "grpZhanli";
			temp.x = 63;
			temp.y = 479;
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
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 59;
			temp.y = 0;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 118;
			temp.y = 0;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 177;
			temp.y = 0;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 237;
			temp.y = 0;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/app/paihangbang/weikaiqi.png";
			temp.x = 297;
			temp.y = 0;
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
			var skin:StateSkin = new org.mokylin.skin.common.Flip1_Skin()
			temp.skin = skin
			temp.width = 122;
			temp.x = 100;
			temp.y = 484;
			return temp;
		}

		private function uiTongjizhong_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiTongjizhong = temp;
			temp.name = "uiTongjizhong";
			temp.styleName = "ui/app/paihangbang/word/paimingtongji.png";
			temp.x = 23;
			temp.y = 192;
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
			temp.x = 2;
			temp.y = 40;
			temp.elementsContent = [Icbg0_i(),Icbg5_i(),Icbg1_i(),Icbg6_i(),Icbg2_i(),Icbg7_i(),Icbg3_i(),Icbg8_i(),Icbg4_i(),Icbg10_i(),Icbg9_i(),Icbg11_i()];
			return temp;
		}

	}
}