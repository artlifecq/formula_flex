package org.mokylin.skin.app.mail
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.common.Erji_panelbg_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MailReceive_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCancel:feathers.controls.Button;

		public var btnTiqu:feathers.controls.Button;

		public var chkSelect:feathers.controls.Check;

		public var imgNO:feathers.controls.UIAsset;

		public var listMail:feathers.controls.List;

		public var tab_nv:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MailReceive_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 586;
			this.width = 434;
			this.elementsContent = [__MailReceive_Skin_SkinnableContainer1_i(),__MailReceive_Skin_UIAsset1_i(),tab_nv_i(),chkSelect_i(),__MailReceive_Skin_UIAsset2_i(),btnCancel_i(),btnTiqu_i(),listMail_i(),__MailReceive_Skin_UIAsset3_i(),imgNO_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MailReceive_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['系统邮件'];
			return temp;
		}

		private function __MailReceive_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			return temp;
		}

		private function __MailReceive_Skin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 586;
			var skin:StateSkin = new org.mokylin.skin.common.Erji_panelbg_Skin()
			temp.skin = skin
			temp.width = 434;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MailReceive_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 440;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 404;
			temp.x = 14;
			temp.y = 71;
			return temp;
		}

		private function __MailReceive_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mail/quanxuan.png";
			temp.x = 63;
			temp.y = 543;
			return temp;
		}

		private function __MailReceive_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/mail/sxx.png";
			temp.x = 195;
			temp.y = 12;
			return temp;
		}

		private function btnCancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCancel = temp;
			temp.name = "btnCancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "删除";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.width = 79;
			temp.x = 236;
			temp.y = 528;
			return temp;
		}

		private function btnTiqu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnTiqu = temp;
			temp.name = "btnTiqu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "提取附件";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 73;
			temp.x = 323;
			temp.y = 531;
			return temp;
		}

		private function chkSelect_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkSelect = temp;
			temp.name = "chkSelect";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 37;
			temp.y = 539;
			return temp;
		}

		private function imgNO_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgNO = temp;
			temp.name = "imgNO";
			temp.styleName = "ui/app/mail/dangqian.png";
			temp.x = 69;
			temp.y = 236;
			return temp;
		}

		private function listMail_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listMail = temp;
			temp.name = "listMail";
			temp.height = 428;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 394;
			temp.x = 19;
			temp.y = 77;
			return temp;
		}

		private function tab_nv_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_nv = temp;
			temp.name = "tab_nv";
			temp.btnWidth = 67;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 71;
			temp.x = 20;
			temp.y = 44;
			temp.layout = __MailReceive_Skin_HorizontalLayout1_i();
			temp.dataProvider = __MailReceive_Skin_ArrayCollection1_i();
			return temp;
		}

	}
}