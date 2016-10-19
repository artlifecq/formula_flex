package org.mokylin.skin.component.text
{
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TextInput3Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextInput3Skin()
		{
			super();
			
			this.currentState = "focused";
			this.elementsContent = [textDisplay_i()];
			bg_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/common/kang/shurukuang/shurukuang.png", "enabled":"ui/common/kang/shurukuang/shurukuang.png", "focused":"ui/common/kang/shurukuang/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.top = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 2;
			temp.left = 2;
			temp.right = 2;
			temp.color = 0xFFFFFF;
			temp.top = 2;
			return temp;
		}

	}
}