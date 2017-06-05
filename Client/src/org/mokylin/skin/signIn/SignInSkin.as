package org.mokylin.skin.signIn
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.signIn.CheckBoxSkin;
	import org.mokylin.skin.signIn.InputTextSkin;
	import org.mokylin.skin.signIn.button.ButtonDeng_lu;
	import org.mokylin.skin.signIn.button.ButtonWen_hao;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SignInSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bgImage:feathers.controls.UIAsset;

		public var bottomInfo:feathers.controls.Label;

		public var infoTxt:feathers.controls.Label;

		public var loginBtn:feathers.controls.Button;

		public var passWordText:feathers.controls.TextInput;

		public var passWordTips:feathers.controls.Label;

		public var rememberBox:feathers.controls.Check;

		public var userNameText:feathers.controls.TextInput;

		public var userNameTips:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SignInSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 1080;
			this.width = 1920;
			this.elementsContent = [bgImage_i(),userNameText_i(),passWordText_i(),loginBtn_i(),__SignInSkin_Button1_i(),__SignInSkin_Label1_i(),infoTxt_i(),bottomInfo_i(),rememberBox_i(),passWordTips_i(),userNameTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SignInSkin_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.height = 18;
			temp.styleClass = org.mokylin.skin.signIn.button.ButtonWen_hao;
			temp.width = 12;
			temp.x = 1165;
			temp.y = 562;
			return temp;
		}

		private function __SignInSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.text = "忘记密码";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 1185;
			temp.y = 560;
			return temp;
		}

		private function bgImage_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgImage = temp;
			temp.name = "bgImage";
			temp.height = 1080;
			temp.styleName = "ui/signIn/di.png";
			temp.width = 1920;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bottomInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bottomInfo = temp;
			temp.name = "bottomInfo";
			temp.height = 24;
			temp.text = "抵制不良游戏，拒绝盗版游戏。注意自我保护，谨防受骗上当。适度游戏益脑，沉迷游戏伤身。合理安排时间，享受健康生活。";
			temp.textAlign = "center";
			temp.color = 0x333a40;
			temp.width = 850;
			temp.x = 487;
			temp.y = 1047;
			return temp;
		}

		private function infoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt = temp;
			temp.name = "infoTxt";
			temp.height = 28;
			temp.fontSize = 14;
			temp.text = "正在请求登录，请稍等...";
			temp.textAlign = "center";
			temp.color = 0xE1D4A9;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 400;
			temp.x = 765;
			temp.y = 740;
			return temp;
		}

		private function loginBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			loginBtn = temp;
			temp.name = "loginBtn";
			temp.height = 68;
			temp.styleClass = org.mokylin.skin.signIn.button.ButtonDeng_lu;
			temp.width = 227;
			temp.x = 850;
			temp.y = 640;
			return temp;
		}

		private function passWordText_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			passWordText = temp;
			temp.name = "passWordText";
			temp.height = 36;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.signIn.InputTextSkin;
			temp.color = 0xFFFFFF;
			temp.width = 355;
			temp.x = 785;
			temp.y = 550;
			return temp;
		}

		private function passWordTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			passWordTips = temp;
			temp.name = "passWordTips";
			temp.height = 26;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "请输入密码";
			temp.textAlign = "left";
			temp.color = 0x4A4744;
			temp.width = 263;
			temp.x = 795;
			temp.y = 556;
			return temp;
		}

		private function rememberBox_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			rememberBox = temp;
			temp.name = "rememberBox";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "记住账号";
			temp.styleClass = org.mokylin.skin.signIn.CheckBoxSkin;
			temp.color = 0xE1D4A9;
			temp.width = 80;
			temp.x = 1160;
			temp.y = 510;
			return temp;
		}

		private function userNameText_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			userNameText = temp;
			temp.name = "userNameText";
			temp.height = 36;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.signIn.InputTextSkin;
			temp.color = 0xFFFFFF;
			temp.width = 355;
			temp.x = 785;
			temp.y = 500;
			return temp;
		}

		private function userNameTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			userNameTips = temp;
			temp.name = "userNameTips";
			temp.height = 26;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "请输入账户";
			temp.textAlign = "left";
			temp.color = 0x4A4744;
			temp.width = 263;
			temp.x = 795;
			temp.y = 506;
			return temp;
		}

	}
}