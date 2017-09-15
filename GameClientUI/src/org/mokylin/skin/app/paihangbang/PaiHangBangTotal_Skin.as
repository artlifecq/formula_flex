package org.mokylin.skin.app.paihangbang
{
	import feathers.data.ListCollection;
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_tab;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PaiHangBangTotal_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var tabBar:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PaiHangBangTotal_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__PaiHangBangTotal_Skin_UIAsset1_i(),__PaiHangBangTotal_Skin_UIAsset2_i(),__PaiHangBangTotal_Skin_UIAsset5_i(),__PaiHangBangTotal_Skin_UIAsset6_i(),__PaiHangBangTotal_Skin_Group1_i(),tabBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PaiHangBangTotal_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['战力榜','巅峰对决'];
			return temp;
		}

		private function __PaiHangBangTotal_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 22;
			temp.y = 114;
			temp.elementsContent = [__PaiHangBangTotal_Skin_UIAsset7_i(),__PaiHangBangTotal_Skin_UIAsset8_i(),__PaiHangBangTotal_Skin_UIAsset9_i(),__PaiHangBangTotal_Skin_UIAsset10_i(),__PaiHangBangTotal_Skin_UIAsset11_i(),__PaiHangBangTotal_Skin_UIAsset12_i(),__PaiHangBangTotal_Skin_UIAsset13_i(),__PaiHangBangTotal_Skin_UIAsset14_i(),__PaiHangBangTotal_Skin_UIAsset15_i(),__PaiHangBangTotal_Skin_UIAsset16_i()];
			return temp;
		}

		private function __PaiHangBangTotal_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 93;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 124;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 186;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 217;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 248;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 304;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 502;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 369;
			temp.x = 569;
			temp.y = 84;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/paihangbang/word/quanpingtaipaihangbang.png";
			temp.x = 401;
			temp.y = 8;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/bg1.png";
			temp.x = 21;
			temp.y = 480;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 31;
			return temp;
		}

		private function __PaiHangBangTotal_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/paihangbang/list.png";
			temp.width = 546;
			temp.x = 0;
			temp.y = 62;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 78;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_tab;
			temp.x = 39;
			temp.y = 50;
			temp.layout = __PaiHangBangTotal_Skin_HorizontalLayout1_i();
			temp.dataProvider = __PaiHangBangTotal_Skin_ArrayCollection1_i();
			return temp;
		}

	}
}