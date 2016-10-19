package org.mokylin.skin.app.mail
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.text.TextBlankSkin;
	import org.mokylin.skin.component.text.TextInput2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailReadMsgSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBack:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnClose2:feathers.controls.Button;

		public var btnDeleteMsg:feathers.controls.Button;

		public var inputInfo:feathers.controls.TextArea;

		public var inputName:feathers.controls.TextInput;

		public var inputTime:feathers.controls.TextInput;

		public var inputTitle:feathers.controls.TextInput;

		public var labItemTitle:feathers.controls.Label;

		public var labName:feathers.controls.Label;

		public var labSendTime:feathers.controls.Label;

		public var labTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailReadMsgSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 490;
			this.width = 380;
			this.elementsContent = [__MailReadMsgSkin_UIAsset1_i(),__MailReadMsgSkin_UIAsset2_i(),__MailReadMsgSkin_UIAsset3_i(),__MailReadMsgSkin_UIAsset4_i(),btnClose_i(),labName_i(),labTitle_i(),labSendTime_i(),inputName_i(),inputTitle_i(),inputTime_i(),inputInfo_i(),btnDeleteMsg_i(),btnClose2_i(),labItemTitle_i(),btnBack_i(),__MailReadMsgSkin_UIAsset5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailReadMsgSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 490;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 380;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MailReadMsgSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 395;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 360;
			temp.x = 10;
			temp.y = 37;
			return temp;
		}

		private function __MailReadMsgSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 83;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 340;
			temp.x = 20;
			temp.y = 341;
			return temp;
		}

		private function __MailReadMsgSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 219;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 340;
			temp.x = 20;
			temp.y = 119;
			return temp;
		}

		private function __MailReadMsgSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 22;
			temp.touchable = false;
			temp.styleName = "ui/app/mail/wz_yj.png";
			temp.width = 47;
			temp.x = 167;
			temp.y = 8;
			return temp;
		}

		private function btnBack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBack = temp;
			temp.name = "btnBack";
			temp.height = 29;
			temp.label = "回复邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 152;
			temp.y = 442;
			return temp;
		}

		private function btnClose2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose2 = temp;
			temp.name = "btnClose2";
			temp.height = 29;
			temp.label = "关闭邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 279;
			temp.y = 442;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.width = 30;
			temp.x = 344;
			temp.y = 3;
			return temp;
		}

		private function btnDeleteMsg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDeleteMsg = temp;
			temp.name = "btnDeleteMsg";
			temp.height = 29;
			temp.label = "删除邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 25;
			temp.y = 442;
			return temp;
		}

		private function inputInfo_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			inputInfo = temp;
			temp.name = "inputInfo";
			temp.height = 204;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.width = 323;
			temp.x = 27;
			temp.y = 126;
			return temp;
		}

		private function inputName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputName = temp;
			temp.name = "inputName";
			temp.height = 20;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.color = 0xC9B48A;
			temp.width = 250;
			temp.x = 92;
			temp.y = 68;
			return temp;
		}

		private function inputTime_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputTime = temp;
			temp.name = "inputTime";
			temp.height = 20;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.color = 0xC9B48A;
			temp.width = 250;
			temp.x = 92;
			temp.y = 44;
			return temp;
		}

		private function inputTitle_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputTitle = temp;
			temp.name = "inputTitle";
			temp.height = 20;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.color = 0xC9B48A;
			temp.width = 250;
			temp.x = 92;
			temp.y = 91;
			return temp;
		}

		private function labItemTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labItemTitle = temp;
			temp.name = "labItemTitle";
			temp.height = 16;
			temp.text = "获取随信包裹：";
			temp.color = 0xC9B48A;
			temp.width = 126;
			temp.x = 32;
			temp.y = 349;
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
			temp.width = 58;
			temp.x = 23;
			temp.y = 70;
			return temp;
		}

		private function labSendTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSendTime = temp;
			temp.name = "labSendTime";
			temp.height = 16;
			temp.text = "发送时间";
			temp.color = 0xC9B48A;
			temp.width = 64;
			temp.x = 23;
			temp.y = 46;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.height = 16;
			temp.text = "主 题";
			temp.color = 0xC9B48A;
			temp.width = 62;
			temp.x = 23;
			temp.y = 93;
			return temp;
		}

	}
}