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
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.maps.mapItems;
	import org.mokylin.skin.common.yiji_panelbg_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	import org.mokylin.skin.component.text.textInput2_Skin;

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

		public var btn_jia:feathers.controls.Button;

		public var btn_jian:feathers.controls.Button;

		public var grp_msg:feathers.controls.Group;

		public var lbl_mapName:feathers.controls.Label;

		public var lbl_name:feathers.controls.Label;

		public var locat_x:feathers.controls.SkinnableContainer;

		public var locat_y:feathers.controls.SkinnableContainer;

		public var scroll_Bar:feathers.controls.ScrollContainer;

		public var tab:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function maps_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),tab_i(),__maps_Skin_UIAsset1_i(),__maps_Skin_UIAsset2_i(),Item1_i(),Item2_i(),Item3_i(),scroll_Bar_i(),grp_msg_i()];
			
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
			temp.x = 664;
			temp.y = 75;
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
			temp.x = 664;
			temp.y = 195;
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
			temp.x = 664;
			temp.y = 317;
			return temp;
		}

		private function __maps_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['世界地图','当前地图'];
			return temp;
		}

		private function __maps_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			return temp;
		}

		private function __maps_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "当前地图：";
			temp.color = 0xAEA790;
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
			temp.x = 584;
			temp.y = 10;
			return temp;
		}

		private function __maps_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "Y:";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 712;
			temp.y = 10;
			return temp;
		}

		private function __maps_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 458;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 277;
			temp.x = 659;
			temp.y = 70;
			return temp;
		}

		private function __maps_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/ditu.png";
			temp.x = 442;
			temp.y = 11;
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
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.common.yiji_panelbg_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_go_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_go = temp;
			temp.name = "btn_go";
			temp.label = "前往";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 80;
			temp.x = 836;
			temp.y = 0;
			return temp;
		}

		private function grp_msg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_msg = temp;
			temp.name = "grp_msg";
			temp.x = 20;
			temp.y = 534;
			temp.elementsContent = [__maps_Skin_UIAsset4_i(),__maps_Skin_Label1_i(),lbl_mapName_i(),__maps_Skin_Label2_i(),__maps_Skin_Label3_i(),locat_x_i(),locat_y_i(),btn_go_i()];
			return temp;
		}

		private function lbl_mapName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_mapName = temp;
			temp.name = "lbl_mapName";
			temp.text = "马贼大本营";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 75;
			temp.y = 10;
			return temp;
		}

		private function locat_x_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			locat_x = temp;
			temp.name = "locat_x";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.component.text.textInput2_Skin()
			temp.skin = skin
			temp.width = 104;
			temp.x = 600;
			temp.y = 6;
			return temp;
		}

		private function locat_y_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			locat_y = temp;
			temp.name = "locat_y";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.component.text.textInput2_Skin()
			temp.skin = skin
			temp.width = 104;
			temp.x = 727;
			temp.y = 6;
			return temp;
		}

		private function scroll_Bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroll_Bar = temp;
			temp.name = "scroll_Bar";
			temp.height = 452;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 912;
			temp.y = 73;
			return temp;
		}

		private function tab_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab = temp;
			temp.name = "tab";
			temp.btnWidth = 90;
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 174;
			temp.x = 23;
			temp.y = 41;
			temp.layout = __maps_Skin_HorizontalLayout1_i();
			temp.dataProvider = __maps_Skin_ArrayCollection1_i();
			return temp;
		}

	}
}