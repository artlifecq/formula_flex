package org.mokylin.skin.app.team
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var line0:feathers.controls.UIAsset;

		public var line1:feathers.controls.UIAsset;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 511;
			this.width = 868;
			this.elementsContent = [__TeamPanelSkin_UIAsset1_i(),__TeamPanelSkin_UIAsset2_i(),__TeamPanelSkin_UIAsset3_i(),__TeamPanelSkin_UIAsset4_i(),tabBar_i(),line0_i(),line1_i(),btnClose_i(),__TeamPanelSkin_UIAsset5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['我的队伍','附近队伍','附近的人'];
			return temp;
		}

		private function __TeamPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 3;
			return temp;
		}

		private function __TeamPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 495;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 865;
			temp.x = 1;
			temp.y = 6;
			return temp;
		}

		private function __TeamPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 840;
			temp.x = 13;
			temp.y = 38;
			return temp;
		}

		private function __TeamPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 860;
			temp.x = 4;
			temp.y = 9;
			return temp;
		}

		private function __TeamPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 333;
			temp.styleName = "ui/app/team/di_tu.jpg";
			temp.width = 833;
			temp.x = 17;
			temp.y = 72;
			return temp;
		}

		private function __TeamPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.styleName = "ui/app/team/zudui.png";
			temp.x = 417;
			temp.y = 14;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_close);
			temp.width = 30;
			temp.x = 835;
			temp.y = 4;
			return temp;
		}

		private function line0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line0 = temp;
			temp.name = "line0";
			temp.height = 4;
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 835;
			temp.x = 15;
			temp.y = 405;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.height = 4;
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 835;
			temp.x = 15;
			temp.y = 70;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 80;
			temp.height = 28;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng);
			temp.width = 260;
			temp.x = 21;
			temp.y = 44;
			temp.layout = __TeamPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __TeamPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}