package org.mokylin.skin.component.combobox
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_xiala;
	import org.mokylin.skin.component.text.TextAreaDwonSkin;
	import org.mokylin.skin.component.text.textInput1_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ComboBox2_Skin extends feathers.controls.StateSkin
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
		public function ComboBox2_Skin()
		{
			super();
			
			this.currentState = "disabled";
			this.height = 24;
			this.width = 123;
			this.elementsContent = [textInput_i(),openButton_i(),dropDown_i()];
			
			states = {
				disabled:[
						{target:"dropDown",
							name:"visible",
							value:false
						}
					]
				,
				normal:[
						{target:"dropDown",
							name:"visible",
							value:false
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ComboBox2_Skin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 2;
			return temp;
		}

		private function dropDown_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			dropDown = temp;
			temp.name = "dropDown";
			temp.height = 105;
			temp.left = 0;
			temp.right = 16;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaDwonSkin;
			temp.y = 22;
			temp.layout = __ComboBox2_Skin_VerticalLayout1_i();
			return temp;
		}

		private function openButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			openButton = temp;
			temp.name = "openButton";
			temp.bold = false;
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_xiala;
			temp.width = 22;
			temp.y = 0;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 24;
			temp.left = 0;
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.text.textInput1_Skin;
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.y = 0;
			return temp;
		}

	}
}