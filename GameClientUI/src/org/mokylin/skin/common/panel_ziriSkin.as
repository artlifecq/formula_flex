package org.mokylin.skin.common
{
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.common.TongYongTanKuang_bg;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class panel_ziriSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;

		public var msg_list:feathers.controls.List;

		public var tab_zizhi:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function panel_ziriSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 581;
			this.width = 337;
			this.elementsContent = [bg_i(),__panel_ziriSkin_UIAsset1_i(),btnClose_i(),tab_zizhi_i(),msg_list_i(),__panel_ziriSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __panel_ziriSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部'];
			return temp;
		}

		private function __panel_ziriSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 1;
			return temp;
		}

		private function __panel_ziriSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 500;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 317;
			temp.x = 10;
			temp.y = 69;
			return temp;
		}

		private function __panel_ziriSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/background/rizijilu.png";
			temp.x = 124;
			temp.y = 7;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 581;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongTanKuang_bg()
			temp.skin = skin
			temp.width = 337;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 302;
			temp.y = 6;
			return temp;
		}

		private function msg_list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			msg_list = temp;
			temp.name = "msg_list";
			temp.height = 481;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 308;
			temp.x = 18;
			temp.y = 73;
			return temp;
		}

		private function tab_zizhi_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_zizhi = temp;
			temp.name = "tab_zizhi";
			temp.btnWidth = 66;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.x = 21;
			temp.y = 41;
			temp.layout = __panel_ziriSkin_HorizontalLayout1_i();
			temp.dataProvider = __panel_ziriSkin_ArrayCollection1_i();
			return temp;
		}

	}
}