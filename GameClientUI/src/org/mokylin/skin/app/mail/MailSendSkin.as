package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonSkin_xiala;
	import org.mokylin.skin.component.text.TextBlankSkin;
	import org.mokylin.skin.component.text.TextInput2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailSendSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bgNiuPiZhi:feathers.controls.UIAsset;

		public var btnCancel:feathers.controls.Button;

		public var btnSend:feathers.controls.Button;

		public var btnTarget:feathers.controls.Button;

		public var inputContent:feathers.controls.TextArea;

		public var inputMoneyDing:feathers.controls.TextInput;

		public var inputMoneyLiang:feathers.controls.TextInput;

		public var inputMoneyWen:feathers.controls.TextInput;

		public var inputTarget:feathers.controls.TextInput;

		public var inputTitle:feathers.controls.TextInput;

		public var labDing:feathers.controls.Label;

		public var labLing:feathers.controls.Label;

		public var labWen:feathers.controls.Label;

		public var lbCost:feathers.controls.Label;

		public var listFuJian:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailSendSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 524;
			this.width = 365;
			this.elementsContent = [__MailSendSkin_UIAsset1_i(),__MailSendSkin_Label1_i(),__MailSendSkin_Label2_i(),labDing_i(),labLing_i(),labWen_i(),inputTarget_i(),inputTitle_i(),__MailSendSkin_Label3_i(),__MailSendSkin_Label4_i(),lbCost_i(),inputMoneyDing_i(),inputMoneyWen_i(),inputMoneyLiang_i(),btnTarget_i(),btnSend_i(),btnCancel_i(),__MailSendSkin_UIAsset2_i(),bgNiuPiZhi_i(),inputContent_i(),listFuJian_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailSendSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			return temp;
		}

		private function __MailSendSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "收件人";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 52;
			temp.x = 13;
			temp.y = 11;
			return temp;
		}

		private function __MailSendSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "主题";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 35;
			temp.x = 13;
			temp.y = 37;
			return temp;
		}

		private function __MailSendSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "寄送金额:";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 9;
			temp.y = 454;
			return temp;
		}

		private function __MailSendSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "寄送附件:";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 9;
			temp.y = 357;
			return temp;
		}

		private function __MailSendSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 360;
			temp.x = 3;
			temp.y = 438;
			return temp;
		}

		private function __MailSendSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 289;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 361;
			temp.x = 2;
			temp.y = 61;
			return temp;
		}

		private function bgNiuPiZhi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgNiuPiZhi = temp;
			temp.name = "bgNiuPiZhi";
			temp.height = 285;
			temp.styleName = "ui/app/mail/niu_pi_zi.jpg";
			temp.width = 356;
			temp.x = 4;
			temp.y = 63;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "取消发送";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 240;
			temp.y = 501;
			return temp;
		}

		private function btnSend_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSend = temp;
			temp.name = "btnSend";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "发送邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 29;
			temp.y = 501;
			return temp;
		}

		private function btnTarget_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTarget = temp;
			temp.name = "btnTarget";
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_xiala);
			temp.width = 18;
			temp.x = 332;
			temp.y = 10;
			return temp;
		}

		private function inputContent_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			inputContent = temp;
			temp.name = "inputContent";
			temp.height = 268;
			temp.leading = 7;
			temp.letterSpacing = 1;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 339;
			temp.x = 11;
			temp.y = 68;
			return temp;
		}

		private function inputMoneyDing_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputMoneyDing = temp;
			temp.name = "inputMoneyDing";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "0";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 80;
			temp.y = 453;
			return temp;
		}

		private function inputMoneyLiang_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputMoneyLiang = temp;
			temp.name = "inputMoneyLiang";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "0";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 166;
			temp.y = 453;
			return temp;
		}

		private function inputMoneyWen_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputMoneyWen = temp;
			temp.name = "inputMoneyWen";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "0";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 253;
			temp.y = 453;
			return temp;
		}

		private function inputTarget_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputTarget = temp;
			temp.name = "inputTarget";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 280;
			temp.x = 73;
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
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 280;
			temp.x = 73;
			temp.y = 35;
			return temp;
		}

		private function labDing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDing = temp;
			temp.name = "labDing";
			temp.height = 16;
			temp.text = "锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 29;
			temp.x = 147;
			temp.y = 454;
			return temp;
		}

		private function labLing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLing = temp;
			temp.name = "labLing";
			temp.height = 16;
			temp.text = "两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 29;
			temp.x = 233;
			temp.y = 454;
			return temp;
		}

		private function labWen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labWen = temp;
			temp.name = "labWen";
			temp.height = 16;
			temp.text = "文";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 29;
			temp.x = 318;
			temp.y = 454;
			return temp;
		}

		private function lbCost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCost = temp;
			temp.name = "lbCost";
			temp.height = 16;
			temp.text = "邮资总计：$";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 119;
			temp.x = 120;
			temp.y = 509;
			return temp;
		}

		private function listFuJian_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listFuJian = temp;
			temp.name = "listFuJian";
			temp.height = 56;
			temp.width = 360;
			temp.x = 5;
			temp.y = 377;
			temp.layout = __MailSendSkin_HorizontalLayout1_i();
			return temp;
		}

	}
}