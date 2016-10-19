package org.mokylin.skin.app.shop
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import org.mokylin.skin.component.tabbar.TabBtnSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopSystemItemInfoSkin extends feathers.controls.StateSkin
	{
		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopSystemItemInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 466;
			this.width = 646;
			this.elementsContent = [tabBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopSystemItemInfoSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['普通杂货','绑金杂货','历练功勋','家族功勋'];
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.height = 26;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBtnSkin);
			temp.width = 273;
			temp.x = 10;
			temp.y = 9;
			temp.dataProvider = __ShopSystemItemInfoSkin_ArrayCollection1_i();
			return temp;
		}

	}
}