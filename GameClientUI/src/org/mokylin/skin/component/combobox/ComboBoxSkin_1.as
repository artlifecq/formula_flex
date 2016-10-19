package org.mokylin.skin.component.combobox
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_incre;
	import org.mokylin.skin.component.text.TextAreaLvSkin;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ComboBoxSkin_1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var dropDown:feathers.controls.List;

		public var openButton:feathers.controls.Button;

		public var textInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ComboBoxSkin_1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 22;
			this.width = 118;
			this.elementsContent = [textInput_i(),openButton_i(),dropDown_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function dropDown_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			dropDown = temp;
			temp.name = "dropDown";
			temp.height = 91;
			temp.left = 0;
			temp.right = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaLvSkin);
			temp.visible = false;
			temp.y = 22;
			return temp;
		}

		private function openButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			openButton = temp;
			temp.name = "openButton";
			temp.height = 18;
			temp.right = 2;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_incre);
			temp.width = 18;
			temp.y = 2;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 22;
			temp.left = 0;
			temp.right = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputSkin);
			temp.top = 0;
			return temp;
		}

	}
}