package org.mokylin.skin.component.text
{
	import feathers.controls.text.Fontter;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TextBlankSkin extends feathers.controls.StateSkin
	{
		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextBlankSkin()
		{
			super();
			
			this.currentState = "focused";
			this.elementsContent = [textDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 1;
			temp.height = 44;
			temp.left = 2;
			temp.right = 2;
			temp.text = "asdfads";
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.top = 1;
			temp.width = 147;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

	}
}