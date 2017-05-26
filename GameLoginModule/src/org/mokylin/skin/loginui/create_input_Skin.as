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
	public class create_input_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __create_input_Skin_UIAsset1:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function create_input_Skin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 42;
			this.width = 280;
			this.elementsContent = [textDisplay_i()];
			__create_input_Skin_UIAsset1_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/loginui/IDkuang.png", "enabled":"ui/loginui/IDkuang.png", "focused":"ui/loginui/IDkuang.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __create_input_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__create_input_Skin_UIAsset1 = temp;
			temp.styleName = "ui/loginui/IDkuang.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 8;
			temp.left = 7;
			temp.right = 59;
			temp.fontSize = 16;
			temp.text = "输入角色名称";
			temp.textAlign = "center";
			temp.color = 0x757575;
			temp.top = 9;
			return temp;
		}

	}
}