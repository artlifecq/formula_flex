package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CreateTextInputSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __CreateTextInputSkin_UIAsset1:feathers.controls.UIAsset;

		public var __CreateTextInputSkin_UIAsset2:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CreateTextInputSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 270;
			this.elementsContent = [textDisplay_i()];
			__CreateTextInputSkin_UIAsset1_i();
			__CreateTextInputSkin_UIAsset2_i();
			
			
			states = {
			};
			skinNames={"enabled":"ui/app/country/bangpai/shurukuang.png", "focused":"ui/app/country/bangpai/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CreateTextInputSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CreateTextInputSkin_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/country/bangpai/shurukuang.png";
			temp.top = 0;
			return temp;
		}

		private function __CreateTextInputSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__CreateTextInputSkin_UIAsset2 = temp;
			temp.height = 36;
			temp.left = 0;
			temp.styleName = "ui/app/country/bangpai/shurukuang.png";
			temp.top = 0;
			temp.width = 270;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 1;
			temp.left = 4;
			temp.right = 6;
			temp.fontSize = 14;
			temp.text = "家族名字";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 9;
			return temp;
		}

	}
}