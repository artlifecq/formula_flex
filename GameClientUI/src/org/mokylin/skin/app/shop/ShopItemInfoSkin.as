package org.mokylin.skin.app.shop
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_yellow;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopItemInfoSkin extends feathers.controls.StateSkin
	{
		public var btnBuy:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopItemInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 384;
			this.width = 657;
			this.elementsContent = [btnBuy_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btnBuy_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBuy = temp;
			temp.name = "btnBuy";
			temp.label = "购买";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow);
			temp.x = 567;
			temp.y = 11;
			return temp;
		}

	}
}