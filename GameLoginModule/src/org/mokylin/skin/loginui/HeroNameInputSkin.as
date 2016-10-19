package org.mokylin.skin.loginui
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loginui.HeroNameInputTextSkin;
	import org.mokylin.skin.loginui.button.ButtonSkin_loginCountry;
	import org.mokylin.skin.loginui.button.ButtonSkin_loginRandom;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroNameInputSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var country1:feathers.controls.Radio;

		public var country2:feathers.controls.Radio;

		public var country3:feathers.controls.Radio;

		public var country4:feathers.controls.Radio;

		public var country5:feathers.controls.Radio;

		public var countryJian1:feathers.controls.UIAsset;

		public var countryJian2:feathers.controls.UIAsset;

		public var countryJian3:feathers.controls.UIAsset;

		public var countryJian4:feathers.controls.UIAsset;

		public var countryJian5:feathers.controls.UIAsset;

		public var heroNameText:feathers.controls.TextInput;

		public var infoTxt:feathers.controls.Label;

		public var randomBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroNameInputSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 924;
			this.width = 1643;
			this.elementsContent = [infoTxt_i(),heroNameText_i(),randomBtn_i(),__HeroNameInputSkin_UIAsset1_i(),country1_i(),country2_i(),country3_i(),country4_i(),country5_i(),countryJian1_i(),countryJian2_i(),countryJian3_i(),countryJian4_i(),countryJian5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HeroNameInputSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 81;
			temp.styleName = "ui/loginui/loginuiBg/chu_sheng_di_xuan_ze%20.png";
			temp.width = 728;
			temp.x = 417;
			temp.y = 721;
			return temp;
		}

		private function country1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			country1 = temp;
			temp.name = "country1";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginCountry;
			temp.width = 71;
			temp.x = 620;
			temp.y = 720;
			return temp;
		}

		private function country2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			country2 = temp;
			temp.name = "country2";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginCountry;
			temp.width = 71;
			temp.x = 714;
			temp.y = 720;
			return temp;
		}

		private function country3_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			country3 = temp;
			temp.name = "country3";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginCountry;
			temp.width = 71;
			temp.x = 804;
			temp.y = 720;
			return temp;
		}

		private function country4_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			country4 = temp;
			temp.name = "country4";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginCountry;
			temp.width = 71;
			temp.x = 900;
			temp.y = 720;
			return temp;
		}

		private function country5_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			country5 = temp;
			temp.name = "country5";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginCountry;
			temp.width = 71;
			temp.x = 988;
			temp.y = 720;
			return temp;
		}

		private function countryJian1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			countryJian1 = temp;
			temp.name = "countryJian1";
			temp.height = 24;
			temp.styleName = "ui/loginui/loginuiOther/jian.png";
			temp.width = 26;
			temp.x = 667;
			temp.y = 726;
			return temp;
		}

		private function countryJian2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			countryJian2 = temp;
			temp.name = "countryJian2";
			temp.height = 24;
			temp.styleName = "ui/loginui/loginuiOther/jian.png";
			temp.width = 26;
			temp.x = 761;
			temp.y = 726;
			return temp;
		}

		private function countryJian3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			countryJian3 = temp;
			temp.name = "countryJian3";
			temp.height = 24;
			temp.styleName = "ui/loginui/loginuiOther/jian.png";
			temp.width = 26;
			temp.x = 852;
			temp.y = 726;
			return temp;
		}

		private function countryJian4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			countryJian4 = temp;
			temp.name = "countryJian4";
			temp.height = 24;
			temp.styleName = "ui/loginui/loginuiOther/jian.png";
			temp.width = 26;
			temp.x = 947;
			temp.y = 726;
			return temp;
		}

		private function countryJian5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			countryJian5 = temp;
			temp.name = "countryJian5";
			temp.height = 24;
			temp.styleName = "ui/loginui/loginuiOther/jian.png";
			temp.width = 26;
			temp.x = 1035;
			temp.y = 726;
			return temp;
		}

		private function heroNameText_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			heroNameText = temp;
			temp.name = "heroNameText";
			temp.height = 36;
			temp.styleClass = org.mokylin.skin.loginui.HeroNameInputTextSkin;
			temp.width = 355;
			temp.x = 624;
			temp.y = 818;
			return temp;
		}

		private function infoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt = temp;
			temp.name = "infoTxt";
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "正在请求创建角色，请稍等...";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.width = 400;
			temp.x = 602;
			temp.y = 860;
			return temp;
		}

		private function randomBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			randomBtn = temp;
			temp.name = "randomBtn";
			temp.height = 49;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginRandom;
			temp.width = 49;
			temp.x = 982;
			temp.y = 810;
			return temp;
		}

	}
}