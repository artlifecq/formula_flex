package org.mokylin.skin.app.equip
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.equip.button.ButtonBtn_combine;
	import org.mokylin.skin.app.equip.button.ButtonBtn_you;
	import org.mokylin.skin.app.equip.button.ButtonBtn_zuo;
	import org.mokylin.skin.app.equip.radio.RadioButtonSkin_equipradio;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.button.ButtonSkin_wenhao;
	import org.mokylin.skin.component.list.EquipListSkin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_equipnormal;
	import org.mokylin.skin.component.uinumber.UINumberSkin_general;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipCombinePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoJoin:feathers.controls.Button;

		public var bandSilver:feathers.controls.Radio;

		public var combineNum:feathers.controls.Label;

		public var createBtn:feathers.controls.Button;

		public var equipGroup:feathers.controls.Group;

		public var errorLbl:feathers.controls.Label;

		public var getEquip:feathers.controls.Button;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var gridList:feathers.controls.List;

		public var haveBindSilver:feathers.controls.Label;

		public var haveSilver:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftBtn:feathers.controls.Button;

		public var mainGrid:feathers.controls.UIAsset;

		public var materialGroup:feathers.controls.Group;

		public var page:feathers.controls.Label;

		public var rate:feathers.controls.Label;

		public var rateNum:feathers.controls.UINumber;

		public var refleshGroup:feathers.controls.Group;

		public var rightBtn:feathers.controls.Button;

		public var silver:feathers.controls.Radio;

		public var silverLbl:feathers.controls.Label;

		public var typeBar:feathers.controls.TabBar;

		public var updateRate:feathers.controls.Label;

		public var wenhao:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipCombinePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 509;
			this.width = 770;
			labelFilterBlack_i();
			this.elementsContent = [__EquipCombinePanelSkin_UIAsset1_i(),__EquipCombinePanelSkin_UIAsset2_i(),gridList_i(),__EquipCombinePanelSkin_UIAsset3_i(),__EquipCombinePanelSkin_UIAsset4_i(),__EquipCombinePanelSkin_UIAsset5_i(),grid0_i(),typeBar_i(),grid1_i(),grid2_i(),grid3_i(),grid4_i(),mainGrid_i(),autoJoin_i(),getEquip_i(),createBtn_i(),errorLbl_i(),materialGroup_i(),__EquipCombinePanelSkin_UIAsset8_i(),__EquipCombinePanelSkin_Label3_i(),silverLbl_i(),bandSilver_i(),silver_i(),equipGroup_i(),__EquipCombinePanelSkin_UIAsset10_i(),wenhao_i(),leftBtn_i(),rightBtn_i(),page_i(),__EquipCombinePanelSkin_UIAsset11_i(),__EquipCombinePanelSkin_UIAsset12_i(),__EquipCombinePanelSkin_Label5_i(),haveSilver_i(),__EquipCombinePanelSkin_Label6_i(),haveBindSilver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __EquipCombinePanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['装备合成','材料合成'];
			return temp;
		}

		private function __EquipCombinePanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __EquipCombinePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "成功几率：";
			temp.color = 0xD4C996;
			temp.width = 79;
			temp.x = 43;
			temp.y = 14;
			return temp;
		}

		private function __EquipCombinePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "合成数量：";
			temp.color = 0xD4C996;
			temp.width = 84;
			temp.x = 223;
			temp.y = 13;
			return temp;
		}

		private function __EquipCombinePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "需要金钱：";
			temp.color = 0xD4C996;
			temp.x = 74;
			temp.y = 395;
			return temp;
		}

		private function __EquipCombinePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.fontSize = 12;
			temp.text = "（提升几率：较高几率";
			temp.color = 0x98692D;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipCombinePanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "银两";
			temp.color = 0xD4C996;
			temp.x = 446;
			temp.y = 481;
			return temp;
		}

		private function __EquipCombinePanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 12;
			temp.text = "绑银";
			temp.color = 0xD4C996;
			temp.x = 609;
			temp.y = 481;
			return temp;
		}

		private function __EquipCombinePanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 0;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 100;
			temp.x = 555;
			temp.y = 434;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 120;
			temp.x = 477;
			temp.y = 480;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 118;
			temp.x = 644;
			temp.y = 480;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/combine/hechengdi_zuo.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zhuangbeidi.jpg";
			temp.x = 435;
			temp.y = 0;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 510;
			temp.styleName = "ui/common/bar/sugang.png";
			temp.width = 4;
			temp.x = 434;
			temp.y = 0;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 332;
			temp.x = 437;
			temp.y = 471;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 332;
			temp.x = 437;
			temp.y = 23;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 165;
			temp.x = 41;
			temp.y = 12;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 165;
			temp.x = 221;
			temp.y = 12;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 165;
			temp.x = 72;
			temp.y = 393;
			return temp;
		}

		private function __EquipCombinePanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/combine/chenggongjilv.png";
			temp.x = 45;
			temp.y = 0;
			return temp;
		}

		private function autoJoin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			autoJoin = temp;
			temp.name = "autoJoin";
			temp.label = "自动放入";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_getequip;
			temp.x = 186;
			temp.y = 212;
			return temp;
		}

		private function bandSilver_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			bandSilver = temp;
			temp.name = "bandSilver";
			temp.groupName = "CreateRadioSilver";
			temp.label = "绑银";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.app.equip.radio.RadioButtonSkin_equipradio;
			temp.textAlign = "left";
			temp.width = 60;
			temp.x = 249;
			temp.y = 392;
			return temp;
		}

		private function combineNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			combineNum = temp;
			temp.name = "combineNum";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0xD4C996;
			temp.width = 97;
			temp.x = 288;
			temp.y = 14;
			return temp;
		}

		private function createBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			createBtn = temp;
			temp.name = "createBtn";
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonBtn_combine;
			temp.x = 171;
			temp.y = 426;
			return temp;
		}

		private function equipGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			equipGroup = temp;
			temp.name = "equipGroup";
			temp.x = 88;
			temp.y = 341;
			temp.elementsContent = [__EquipCombinePanelSkin_UIAsset9_i(),rateNum_i(),refleshGroup_i()];
			return temp;
		}

		private function errorLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			errorLbl = temp;
			temp.name = "errorLbl";
			temp.height = 21;
			temp.text = "错误提示";
			temp.textAlign = "center";
			temp.color = 0xFE0000;
			temp.width = 189;
			temp.x = 137;
			temp.y = 479;
			return temp;
		}

		private function getEquip_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			getEquip = temp;
			temp.name = "getEquip";
			temp.height = 31;
			temp.label = "取回装备";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_getequip;
			temp.width = 76;
			temp.x = 356;
			temp.y = 471;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 62;
			temp.y = 48;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 330;
			temp.y = 52;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 61;
			temp.y = 233;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.height = 55;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 54;
			temp.x = 330;
			temp.y = 233;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.height = 74;
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.width = 76;
			temp.x = 184;
			temp.y = 132;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 406;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 332;
			temp.x = 438;
			temp.y = 29;
			temp.layout = __EquipCombinePanelSkin_TileLayout1_i();
			return temp;
		}

		private function haveBindSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			haveBindSilver = temp;
			temp.name = "haveBindSilver";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "888锭88文88两";
			temp.color = 0xF4BD63;
			temp.width = 124;
			temp.x = 642;
			temp.y = 482;
			return temp;
		}

		private function haveSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			haveSilver = temp;
			temp.name = "haveSilver";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "888锭88文88两";
			temp.color = 0xF4BD63;
			temp.width = 117;
			temp.x = 480;
			temp.y = 482;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function leftBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leftBtn = temp;
			temp.name = "leftBtn";
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonBtn_zuo;
			temp.width = 20;
			temp.x = 524;
			temp.y = 436;
			return temp;
		}

		private function mainGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid = temp;
			temp.name = "mainGrid";
			temp.height = 74;
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.width = 76;
			temp.x = 184;
			temp.y = 132;
			return temp;
		}

		private function materialGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			materialGroup = temp;
			temp.name = "materialGroup";
			temp.height = 46;
			temp.width = 398;
			temp.x = 32;
			temp.y = 341;
			temp.elementsContent = [__EquipCombinePanelSkin_UIAsset6_i(),__EquipCombinePanelSkin_Label1_i(),rate_i(),__EquipCombinePanelSkin_UIAsset7_i(),__EquipCombinePanelSkin_Label2_i(),combineNum_i()];
			return temp;
		}

		private function page_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			page = temp;
			temp.name = "page";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 19;
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.width = 92;
			temp.x = 557;
			temp.y = 436;
			return temp;
		}

		private function rateNum_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			rateNum = temp;
			temp.name = "rateNum";
			temp.gap = -8;
			temp.height = 25;
			temp.label = "100%";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_general;
			temp.width = 169;
			temp.x = 133;
			temp.y = 2;
			return temp;
		}

		private function rate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rate = temp;
			temp.name = "rate";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "0%";
			temp.color = 0xD4C996;
			temp.width = 98;
			temp.x = 108;
			temp.y = 14;
			return temp;
		}

		private function refleshGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			refleshGroup = temp;
			temp.name = "refleshGroup";
			temp.x = 10;
			temp.y = 39;
			temp.elementsContent = [__EquipCombinePanelSkin_Label4_i(),updateRate_i()];
			return temp;
		}

		private function rightBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rightBtn = temp;
			temp.name = "rightBtn";
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonBtn_you;
			temp.width = 20;
			temp.x = 662;
			temp.y = 436;
			return temp;
		}

		private function silverLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			silverLbl = temp;
			temp.name = "silverLbl";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0xD4C996;
			temp.width = 96;
			temp.x = 139;
			temp.y = 395;
			return temp;
		}

		private function silver_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			silver = temp;
			temp.name = "silver";
			temp.groupName = "CreateRadioSilver";
			temp.label = "银两";
			temp.styleClass = org.mokylin.skin.app.equip.radio.RadioButtonSkin_equipradio;
			temp.textAlign = "left";
			temp.width = 114;
			temp.x = 312;
			temp.y = 392;
			return temp;
		}

		private function typeBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			typeBar = temp;
			temp.name = "typeBar";
			temp.btnWidth = 85;
			temp.height = 25;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_equipnormal;
			temp.width = 178;
			temp.x = 450;
			temp.y = 0;
			temp.layout = __EquipCombinePanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __EquipCombinePanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function updateRate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			updateRate = temp;
			temp.name = "updateRate";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.fontSize = 12;
			temp.text = "刷新几率:99%)";
			temp.color = 0x98692D;
			temp.width = 118;
			temp.x = 168;
			temp.y = 0;
			return temp;
		}

		private function wenhao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			wenhao = temp;
			temp.name = "wenhao";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_wenhao;
			temp.x = 14;
			temp.y = 475;
			return temp;
		}

	}
}