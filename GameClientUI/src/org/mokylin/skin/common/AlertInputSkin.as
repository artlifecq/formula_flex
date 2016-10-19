package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class AlertInputSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnOk:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var labTile:feathers.controls.Label;

		public var txtInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AlertInputSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__AlertInputSkin_UIAsset1_i(),__AlertInputSkin_UIAsset2_i(),txtInput_i(),labTile_i(),btnOk_i(),btnCancel_i(),closeBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AlertInputSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 206;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 300;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __AlertInputSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 111;
			temp.styleName = "ui/mainui/chat/shurukuang.png";
			temp.width = 269;
			temp.x = 15;
			temp.y = 41;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.height = 29;
			temp.label = "取消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.width = 66;
			temp.x = 192;
			temp.y = 158;
			return temp;
		}

		private function btnOk_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOk = temp;
			temp.name = "btnOk";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 29;
			temp.label = "确定";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
			temp.color = 0xF9F0CC;
			temp.width = 66;
			temp.x = 40;
			temp.y = 159;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 268;
			temp.y = 5;
			return temp;
		}

		private function labTile_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTile = temp;
			temp.name = "labTile";
			temp.height = 19;
			temp.htmlText = "立即开启<font color='#5DBD37'>[x]个</font>格子你将获得";
			temp.textAlign = "center";
			temp.color = 0xC8B68A;
			temp.width = 267;
			temp.x = 16;
			temp.y = 54;
			return temp;
		}

		private function txtInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			txtInput = temp;
			temp.name = "txtInput";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.text.TextInputSkin;
			temp.width = 128;
			temp.x = 85;
			temp.y = 92;
			return temp;
		}

	}
}