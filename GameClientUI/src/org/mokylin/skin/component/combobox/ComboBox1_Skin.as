package org.mokylin.skin.component.combobox
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_xiala;
	import org.mokylin.skin.component.text.textInput1_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ComboBox1_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __ComboBox1_Skin_UIAsset1:feathers.controls.UIAsset;

		public var btn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ComboBox1_Skin()
		{
			super();
			
			this.currentState = "disabled";
			this.height = 22;
			this.width = 70;
			this.elementsContent = [__ComboBox1_Skin_TextInput1_i(),btn_i(),__ComboBox1_Skin_UIAsset1_i()];
			
			states = {
				disabled:[
						{target:"__ComboBox1_Skin_UIAsset1",
							name:"visible",
							value:false
						}
					]
				,
				normal:[
						{target:"__ComboBox1_Skin_UIAsset1",
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
		private function __ComboBox1_Skin_TextInput1_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.text.textInput1_Skin;
			temp.width = 70;
			temp.x = 0;
			temp.y = -1;
			return temp;
		}

		private function __ComboBox1_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__ComboBox1_Skin_UIAsset1 = temp;
			temp.height = 86;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 70;
			temp.x = 0;
			temp.y = 23;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_xiala;
			temp.x = 48;
			temp.y = 0;
			return temp;
		}

	}
}