package org.mokylin.skin.app.shop
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.themes.GuiTheme;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.PageNavigator;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_icon_button;
	import org.mokylin.skin.component.check.CheckBoxSkin_4;
	import org.mokylin.skin.component.page.PageNavigatorSkin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;
	import starling.display.Image;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bg_model:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btnRepair:feathers.controls.Button;

		public var btnRepairAll:feathers.controls.Button;

		public var btnSell:feathers.controls.Button;

		public var cbBuyGroup:feathers.controls.Check;

		public var group:feathers.controls.Group;

		public var head_bg:feathers.controls.UIAsset;

		public var iconTitle:feathers.controls.UIAsset;

		public var neiBg:feathers.controls.UIAsset;

		public var pager:feathers.controls.PageNavigator;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),neiBg_i(),cbBuyGroup_i(),btnClose_i(),head_bg_i(),tabBar_i(),iconTitle_i(),btnRepair_i(),btnRepairAll_i(),btnSell_i(),pager_i(),group_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','回购'];
			return temp;
		}

		private function __ShopPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 3;
			return temp;
		}

		private function __ShopPanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 6;
			temp.paddingTop = 2;
			temp.requestedColumnCount = 2;
			temp.requestedRowCount = 6;
			temp.verticalGap = 4;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 577;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 382;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 355;
			temp.y = 1;
			return temp;
		}

		private function btnRepairAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRepairAll = temp;
			temp.name = "btnRepairAll";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.defaultIcon = new Image(GuiTheme.ins.getTexture("ui/app/shop/repair_all.png"));;
			temp.iconOffsetX = 4;
			temp.label = "全部修理";
			temp.labelOffsetX = -4;
			temp.labelOffsetY = -2;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_icon_button;
			temp.textAlign = "right";
			temp.color = 0xE9C099;
			temp.x = 148.5;
			temp.y = 527;
			return temp;
		}

		private function btnRepair_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRepair = temp;
			temp.name = "btnRepair";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.defaultIcon = new Image(GuiTheme.ins.getTexture("ui/pngx/mouse/repair_up_1.png"));;
			temp.iconOffsetX = 4;
			temp.label = "修理";
			temp.labelOffsetX = -20;
			temp.labelOffsetY = -2;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_icon_button;
			temp.textAlign = "right";
			temp.color = 0xE9C099;
			temp.x = 32;
			temp.y = 527;
			return temp;
		}

		private function btnSell_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSell = temp;
			temp.name = "btnSell";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.defaultIcon = new Image(GuiTheme.ins.getTexture("ui/pngx/mouse/sell_up_1.png"));;
			temp.iconOffsetX = 4;
			temp.label = "批量出售";
			temp.labelOffsetX = -2;
			temp.labelOffsetY = -2;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_icon_button;
			temp.textAlign = "right";
			temp.color = 0xE9C099;
			temp.x = 264;
			temp.y = 527;
			return temp;
		}

		private function cbBuyGroup_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cbBuyGroup = temp;
			temp.name = "cbBuyGroup";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 22;
			temp.label = "双击直接购买一组";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_4;
			temp.textAlign = "left";
			temp.color = 0xCAAF94;
			temp.width = 160;
			temp.x = 14;
			temp.y = 490;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 421;
			temp.width = 356;
			temp.x = 13;
			temp.y = 67;
			temp.layout = __ShopPanelSkin_TileLayout1_i();
			return temp;
		}

		private function head_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_bg = temp;
			temp.name = "head_bg";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 323;
			temp.x = 29;
			temp.y = 3;
			return temp;
		}

		private function iconTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconTitle = temp;
			temp.name = "iconTitle";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/shop/shang_dian.png";
			temp.x = 175;
			temp.y = 6;
			return temp;
		}

		private function neiBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			neiBg = temp;
			temp.name = "neiBg";
			temp.height = 456;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/nei_kuang.png";
			temp.width = 371;
			temp.x = 5;
			temp.y = 64;
			return temp;
		}

		private function pager_i():feathers.controls.PageNavigator
		{
			var temp:feathers.controls.PageNavigator = new feathers.controls.PageNavigator();
			pager = temp;
			temp.name = "pager";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.page.PageNavigatorSkin;
			temp.width = 103;
			temp.x = 265;
			temp.y = 489;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 52;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;
			temp.width = 107;
			temp.x = 22;
			temp.y = 39;
			temp.layout = __ShopPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __ShopPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}