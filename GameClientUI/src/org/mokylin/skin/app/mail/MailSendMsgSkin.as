package org.mokylin.skin.app.mail
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_incre;
	import org.mokylin.skin.component.text.TextBlankSkin;
	import org.mokylin.skin.component.text.TextInput2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailSendMsgSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCannel:feathers.controls.Button;

		public var btnNames:feathers.controls.Button;

		public var btnSendMsg:feathers.controls.Button;

		public var inputInfo:feathers.controls.TextArea;

		public var inputLiang:feathers.controls.TextInput;

		public var inputMoney:feathers.controls.TextInput;

		public var inputName:feathers.controls.TextInput;

		public var inputTitle:feathers.controls.TextInput;

		public var inputWen:feathers.controls.TextInput;

		public var labCost:feathers.controls.Label;

		public var labDing:feathers.controls.Label;

		public var labLing:feathers.controls.Label;

		public var labMoneyTitle:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labTitle:feathers.controls.Label;

		public var labWen:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailSendMsgSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 410;
			this.width = 360;
			this.elementsContent = [__MailSendMsgSkin_UIAsset1_i(),__MailSendMsgSkin_UIAsset2_i(),__MailSendMsgSkin_UIAsset3_i(),__MailSendMsgSkin_UIAsset4_i(),labName_i(),labTitle_i(),labDing_i(),labLing_i(),labWen_i(),inputName_i(),inputTitle_i(),inputInfo_i(),labMoneyTitle_i(),btnSendMsg_i(),btnCannel_i(),labCost_i(),inputMoney_i(),inputWen_i(),inputLiang_i(),btnNames_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailSendMsgSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 350;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 360;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MailSendMsgSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 22;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 360;
			temp.x = 0;
			temp.y = 354;
			return temp;
		}

		private function __MailSendMsgSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 95;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 335;
			temp.x = 13;
			temp.y = 248;
			return temp;
		}

		private function __MailSendMsgSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 182;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 335;
			temp.x = 13;
			temp.y = 62;
			return temp;
		}

		private function btnCannel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCannel = temp;
			temp.name = "btnCannel";
			temp.height = 29;
			temp.label = "取消发送";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 234;
			temp.y = 379;
			return temp;
		}

		private function btnNames_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNames = temp;
			temp.name = "btnNames";
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_incre);
			temp.width = 18;
			temp.x = 323;
			temp.y = 10;
			return temp;
		}

		private function btnSendMsg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSendMsg = temp;
			temp.name = "btnSendMsg";
			temp.height = 29;
			temp.label = "发送邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 47;
			temp.y = 379;
			return temp;
		}

		private function inputInfo_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			inputInfo = temp;
			temp.name = "inputInfo";
			temp.height = 167;
			temp.fontSize = 1;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.textAlign = "7";
			temp.width = 320;
			temp.x = 20;
			temp.y = 69;
			return temp;
		}

		private function inputLiang_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputLiang = temp;
			temp.name = "inputLiang";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "0";
			temp.color = 0xC9B48A;
			temp.width = 60;
			temp.x = 166;
			temp.y = 317;
			return temp;
		}

		private function inputMoney_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputMoney = temp;
			temp.name = "inputMoney";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "0";
			temp.color = 0xC9B48A;
			temp.width = 60;
			temp.x = 80;
			temp.y = 316;
			return temp;
		}

		private function inputName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputName = temp;
			temp.name = "inputName";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.color = 0xC9B48A;
			temp.width = 280;
			temp.x = 63;
			temp.y = 9;
			return temp;
		}

		private function inputTitle_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputTitle = temp;
			temp.name = "inputTitle";
			temp.height = 22;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.color = 0xC9B48A;
			temp.width = 280;
			temp.x = 63;
			temp.y = 35;
			return temp;
		}

		private function inputWen_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputWen = temp;
			temp.name = "inputWen";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "0";
			temp.color = 0xC9B48A;
			temp.width = 60;
			temp.x = 253;
			temp.y = 317;
			return temp;
		}

		private function labCost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCost = temp;
			temp.name = "labCost";
			temp.height = 16;
			temp.text = "邮资总计：$";
			temp.color = 0x9C8049;
			temp.width = 270;
			temp.x = 19;
			temp.y = 357;
			return temp;
		}

		private function labDing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDing = temp;
			temp.name = "labDing";
			temp.height = 16;
			temp.text = "锭";
			temp.color = 0xC9B48A;
			temp.width = 29;
			temp.x = 147;
			temp.y = 318;
			return temp;
		}

		private function labLing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLing = temp;
			temp.name = "labLing";
			temp.height = 16;
			temp.text = "两";
			temp.color = 0xC9B48A;
			temp.width = 29;
			temp.x = 233;
			temp.y = 318;
			return temp;
		}

		private function labMoneyTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoneyTitle = temp;
			temp.name = "labMoneyTitle";
			temp.height = 16;
			temp.text = "寄送金额：";
			temp.color = 0xC9B48A;
			temp.width = 65;
			temp.x = 19;
			temp.y = 318;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 16;
			temp.text = "收件人";
			temp.color = 0xC9B48A;
			temp.width = 41;
			temp.x = 13;
			temp.y = 11;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.height = 16;
			temp.text = "主题";
			temp.color = 0xC9B48A;
			temp.width = 35;
			temp.x = 13;
			temp.y = 37;
			return temp;
		}

		private function labWen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labWen = temp;
			temp.name = "labWen";
			temp.height = 16;
			temp.text = "文";
			temp.color = 0xC9B48A;
			temp.width = 29;
			temp.x = 318;
			temp.y = 318;
			return temp;
		}

	}
}