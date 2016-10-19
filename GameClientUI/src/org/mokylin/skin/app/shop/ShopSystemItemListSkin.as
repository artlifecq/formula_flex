package org.mokylin.skin.app.shop
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_yellow;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopSystemItemListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBuy:feathers.controls.Button;

		public var imgEff:feathers.controls.UIAsset;

		public var imgTab:feathers.controls.UIAsset;

		public var labMoney:feathers.controls.Label;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopSystemItemListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__ShopSystemItemListSkin_UIAsset1_i(),imgEff_i(),labName_i(),btnBuy_i(),imgTab_i(),labMoney_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopSystemItemListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 100;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 160;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBuy_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBuy = temp;
			temp.name = "btnBuy";
			temp.label = "抢购";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow);
			temp.x = 109;
			temp.y = 73;
			return temp;
		}

		private function imgEff_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgEff = temp;
			temp.name = "imgEff";
			temp.height = 80;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 148;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function imgTab_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTab = temp;
			temp.name = "imgTab";
			temp.height = 20;
			temp.width = 20;
			temp.x = 3;
			temp.y = 2;
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.width = 100;
			temp.x = 53;
			temp.y = 51;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "金刚钻";
			temp.width = 92;
			temp.x = 64;
			temp.y = 3;
			return temp;
		}

	}
}