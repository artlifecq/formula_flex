package org.mokylin.skin.app.systemSet
{
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.systemSet.guajiset_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class systemSet_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var containers:feathers.controls.SkinnableContainer;

		public var tab_set:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function systemSet_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__systemSet_Skin_Group1_i(),__systemSet_Skin_UIAsset5_i(),tab_set_i(),__systemSet_Skin_UIAsset6_i(),btnClose_i(),containers_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __systemSet_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['挂机设置','系统设置','屏蔽设置','快捷键'];
			return temp;
		}

		private function __systemSet_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 6;
			temp.elementsContent = [__systemSet_Skin_UIAsset1_i(),__systemSet_Skin_UIAsset2_i()];
			return temp;
		}

		private function __systemSet_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			return temp;
		}

		private function __systemSet_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/yiji_head.png";
			temp.width = 432;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __systemSet_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 481;
			temp.styleName = "ui/common/background/yiji_mianban.png";
			temp.width = 423;
			temp.x = 4;
			temp.y = 75;
			return temp;
		}

		private function __systemSet_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 444;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 13;
			temp.y = 73;
			return temp;
		}

		private function __systemSet_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/shezhi.png";
			temp.x = 196;
			temp.y = 14;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 397;
			temp.y = 25;
			return temp;
		}

		private function containers_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			containers = temp;
			temp.name = "containers";
			temp.height = 441;
			var skin:StateSkin = new org.mokylin.skin.app.systemSet.guajiset_Skin()
			temp.skin = skin
			temp.width = 403;
			temp.x = 13;
			temp.y = 73;
			return temp;
		}

		private function tab_set_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_set = temp;
			temp.name = "tab_set";
			temp.btnWidth = 67;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.x = 20;
			temp.y = 45;
			temp.layout = __systemSet_Skin_HorizontalLayout1_i();
			temp.dataProvider = __systemSet_Skin_ArrayCollection1_i();
			return temp;
		}

	}
}