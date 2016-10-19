package org.mokylin.skin.app.country
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.country.JinWeiJunMemberPanelSkin;
	import org.mokylin.skin.app.country.JinWeiJunRecruitmentPanelSkin;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JinWeiJunTabItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var jinWeiJunPanel:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;

		public var zhaoMuPanel:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JinWeiJunTabItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [tabBar_i(),zhaoMuPanel_i(),jinWeiJunPanel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JinWeiJunTabItemSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['招募','禁卫军'];
			return temp;
		}

		private function __JinWeiJunTabItemSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function jinWeiJunPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			jinWeiJunPanel = temp;
			temp.name = "jinWeiJunPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.JinWeiJunMemberPanelSkin()
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
			temp.layout = __JinWeiJunTabItemSkin_HorizontalLayout1_i();
			temp.dataProvider = __JinWeiJunTabItemSkin_ArrayCollection1_i();
			return temp;
		}

		private function zhaoMuPanel_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			zhaoMuPanel = temp;
			temp.name = "zhaoMuPanel";
			temp.height = 496;
			var skin:StateSkin = new org.mokylin.skin.app.country.JinWeiJunRecruitmentPanelSkin()
			temp.skin = skin
			temp.width = 883;
			temp.x = 1;
			temp.y = 29;
			return temp;
		}

	}
}