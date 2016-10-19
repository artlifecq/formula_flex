package org.mokylin.skin.app.alert
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SellItemAlertSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.ToggleButton;

		public var btnOk:feathers.controls.Button;

		public var imgBG:feathers.controls.UIAsset;

		public var labTile:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SellItemAlertSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imgBG_i(),__SellItemAlertSkin_UIAsset1_i(),labTile_i(),btnOk_i(),btnCancel_i(),__SellItemAlertSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SellItemAlertSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 111;
			temp.left = 7;
			temp.right = 8;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.y = 41;
			return temp;
		}

		private function __SellItemAlertSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/zmbk.png";
			temp.x = 129;
			temp.y = 59;
			return temp;
		}

		private function btnCancel_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.height = 29;
			temp.label = "取消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 66;
			temp.x = 178;
			temp.y = 158;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.height = 29;
			temp.label = "确定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 66;
			temp.x = 56;
			temp.y = 158;
			return temp;
		}

		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.height = 206;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 300;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labTile_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTile = temp;
			temp.name = "labTile";
			temp.height = 19;
			temp.htmlText = "立即开启<font color='#5DBD37'>[x]个</font>格子你将获得";
			temp.textAlign = "center";
			temp.color = 0xC8B68A;
			temp.width = 200;
			temp.x = 50;
			temp.y = 124;
			return temp;
		}

	}
}