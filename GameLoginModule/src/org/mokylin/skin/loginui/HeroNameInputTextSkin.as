package org.mokylin.skin.loginui
{
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroNameInputTextSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __HeroNameInputTextSkin_UIAsset1:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroNameInputTextSkin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 36;
			this.width = 355;
			this.elementsContent = [textDisplay_i()];
			__HeroNameInputTextSkin_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/loginui/loginuiOther/shurukuang.png", "enabled":"ui/loginui/loginuiOther/shurukuang.png", "focused":"ui/loginui/loginuiOther/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HeroNameInputTextSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__HeroNameInputTextSkin_UIAsset1 = temp;
			temp.height = 36;
			temp.left = 0;
			temp.styleName = "ui/loginui/loginuiOther/shurukuang.png";
			temp.top = 0;
			temp.width = 355;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bold = true;
			temp.bottom = 3;
			temp.left = 10;
			temp.right = 10;
			temp.fontSize = 16;
			temp.text = "请输入";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.top = 7;
			return temp;
		}

	}
}