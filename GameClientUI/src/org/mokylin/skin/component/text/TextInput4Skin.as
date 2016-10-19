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
	public class TextInput4Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __TextInput4Skin_UIAsset1:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextInput4Skin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 24;
			this.width = 160;
			this.elementsContent = [textDisplay_i()];
			bg_i();
			__TextInput4Skin_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/common/kang/shurukuang.png", "enabled":"ui/common/kang/shurukuang.png", "focused":"ui/component/text/select.png,ui/common/kang/shurukuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TextInput4Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TextInput4Skin_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.top = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/text/select.png";
			temp.top = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.color = 0xCAAF94;
			temp.top = 0;
			return temp;
		}

	}
}