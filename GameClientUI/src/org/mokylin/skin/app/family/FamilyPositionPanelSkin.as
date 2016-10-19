package org.mokylin.skin.app.family
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
	public class FamilyPositionPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnSetPosition:feathers.controls.Button;

		public var groupRadio:feathers.controls.Group;

		public var labInfo:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyPositionPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyPositionPanelSkin_UIAsset1_i(),__FamilyPositionPanelSkin_Label1_i(),groupRadio_i(),btnSetPosition_i(),btnClose_i(),labInfo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyPositionPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "设置职位";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 107;
			temp.x = 146;
			temp.y = 11;
			return temp;
		}

		private function __FamilyPositionPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 407;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 399;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FamilyPositionPanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
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
			temp.x = 359;
			temp.y = 3;
			return temp;
		}

		private function btnSetPosition_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSetPosition = temp;
			temp.name = "btnSetPosition";
			temp.height = 30;
			temp.label = "设 置";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 118;
			temp.x = 140.5;
			temp.y = 319;
			return temp;
		}

		private function groupRadio_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupRadio = temp;
			temp.name = "groupRadio";
			temp.height = 164;
			temp.width = 344;
			temp.x = 25;
			temp.y = 106;
			temp.layout = __FamilyPositionPanelSkin_VerticalLayout1_i();
			return temp;
		}

		private function labInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labInfo = temp;
			temp.name = "labInfo";
			temp.text = "把 $ [$] 设置成 $";
			temp.width = 310;
			temp.x = 30;
			temp.y = 65;
			return temp;
		}

	}
}