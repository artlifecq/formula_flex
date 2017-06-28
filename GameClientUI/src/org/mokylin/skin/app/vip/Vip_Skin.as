package org.mokylin.skin.app.vip
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.vip.VipLevel1;
	import org.mokylin.skin.app.vip.VipLevel2;
	import org.mokylin.skin.app.vip.VipLevel3;
	import org.mokylin.skin.app.vip.button.ButtonLijichongzhi;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Vip_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnChongzhi:feathers.controls.Button;

		public var btnLIngQu:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var imgAcitve:feathers.controls.UIAsset;

		public var imgAttr:feathers.controls.UIAsset;

		public var imgBuy:feathers.controls.UIAsset;

		public var imgMo:feathers.controls.UIAsset;

		public var imgRewardType:feathers.controls.UIAsset;

		public var imgTQ:feathers.controls.UIAsset;

		public var imgVipPrivilegs:feathers.controls.UIAsset;

		public var lb1:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbTime0:feathers.controls.Label;

		public var listVip:feathers.controls.List;

		public var skinVip1:feathers.controls.SkinnableContainer;

		public var skinVip2:feathers.controls.SkinnableContainer;

		public var skinVip3:feathers.controls.SkinnableContainer;

		public var uiVipLevel:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Vip_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__Vip_Skin_UIAsset1_i(),__Vip_Skin_UIAsset2_i(),__Vip_Skin_UIAsset3_i(),__Vip_Skin_UIAsset4_i(),__Vip_Skin_UIAsset5_i(),__Vip_Skin_UIAsset6_i(),uiVipLevel_i(),imgTQ_i(),btnChongzhi_i(),imgMo_i(),imgAcitve_i(),__Vip_Skin_UIAsset7_i(),NumZhanli_i(),skinVip1_i(),skinVip2_i(),skinVip3_i(),__Vip_Skin_UIAsset8_i(),__Vip_Skin_UIAsset9_i(),imgRewardType_i(),imgVipPrivilegs_i(),__Vip_Skin_UIAsset10_i(),__Vip_Skin_UIAsset11_i(),imgBuy_i(),grpIcon_i(),btnLIngQu_i(),__Vip_Skin_UIAsset12_i(),imgAttr_i(),lb1_i(),__Vip_Skin_UIAsset14_i(),__Vip_Skin_UIAsset15_i(),__Vip_Skin_UIAsset16_i(),__Vip_Skin_UIAsset17_i(),__Vip_Skin_Label3_i(),__Vip_Skin_Label4_i(),lbTime_i(),lbTime0_i(),listVip_i()];
			
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
			temp.label = "x6457";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 133;
			temp.x = 811;
			temp.y = 510;
			return temp;
		}

		private function __Vip_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "多种VIP叠加使用，特权效果为最高级别VIP特权效果。";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 465;
			temp.x = 54;
			temp.y = 525;
			return temp;
		}

		private function __Vip_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "多种VIP叠加使用，特权效果持续时相互叠加。";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 465;
			temp.x = 54;
			temp.y = 548;
			return temp;
		}

		private function __Vip_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/tequanshuoming.png";
			temp.x = 265;
			temp.y = 342;
			return temp;
		}

		private function __Vip_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/vipkelingqufuli.png";
			temp.x = 295;
			temp.y = 200;
			return temp;
		}

		private function __Vip_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/bg2.png";
			temp.x = 224;
			temp.y = 276;
			return temp;
		}

		private function __Vip_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/wenzitiao-bg.png";
			temp.x = 28;
			temp.y = 493;
			return temp;
		}

		private function __Vip_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/shuoming.png";
			temp.x = 55;
			temp.y = 499;
			return temp;
		}

		private function __Vip_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 42;
			temp.y = 531;
			return temp;
		}

		private function __Vip_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 42;
			temp.y = 554;
			return temp;
		}

		private function __Vip_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __Vip_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/zhizunVIP.png";
			temp.x = 438;
			temp.y = 17;
			return temp;
		}

		private function __Vip_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/bg.jpg";
			temp.x = 28;
			temp.y = 197;
			return temp;
		}

		private function __Vip_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/banner.jpg";
			temp.x = 27;
			temp.y = 90;
			return temp;
		}

		private function __Vip_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/wupinbeijing.png";
			temp.x = 711;
			temp.y = 197;
			return temp;
		}

		private function __Vip_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/dangqianjibie.png";
			temp.x = 56;
			temp.y = 124;
			return temp;
		}

		private function __Vip_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 739;
			temp.y = 500;
			return temp;
		}

		private function __Vip_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/wenzitiao-bg.png";
			temp.x = 222;
			temp.y = 197;
			return temp;
		}

		private function __Vip_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/wenzitiao-bg.png";
			temp.x = 222;
			temp.y = 338;
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

		private function btnChongzhi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChongzhi = temp;
			temp.name = "btnChongzhi";
			temp.styleClass = org.mokylin.skin.app.vip.button.ButtonLijichongzhi;
			temp.x = 754;
			temp.y = 94;
			return temp;
		}

		private function btnLIngQu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLIngQu = temp;
			temp.name = "btnLIngQu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领 取";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 614;
			temp.y = 236;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 226;
			temp.y = 228;
			temp.elementsContent = [icon1_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgAcitve_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgAcitve = temp;
			temp.name = "imgAcitve";
			temp.styleName = "ui/app/vip/act3.png";
			temp.x = 721;
			temp.y = 547;
			return temp;
		}

		private function imgAttr_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgAttr = temp;
			temp.name = "imgAttr";
			temp.styleName = "ui/app/vip/tq3.png";
			temp.x = 429;
			temp.y = 283;
			return temp;
		}

		private function imgBuy_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBuy = temp;
			temp.name = "imgBuy";
			temp.styleName = "ui/app/vip/jihuo.png";
			temp.x = 231;
			temp.y = 202;
			return temp;
		}

		private function imgMo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMo = temp;
			temp.name = "imgMo";
			temp.styleName = "ui/app/vip/mo3.png";
			temp.x = 883;
			temp.y = 201;
			return temp;
		}

		private function imgRewardType_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgRewardType = temp;
			temp.name = "imgRewardType";
			temp.styleName = "ui/app/vip/vip_name3.png";
			temp.x = 262;
			temp.y = 201;
			return temp;
		}

		private function imgTQ_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTQ = temp;
			temp.name = "imgTQ";
			temp.styleName = "ui/app/vip/duxianghailiangtequan.png";
			temp.x = 57;
			temp.y = 160;
			return temp;
		}

		private function imgVipPrivilegs_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgVipPrivilegs = temp;
			temp.name = "imgVipPrivilegs";
			temp.styleName = "ui/app/vip/vip_name3.png";
			temp.x = 232;
			temp.y = 342;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.text = "攻击：$";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 442;
			temp.x = 244;
			temp.y = 309;
			return temp;
		}

		private function lbTime0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime0 = temp;
			temp.name = "lbTime0";
			temp.text = "(剩余领取次数：$)";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 162;
			temp.x = 420;
			temp.y = 202;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "剩余时间：$";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 298;
			temp.x = 57;
			temp.y = 160;
			return temp;
		}

		private function listVip_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listVip = temp;
			temp.name = "listVip";
			temp.height = 117;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 475;
			temp.x = 229;
			temp.y = 367;
			return temp;
		}

		private function skinVip1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinVip1 = temp;
			temp.name = "skinVip1";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.vip.VipLevel1()
			temp.skin = skin
			temp.width = 190;
			temp.x = 30;
			temp.y = 200;
			return temp;
		}

		private function skinVip2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinVip2 = temp;
			temp.name = "skinVip2";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.vip.VipLevel2()
			temp.skin = skin
			temp.width = 190;
			temp.x = 30;
			temp.y = 297;
			return temp;
		}

		private function skinVip3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinVip3 = temp;
			temp.name = "skinVip3";
			temp.height = 94;
			var skin:StateSkin = new org.mokylin.skin.app.vip.VipLevel3()
			temp.skin = skin
			temp.width = 190;
			temp.x = 30;
			temp.y = 394;
			return temp;
		}

		private function uiVipLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiVipLevel = temp;
			temp.name = "uiVipLevel";
			temp.styleName = "ui/app/vip/nizanweikaitong.png";
			temp.x = 193;
			temp.y = 115;
			return temp;
		}

	}
}