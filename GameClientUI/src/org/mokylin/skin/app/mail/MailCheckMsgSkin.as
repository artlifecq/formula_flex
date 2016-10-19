package org.mokylin.skin.app.mail
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.button.ButtonSkin_lv;
	import org.mokylin.skin.component.check.CheckBoxSkin_gold;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailCheckMsgSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAll:feathers.controls.Check;

		public var btnAutoDelete:feathers.controls.Check;

		public var btnAutoPick:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnDelete:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailCheckMsgSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 400;
			this.width = 360;
			this.elementsContent = [__MailCheckMsgSkin_UIAsset1_i(),btnOpen_i(),btnDelete_i(),btnClose_i(),btnAutoDelete_i(),btnAutoPick_i(),btnAll_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailCheckMsgSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 300;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.width = 360;
			temp.x = 1;
			temp.y = -1;
			return temp;
		}

		private function btnAll_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnAll = temp;
			temp.name = "btnAll";
			temp.height = 20;
			temp.label = "全部选择";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 98;
			temp.x = 256;
			temp.y = -23;
			return temp;
		}

		private function btnAutoDelete_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			btnAutoDelete = temp;
			temp.name = "btnAutoDelete";
			temp.height = 22;
			temp.label = "提取完附件，自动删除邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_gold);
			temp.width = 200;
			temp.x = 31;
			temp.y = 339;
			return temp;
		}

		private function btnAutoPick_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAutoPick = temp;
			temp.name = "btnAutoPick";
			temp.height = 27;
			temp.label = "一键收取附件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_lv);
			temp.width = 100;
			temp.x = 241;
			temp.y = 336;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			temp.label = "关闭邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 80;
			temp.x = 269;
			temp.y = 373;
			return temp;
		}

		private function btnDelete_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDelete = temp;
			temp.name = "btnDelete";
			temp.height = 29;
			temp.label = "删除选择邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 100;
			temp.x = 140;
			temp.y = 373;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.height = 29;
			temp.label = "打开选择邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 100;
			temp.x = 20;
			temp.y = 373;
			return temp;
		}

	}
}