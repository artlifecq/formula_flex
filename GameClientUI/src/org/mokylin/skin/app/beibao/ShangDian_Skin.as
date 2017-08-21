package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangDian_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var chkSelect:feathers.controls.Check;

		public var gCheck:feathers.controls.Group;

		public var lb_Title:feathers.controls.UIAsset;

		public var lst_pack0:feathers.controls.List;

		public var lst_pack1:feathers.controls.List;

		public var tab_pack:feathers.controls.TabBar;

		public var uiNo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangDian_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 447;
			this.width = 383;
			this.elementsContent = [__ShangDian_Skin_Group1_i(),lst_pack0_i(),lst_pack1_i(),bg_i(),lb_Title_i(),btnClose_i(),tab_pack_i(),__ShangDian_Skin_Label1_i(),gCheck_i(),uiNo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShangDian_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['常用道具','回 购'];
			return temp;
		}

		private function __ShangDian_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__ShangDian_Skin_UIAsset1_i(),__ShangDian_Skin_UIAsset2_i(),__ShangDian_Skin_UIAsset3_i()];
			return temp;
		}

		private function __ShangDian_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 1;
			return temp;
		}

		private function __ShangDian_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "单击购买商品";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 289;
			temp.y = 35;
			return temp;
		}

		private function __ShangDian_Skin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			return temp;
		}

		private function __ShangDian_Skin_TileLayout2_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			return temp;
		}

		private function __ShangDian_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 447;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 383;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 391;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 383;
			temp.x = 0;
			temp.y = 56;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 383;
			temp.x = 0;
			temp.y = 382;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shangdian/wdqkyd.png";
			temp.x = 31;
			temp.y = 3;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/beibao/cangku/ckmtiao.png";
			temp.x = 3;
			temp.y = 3;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 362;
			temp.y = 9;
			return temp;
		}

		private function chkSelect_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkSelect = temp;
			temp.name = "chkSelect";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gCheck_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gCheck = temp;
			temp.name = "gCheck";
			temp.x = 7;
			temp.y = 409;
			temp.elementsContent = [chkSelect_i(),__ShangDian_Skin_UIAsset4_i()];
			return temp;
		}

		private function lb_Title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lb_Title = temp;
			temp.name = "lb_Title";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/shangdian/suishenshangidan.png";
			temp.x = 30;
			temp.y = 7;
			return temp;
		}

		private function lst_pack0_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack0 = temp;
			temp.name = "lst_pack0";
			temp.height = 326;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 377;
			temp.x = 2;
			temp.y = 59;
			temp.layout = __ShangDian_Skin_TileLayout1_i();
			return temp;
		}

		private function lst_pack1_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack1 = temp;
			temp.name = "lst_pack1";
			temp.height = 330;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 377;
			temp.x = 2;
			temp.y = 59;
			temp.layout = __ShangDian_Skin_TileLayout2_i();
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 79;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 202;
			temp.x = 9;
			temp.y = 30;
			temp.layout = __ShangDian_Skin_HorizontalLayout1_i();
			temp.dataProvider = __ShangDian_Skin_ArrayCollection1_i();
			return temp;
		}

		private function uiNo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNo = temp;
			temp.name = "uiNo";
			temp.styleName = "ui/app/beibao/shangdian/zwhgsp.png";
			temp.x = 86;
			temp.y = 177;
			return temp;
		}

	}
}