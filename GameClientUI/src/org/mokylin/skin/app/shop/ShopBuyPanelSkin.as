package org.mokylin.skin.app.shop
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.NumericStepper;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.stepper.NumericStepperSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopBuyPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnBuy:feathers.controls.Button;

		public var btnCancel:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var grid:feathers.controls.UIAsset;

		public var labName:feathers.controls.Label;

		public var labPrice:feathers.controls.Label;

		public var labStack:feathers.controls.Label;

		public var labTotalPrice:feathers.controls.Label;

		public var lbTitle:feathers.controls.Label;

		public var neiBg:feathers.controls.UIAsset;

		public var steper:feathers.controls.NumericStepper;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopBuyPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),neiBg_i(),btnClose_i(),lbTitle_i(),btnBuy_i(),btnCancel_i(),labName_i(),__ShopBuyPanelSkin_Label1_i(),labPrice_i(),labStack_i(),__ShopBuyPanelSkin_Label2_i(),labTotalPrice_i(),grid_i(),__ShopBuyPanelSkin_Label3_i(),steper_i(),__ShopBuyPanelSkin_UIAsset1_i(),__ShopBuyPanelSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopBuyPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "单价：";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 89;
			temp.y = 74;
			return temp;
		}

		private function __ShopBuyPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "购买总价：";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 74;
			temp.x = 30;
			temp.y = 166;
			return temp;
		}

		private function __ShopBuyPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "购买数量：";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 271;
			temp.x = 30;
			temp.y = 138;
			return temp;
		}

		private function __ShopBuyPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/bang_yin.png";
			temp.width = 20;
			temp.x = 128;
			temp.y = 74;
			return temp;
		}

		private function __ShopBuyPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/bang_yin.png";
			temp.width = 20;
			temp.x = 97;
			temp.y = 166;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 263;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 336;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBuy_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBuy = temp;
			temp.name = "btnBuy";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "购 买";
			temp.letterSpacing = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.color = 0xF9F0CC;
			temp.width = 106;
			temp.x = 43;
			temp.y = 207;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.color = 0xF9F0CC;
			temp.width = 106;
			temp.x = 186;
			temp.y = 207;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 304;
			temp.y = 4;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 32;
			temp.y = 55;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "金刚钻";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 180;
			temp.x = 89;
			temp.y = 53;
			return temp;
		}

		private function labPrice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPrice = temp;
			temp.name = "labPrice";
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "1000000";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 150;
			temp.y = 74;
			return temp;
		}

		private function labStack_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labStack = temp;
			temp.name = "labStack";
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "最大堆叠数：";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 89;
			temp.y = 94;
			return temp;
		}

		private function labTotalPrice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTotalPrice = temp;
			temp.name = "labTotalPrice";
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "1000000";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 180;
			temp.x = 120;
			temp.y = 166;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.bold = false;
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "购 买";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 129;
			temp.y = 14;
			return temp;
		}

		private function neiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			neiBg = temp;
			temp.name = "neiBg";
			temp.height = 158;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/nei_kuang.png";
			temp.width = 300;
			temp.x = 18;
			temp.y = 41;
			return temp;
		}

		private function steper_i():feathers.controls.NumericStepper
		{
			var temp:feathers.controls.NumericStepper = new feathers.controls.NumericStepper();
			steper = temp;
			temp.name = "steper";
			temp.styleClass = org.mokylin.skin.component.stepper.NumericStepperSkin;
			temp.width = 131;
			temp.x = 101;
			temp.y = 138;
			return temp;
		}

	}
}