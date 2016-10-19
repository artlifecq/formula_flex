package org.mokylin.skin.app.countryWar
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DeclareWarPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnDeclareWar:feathers.controls.Button;

		public var groupRadio:feathers.controls.Group;

		public var labMoney:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DeclareWarPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 458;
			this.width = 515;
			this.elementsContent = [__DeclareWarPanelSkin_UIAsset1_i(),__DeclareWarPanelSkin_Label1_i(),groupRadio_i(),labMoney_i(),btnDeclareWar_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DeclareWarPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "宣 战";
			temp.color = 0xFFFFFF;
			temp.width = 41;
			temp.x = 236.5;
			temp.y = 11;
			return temp;
		}

		private function __DeclareWarPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 454;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 514;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __DeclareWarPanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 10;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 479;
			temp.y = 6;
			return temp;
		}

		private function btnDeclareWar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDeclareWar = temp;
			temp.name = "btnDeclareWar";
			temp.height = 30;
			temp.label = "宣 战";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 118;
			temp.x = 203;
			temp.y = 383;
			return temp;
		}

		private function groupRadio_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupRadio = temp;
			temp.name = "groupRadio";
			temp.height = 229;
			temp.width = 344;
			temp.x = 40;
			temp.y = 62;
			temp.layout = __DeclareWarPanelSkin_VerticalLayout1_i();
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.bold = true;
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "宣战消耗：1 银两";
			temp.color = 0xFF0000;
			temp.width = 208;
			temp.x = 44;
			temp.y = 327;
			return temp;
		}

	}
}