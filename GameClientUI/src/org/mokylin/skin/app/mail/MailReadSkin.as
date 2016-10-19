package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonSkin_red_2;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailReadSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bgNiuPiZhi:feathers.controls.UIAsset;

		public var btnBack:feathers.controls.Button;

		public var btnDelete:feathers.controls.Button;

		public var btnGetAll:feathers.controls.Button;

		public var btnPingBi:feathers.controls.Button;

		public var btnReply:feathers.controls.Button;

		public var iconMoney:feathers.controls.UIAsset;

		public var imageSystem:feathers.controls.UIAsset;

		public var lbContent:feathers.controls.TextArea;

		public var lbSenderName:feathers.controls.Label;

		public var lbTimes:feathers.controls.Label;

		public var lbTitle:feathers.controls.Label;

		public var listFuJian:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailReadSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 524;
			this.width = 365;
			this.elementsContent = [__MailReadSkin_UIAsset1_i(),bgNiuPiZhi_i(),__MailReadSkin_UIAsset2_i(),__MailReadSkin_UIAsset3_i(),__MailReadSkin_UIAsset4_i(),__MailReadSkin_Label1_i(),__MailReadSkin_Label2_i(),__MailReadSkin_Label3_i(),lbSenderName_i(),lbTitle_i(),lbTimes_i(),lbContent_i(),listFuJian_i(),__MailReadSkin_Label4_i(),__MailReadSkin_Label5_i(),btnPingBi_i(),btnDelete_i(),btnBack_i(),btnReply_i(),btnGetAll_i(),imageSystem_i(),__MailReadSkin_UIAsset5_i(),iconMoney_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailReadSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			return temp;
		}

		private function __MailReadSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "发件人";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 64;
			temp.x = 7;
			temp.y = 30;
			return temp;
		}

		private function __MailReadSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "主 题";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 64;
			temp.x = 7;
			temp.y = 53;
			return temp;
		}

		private function __MailReadSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "发送时间";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 64;
			temp.x = 7;
			temp.y = 6;
			return temp;
		}

		private function __MailReadSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "随信附件:";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 126;
			temp.x = 3;
			temp.y = 369;
			return temp;
		}

		private function __MailReadSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 16;
			temp.text = "随信银两:";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 71;
			temp.x = 3;
			temp.y = 444;
			return temp;
		}

		private function __MailReadSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 289;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 361;
			temp.x = 2;
			temp.y = 77;
			return temp;
		}

		private function __MailReadSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 21;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 276;
			temp.x = 79;
			temp.y = 4;
			return temp;
		}

		private function __MailReadSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 21;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 276;
			temp.x = 79;
			temp.y = 28;
			return temp;
		}

		private function __MailReadSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 21;
			temp.styleName = "ui/common/kang/shurukuang/shurukuang.png";
			temp.width = 276;
			temp.x = 79;
			temp.y = 52;
			return temp;
		}

		private function __MailReadSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 75;
			temp.y = 441;
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
			temp.y = 79;
			return temp;
		}

		private function btnBack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBack = temp;
			temp.name = "btnBack";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "关闭邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 275;
			temp.y = 502;
			return temp;
		}

		private function btnDelete_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDelete = temp;
			temp.name = "btnDelete";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "删除邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 101;
			temp.y = 502;
			return temp;
		}

		private function btnGetAll_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGetAll = temp;
			temp.name = "btnGetAll";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "一键提取";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_red_2);
			temp.color = 0xF9F0CC;
			temp.x = 246;
			temp.y = 444;
			return temp;
		}

		private function btnPingBi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPingBi = temp;
			temp.name = "btnPingBi";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "屏蔽发件人";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 100;
			temp.x = 3;
			temp.y = 502;
			return temp;
		}

		private function btnReply_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnReply = temp;
			temp.name = "btnReply";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "回复邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 188;
			temp.y = 502;
			return temp;
		}

		private function iconMoney_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconMoney = temp;
			temp.name = "iconMoney";
			temp.styleName = "ui/common/tubiao/yinzi_46.png";
			temp.x = 77;
			temp.y = 443;
			return temp;
		}

		private function imageSystem_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageSystem = temp;
			temp.name = "imageSystem";
			temp.height = 35;
			temp.styleName = "ui/app/mail/xi_tong_xx.png";
			temp.width = 102;
			temp.x = 139;
			temp.y = 83;
			return temp;
		}

		private function lbContent_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			lbContent = temp;
			temp.name = "lbContent";
			temp.height = 268;
			temp.leading = 7;
			temp.letterSpacing = 1;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 339;
			temp.x = 11;
			temp.y = 82;
			return temp;
		}

		private function lbSenderName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSenderName = temp;
			temp.name = "lbSenderName";
			temp.height = 16;
			temp.text = "发件人";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 268;
			temp.x = 87;
			temp.y = 30;
			return temp;
		}

		private function lbTimes_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTimes = temp;
			temp.name = "lbTimes";
			temp.height = 16;
			temp.text = "发送时间";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 268;
			temp.x = 87;
			temp.y = 6;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.height = 16;
			temp.text = "主 题";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 268;
			temp.x = 87;
			temp.y = 53;
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
			temp.y = 387;
			temp.layout = __MailReadSkin_HorizontalLayout1_i();
			return temp;
		}

	}
}