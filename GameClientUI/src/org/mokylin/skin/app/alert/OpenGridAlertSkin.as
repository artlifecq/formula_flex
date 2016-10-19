package org.mokylin.skin.app.alert
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class OpenGridAlertSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var imgBG:feathers.controls.UIAsset;

		public var labProps:feathers.controls.Label;

		public var labTile:feathers.controls.Label;

		public var labTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function OpenGridAlertSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 206;
			this.width = 300;
			this.elementsContent = [imgBG_i(),__OpenGridAlertSkin_UIAsset1_i(),labProps_i(),labTime_i(),labTile_i(),btnOk_i(),btnCancel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __OpenGridAlertSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 111;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 281;
			temp.x = 9;
			temp.y = 41;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.height = 29;
			temp.label = "取消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
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
			temp.width = 80;
			temp.x = 49;
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

		private function labProps_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labProps = temp;
			temp.name = "labProps";
			temp.bold = false;
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "+1";
			temp.textAlign = "center";
			temp.color = 0x02AA1B;
			temp.width = 280;
			temp.x = 10;
			temp.y = 86;
			return temp;
		}

		private function labTile_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTile = temp;
			temp.name = "labTile";
			temp.height = 19;
			temp.htmlText = "立即开启";
			temp.textAlign = "center";
			temp.color = 0xC8B68A;
			temp.width = 200;
			temp.x = 50;
			temp.y = 52;
			return temp;
		}

		private function labTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTime = temp;
			temp.name = "labTime";
			temp.htmlText = "开启倒计时";
			temp.color = 0x73705F;
			temp.width = 170;
			temp.x = 72;
			temp.y = 110;
			return temp;
		}

	}
}