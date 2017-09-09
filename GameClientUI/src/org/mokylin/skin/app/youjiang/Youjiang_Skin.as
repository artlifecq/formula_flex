package org.mokylin.skin.app.youjiang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.youjiang.button.ButtonJiang_Close;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;
	import org.mokylin.skin.component.radio.RadioButtonSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Youjiang_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var lbEnter:feathers.controls.Label;

		public var rdoBUG:feathers.controls.Radio;

		public var rdoJianyi:feathers.controls.Radio;

		public var txtInput:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Youjiang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 362;
			this.width = 495;
			this.elementsContent = [__Youjiang_Skin_UIAsset1_i(),btnClose_i(),__Youjiang_Skin_Label1_i(),__Youjiang_Skin_Label2_i(),__Youjiang_Skin_Label3_i(),lbEnter_i(),__Youjiang_Skin_Label4_i(),__Youjiang_Skin_Label5_i(),__Youjiang_Skin_Label6_i(),rdoBUG_i(),rdoJianyi_i(),txtInput_i(),btnOK_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Youjiang_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 39;
			temp.leading = 2;
			temp.text = "尊敬的玩家，欢迎你们将发现的问题反馈给我们，反馈有效建议或者BUG，均有机会获得答谢礼哦~~";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 403;
			temp.x = 42;
			temp.y = 64;
			return temp;
		}

		private function __Youjiang_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.leading = 2;
			temp.text = "详细描述：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 44;
			temp.y = 125;
			return temp;
		}

		private function __Youjiang_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 39;
			temp.leading = 2;
			temp.text = "如需上次图片或者更详细建议请点击：》        》参与活动。有精美礼包哦~~";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 403;
			temp.x = 42;
			temp.y = 255;
			return temp;
		}

		private function __Youjiang_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "选择问题：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 44;
			temp.y = 103;
			return temp;
		}

		private function __Youjiang_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "游戏BUG";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 144;
			temp.y = 103;
			return temp;
		}

		private function __Youjiang_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "游戏建议";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 247;
			temp.y = 103;
			return temp;
		}

		private function __Youjiang_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/youjiang/bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.app.youjiang.button.ButtonJiang_Close;
			temp.x = 458;
			temp.y = 55;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "提 交";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.x = 197;
			temp.y = 296;
			return temp;
		}

		private function lbEnter_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbEnter = temp;
			temp.name = "lbEnter";
			temp.height = 18;
			temp.leading = 2;
			temp.text = "进入论坛";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 61;
			temp.x = 292;
			temp.y = 255;
			return temp;
		}

		private function rdoBUG_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdoBUG = temp;
			temp.name = "rdoBUG";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.width = 57;
			temp.x = 120;
			temp.y = 102;
			return temp;
		}

		private function rdoJianyi_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdoJianyi = temp;
			temp.name = "rdoJianyi";
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin_1;
			temp.width = 57;
			temp.x = 223;
			temp.y = 102;
			return temp;
		}

		private function txtInput_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			txtInput = temp;
			temp.name = "txtInput";
			temp.height = 103;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 391;
			temp.x = 45;
			temp.y = 146;
			return temp;
		}

	}
}