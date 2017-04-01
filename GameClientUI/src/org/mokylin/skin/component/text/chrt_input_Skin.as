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
	public class chrt_input_Skin extends feathers.controls.StateSkin
	{
		public var input_txt:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function chrt_input_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 161;
			this.elementsContent = [__chrt_input_Skin_UIAsset1_i(),input_txt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __chrt_input_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/component/text/duihuankuangInput.png";
			temp.top = 0;
			return temp;
		}

		private function input_txt_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			input_txt = temp;
			temp.name = "input_txt";
			temp.height = 24;
			temp.left = 1;
			temp.right = 1;
			temp.top = 0;
			return temp;
		}

	}
}