package org.mokylin.skin.app.systemSet
{
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.systemSet.guajiset_Skin;
	import org.mokylin.skin.app.systemSet.kuaijiejian_Skin;
	import org.mokylin.skin.app.systemSet.pingbiset_Skin;
	import org.mokylin.skin.app.systemSet.xitong_Skin;
	import org.mokylin.skin.common.TongYongPanelbg3;
	import org.mokylin.skin.component.tabbar.TabBarSkin_tab;

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
		public var bg:feathers.controls.SkinnableContainer;

		public var guaji:feathers.controls.SkinnableContainer;

		public var kuaijie:feathers.controls.SkinnableContainer;

		public var pingbi:feathers.controls.SkinnableContainer;

		public var tab_set:feathers.controls.TabBar;

		public var xitong:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function systemSet_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 565;
			this.width = 437;
			this.elementsContent = [bg_i(),__systemSet_Skin_UIAsset1_i(),__systemSet_Skin_UIAsset2_i(),__systemSet_Skin_UIAsset3_i(),guaji_i(),xitong_i(),pingbi_i(),kuaijie_i(),tab_set_i()];
			
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
			temp.data = ['挂机设置','画面设置','快捷键'];
			return temp;
		}

		private function __systemSet_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __systemSet_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 476;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 405;
			temp.x = 16;
			temp.y = 81;
			return temp;
		}

		private function __systemSet_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/systemSet/bg.png";
			temp.x = 19;
			temp.y = 102;
			return temp;
		}

		private function __systemSet_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/systemSet/shezhi.png";
			temp.x = 198;
			temp.y = 10;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 579;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg3()
			temp.skin = skin
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function guaji_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			guaji = temp;
			temp.name = "guaji";
			temp.height = 441;
			var skin:StateSkin = new org.mokylin.skin.app.systemSet.guajiset_Skin()
			temp.skin = skin
			temp.width = 403;
			temp.x = 16;
			temp.y = 81;
			return temp;
		}

		private function kuaijie_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			kuaijie = temp;
			temp.name = "kuaijie";
			temp.height = 470;
			var skin:StateSkin = new org.mokylin.skin.app.systemSet.kuaijiejian_Skin()
			temp.skin = skin
			temp.visible = false;
			temp.width = 404;
			temp.x = 15;
			temp.y = 82;
			return temp;
		}

		private function pingbi_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pingbi = temp;
			temp.name = "pingbi";
			temp.height = 470;
			var skin:StateSkin = new org.mokylin.skin.app.systemSet.pingbiset_Skin()
			temp.skin = skin
			temp.visible = false;
			temp.width = 405;
			temp.x = 15;
			temp.y = 82;
			return temp;
		}

		private function tab_set_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_set = temp;
			temp.name = "tab_set";
			temp.btnWidth = 78;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_tab;
			temp.x = 23;
			temp.y = 49;
			temp.layout = __systemSet_Skin_HorizontalLayout1_i();
			temp.dataProvider = __systemSet_Skin_ArrayCollection1_i();
			return temp;
		}

		private function xitong_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			xitong = temp;
			temp.name = "xitong";
			temp.height = 467;
			var skin:StateSkin = new org.mokylin.skin.app.systemSet.xitong_Skin()
			temp.skin = skin
			temp.visible = false;
			temp.width = 400;
			temp.x = 16;
			temp.y = 81;
			return temp;
		}

	}
}