package org.mokylin.skin.app.equip
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.equip.button.ButtonBtn_qianghua;
	import org.mokylin.skin.app.equip.button.ButtonBtn_you;
	import org.mokylin.skin.app.equip.button.ButtonBtn_zuo;
	import org.mokylin.skin.app.equip.radio.RadioButtonSkin_equipradio;
	import org.mokylin.skin.component.button.ButtonSkin_wenhao;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin;
	import org.mokylin.skin.component.list.EquipListSkin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_equipnormal;
	import org.mokylin.skin.component.tabbar.TabBarSkin_sulianganniu;
	import org.mokylin.skin.component.uinumber.UINumberSkin_general;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipRefinePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoRefine:feathers.controls.Check;

		public var bandSilver:feathers.controls.Radio;

		public var costBar:feathers.controls.TabBar;

		public var createBtn:feathers.controls.Button;

		public var equipName:feathers.controls.Label;

		public var errorLbl:feathers.controls.Label;

		public var grid0:feathers.controls.UIAsset;

		public var gridList:feathers.controls.List;

		public var haveBindSilver:feathers.controls.Label;

		public var haveSilver:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftBtn:feathers.controls.Button;

		public var mainGrid:feathers.controls.UIAsset;

		public var materialGroup:feathers.controls.Group;

		public var materialName:feathers.controls.Label;

		public var page:feathers.controls.Label;

		public var rate:feathers.controls.UINumber;

		public var refineTimes:feathers.controls.ComboBox;

		public var rightBtn:feathers.controls.Button;

		public var silver:feathers.controls.Radio;

		public var silverLbl:feathers.controls.Label;

		public var typeBar:feathers.controls.TabBar;

		public var wenhao:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipRefinePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 510;
			this.width = 771;
			labelFilterBlack_i();
			this.elementsContent = [__EquipRefinePanelSkin_UIAsset1_i(),__EquipRefinePanelSkin_UIAsset2_i(),__EquipRefinePanelSkin_UIAsset3_i(),__EquipRefinePanelSkin_UIAsset4_i(),grid0_i(),__EquipRefinePanelSkin_UIAsset5_i(),createBtn_i(),errorLbl_i(),__EquipRefinePanelSkin_Label1_i(),silverLbl_i(),bandSilver_i(),silver_i(),materialGroup_i(),__EquipRefinePanelSkin_Label3_i(),__EquipRefinePanelSkin_Label4_i(),autoRefine_i(),__EquipRefinePanelSkin_UIAsset6_i(),typeBar_i(),__EquipRefinePanelSkin_UIAsset7_i(),rate_i(),__EquipRefinePanelSkin_UIAsset8_i(),__EquipRefinePanelSkin_UIAsset9_i(),materialName_i(),refineTimes_i(),wenhao_i(),__EquipRefinePanelSkin_UIAsset10_i(),mainGrid_i(),__EquipRefinePanelSkin_UIAsset11_i(),equipName_i(),__EquipRefinePanelSkin_UIAsset12_i(),__EquipRefinePanelSkin_UIAsset13_i(),__EquipRefinePanelSkin_UIAsset14_i(),__EquipRefinePanelSkin_UIAsset15_i(),leftBtn_i(),rightBtn_i(),page_i(),gridList_i(),__EquipRefinePanelSkin_UIAsset16_i(),__EquipRefinePanelSkin_UIAsset17_i(),__EquipRefinePanelSkin_Label5_i(),haveSilver_i(),__EquipRefinePanelSkin_Label6_i(),haveBindSilver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __EquipRefinePanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5'];
			return temp;
		}

		private function __EquipRefinePanelSkin_ArrayCollection2_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['装 备','强化石'];
			return temp;
		}

		private function __EquipRefinePanelSkin_ArrayCollection3_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5','6','7','8','9','10'];
			return temp;
		}

		private function __EquipRefinePanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __EquipRefinePanelSkin_HorizontalLayout2_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __EquipRefinePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.text = "消耗金钱：";
			temp.color = 0xD4C996;
			temp.x = 84;
			temp.y = 373;
			return temp;
		}

		private function __EquipRefinePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 21;
			temp.text = "强化石数量：";
			temp.color = 0xD4C996;
			temp.width = 95;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipRefinePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "强化至";
			temp.color = 0x98692D;
			temp.visible = false;
			temp.width = 47;
			temp.x = 210;
			temp.y = 332;
			return temp;
		}

		private function __EquipRefinePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "级";
			temp.color = 0x98692D;
			temp.visible = false;
			temp.x = 332;
			temp.y = 334;
			return temp;
		}

		private function __EquipRefinePanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "银两";
			temp.color = 0xD4C996;
			temp.x = 446;
			temp.y = 483;
			return temp;
		}

		private function __EquipRefinePanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "绑银";
			temp.color = 0xD4C996;
			temp.x = 609;
			temp.y = 483;
			return temp;
		}

		private function __EquipRefinePanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 0;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zuowupinkuang.png";
			temp.x = 32;
			temp.y = 51;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zhuangbei.png";
			temp.x = 78;
			temp.y = 34;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 510;
			temp.styleName = "ui/common/bar/sugang.png";
			temp.width = 4;
			temp.x = 434;
			temp.y = 0;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 332;
			temp.x = 437;
			temp.y = 471;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 332;
			temp.x = 437;
			temp.y = 23;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 100;
			temp.x = 555;
			temp.y = 434;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 120;
			temp.x = 477;
			temp.y = 480;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 118;
			temp.x = 644;
			temp.y = 480;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zhuangbeidi2.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 248;
			temp.styleName = "ui/app/equip/dikuang.png";
			temp.x = 8;
			temp.y = 21;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zuowupinkuang.png";
			temp.x = 272;
			temp.y = 51;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/liangdi.png";
			temp.x = 107;
			temp.y = 262;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 165;
			temp.x = 79;
			temp.y = 370;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zhuangbeidi.jpg";
			temp.x = 435;
			temp.y = 0;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/combine/chenggongjilv.png";
			temp.x = 156;
			temp.y = 274;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/jiantou.png";
			temp.x = 192;
			temp.y = 93;
			return temp;
		}

		private function __EquipRefinePanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/qinghuashi.png";
			temp.x = 312;
			temp.y = 34;
			return temp;
		}

		private function autoRefine_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			autoRefine = temp;
			temp.name = "autoRefine";
			temp.label = "自动强化";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_3;
			temp.color = 0x98692D;
			temp.visible = false;
			temp.x = 101;
			temp.y = 332;
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
			temp.width = 59;
			temp.x = 256;
			temp.y = 369;
			return temp;
		}

		private function costBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			costBar = temp;
			temp.name = "costBar";
			temp.btnWidth = 23;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_sulianganniu;
			temp.width = 127;
			temp.x = 86;
			temp.y = 0;
			temp.layout = __EquipRefinePanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __EquipRefinePanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function createBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			createBtn = temp;
			temp.name = "createBtn";
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonBtn_qianghua;
			temp.x = 173;
			temp.y = 414;
			return temp;
		}

		private function equipName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			equipName = temp;
			temp.name = "equipName";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xE530EC;
			temp.width = 119;
			temp.x = 43;
			temp.y = 178;
			return temp;
		}

		private function errorLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			errorLbl = temp;
			temp.name = "errorLbl";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.textAlign = "center";
			temp.color = 0xC21515;
			temp.width = 267;
			temp.x = 100;
			temp.y = 477;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 303;
			temp.y = 83;
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
			temp.layout = __EquipRefinePanelSkin_TileLayout1_i();
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
			temp.width = 121;
			temp.x = 643;
			temp.y = 483;
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
			temp.width = 125;
			temp.x = 478;
			temp.y = 483;
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
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 63;
			temp.y = 83;
			return temp;
		}

		private function materialGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			materialGroup = temp;
			temp.name = "materialGroup";
			temp.width = 228;
			temp.x = 193;
			temp.y = 226;
			temp.elementsContent = [__EquipRefinePanelSkin_Label2_i(),costBar_i()];
			return temp;
		}

		private function materialName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			materialName = temp;
			temp.name = "materialName";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0x98692D;
			temp.width = 114;
			temp.x = 287;
			temp.y = 178;
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

		private function rate_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			rate = temp;
			temp.name = "rate";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "100%";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_general;
			temp.width = 169;
			temp.x = 246;
			temp.y = 277;
			return temp;
		}

		private function refineTimes_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			refineTimes = temp;
			temp.name = "refineTimes";
			temp.height = 23;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin;
			temp.visible = false;
			temp.width = 62;
			temp.x = 258;
			temp.y = 333;
			temp.dataProvider = __EquipRefinePanelSkin_ArrayCollection3_i();
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
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 146;
			temp.y = 373;
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
			temp.width = 69;
			temp.x = 319;
			temp.y = 369;
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
			temp.width = 176;
			temp.x = 450;
			temp.y = 0;
			temp.layout = __EquipRefinePanelSkin_HorizontalLayout2_i();
			temp.dataProvider = __EquipRefinePanelSkin_ArrayCollection2_i();
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