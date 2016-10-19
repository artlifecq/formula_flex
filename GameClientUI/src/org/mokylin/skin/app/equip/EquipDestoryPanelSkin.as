package org.mokylin.skin.app.equip
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.equip.button.ButtonBtn_kaishihaijie;
	import org.mokylin.skin.app.equip.button.ButtonBtn_you;
	import org.mokylin.skin.app.equip.button.ButtonBtn_zuo;
	import org.mokylin.skin.app.equip.radio.RadioButtonSkin_equipradio;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.button.ButtonSkin_wenhao;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipDestoryPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bandSilver:feathers.controls.Radio;

		public var createBtn:feathers.controls.Button;

		public var destoryGetMaterialGroup:feathers.controls.Group;

		public var equipName:feathers.controls.Label;

		public var errorLbl:feathers.controls.Label;

		public var getEquip:feathers.controls.Button;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var gridList:feathers.controls.List;

		public var haveBindSilver:feathers.controls.Label;

		public var haveSilver:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftBtn:feathers.controls.Button;

		public var mainGrid:feathers.controls.UIAsset;

		public var material0:feathers.controls.Label;

		public var material1:feathers.controls.Label;

		public var material2:feathers.controls.Label;

		public var material3:feathers.controls.Label;

		public var page:feathers.controls.Label;

		public var rightBtn:feathers.controls.Button;

		public var silver:feathers.controls.Radio;

		public var silverLbl:feathers.controls.Label;

		public var wenhao:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipDestoryPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 510;
			this.width = 771;
			labelFilterBlack_i();
			this.elementsContent = [__EquipDestoryPanelSkin_UIAsset1_i(),__EquipDestoryPanelSkin_UIAsset2_i(),__EquipDestoryPanelSkin_UIAsset3_i(),gridList_i(),__EquipDestoryPanelSkin_UIAsset4_i(),__EquipDestoryPanelSkin_UIAsset5_i(),mainGrid_i(),createBtn_i(),getEquip_i(),errorLbl_i(),equipName_i(),bandSilver_i(),silver_i(),__EquipDestoryPanelSkin_UIAsset6_i(),wenhao_i(),destoryGetMaterialGroup_i(),__EquipDestoryPanelSkin_UIAsset11_i(),__EquipDestoryPanelSkin_Label1_i(),__EquipDestoryPanelSkin_UIAsset12_i(),silverLbl_i(),__EquipDestoryPanelSkin_UIAsset13_i(),leftBtn_i(),rightBtn_i(),page_i(),__EquipDestoryPanelSkin_UIAsset14_i(),__EquipDestoryPanelSkin_UIAsset15_i(),__EquipDestoryPanelSkin_Label2_i(),haveSilver_i(),__EquipDestoryPanelSkin_Label3_i(),haveBindSilver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __EquipDestoryPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.text = "需要金钱：";
			temp.color = 0xD4C996;
			temp.x = 60;
			temp.y = 387;
			return temp;
		}

		private function __EquipDestoryPanelSkin_Label2_i():feathers.controls.Label
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

		private function __EquipDestoryPanelSkin_Label3_i():feathers.controls.Label
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

		private function __EquipDestoryPanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 0;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fenge2.png";
			temp.x = 261;
			temp.y = 10;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 185;
			temp.x = 56;
			temp.y = 385;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 100;
			temp.x = 555;
			temp.y = 440;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/henggang.png";
			temp.width = 332;
			temp.x = 437;
			temp.y = 471;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 120;
			temp.x = 477;
			temp.y = 480;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 118;
			temp.x = 644;
			temp.y = 480;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zhuangbeidi.jpg";
			temp.x = 437;
			temp.y = 0;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zhuangbeidi2.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 215;
			temp.styleName = "ui/app/equip/dikuang.png";
			temp.x = 8;
			temp.y = 21;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/zuowupinkuang.png";
			temp.x = 152;
			temp.y = 51;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/chaijiewupin.png";
			temp.x = 182;
			temp.y = 32;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 510;
			temp.styleName = "ui/common/bar/sugang.png";
			temp.width = 4;
			temp.x = 434;
			temp.y = 0;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fengedi.png";
			temp.width = 355;
			temp.x = 22;
			temp.y = 2;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/huodewupin.png";
			temp.x = 160;
			temp.y = 0;
			return temp;
		}

		private function __EquipDestoryPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/bar/fenge1.png";
			temp.x = 53;
			temp.y = 10;
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
			temp.width = 67;
			temp.x = 257;
			temp.y = 385;
			return temp;
		}

		private function createBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			createBtn = temp;
			temp.name = "createBtn";
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonBtn_kaishihaijie;
			temp.x = 167;
			temp.y = 424;
			return temp;
		}

		private function destoryGetMaterialGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			destoryGetMaterialGroup = temp;
			temp.name = "destoryGetMaterialGroup";
			temp.height = 129;
			temp.width = 404;
			temp.x = 20;
			temp.y = 237;
			temp.elementsContent = [grid0_i(),grid1_i(),grid2_i(),grid3_i(),material0_i(),material1_i(),material2_i(),material3_i(),__EquipDestoryPanelSkin_UIAsset7_i(),__EquipDestoryPanelSkin_UIAsset8_i(),__EquipDestoryPanelSkin_UIAsset9_i(),__EquipDestoryPanelSkin_UIAsset10_i()];
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
			temp.x = 163;
			temp.y = 173;
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
			temp.width = 189;
			temp.x = 140;
			temp.y = 476;
			return temp;
		}

		private function getEquip_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			getEquip = temp;
			temp.name = "getEquip";
			temp.height = 31;
			temp.label = "取回材料";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_getequip;
			temp.width = 76;
			temp.x = 343;
			temp.y = 462;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 14;
			temp.y = 44;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 115;
			temp.y = 44;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 225;
			temp.y = 44;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 334;
			temp.y = 44;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 440;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 332;
			temp.x = 438;
			temp.y = 1;
			temp.layout = __EquipDestoryPanelSkin_TileLayout1_i();
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
			temp.width = 123;
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
			temp.y = 442;
			return temp;
		}

		private function mainGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid = temp;
			temp.name = "mainGrid";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 183;
			temp.y = 83;
			return temp;
		}

		private function material0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			material0 = temp;
			temp.name = "material0";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xF0F9CC;
			temp.width = 84;
			temp.x = 0;
			temp.y = 109;
			return temp;
		}

		private function material1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			material1 = temp;
			temp.name = "material1";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xF0F9CC;
			temp.width = 84;
			temp.x = 100;
			temp.y = 109;
			return temp;
		}

		private function material2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			material2 = temp;
			temp.name = "material2";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xF0F9CC;
			temp.width = 84;
			temp.x = 210;
			temp.y = 109;
			return temp;
		}

		private function material3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			material3 = temp;
			temp.name = "material3";
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xF0F9CC;
			temp.width = 84;
			temp.x = 320;
			temp.y = 109;
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
			temp.y = 442;
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
			temp.y = 442;
			return temp;
		}

		private function silverLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			silverLbl = temp;
			temp.name = "silverLbl";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.text = "123123";
			temp.color = 0xF4BD63;
			temp.width = 117;
			temp.x = 128;
			temp.y = 388;
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
			temp.width = 64;
			temp.x = 320;
			temp.y = 385;
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