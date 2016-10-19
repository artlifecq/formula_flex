package org.mokylin.skin.demo
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.ComboBox;
	import feathers.controls.SkinnablePanel;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import org.mokylin.skin.common.PanelSkin;
	import org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin;
	import org.mokylin.skin.component.text.TextAreaSkin;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TextDemoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var comboBox:feathers.controls.ComboBox;

		public var textArea:feathers.controls.TextArea;

		public var textArea0:feathers.controls.TextArea;

		public var textInput:feathers.controls.TextInput;

		public var textInput0:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextDemoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__TextDemoSkin_Panel1_i(),__TextDemoSkin_ComboBox1_i(),textArea_i(),textArea0_i(),textInput_i(),textInput0_i(),comboBox_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TextDemoSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5','6','7','8'];
			return temp;
		}

		private function __TextDemoSkin_ArrayCollection2_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5','6','7','8'];
			return temp;
		}

		private function __TextDemoSkin_ComboBox1_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			temp.height = 22;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin);
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 118;
			temp.x = 341;
			temp.y = 97;
			temp.dataProvider = __TextDemoSkin_ArrayCollection1_i();
			return temp;
		}

		private function __TextDemoSkin_Panel1_i():feathers.controls.SkinnablePanel
		{
			var temp:feathers.controls.SkinnablePanel = new feathers.controls.SkinnablePanel();
			temp.height = 572;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.PanelSkin);
			temp.title = "技能";
			temp.width = 774;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function comboBox_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			comboBox = temp;
			temp.name = "comboBox";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin);
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 319;
			temp.y = 121;
			temp.dataProvider = __TextDemoSkin_ArrayCollection2_i();
			return temp;
		}

		private function textArea0_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textArea0 = temp;
			temp.name = "textArea0";
			temp.height = 99;
			temp.italic = true;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin);
			temp.text = "多行文本框多行输入文本框TextAreaTextArea\na\nb\nc\nd\ne\nf\ng\nh\ni";
			temp.textAlign = "left";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 354;
			temp.x = 105;
			temp.y = 393;
			return temp;
		}

		private function textArea_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textArea = temp;
			temp.name = "textArea";
			temp.height = 99;
			temp.italic = true;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin);
			temp.text = "多行文本框多行输入文本框TextAreaTextArea\na\nb\nc\nd\ne\nf\ng\nh\ni";
			temp.textAlign = "center";
			temp.color = 0xD974428;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 253;
			temp.x = 206;
			temp.y = 274;
			return temp;
		}

		private function textInput0_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput0 = temp;
			temp.name = "textInput0";
			temp.height = 22;
			temp.prompt = "请输入";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputSkin);
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 303;
			temp.y = 220;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 22;
			temp.prompt = "请输入";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputSkin);
			temp.textAlign = "right";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 252;
			temp.x = 207;
			temp.y = 187;
			return temp;
		}

	}
}