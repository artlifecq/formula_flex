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
	public class TextInputSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __TextInputSkin_UIAsset1:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextInputSkin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 21;
			this.width = 249;
			this.elementsContent = [textDisplay_i()];
			__TextInputSkin_UIAsset1_i();
			
			
			states = {
				init:[
						{target:"textDisplay",
							name:"paddingLeft",
							value:0
						}
					]
			};
			skinNames={"disabled":"ui/component/text/textInput_normal.png", "enabled":"ui/component/text/textInput_normal.png", "focused":"ui/component/text/textInput_normal.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TextInputSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__TextInputSkin_UIAsset1 = temp;
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/text/textInput_normal.png";
			temp.top = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bold = false;
			temp.bottom = -1;
			temp.leading = 1;
			temp.left = 9;
			temp.letterSpacing = 1;
			temp.right = 1;
			temp.fontSize = 12;
			temp.textAlign = "left";
			temp.color = 0xFEFEFE;
			temp.top = 1;
			temp.underline = false;
			return temp;
		}

	}
}