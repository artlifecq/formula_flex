package org.mokylin.skin.app.countryWar
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnDeclareWar:feathers.controls.Button;

		public var labDic:feathers.controls.TextArea;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 378;
			this.width = 500;
			this.elementsContent = [__CountryWarPanelSkin_UIAsset1_i(),btnClose_i(),btnDeclareWar_i(),__CountryWarPanelSkin_Label1_i(),labDic_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryWarPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 17;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "国 战";
			temp.textAlign = "center";
			temp.color = 0xDED8C7;
			temp.width = 120;
			temp.x = 190;
			temp.y = 11;
			return temp;
		}

		private function __CountryWarPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 378;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 500;
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
			temp.x = 465;
			temp.y = 5;
			return temp;
		}

		private function btnDeclareWar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDeclareWar = temp;
			temp.name = "btnDeclareWar";
			temp.height = 28;
			temp.label = "宣     战";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 173;
			temp.x = 163;
			temp.y = 330;
			return temp;
		}

		private function labDic_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labDic = temp;
			temp.name = "labDic";
			temp.height = 90;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "    九州争霸，成王败寇，洛阳称皇，一统天下，强者的荣耀，弱者的守护，所有的一切都由你来主宰！";
			temp.color = 0xDED8C7;
			temp.width = 400;
			temp.x = 50;
			temp.y = 62;
			return temp;
		}

	}
}