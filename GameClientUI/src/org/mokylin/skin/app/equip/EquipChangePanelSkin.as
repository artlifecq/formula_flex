package org.mokylin.skin.app.equip
{
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.equip.button.ButtonBtn_equipclose;
	import org.mokylin.skin.component.tabbar.TabBarSkin_equipnormal;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipChangePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipChangePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 582;
			this.width = 785;
			this.elementsContent = [__EquipChangePanelSkin_UIAsset1_i(),__EquipChangePanelSkin_UIAsset2_i(),tabBar_i(),closeBtn_i(),__EquipChangePanelSkin_UIAsset3_i(),__EquipChangePanelSkin_UIAsset4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __EquipChangePanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['打 造','合 成','强 化','改 造','拆 解'];
			return temp;
		}

		private function __EquipChangePanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __EquipChangePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 582;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 790;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipChangePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function __EquipChangePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/fengetiao.png";
			temp.width = 772;
			temp.x = 9;
			temp.y = 55;
			return temp;
		}

		private function __EquipChangePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/equip/duan_zao.png";
			temp.x = 362;
			temp.y = 3;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.equip.button.ButtonBtn_equipclose);
			temp.x = 754;
			temp.y = 6;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarSkin_equipnormal);
			temp.width = 344;
			temp.x = 17;
			temp.y = 34;
			temp.layout = __EquipChangePanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __EquipChangePanelSkin_ArrayCollection1_i();
			return temp;
		}

	}
}