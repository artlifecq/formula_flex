package org.mokylin.skin.mainui.map
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.map.button.ButtonDitu;
	import org.mokylin.skin.mainui.map.button.ButtonGm;
	import org.mokylin.skin.mainui.map.button.ButtonGuanwang;
	import org.mokylin.skin.mainui.map.button.ButtonMail;
	import org.mokylin.skin.mainui.map.button.ButtonPaihangbang;
	import org.mokylin.skin.mainui.map.button.ButtonQiehuan;
	import org.mokylin.skin.mainui.map.button.ButtonScaleMax;
	import org.mokylin.skin.mainui.map.button.ButtonScaleMin;
	import org.mokylin.skin.mainui.map.button.ButtonShengyin;
	import org.mokylin.skin.mainui.map.button.ButtonShezhi;
	import org.mokylin.skin.mainui.map.button.ButtonShouqi;
	import org.mokylin.skin.mainui.map.button.ButtonYincang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class map_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var UIMap:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btnGm:feathers.controls.Button;

		public var btnHide:feathers.controls.Check;

		public var btnMail:feathers.controls.Button;

		public var btnMap:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnPaiHang:feathers.controls.Button;

		public var btnSMax:feathers.controls.Button;

		public var btnSMin:feathers.controls.Button;

		public var btnSelect:feathers.controls.Button;

		public var btnSet:feathers.controls.Button;

		public var btnSound:feathers.controls.Check;

		public var btnWeb:feathers.controls.Button;

		public var grp_cont:feathers.controls.Group;

		public var lbLocation:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var uiSelect:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function map_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 235;
			this.width = 218;
			this.elementsContent = [grp_cont_i(),btnClose_i(),btnOpen_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function UIMap_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			UIMap = temp;
			temp.name = "UIMap";
			temp.height = 120;
			temp.width = 120;
			temp.x = 47;
			temp.y = 33;
			return temp;
		}

		private function __map_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/map/ditukuang1.png";
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function __map_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/map/ditukuang.png";
			temp.x = -1;
			temp.y = -27;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonShouqi;
			temp.x = 188;
			temp.y = 4;
			return temp;
		}

		private function btnGm_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGm = temp;
			temp.name = "btnGm";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonGm;
			temp.x = 0;
			temp.y = 86;
			return temp;
		}

		private function btnHide_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnHide = temp;
			temp.name = "btnHide";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonYincang;
			temp.x = 35;
			temp.y = 156;
			return temp;
		}

		private function btnMail_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMail = temp;
			temp.name = "btnMail";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonMail;
			temp.x = 6;
			temp.y = 48;
			return temp;
		}

		private function btnMap_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMap = temp;
			temp.name = "btnMap";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonDitu;
			temp.x = 179;
			temp.y = 124;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonShouqi;
			temp.x = 212;
			temp.y = 4;
			return temp;
		}

		private function btnPaiHang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPaiHang = temp;
			temp.name = "btnPaiHang";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonPaihangbang;
			temp.x = 0;
			temp.y = -23;
			return temp;
		}

		private function btnSMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSMax = temp;
			temp.name = "btnSMax";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonScaleMax;
			temp.x = 183;
			temp.y = 48;
			return temp;
		}

		private function btnSMin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSMin = temp;
			temp.name = "btnSMin";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonScaleMin;
			temp.x = 189;
			temp.y = 86;
			return temp;
		}

		private function btnSelect_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSelect = temp;
			temp.name = "btnSelect";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "1线";
			temp.labelOffsetY = -1;
			temp.letterSpacing = -1;
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonQiehuan;
			temp.color = 0xEAEABC;
			temp.x = 155;
			temp.y = 156;
			return temp;
		}

		private function btnSet_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSet = temp;
			temp.name = "btnSet";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonShezhi;
			temp.x = 10;
			temp.y = 124;
			return temp;
		}

		private function btnSound_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnSound = temp;
			temp.name = "btnSound";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonShengyin;
			temp.x = 166;
			temp.y = 14;
			return temp;
		}

		private function btnWeb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnWeb = temp;
			temp.name = "btnWeb";
			temp.styleClass = org.mokylin.skin.mainui.map.button.ButtonGuanwang;
			temp.x = 88;
			temp.y = 178;
			return temp;
		}

		private function grp_cont_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_cont = temp;
			temp.name = "grp_cont";
			temp.x = 0;
			temp.y = 27;
			temp.elementsContent = [UIMap_i(),__map_Skin_UIAsset1_i(),lbTime_i(),lbLocation_i(),btnMail_i(),btnGm_i(),btnSet_i(),btnHide_i(),btnWeb_i(),btnSound_i(),btnSMax_i(),btnSMin_i(),btnMap_i(),btnSelect_i(),btnPaiHang_i(),__map_Skin_UIAsset2_i(),lbName_i(),uiUp_i(),uiSelect_i()];
			return temp;
		}

		private function lbLocation_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLocation = temp;
			temp.name = "lbLocation";
			temp.fontSize = 12;
			temp.text = "1234-1234";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 89;
			temp.x = 65;
			temp.y = 160;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.leading = 1;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "函谷关五字";
			temp.textAlign = "center";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 146;
			temp.x = 32;
			temp.y = -20;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.fontSize = 12;
			temp.text = "12:04";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 61;
			temp.x = 78;
			temp.y = 0;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/map/button/yincang/select1.png";
			temp.x = 35;
			temp.y = 156;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/map/button/yincang/up1.png";
			temp.x = 35;
			temp.y = 156;
			return temp;
		}

	}
}