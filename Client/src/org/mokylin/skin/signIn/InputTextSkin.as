package org.mokylin.skin.signIn
{
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class InputTextSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __InputTextSkin_UIAsset1:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function InputTextSkin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 36;
			this.width = 355;
			this.elementsContent = [textDisplay_i()];
			__InputTextSkin_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/signIn/shurukuang.png", "enabled":"ui/signIn/shurukuang.png", "focused":"ui/signIn/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __InputTextSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__InputTextSkin_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/signIn/shurukuang.png";
			temp.top = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 4;
			temp.left = 10;
			temp.right = 10;
			temp.fontSize = 14;
			temp.text = "请输入";
			temp.textAlign = "left";
			temp.color = 0xFFFFFF;
			temp.top = 6;
			return temp;
		}

	}
}