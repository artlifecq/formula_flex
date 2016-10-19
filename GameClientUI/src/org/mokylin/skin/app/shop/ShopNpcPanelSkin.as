package org.mokylin.skin.app.shop
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_yellow;
	import org.mokylin.skin.component.tabbar.TabBtnSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopNpcPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnDown:feathers.controls.Button;

		public var btnUp:feathers.controls.Button;

		public var labPageInfo:feathers.controls.Label;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopNpcPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ShopNpcPanelSkin_UIAsset1_i(),btnClose_i(),__ShopNpcPanelSkin_Label1_i(),tabBar_i(),btnUp_i(),btnDown_i(),labPageInfo_i(),__ShopNpcPanelSkin_Label2_i(),__ShopNpcPanelSkin_Label3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopNpcPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['普通杂货','绑金杂货','历练功勋','家族功勋'];
			return temp;
		}

		private function __ShopNpcPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "商店";
			temp.textAlign = "center";
			temp.color = 0xDED8C7;
			temp.width = 88;
			temp.x = 149;
			temp.y = 9;
			return temp;
		}

		private function __ShopNpcPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "回购区";
			temp.textAlign = "center";
			temp.width = 58;
			temp.x = 37;
			temp.y = 429;
			return temp;
		}

		private function __ShopNpcPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "右键点击可购回";
			temp.textAlign = "center";
			temp.width = 104;
			temp.x = 18;
			temp.y = 451;
			return temp;
		}

		private function __ShopNpcPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 518;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 388;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 348;
			temp.y = 3;
			return temp;
		}

		private function btnDown_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDown = temp;
			temp.name = "btnDown";
			temp.label = "下一页";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow);
			temp.x = 299;
			temp.y = 478;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.label = "上一页";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow);
			temp.x = 53;
			temp.y = 477;
			return temp;
		}

		private function labPageInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPageInfo = temp;
			temp.name = "labPageInfo";
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.width = 65;
			temp.x = 168;
			temp.y = 479;
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
			temp.x = 15;
			temp.y = 39;
			temp.dataProvider = __ShopNpcPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}