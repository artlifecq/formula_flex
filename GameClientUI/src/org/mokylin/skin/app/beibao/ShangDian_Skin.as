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

		public var lbMsg:feathers.controls.Label;

		public var lb_Title:feathers.controls.Label;

		public var lst_pack:feathers.controls.List;

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
			this.width = 364;
			this.elementsContent = [__ShangDian_Skin_Group1_i(),bg_i(),lb_Title_i(),btnClose_i(),lst_pack_i(),tab_pack_i(),__ShangDian_Skin_Label1_i(),chkSelect_i(),__ShangDian_Skin_UIAsset4_i(),uiNo_i(),lbMsg_i()];
			
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
			temp.data = ['常用道具','回购'];
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
			temp.gap = -2;
			return temp;
		}

		private function __ShangDian_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "单击购买商店";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 251;
			temp.y = 35;
			return temp;
		}

		private function __ShangDian_Skin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.requestedColumnCount = 7;
			temp.requestedRowCount = 6;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 447;
			temp.styleName = "ui/app/beibao/cangku/bg.png";
			temp.width = 364;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 386;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 354;
			temp.x = 5;
			temp.y = 56;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 348;
			temp.x = 8;
			temp.y = 382;
			return temp;
		}

		private function __ShangDian_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shangdian/wdqkyd.png";
			temp.x = 49;
			temp.y = 407;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/titilebg/head_bg.png";
			temp.width = 354;
			temp.x = 5;
			temp.y = 4;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.x = 340;
			temp.y = 9;
			return temp;
		}

		private function chkSelect_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkSelect = temp;
			temp.name = "chkSelect";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 18;
			temp.y = 404;
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.text = "最多保留10条，道具出售后下线则不保留信息";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 30;
			temp.y = 364;
			return temp;
		}

		private function lb_Title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_Title = temp;
			temp.name = "lb_Title";
			temp.bold = true;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 0;
			temp.text = "随身商店";
			temp.color = 0xa6a07b;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 33;
			temp.y = 7;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 326;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 346;
			temp.x = 9;
			temp.y = 60;
			temp.layout = __ShangDian_Skin_TileLayout1_i();
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 77;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 202;
			temp.x = 6;
			temp.y = 28;
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
			temp.x = 61;
			temp.y = 177;
			return temp;
		}

	}
}