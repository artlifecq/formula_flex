package org.mokylin.skin.app.country
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.country.JiuZhouZhuHouPanelSkin;
	import org.mokylin.skin.app.country.ShiJiPanelSkin;
	import org.mokylin.skin.app.country.TianXiaZhiShiPanelSkin;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TianXiaTabItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var jiuZhouZhuHouPanel:feathers.controls.SkinnableContainer;

		public var shiJiPanel:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;

		public var tianXiaZhiShiPanel:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TianXiaTabItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [tabBar_i(),jiuZhouZhuHouPanel_i(),shiJiPanel_i(),tianXiaZhiShiPanel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TianXiaTabItemSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['九州诸侯','天下之势','史记'];
			return temp;
		}

		private function __TianXiaTabItemSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function jiuZhouZhuHouPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jiuZhouZhuHouPanel = temp;
			temp.name = "jiuZhouZhuHouPanel";
			var skin:StateSkin = new org.mokylin.skin.app.country.JiuZhouZhuHouPanelSkin()
			temp.skin = skin
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

		private function shiJiPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			shiJiPanel = temp;
			temp.name = "shiJiPanel";
			var skin:StateSkin = new org.mokylin.skin.app.country.ShiJiPanelSkin()
			temp.skin = skin
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
			temp.layout = __TianXiaTabItemSkin_HorizontalLayout1_i();
			temp.dataProvider = __TianXiaTabItemSkin_ArrayCollection1_i();
			return temp;
		}

		private function tianXiaZhiShiPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			tianXiaZhiShiPanel = temp;
			temp.name = "tianXiaZhiShiPanel";
			var skin:StateSkin = new org.mokylin.skin.app.country.TianXiaZhiShiPanelSkin()
			temp.skin = skin
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

	}
}