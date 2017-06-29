package org.mokylin.skin.component.text
{
	import feathers.controls.text.Fontter;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class textInput2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function textInput2_Skin()
		{
			super();
			
			this.currentState = "disable";
			this.width = 66;
			this.elementsContent = [textDisplay_i()];
			bg_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/component/text/input_bg.png", "enabled":"ui/component/text/input_bg.png", "focused":"ui/component/text/input_bg.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 23;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/text/input_bg.png";
			temp.y = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.height = 19;
			temp.left = 3;
			temp.right = 3;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.y = 3;
			return temp;
		}

	}
}