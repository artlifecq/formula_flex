package org.mokylin.skin.app.country
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.country.CountryExchequerSkin;
	import org.mokylin.skin.app.country.CountryInfoPanelSkin;
	import org.mokylin.skin.app.country.GuanYuanMingCePanelSkin;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuoJiaTabItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var guanYuanMingCePanel:feathers.controls.SkinnableContainer;

		public var guoJiaXinXiPanel:feathers.controls.SkinnableContainer;

		public var guoKuPanel:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuoJiaTabItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 526;
			this.width = 883;
			this.elementsContent = [tabBar_i(),guoJiaXinXiPanel_i(),guanYuanMingCePanel_i(),guoKuPanel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuoJiaTabItemSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['国家信息','官员名册','国库'];
			return temp;
		}

		private function __GuoJiaTabItemSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function guanYuanMingCePanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guanYuanMingCePanel = temp;
			temp.name = "guanYuanMingCePanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.GuanYuanMingCePanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function guoJiaXinXiPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guoJiaXinXiPanel = temp;
			temp.name = "guoJiaXinXiPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.CountryInfoPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function guoKuPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guoKuPanel = temp;
			temp.name = "guoKuPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.CountryExchequerSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarXiaofenye);
			temp.width = 268;
			temp.x = 24;
			temp.y = 0;
			temp.layout = __GuoJiaTabItemSkin_HorizontalLayout1_i();
			temp.dataProvider = __GuoJiaTabItemSkin_ArrayCollection1_i();
			return temp;
		}

	}
}