package org.mokylin.skin.app.maps
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.maps.mapItems;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_tab;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class maps_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Item1:feathers.controls.SkinnableContainer;

		public var Item2:feathers.controls.SkinnableContainer;

		public var Item3:feathers.controls.SkinnableContainer;

		public var bg:feathers.controls.SkinnableContainer;

		public var btn_go:feathers.controls.Button;

		public var grp_cont:feathers.controls.Group;

		public var grp_msg:feathers.controls.Group;

		public var lbl_mapName:feathers.controls.Label;

		public var locat_x:feathers.controls.TextInput;

		public var locat_y:feathers.controls.TextInput;

		public var scroll_Bar:feathers.controls.ScrollContainer;

		public var tab:feathers.controls.TabBar;

		public var uiOver:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function maps_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__maps_Skin_UIAsset1_i(),tab_i(),grp_cont_i(),uiOver_i(),__maps_Skin_UIAsset2_i(),__maps_Skin_UIAsset3_i(),Item1_i(),Item2_i(),Item3_i(),scroll_Bar_i(),grp_msg_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Item1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			Item1 = temp;
			temp.name = "Item1";
			temp.height = 28;
			var skin:StateSkin = new org.mokylin.skin.app.maps.mapItems()
			temp.skin = skin
			temp.width = 247;
			temp.x = 667;
			temp.y = 87;
			return temp;
		}

		private function Item2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			Item2 = temp;
			temp.name = "Item2";
			temp.height = 28;
			var skin:StateSkin = new org.mokylin.skin.app.maps.mapItems()
			temp.skin = skin
			temp.width = 247;
			temp.x = 667;
			temp.y = 207;
			return temp;
		}

		private function Item3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			Item3 = temp;
			temp.name = "Item3";
			temp.height = 28;
			var skin:StateSkin = new org.mokylin.skin.app.maps.mapItems()
			temp.skin = skin
			temp.width = 247;
			temp.x = 667;
			temp.y = 329;
			return temp;
		}

		private function __maps_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['当前地图'];
			return temp;
		}

		private function __maps_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __maps_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前地图：";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 2;
			temp.y = 10;
			return temp;
		}

		private function __maps_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "X:";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 536;
			temp.y = 13;
			return temp;
		}

		private function __maps_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "Y:";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 664;
			temp.y = 13;
			return temp;
		}

		private function __maps_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 459;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __maps_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 459;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 278;
			temp.x = 662;
			temp.y = 82;
			return temp;
		}

		private function __maps_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/ditu.png";
			temp.x = 453;
			temp.y = 8;
			return temp;
		}

		private function __maps_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/hongdi.png";
			temp.x = 0;
			temp.y = 0;
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

		private function btn_go_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_go = temp;
			temp.name = "btn_go";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "前 往";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 805;
			temp.y = 3;
			return temp;
		}

		private function grp_cont_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_cont = temp;
			temp.name = "grp_cont";
			temp.height = 449;
			temp.width = 638;
			temp.x = 23;
			temp.y = 88;
			return temp;
		}

		private function grp_msg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_msg = temp;
			temp.name = "grp_msg";
			temp.x = 23;
			temp.y = 547;
			temp.elementsContent = [__maps_Skin_UIAsset4_i(),__maps_Skin_Label1_i(),lbl_mapName_i(),__maps_Skin_Label2_i(),__maps_Skin_Label3_i(),locat_y_i(),locat_x_i(),btn_go_i()];
			return temp;
		}

		private function lbl_mapName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_mapName = temp;
			temp.name = "lbl_mapName";
			temp.text = "马贼大本营";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 75;
			temp.y = 10;
			return temp;
		}

		private function locat_x_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			locat_x = temp;
			temp.name = "locat_x";
			temp.height = 25;
			temp.maxChars = 5;
			temp.restrict = "\"0-9\"";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0x55BD15;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 552;
			temp.y = 9;
			return temp;
		}

		private function locat_y_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			locat_y = temp;
			temp.name = "locat_y";
			temp.height = 25;
			temp.maxChars = 5;
			temp.restrict = "\"0-9\"";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.textAlign = "center";
			temp.color = 0x55BD15;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 679;
			temp.y = 9;
			return temp;
		}

		private function scroll_Bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroll_Bar = temp;
			temp.name = "scroll_Bar";
			temp.height = 452;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 916;
			temp.y = 86;
			return temp;
		}

		private function tab_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab = temp;
			temp.name = "tab";
			temp.btnWidth = 78;
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_tab;
			temp.width = 174;
			temp.x = 27;
			temp.y = 54;
			temp.layout = __maps_Skin_HorizontalLayout1_i();
			temp.dataProvider = __maps_Skin_ArrayCollection1_i();
			return temp;
		}

		private function uiOver_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiOver = temp;
			temp.name = "uiOver";
			temp.height = 449;
			temp.styleName = "ui/app/maps/bggg.png";
			temp.width = 638;
			temp.x = 23;
			temp.y = 88;
			return temp;
		}

	}
}