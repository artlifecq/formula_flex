package org.mokylin.skin.app.ActivityHall
{
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActivityHallPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var head_bg:feathers.controls.UIAsset;

		public var tabbar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActivityHallPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),head_bg_i(),btnClose_i(),__ActivityHallPanelSkin_UIAsset1_i(),__ActivityHallPanelSkin_UIAsset2_i(),tabbar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ActivityHallPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['赛马大会','其它活动'];
			return temp;
		}

		private function __ActivityHallPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 3;
			return temp;
		}

		private function __ActivityHallPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/huo_dong.png";
			temp.x = 373;
			temp.y = 4;
			return temp;
		}

		private function __ActivityHallPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 486;
			temp.styleName = "ui/common/backgound/di.png";
			temp.width = 764;
			temp.x = 13;
			temp.y = 70;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 575;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 791;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 768;
			temp.y = 3;
			return temp;
		}

		private function head_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_bg = temp;
			temp.name = "head_bg";
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 736;
			temp.x = 37;
			temp.y = 4;
			return temp;
		}

		private function tabbar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabbar = temp;
			temp.name = "tabbar";
			temp.btnWidth = 80;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;
			temp.x = 19;
			temp.y = 44;
			temp.layout = __ActivityHallPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __ActivityHallPanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}