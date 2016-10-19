package org.mokylin.skin.app.family
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.text.TextAreaSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyCreatAgreementPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAgree:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var labInfo:feathers.controls.TextArea;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyCreatAgreementPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyCreatAgreementPanelSkin_UIAsset1_i(),btnClose_i(),__FamilyCreatAgreementPanelSkin_Label1_i(),btnAgree_i(),labInfo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyCreatAgreementPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 18;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "家族协议";
			temp.textAlign = "center";
			temp.color = 0xDED8C7;
			temp.width = 88;
			temp.x = 162;
			temp.y = 8;
			return temp;
		}

		private function __FamilyCreatAgreementPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 382;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 412;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAgree_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAgree = temp;
			temp.name = "btnAgree";
			temp.label = "同意";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 96;
			temp.x = 158;
			temp.y = 329;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 372;
			temp.y = 3;
			return temp;
		}

		private function labInfo_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 258;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin);
			temp.text = "sssss";
			temp.width = 345;
			temp.x = 33;
			temp.y = 48;
			return temp;
		}

	}
}