package org.mokylin.skin.app.zhanchang.paihangbang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.button.ButtonFangdajing;
	import org.mokylin.skin.app.zhanchang.paihangbang.PaiHangAlll_Skin;
	import org.mokylin.skin.common.Flip3_Skin;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class KuaFuPaiHang_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnGlass:feathers.controls.Button;

		public var btnJiangli:feathers.controls.Button;

		public var btnMsg:feathers.controls.Button;

		public var grpMy:feathers.controls.Group;

		public var icon2:feathers.controls.UIAsset;

		public var lbMsg:feathers.controls.Label;

		public var lbRoleName:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;

		public var skinRank:feathers.controls.SkinnableContainer;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiLevelName:feathers.controls.UIAsset;

		public var uiRight:feathers.controls.UIAsset;

		public var uiRole:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function KuaFuPaiHang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__KuaFuPaiHang_Skin_UIAsset1_i(),__KuaFuPaiHang_Skin_UIAsset2_i(),__KuaFuPaiHang_Skin_UIAsset3_i(),__KuaFuPaiHang_Skin_UIAsset4_i(),uiRight_i(),__KuaFuPaiHang_Skin_UIAsset5_i(),__KuaFuPaiHang_Skin_Group1_i(),grpMy_i(),__KuaFuPaiHang_Skin_UIAsset16_i(),NumZhanli_i(),btnMsg_i(),__KuaFuPaiHang_Skin_UIAsset17_i(),lbRoleName_i(),btnGlass_i(),__KuaFuPaiHang_Skin_UIAsset18_i(),__KuaFuPaiHang_Skin_UIAsset19_i(),uiLevel_i(),uiLevelName_i(),__KuaFuPaiHang_Skin_Label1_i(),lbMsg_i(),btnJiangli_i(),skinFlip_i(),icon2_i(),skinRank_i(),uiRole_i()];
			
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
			temp.x = 714;
			temp.y = 546;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 22;
			temp.y = 86;
			temp.elementsContent = [__KuaFuPaiHang_Skin_UIAsset6_i(),__KuaFuPaiHang_Skin_UIAsset7_i(),__KuaFuPaiHang_Skin_UIAsset8_i(),__KuaFuPaiHang_Skin_UIAsset9_i(),__KuaFuPaiHang_Skin_UIAsset10_i(),__KuaFuPaiHang_Skin_UIAsset11_i(),__KuaFuPaiHang_Skin_UIAsset12_i(),__KuaFuPaiHang_Skin_UIAsset13_i()];
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "(今日可领取昨日的段位奖励)";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 255;
			temp.y = 511;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paiming.png";
			temp.x = 29;
			temp.y = 5;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/xingming.png";
			temp.x = 183;
			temp.y = 5;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/duanwei.png";
			temp.x = 336;
			temp.y = 5;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jifen.png";
			temp.x = 456;
			temp.y = 5;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/wenzikuang.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/wodepaiming.png";
			temp.x = 245;
			temp.y = 4;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/zongzhanli.png";
			temp.x = 651;
			temp.y = 548;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/lan.png";
			temp.x = 688;
			temp.y = 88;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/zuoripaiwei.png";
			temp.x = 36;
			temp.y = 510;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/meiripaiweijiangli.png";
			temp.x = 36;
			temp.y = 553;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 508;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 366;
			temp.x = 569;
			temp.y = 84;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanchang/paihangbang/kuafupaihangbang.png";
			temp.x = 418;
			temp.y = 17;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/bg1.png";
			temp.x = 21;
			temp.y = 480;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/list.png";
			temp.width = 545;
			temp.x = 22;
			temp.y = 416;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 86;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 221;
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 88;
			temp.x = 307;
			temp.y = 0;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 151;
			temp.x = 395;
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

		private function btnGlass_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGlass = temp;
			temp.name = "btnGlass";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonFangdajing;
			temp.x = 810;
			temp.y = 91;
			return temp;
		}

		private function btnJiangli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJiangli = temp;
			temp.name = "btnJiangli";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 88;
			temp.x = 447;
			temp.y = 547;
			return temp;
		}

		private function btnMsg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMsg = temp;
			temp.name = "btnMsg";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 906;
			temp.y = 92;
			return temp;
		}

		private function grpMy_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpMy = temp;
			temp.name = "grpMy";
			temp.x = 21;
			temp.y = 391;
			temp.elementsContent = [__KuaFuPaiHang_Skin_UIAsset14_i(),__KuaFuPaiHang_Skin_UIAsset15_i()];
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 140;
			temp.y = 547;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "段位奖励详情";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 445;
			temp.y = 511;
			return temp;
		}

		private function lbRoleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRoleName = temp;
			temp.name = "lbRoleName";
			temp.text = "玩家名六个字";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 90;
			temp.x = 719;
			temp.y = 96;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.common.Flip3_Skin()
			temp.skin = skin
			temp.width = 169;
			temp.x = 211;
			temp.y = 451;
			return temp;
		}

		private function skinRank_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRank = temp;
			temp.name = "skinRank";
			temp.height = 557;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.paihangbang.PaiHangAlll_Skin()
			temp.skin = skin
			temp.width = 321;
			temp.x = 947;
			temp.y = 44;
			return temp;
		}

		private function uiLevelName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevelName = temp;
			temp.name = "uiLevelName";
			temp.styleName = "ui/app/zhanchang/icon/name2/1001.png";
			temp.x = 124;
			temp.y = 524;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/zhanchang/icon/1001_min.png";
			temp.x = 119;
			temp.y = 478;
			return temp;
		}

		private function uiRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiRight = temp;
			temp.name = "uiRight";
			temp.height = 498;
			temp.styleName = "ui/big_bg/zhanchang/paihang_bg.jpg";
			temp.width = 359;
			temp.x = 574;
			temp.y = 89;
			return temp;
		}

		private function uiRole_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiRole = temp;
			temp.name = "uiRole";
			temp.height = 380;
			temp.styleName = "ui/common/hover/xuanqukuang2_alpha.png";
			temp.width = 250;
			temp.x = 630;
			temp.y = 139;
			return temp;
		}

	}
}