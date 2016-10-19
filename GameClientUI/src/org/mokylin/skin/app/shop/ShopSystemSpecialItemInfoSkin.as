package org.mokylin.skin.app.shop
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.skin_chat.VScrollBarChatSkin;
	import org.mokylin.skin.component.tabbar.TabBtnSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopSystemSpecialItemInfoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var scrollBar:feathers.controls.ScrollContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopSystemSpecialItemInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 383;
			this.width = 208;
			this.elementsContent = [scrollBar_i(),tabBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopSystemSpecialItemInfoSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['人气商品'];
			return temp;
		}

		private function scrollBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollBar = temp;
			temp.name = "scrollBar";
			temp.height = 341;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_chat.VScrollBarChatSkin);
			temp.width = 196;
			temp.x = 5;
			temp.y = 36;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBtnSkin);
			temp.width = 180;
			temp.x = 10;
			temp.y = 9;
			temp.dataProvider = __ShopSystemSpecialItemInfoSkin_ArrayCollection1_i();
			return temp;
		}

	}
}