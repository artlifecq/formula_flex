package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
	import org.mokylin.skin.component.button.ButtonSkin_red_2;
	import org.mokylin.skin.component.check.CheckBoxSkin_4;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __MailListSkin_HorizontalLayout1:feathers.layout.HorizontalLayout;

		public var bgList:feathers.controls.UIAsset;

		public var btnBack:feathers.controls.Button;

		public var btnDelete:feathers.controls.Button;

		public var btnGetAll:feathers.controls.Button;

		public var btnLeft:feathers.controls.Button;

		public var btnNew:feathers.controls.Button;

		public var btnRight:feathers.controls.Button;

		public var cbAll:feathers.controls.Check;

		public var cbAutoDelete:feathers.controls.Check;

		public var lbCount:feathers.controls.Label;

		public var lbPage:feathers.controls.Label;

		public var lbUnread0:feathers.controls.Label;

		public var lbUnread1:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var recPoint0:feathers.controls.UIAsset;

		public var recPoint1:feathers.controls.UIAsset;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bgList_i(),btnDelete_i(),btnNew_i(),btnBack_i(),cbAutoDelete_i(),btnGetAll_i(),cbAll_i(),tabBar_i(),lbCount_i(),btnLeft_i(),recPoint1_i(),recPoint0_i(),btnRight_i(),lbPage_i(),list_i(),lbUnread0_i(),lbUnread1_i()];
			
			states = {
				init:[
						{target:"__MailListSkin_HorizontalLayout1",
							name:"paddingLeft",
							value:2
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailListSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['系统邮件','个人邮件'];
			return temp;
		}

		private function __MailListSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 1;
			__MailListSkin_HorizontalLayout1 = temp;
			temp.paddingRight = 2;
			return temp;
		}

		private function bgList_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgList = temp;
			temp.name = "bgList";
			temp.height = 428;
			temp.styleName = "ui/common/kang/nei_kuang.png";
			temp.width = 364;
			temp.x = 1;
			temp.y = 25;
			return temp;
		}

		private function btnBack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBack = temp;
			temp.name = "btnBack";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "关闭邮箱";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 267;
			temp.y = 501;
			return temp;
		}

		private function btnDelete_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDelete = temp;
			temp.name = "btnDelete";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "删除所选邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 123;
			temp.x = 9;
			temp.y = 501;
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
			temp.x = 245;
			temp.y = 454;
			return temp;
		}

		private function btnLeft_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLeft = temp;
			temp.name = "btnLeft";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_left);
			temp.x = 122;
			temp.y = 420;
			return temp;
		}

		private function btnNew_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNew = temp;
			temp.name = "btnNew";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "写邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 154;
			temp.y = 501;
			return temp;
		}

		private function btnRight_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRight = temp;
			temp.name = "btnRight";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_right);
			temp.x = 237;
			temp.y = 420;
			return temp;
		}

		private function cbAll_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cbAll = temp;
			temp.name = "cbAll";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 20;
			temp.label = "全部选择";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_4);
			temp.textAlign = "left";
			temp.color = 0xCAAF94;
			temp.width = 87;
			temp.x = 275;
			temp.y = 6;
			return temp;
		}

		private function cbAutoDelete_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			cbAutoDelete = temp;
			temp.name = "cbAutoDelete";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 22;
			temp.label = "提取完附件，自动删除邮件";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_4);
			temp.textAlign = "left";
			temp.color = 0xCAAF94;
			temp.width = 200;
			temp.x = 28;
			temp.y = 457;
			return temp;
		}

		private function lbCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCount = temp;
			temp.name = "lbCount";
			temp.text = "120/120";
			temp.textAlign = "right";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 215;
			temp.y = 7;
			return temp;
		}

		private function lbPage_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPage = temp;
			temp.name = "lbPage";
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 81;
			temp.x = 149;
			temp.y = 421;
			return temp;
		}

		private function lbUnread0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbUnread0 = temp;
			temp.name = "lbUnread0";
			temp.fontSize = 12;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 100;
			temp.y = -1;
			return temp;
		}

		private function lbUnread1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbUnread1 = temp;
			temp.name = "lbUnread1";
			temp.fontSize = 12;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 199;
			temp.y = -1;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 381;
			temp.width = 350;
			temp.x = 7;
			temp.y = 32;
			return temp;
		}

		private function recPoint0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			recPoint0 = temp;
			temp.name = "recPoint0";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/B_bujian/ti_shi_hong_di.png";
			temp.x = 101;
			temp.y = 0;
			return temp;
		}

		private function recPoint1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			recPoint1 = temp;
			temp.name = "recPoint1";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/B_bujian/ti_shi_hong_di.png";
			temp.x = 200;
			temp.y = 0;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 97;
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng);
			temp.width = 199;
			temp.x = 16;
			temp.y = 0;
			temp.layout = __MailListSkin_HorizontalLayout1_i();
			temp.dataProvider = __MailListSkin_ArrayCollection1_i();
			return temp;
		}

	}
}