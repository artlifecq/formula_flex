package org.mokylin.skin.app.gmpanel
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GmListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnConfirm:feathers.controls.Button;

		public var labInfo:feathers.controls.TextInput;

		public var labTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GmListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 300;
			this.elementsContent = [btnConfirm_i(),labInfo_i(),labTitle_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnConfirm_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnConfirm = temp;
			temp.name = "btnConfirm";
			temp.label = "按钮";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.width = 94;
			temp.x = 194;
			temp.y = 1;
			return temp;
		}

		private function labInfo_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.text = "1";
			temp.color = 0xE12E06;
			temp.width = 106;
			temp.x = 78;
			temp.y = 4;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.text = "最多四字";
			temp.width = 68;
			temp.x = 6;
			temp.y = 8;
			return temp;
		}

	}
}