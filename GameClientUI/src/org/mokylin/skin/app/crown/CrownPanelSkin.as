package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close_4;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 590;
			this.width = 950;
			labelFilterBlack_i();
			this.elementsContent = [__CrownPanelSkin_UIAsset1_i(),btnClose_i(),tabBar_i(),__CrownPanelSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['国  王','内政管理','外交管理','官员任命','国库管理','征  战','禁卫军'];
			return temp;
		}

		private function __CrownPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			temp.horizontalAlign = "left";
			return temp;
		}

		private function __CrownPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 590;
			temp.styleName = "ui/big_bg/wangquan_di.png";
			temp.width = 950;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/crown/wangquan.png";
			temp.x = 458;
			temp.y = 13;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_4);
			temp.x = 890;
			temp.y = 39;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 34;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarXiaofenye);
			temp.width = 616;
			temp.x = 56;
			temp.y = 51;
			temp.layout = __CrownPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __CrownPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}