package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang;
	import org.mokylin.skin.component.tabbar.TabBarSkin_normal;
	import org.mokylin.skin.component.text.TextInputV3_2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoAd:feathers.controls.Button;

		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var changeStall:feathers.controls.Button;

		public var dragSprite:feathers.controls.UIAsset;

		public var getStallArea:feathers.controls.Button;

		public var openBagSetGoods:feathers.controls.Label;

		public var stallCost:feathers.controls.Label;

		public var stallCostTitle:feathers.controls.Label;

		public var stallName:feathers.controls.TextInput;

		public var stallSellNum:feathers.controls.Label;

		public var stallType:feathers.controls.Label;

		public var startStall:feathers.controls.Button;

		public var stopAutoAd:feathers.controls.Button;

		public var tabBar:feathers.controls.TabBar;

		public var typeNumName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnClose_i(),tabBar_i(),stallName_i(),changeStall_i(),getStallArea_i(),startStall_i(),autoAd_i(),stopAutoAd_i(),__StallPanelSkin_UIAsset1_i(),dragSprite_i(),__StallPanelSkin_UIAsset2_i(),stallType_i(),typeNumName_i(),stallSellNum_i(),stallCost_i(),stallCostTitle_i(),openBagSetGoods_i(),__StallPanelSkin_UIAsset3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __StallPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['出售货物','收购货物','销售记录'];
			return temp;
		}

		private function __StallPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 4;
			return temp;
		}

		private function __StallPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 658;
			temp.x = 48;
			temp.y = 4;
			return temp;
		}

		private function __StallPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/stall/tanwei_type.png";
			temp.x = 28;
			temp.y = 42;
			return temp;
		}

		private function __StallPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/stall/title.png";
			temp.x = 356;
			temp.y = 8;
			return temp;
		}

		private function autoAd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			autoAd = temp;
			temp.name = "autoAd";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "自动喊话";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 85;
			temp.x = 477;
			temp.y = 405;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 460;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 758;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 25;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.width = 25;
			temp.x = 722;
			temp.y = 6;
			return temp;
		}

		private function changeStall_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			changeStall = temp;
			temp.name = "changeStall";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "更改摊位";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 89;
			temp.x = 652;
			temp.y = 38;
			return temp;
		}

		private function dragSprite_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			dragSprite = temp;
			temp.name = "dragSprite";
			temp.height = 307;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/nei_kuang.png";
			temp.width = 738;
			temp.x = 11;
			temp.y = 98;
			return temp;
		}

		private function getStallArea_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			getStallArea = temp;
			temp.name = "getStallArea";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "查看摆摊区域";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 122;
			temp.x = 619;
			temp.y = 405;
			return temp;
		}

		private function openBagSetGoods_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			openBagSetGoods = temp;
			temp.name = "openBagSetGoods";
			temp.fontSize = 14;
			temp.text = "请打开背包放置物品";
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 599;
			temp.y = 375;
			return temp;
		}

		private function stallCostTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			stallCostTitle = temp;
			temp.name = "stallCostTitle";
			temp.fontSize = 14;
			temp.text = "摆摊费用:";
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 154;
			temp.y = 410;
			return temp;
		}

		private function stallCost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			stallCost = temp;
			temp.name = "stallCost";
			temp.fontSize = 14;
			temp.text = "银两20两";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 221;
			temp.y = 410;
			return temp;
		}

		private function stallName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			stallName = temp;
			temp.name = "stallName";
			temp.prompt = "请输入摊位名称";
			temp.styleClass = org.mokylin.skin.component.text.TextInputV3_2Skin;
			temp.width = 615;
			temp.x = 35;
			temp.y = 40;
			return temp;
		}

		private function stallSellNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			stallSellNum = temp;
			temp.name = "stallSellNum";
			temp.fontSize = 14;
			temp.text = "0/8";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 98;
			temp.y = 410;
			return temp;
		}

		private function stallType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			stallType = temp;
			temp.name = "stallType";
			temp.fontSize = 14;
			temp.text = "高级摊位";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 35;
			temp.y = 44;
			return temp;
		}

		private function startStall_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			startStall = temp;
			temp.name = "startStall";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "开始摆摊";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang;
			temp.color = 0xF9F0CC;
			temp.width = 85;
			temp.x = 340;
			temp.y = 405;
			return temp;
		}

		private function stopAutoAd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			stopAutoAd = temp;
			temp.name = "stopAutoAd";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "取消喊话(喊话中：60s)";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 173;
			temp.x = 436;
			temp.y = 405;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 105;
			temp.gap = 0;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_normal;
			temp.width = 547;
			temp.x = 27;
			temp.y = 72;
			temp.layout = __StallPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __StallPanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function typeNumName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			typeNumName = temp;
			temp.name = "typeNumName";
			temp.fontSize = 14;
			temp.text = "出售货架:";
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 34;
			temp.y = 410;
			return temp;
		}

	}
}