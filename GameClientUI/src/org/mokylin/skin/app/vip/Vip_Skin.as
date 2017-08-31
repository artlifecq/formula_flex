package org.mokylin.skin.app.vip
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.vip.VipLevels;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

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
		public var NumZhanli0:feathers.controls.UINumber;

		public var btnClose:feathers.controls.Button;

		public var btnLIngQu:feathers.controls.Button;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var imgAcitve:feathers.controls.UIAsset;

		public var imgMo:feathers.controls.UIAsset;

		public var imgTQ:feathers.controls.UIAsset;

		public var lbTime:feathers.controls.Label;

		public var lbTime0:feathers.controls.Label;

		public var skinVip1:feathers.controls.SkinnableContainer;

		public var skinVip2:feathers.controls.SkinnableContainer;

		public var skinVip3:feathers.controls.SkinnableContainer;

		public var uiModel:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

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
			this.elementsContent = [__Vip_Skin_UIAsset1_i(),__Vip_Skin_UIAsset2_i(),__Vip_Skin_UIAsset3_i(),uiModel_i(),__Vip_Skin_UIAsset4_i(),uiVipLevel_i(),imgTQ_i(),imgMo_i(),imgAcitve_i(),__Vip_Skin_UIAsset5_i(),NumZhanli0_i(),__Vip_Skin_Label1_i(),grpIcon_i(),btnLIngQu_i(),btnClose_i(),skinVip1_i(),skinVip2_i(),skinVip3_i(),lbTime0_i(),lbTime_i(),uiName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumZhanli0_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli0 = temp;
			temp.name = "NumZhanli0";
			temp.gap = -15;
			temp.height = 25;
			temp.label = "x29845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 129;
			temp.x = 902;
			temp.y = 553;
			return temp;
		}

		private function __Vip_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "多种VIP叠加使用，特权效果持续时相互叠加，特权效果最高级别VIP特效效果";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 300;
			temp.y = 597;
			return temp;
		}

		private function __Vip_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/vip/bg.png";
			temp.x = -100;
			temp.y = -68;
			return temp;
		}

		private function __Vip_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/zhizunVIP.png";
			temp.x = 274;
			temp.y = 22;
			return temp;
		}

		private function __Vip_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/banner.png";
			temp.x = 27;
			temp.y = 542;
			return temp;
		}

		private function __Vip_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/vip/dangqianjibie.png";
			temp.x = 133;
			temp.y = 552;
			return temp;
		}

		private function __Vip_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/zhandouli1.png";
			temp.x = 827;
			temp.y = 549;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 854;
			temp.y = 76;
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
			temp.width = 88;
			temp.x = 716;
			temp.y = 553;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 302;
			temp.y = 549;
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
			temp.x = 834;
			temp.y = 590;
			return temp;
		}

		private function imgMo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMo = temp;
			temp.name = "imgMo";
			temp.styleName = "ui/app/vip/mo3.png";
			temp.x = 990;
			temp.y = 345;
			return temp;
		}

		private function imgTQ_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTQ = temp;
			temp.name = "imgTQ";
			temp.styleName = "ui/app/vip/duxianghailiangtequan.png";
			temp.x = -123;
			temp.y = 441;
			return temp;
		}

		private function lbTime0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime0 = temp;
			temp.name = "lbTime0";
			temp.text = "剩余领取次数：$";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 539;
			temp.y = 555;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "倒计时";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 167;
			temp.x = 539;
			temp.y = 576;
			return temp;
		}

		private function skinVip1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinVip1 = temp;
			temp.name = "skinVip1";
			var skin:StateSkin = new org.mokylin.skin.app.vip.VipLevels()
			temp.skin = skin
			temp.x = 114;
			temp.y = 118;
			return temp;
		}

		private function skinVip2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinVip2 = temp;
			temp.name = "skinVip2";
			var skin:StateSkin = new org.mokylin.skin.app.vip.VipLevels()
			temp.skin = skin
			temp.x = 351;
			temp.y = 118;
			return temp;
		}

		private function skinVip3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinVip3 = temp;
			temp.name = "skinVip3";
			var skin:StateSkin = new org.mokylin.skin.app.vip.VipLevels()
			temp.skin = skin
			temp.x = 588;
			temp.y = 118;
			return temp;
		}

		private function uiModel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiModel = temp;
			temp.name = "uiModel";
			temp.styleName = "ui/big_bg/vip/wupinbeijing.png";
			temp.x = 87;
			temp.y = 113;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/vip/vip/baijinjika.png";
			temp.x = 116;
			temp.y = 576;
			return temp;
		}

		private function uiVipLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiVipLevel = temp;
			temp.name = "uiVipLevel";
			temp.styleName = "ui/app/vip/nizanweikaitong.png";
			temp.x = 132;
			temp.y = 581;
			return temp;
		}

	}
}