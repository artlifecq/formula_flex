package org.mokylin.skin.app.fulidating
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.fulidating.button.ButtonLibao;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FLDT_Jihuomaduihuan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnOk:feathers.controls.Button;

		public var txtInput:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FLDT_Jihuomaduihuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 502;
			this.width = 749;
			this.elementsContent = [__FLDT_Jihuomaduihuan_UIAsset1_i(),__FLDT_Jihuomaduihuan_Label1_i(),txtInput_i(),btnOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FLDT_Jihuomaduihuan_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "温馨提示：在输入框中输入您的兑换码，即可领取超值大礼包！";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 180;
			temp.y = 466;
			return temp;
		}

		private function __FLDT_Jihuomaduihuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fulidating/jihuo_bg.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.styleClass = org.mokylin.skin.app.fulidating.button.ButtonLibao;
			temp.x = 285;
			temp.y = 373;
			return temp;
		}

		private function txtInput_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			txtInput = temp;
			temp.name = "txtInput";
			temp.height = 19;
			temp.text = "请输入兑换码";
			temp.textAlign = "center";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 315;
			temp.x = 211;
			temp.y = 284;
			return temp;
		}

	}
}