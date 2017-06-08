package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import org.mokylin.skin.component.button.ButtonSkin_you;
	import org.mokylin.skin.component.button.ButtonSkin_youmax;
	import org.mokylin.skin.component.button.ButtonSkin_zuo;
	import org.mokylin.skin.component.button.ButtonSkin_zuomax;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Flip2_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAdd:feathers.controls.Button;

		public var btnDec:feathers.controls.Button;

		public var btnMax:feathers.controls.Button;

		public var btnMin:feathers.controls.Button;

		public var textInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Flip2_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 146;
			this.elementsContent = [textInput_i(),btnDec_i(),btnMin_i(),btnAdd_i(),btnMax_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnAdd_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAdd = temp;
			temp.name = "btnAdd";
			temp.right = 21;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_you;
			temp.y = 2;
			return temp;
		}

		private function btnDec_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDec = temp;
			temp.name = "btnDec";
			temp.left = 21;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuo;
			temp.y = 2;
			return temp;
		}

		private function btnMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMax = temp;
			temp.name = "btnMax";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_youmax;
			temp.y = 2;
			return temp;
		}

		private function btnMin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMin = temp;
			temp.name = "btnMin";
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuomax;
			temp.y = 2;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.left = 16;
			temp.right = 16;
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.y = 0;
			return temp;
		}

	}
}