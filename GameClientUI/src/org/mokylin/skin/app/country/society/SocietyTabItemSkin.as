package org.mokylin.skin.app.country.society
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.country.society.CreateSocietyPanelSkin;
	import org.mokylin.skin.app.country.society.HasOtherCountrySocietyListPanelSkin;
	import org.mokylin.skin.app.country.society.HasSocietyListPanelSkin;
	import org.mokylin.skin.app.country.society.OtherCountrySocietyListPanelSkin;
	import org.mokylin.skin.app.country.society.SocietyBeastPanelSkin;
	import org.mokylin.skin.app.country.society.SocietyBuildPanelSkin;
	import org.mokylin.skin.app.country.society.SocietyEscortPanelSkin;
	import org.mokylin.skin.app.country.society.SocietyInfoPanelSkin;
	import org.mokylin.skin.app.country.society.SocietyListPanelSkin;
	import org.mokylin.skin.app.country.society.SocietySpellPanelSkin;
	import org.mokylin.skin.app.country.society.SocietyTrendsPanelSkin;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyTabItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var createSociecyPanel:feathers.controls.SkinnableContainer;

		public var hasOtherCountrySociecyListPanel:feathers.controls.SkinnableContainer;

		public var hasSocietyListPanel:feathers.controls.SkinnableContainer;

		public var otherCountrySociecyListPanel:feathers.controls.SkinnableContainer;

		public var sociecyInfoPanel:feathers.controls.SkinnableContainer;

		public var societyBeastPanel:feathers.controls.SkinnableContainer;

		public var societyBuildPanel:feathers.controls.SkinnableContainer;

		public var societyEscortPanel:feathers.controls.SkinnableContainer;

		public var societyListPanel:feathers.controls.SkinnableContainer;

		public var societySpellPanel:feathers.controls.SkinnableContainer;

		public var societyTrendsPanel:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyTabItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [tabBar_i(),createSociecyPanel_i(),societyListPanel_i(),hasSocietyListPanel_i(),otherCountrySociecyListPanel_i(),hasOtherCountrySociecyListPanel_i(),sociecyInfoPanel_i(),societyBuildPanel_i(),societySpellPanel_i(),societyBeastPanel_i(),societyEscortPanel_i(),societyTrendsPanel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyTabItemSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['创建家族','申请入族'];
			return temp;
		}

		private function __SocietyTabItemSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function createSociecyPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			createSociecyPanel = temp;
			temp.name = "createSociecyPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.CreateSocietyPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function hasOtherCountrySociecyListPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			hasOtherCountrySociecyListPanel = temp;
			temp.name = "hasOtherCountrySociecyListPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.HasOtherCountrySocietyListPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function hasSocietyListPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			hasSocietyListPanel = temp;
			temp.name = "hasSocietyListPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.HasSocietyListPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function otherCountrySociecyListPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			otherCountrySociecyListPanel = temp;
			temp.name = "otherCountrySociecyListPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.OtherCountrySocietyListPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function sociecyInfoPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sociecyInfoPanel = temp;
			temp.name = "sociecyInfoPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyInfoPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function societyBeastPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			societyBeastPanel = temp;
			temp.name = "societyBeastPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyBeastPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function societyBuildPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			societyBuildPanel = temp;
			temp.name = "societyBuildPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyBuildPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function societyEscortPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			societyEscortPanel = temp;
			temp.name = "societyEscortPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyEscortPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function societyListPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			societyListPanel = temp;
			temp.name = "societyListPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyListPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function societySpellPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			societySpellPanel = temp;
			temp.name = "societySpellPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietySpellPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function societyTrendsPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			societyTrendsPanel = temp;
			temp.name = "societyTrendsPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.society.SocietyTrendsPanelSkin()
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
			temp.layout = __SocietyTabItemSkin_HorizontalLayout1_i();
			temp.dataProvider = __SocietyTabItemSkin_ArrayCollection1_i();
			return temp;
		}

	}
}