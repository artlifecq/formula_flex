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
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

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


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function KuaFuPaiHang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 956;
			this.elementsContent = [bg_i(),__KuaFuPaiHang_Skin_UIAsset1_i(),__KuaFuPaiHang_Skin_UIAsset2_i(),__KuaFuPaiHang_Skin_UIAsset3_i(),__KuaFuPaiHang_Skin_UIAsset4_i(),uiRight_i(),__KuaFuPaiHang_Skin_UIAsset5_i(),__KuaFuPaiHang_Skin_Group1_i(),grpMy_i(),__KuaFuPaiHang_Skin_UIAsset9_i(),NumZhanli_i(),btnMsg_i(),__KuaFuPaiHang_Skin_UIAsset10_i(),lbRoleName_i(),btnGlass_i(),__KuaFuPaiHang_Skin_UIAsset11_i(),__KuaFuPaiHang_Skin_UIAsset12_i(),uiLevel_i(),uiLevelName_i(),__KuaFuPaiHang_Skin_Label5_i(),lbMsg_i(),btnJiangli_i(),skinFlip_i(),icon2_i(),skinRank_i()];
			
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
			temp.x = 649;
			temp.y = 549;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 25;
			temp.y = 89;
			temp.elementsContent = [__KuaFuPaiHang_Skin_UIAsset6_i(),__KuaFuPaiHang_Skin_Label1_i(),__KuaFuPaiHang_Skin_Label2_i(),__KuaFuPaiHang_Skin_Label3_i(),__KuaFuPaiHang_Skin_Label4_i()];
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "排名";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 6;
			temp.y = 4;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 109;
			temp.y = 4;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "段位";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 262;
			temp.y = 4;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "积分";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 336;
			temp.y = 4;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "(今日可领取昨日的段位奖励)";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 210;
			temp.y = 490;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/lan.png";
			temp.x = 602;
			temp.y = 88;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/zuoripaiwei.png";
			temp.x = 36;
			temp.y = 500;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset12_i():feathers.controls.UIAsset
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
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 502;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 392;
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanchang/paihangbang/kuafupaihangbang.png";
			temp.x = 434;
			temp.y = 26;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/bg1.jpg";
			temp.x = 26;
			temp.y = 445;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/tiao.png";
			temp.x = 25;
			temp.y = 448;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/yeqianlan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/tiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/paihangbang/wodepaiming.png";
			temp.x = 127;
			temp.y = 1;
			return temp;
		}

		private function __KuaFuPaiHang_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 578;
			temp.y = 539;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 587;
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
			temp.x = 724;
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
			temp.width = 80;
			temp.x = 312;
			temp.y = 549;
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
			temp.x = 25;
			temp.y = 358;
			temp.elementsContent = [__KuaFuPaiHang_Skin_UIAsset7_i(),__KuaFuPaiHang_Skin_UIAsset8_i()];
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 140;
			temp.y = 540;
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
			temp.x = 303;
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
			temp.x = 633;
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
			temp.width = 146;
			temp.x = 146;
			temp.y = 415;
			return temp;
		}

		private function skinRank_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinRank = temp;
			temp.name = "skinRank";
			temp.height = 561;
			var skin:StateSkin = new org.mokylin.skin.app.zhanchang.paihangbang.PaiHangAlll_Skin()
			temp.skin = skin
			temp.width = 339;
			temp.x = 960;
			temp.y = 40;
			return temp;
		}

		private function uiLevelName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevelName = temp;
			temp.name = "uiLevelName";
			temp.styleName = "ui/app/zhanchang/icon/name2/1001.png";
			temp.x = 124;
			temp.y = 517;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/zhanchang/icon/1001_min.png";
			temp.x = 119;
			temp.y = 471;
			return temp;
		}

		private function uiRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiRight = temp;
			temp.name = "uiRight";
			temp.height = 502;
			temp.styleName = "ui/big_bg/zhanchang/paihang_bg.jpg";
			temp.width = 520;
			temp.x = 415;
			temp.y = 87;
			return temp;
		}

	}
}