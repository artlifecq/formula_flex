package org.mokylin.skin.app.meiren
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.meiren.MeiRen_Item;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou2;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var avatarGrp:feathers.controls.Group;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnInfo:feathers.controls.Button;

		public var btnJinjie:feathers.controls.Button;

		public var btnLijin:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var btnTiaozhan:feathers.controls.Button;

		public var btnYuanbao:feathers.controls.Button;

		public var gBuy:feathers.controls.Group;

		public var grpIcon:feathers.controls.Group;

		public var ico_up:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var icon7:feathers.controls.UIAsset;

		public var icon8:feathers.controls.UIAsset;

		public var icon9:feathers.controls.UIAsset;

		public var lbContent:feathers.controls.Label;

		public var lbLijin:feathers.controls.Label;

		public var lbYuanbao:feathers.controls.Label;

		public var num_lv:feathers.controls.UINumber;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiLijin:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiOK:feathers.controls.UIAsset;

		public var uiYuanbao:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__MeiRen_Skin_UIAsset1_i(),__MeiRen_Skin_UIAsset2_i(),__MeiRen_Skin_UIAsset3_i(),btnPrev_i(),btnNext_i(),avatarGrp_i(),grpIcon_i(),gBuy_i(),btnTiaozhan_i(),uiName_i(),uiLevel_i(),__MeiRen_Skin_Group1_i(),__MeiRen_Skin_Group2_i(),__MeiRen_Skin_Group3_i(),icon_i(),btnJinjie_i(),btnInfo_i(),uiOK_i(),lbContent_i(),__MeiRen_Skin_SkinnableContainer5_i(),__MeiRen_Skin_Group4_i(),ico_up_i(),num_lv_i()];
			
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
			temp.label = "629845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 141;
			temp.x = 91;
			temp.y = 10;
			return temp;
		}

		private function __MeiRen_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 683;
			temp.y = 232;
			temp.elementsContent = [__MeiRen_Skin_UIAsset4_i(),__MeiRen_Skin_UIAsset5_i(),__MeiRen_Skin_UIAsset6_i()];
			return temp;
		}

		private function __MeiRen_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 683;
			temp.y = 429;
			temp.elementsContent = [__MeiRen_Skin_UIAsset7_i(),__MeiRen_Skin_UIAsset8_i(),__MeiRen_Skin_UIAsset9_i()];
			return temp;
		}

		private function __MeiRen_Skin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 683;
			temp.y = 516;
			temp.elementsContent = [__MeiRen_Skin_UIAsset10_i(),__MeiRen_Skin_UIAsset11_i(),__MeiRen_Skin_UIAsset12_i()];
			return temp;
		}

		private function __MeiRen_Skin_Group4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 61;
			temp.width = 206;
			temp.x = 694;
			temp.y = 167;
			temp.layout = __MeiRen_Skin_HorizontalLayout1_i();
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i()];
			return temp;
		}

		private function __MeiRen_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			temp.horizontalAlign = "center";
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __MeiRen_Skin_SkinnableContainer5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 200;
			var skin:StateSkin = new org.mokylin.skin.app.meiren.MeiRen_Item()
			temp.skin = skin
			temp.width = 200;
			temp.x = 694;
			temp.y = 257;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 183;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/meiren/meirenjinjie.png";
			temp.x = 89;
			temp.y = 0;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/meiren/bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/meiren/meiren.png";
			temp.x = 454;
			temp.y = 17;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 183;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/meiren/yongjiujiachengshuxing.png";
			temp.x = 71;
			temp.y = 0;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 183;
			temp.y = 7;
			return temp;
		}

		private function __MeiRen_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/meiren/jineng.png";
			temp.x = 101;
			temp.y = 0;
			return temp;
		}

		private function avatarGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			avatarGrp = temp;
			temp.name = "avatarGrp";
			temp.height = 360;
			temp.width = 237;
			temp.x = 317;
			temp.y = 141;
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

		private function btnInfo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnInfo = temp;
			temp.name = "btnInfo";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 910;
			temp.y = 90;
			return temp;
		}

		private function btnJinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJinjie = temp;
			temp.name = "btnJinjie";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "进 阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.x = 769;
			temp.y = 543;
			return temp;
		}

		private function btnLijin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLijin = temp;
			temp.name = "btnLijin";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 203;
			temp.y = 2;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.scaleY = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 68;
			temp.y = 574;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 68;
			temp.y = 100;
			return temp;
		}

		private function btnTiaozhan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTiaozhan = temp;
			temp.name = "btnTiaozhan";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "挑 战";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.x = 367;
			temp.y = 542;
			return temp;
		}

		private function btnYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnYuanbao = temp;
			temp.name = "btnYuanbao";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 86;
			temp.y = 2;
			return temp;
		}

		private function gBuy_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gBuy = temp;
			temp.name = "gBuy";
			temp.x = 298;
			temp.y = 512;
			temp.elementsContent = [uiYuanbao_i(),lbYuanbao_i(),btnYuanbao_i(),uiLijin_i(),lbLijin_i(),btnLijin_i()];
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 182;
			temp.y = 108;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i(),icon7_i(),icon8_i(),icon9_i()];
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
			temp.x = 887;
			temp.y = 189;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/app/meiren/icon/guangqiu.png";
			temp.x = 96;
			temp.y = -18;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 26;
			temp.y = 75;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 13;
			temp.y = 200;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 86;
			temp.y = 296;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 209;
			temp.y = 343;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 332;
			temp.y = 296;
			return temp;
		}

		private function icon7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon7 = temp;
			temp.name = "icon7";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 404;
			temp.y = 197;
			return temp;
		}

		private function icon8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon8 = temp;
			temp.name = "icon8";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 394;
			temp.y = 74;
			return temp;
		}

		private function icon9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon9 = temp;
			temp.name = "icon9";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 324;
			temp.y = -16;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 782;
			temp.y = 458;
			return temp;
		}

		private function lbContent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbContent = temp;
			temp.name = "lbContent";
			temp.fontSize = 18;
			temp.text = "礼金提升";
			temp.textAlign = "center";
			temp.color = 0x41FF65;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 221;
			temp.x = 300;
			temp.y = 480;
			return temp;
		}

		private function lbLijin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLijin = temp;
			temp.name = "lbLijin";
			temp.text = "礼金提升";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 141;
			temp.y = 4;
			return temp;
		}

		private function lbYuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbYuanbao = temp;
			temp.name = "lbYuanbao";
			temp.text = "元宝提升";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 24;
			temp.y = 4;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "100";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv;
			temp.width = 75;
			temp.x = 900;
			temp.y = 186;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/pet/jieshu/12.png";
			temp.x = 874;
			temp.y = 109;
			return temp;
		}

		private function uiLijin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLijin = temp;
			temp.name = "uiLijin";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 117;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/meiren/head_icon/name2.png";
			temp.x = 768;
			temp.y = 120;
			return temp;
		}

		private function uiOK_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOK = temp;
			temp.name = "uiOK";
			temp.styleName = "ui/app/meiren/yidadaozuigaojie.png";
			temp.x = 757;
			temp.y = 550;
			return temp;
		}

		private function uiYuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiYuanbao = temp;
			temp.name = "uiYuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/art_txt/common/zhandouli1.png";
			temp.x = 17;
			temp.y = 4;
			return temp;
		}

	}
}