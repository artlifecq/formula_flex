package org.mokylin.skin.app.equip
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.Tree;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.equip.EquipTreeItemSkin;
	import org.mokylin.skin.app.equip.button.ButtonBtn_dazao;
	import org.mokylin.skin.app.equip.radio.RadioButtonSkin_equipradio;
	import org.mokylin.skin.component.button.ButtonSkin_wenhao;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class EquipCreatePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bandSilver:feathers.controls.Radio;

		public var createBtn:feathers.controls.Button;

		public var equipName:feathers.controls.Label;

		public var errorLbl:feathers.controls.Label;

		public var grid0:feathers.controls.UIAsset;

		public var grid1:feathers.controls.UIAsset;

		public var gridList:feathers.controls.List;

		public var haveBindSilver:feathers.controls.Label;

		public var haveSilver:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var mainGrid:feathers.controls.UIAsset;

		public var material0:feathers.controls.Label;

		public var material1:feathers.controls.Label;

		public var quality1:feathers.controls.Label;

		public var quality2:feathers.controls.Label;

		public var quality3:feathers.controls.Label;

		public var quality4:feathers.controls.Label;

		public var qualityBg1:feathers.controls.UIAsset;

		public var qualityBg2:feathers.controls.UIAsset;

		public var qualityBg3:feathers.controls.UIAsset;

		public var qualityBg4:feathers.controls.UIAsset;

		public var silver:feathers.controls.Radio;

		public var silverLbl:feathers.controls.Label;

		public var tree:feathers.controls.Tree;

		public var wenhao:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function EquipCreatePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 515;
			this.width = 771;
			labelFilterBlack_i();
			this.elementsContent = [__EquipCreatePanelSkin_UIAsset1_i(),__EquipCreatePanelSkin_UIAsset2_i(),grid1_i(),grid0_i(),__EquipCreatePanelSkin_UIAsset3_i(),__EquipCreatePanelSkin_UIAsset4_i(),__EquipCreatePanelSkin_UIAsset5_i(),__EquipCreatePanelSkin_UIAsset6_i(),mainGrid_i(),createBtn_i(),gridList_i(),errorLbl_i(),__EquipCreatePanelSkin_Label1_i(),__EquipCreatePanelSkin_Label2_i(),__EquipCreatePanelSkin_Label3_i(),silverLbl_i(),bandSilver_i(),silver_i(),material1_i(),material0_i(),qualityBg4_i(),qualityBg2_i(),qualityBg1_i(),qualityBg3_i(),quality1_i(),quality2_i(),quality3_i(),quality4_i(),tree_i(),equipName_i(),__EquipCreatePanelSkin_UIAsset7_i(),wenhao_i(),__EquipCreatePanelSkin_UIAsset8_i(),__EquipCreatePanelSkin_UIAsset9_i(),__EquipCreatePanelSkin_Label4_i(),haveSilver_i(),__EquipCreatePanelSkin_Label5_i(),haveBindSilver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __EquipCreatePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.text = "需要金钱：";
			temp.color = 0xD4C996;
			temp.x = 349;
			temp.y = 272;
			return temp;
		}

		private function __EquipCreatePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 21;
			temp.text = "需要材料";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.width = 77;
			temp.x = 359;
			temp.y = 80;
			return temp;
		}

		private function __EquipCreatePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 21;
			temp.text = "需要材料";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.width = 86;
			temp.x = 593;
			temp.y = 80;
			return temp;
		}

		private function __EquipCreatePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "银两";
			temp.color = 0xD4C996;
			temp.x = 446;
			temp.y = 490;
			return temp;
		}

		private function __EquipCreatePanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "绑银";
			temp.color = 0xD4C996;
			temp.x = 609;
			temp.y = 490;
			return temp;
		}

		private function __EquipCreatePanelSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 3;
			temp.requestedColumnCount = 8;
			temp.requestedRowCount = 8;
			temp.verticalGap = 3;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/make/dazaodi.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 185;
			temp.x = 346;
			temp.y = 269;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/make/lv_an.png";
			temp.x = 324;
			temp.y = 219;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/make/lan_an.png";
			temp.x = 424;
			temp.y = 219;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/make/zi_an.png";
			temp.x = 524;
			temp.y = 219;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/make/huang_an.png";
			temp.x = 624;
			temp.y = 219;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/equip/make/pinzijilv.png";
			temp.x = 471;
			temp.y = 191;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 120;
			temp.x = 477;
			temp.y = 487;
			return temp;
		}

		private function __EquipCreatePanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/app/equip/make/shurukuang.png";
			temp.width = 118;
			temp.x = 644;
			temp.y = 487;
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
			temp.textAlign = "right";
			temp.width = 60;
			temp.x = 553;
			temp.y = 268;
			return temp;
		}

		private function createBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			createBtn = temp;
			temp.name = "createBtn";
			temp.styleClass = org.mokylin.skin.app.equip.button.ButtonBtn_dazao;
			temp.x = 460;
			temp.y = 303;
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
			temp.x = 461;
			temp.y = 172;
			return temp;
		}

		private function errorLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			errorLbl = temp;
			temp.name = "errorLbl";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.color = 0xC21515;
			temp.width = 162;
			temp.x = 577;
			temp.y = 320;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 370;
			temp.y = 15;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 609;
			temp.y = 15;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 114;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 507;
			temp.x = 264;
			temp.y = 369;
			temp.layout = __EquipCreatePanelSkin_TileLayout1_i();
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
			temp.width = 118;
			temp.x = 645;
			temp.y = 490;
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
			temp.width = 124;
			temp.x = 477;
			temp.y = 490;
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

		private function mainGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid = temp;
			temp.name = "mainGrid";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 478;
			temp.y = 85;
			return temp;
		}

		private function material0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			material0 = temp;
			temp.name = "material0";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.underline = false;
			temp.width = 149;
			temp.x = 323;
			temp.y = 101;
			return temp;
		}

		private function material1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			material1 = temp;
			temp.name = "material1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.underline = false;
			temp.width = 158;
			temp.x = 557;
			temp.y = 101;
			return temp;
		}

		private function quality1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			quality1 = temp;
			temp.name = "quality1";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xEFEFF3;
			temp.width = 85;
			temp.x = 323;
			temp.y = 223;
			return temp;
		}

		private function quality2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			quality2 = temp;
			temp.name = "quality2";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xEFEFF3;
			temp.width = 85;
			temp.x = 424;
			temp.y = 223;
			return temp;
		}

		private function quality3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			quality3 = temp;
			temp.name = "quality3";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xEFEFF3;
			temp.width = 85;
			temp.x = 523;
			temp.y = 223;
			return temp;
		}

		private function quality4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			quality4 = temp;
			temp.name = "quality4";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.textAlign = "center";
			temp.color = 0xEFEFF3;
			temp.width = 85;
			temp.x = 624;
			temp.y = 223;
			return temp;
		}

		private function qualityBg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg1 = temp;
			temp.name = "qualityBg1";
			temp.styleName = "ui/app/equip/make/lv.png";
			temp.x = 323;
			temp.y = 219;
			return temp;
		}

		private function qualityBg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg2 = temp;
			temp.name = "qualityBg2";
			temp.styleName = "ui/app/equip/make/lan.png";
			temp.x = 424;
			temp.y = 219;
			return temp;
		}

		private function qualityBg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg3 = temp;
			temp.name = "qualityBg3";
			temp.styleName = "ui/app/equip/make/zi.png";
			temp.x = 523;
			temp.y = 219;
			return temp;
		}

		private function qualityBg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qualityBg4 = temp;
			temp.name = "qualityBg4";
			temp.styleName = "ui/app/equip/make/huang.png";
			temp.x = 624;
			temp.y = 219;
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
			temp.width = 125;
			temp.x = 418;
			temp.y = 272;
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
			temp.textAlign = "right";
			temp.width = 60;
			temp.x = 626;
			temp.y = 268;
			return temp;
		}

		private function tree_i():feathers.controls.Tree
		{
			var temp:feathers.controls.Tree = new feathers.controls.Tree();
			tree = temp;
			temp.name = "tree";
			temp.height = 516;
			temp.styleClass = org.mokylin.skin.app.equip.EquipTreeItemSkin;
			temp.styleClass = org.mokylin.skin.component.list.EquipListSkin;
			temp.width = 266;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function wenhao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			wenhao = temp;
			temp.name = "wenhao";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_wenhao;
			temp.x = 273;
			temp.y = 337;
			return temp;
		}

	}
}