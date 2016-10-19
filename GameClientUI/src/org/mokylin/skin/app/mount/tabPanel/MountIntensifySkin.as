package org.mokylin.skin.app.mount.tabPanel
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
	import org.mokylin.skin.component.list.ListSkin4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountIntensifySkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnRefine:feathers.controls.Button;

		public var curGenguImg:feathers.controls.UIAsset;

		public var grid0:feathers.controls.UIAsset;

		public var gridList:feathers.controls.List;

		public var group:feathers.controls.Group;

		public var group1:feathers.controls.Group;

		public var groupIcon:feathers.controls.Group;

		public var imgBg:feathers.controls.UIAsset;

		public var imgNoMount1:feathers.controls.UIAsset;

		public var imgNoMount2:feathers.controls.UIAsset;

		public var imgProgress:feathers.controls.UIAsset;

		public var imgTips:feathers.controls.UIAsset;

		public var labBangyin:feathers.controls.Label;

		public var labBindSilver:feathers.controls.Label;

		public var labConsume:feathers.controls.Label;

		public var labConsume2:feathers.controls.Label;

		public var labCurGengu:feathers.controls.Label;

		public var labDesc1:feathers.controls.Label;

		public var labDesc2:feathers.controls.Label;

		public var labExp:feathers.controls.Label;

		public var labGetExp:feathers.controls.Label;

		public var labGold:feathers.controls.Label;

		public var labNextGengu:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftBtn:feathers.controls.Button;

		public var leftGroup:feathers.controls.Group;

		public var mainGrid1:feathers.controls.UIAsset;

		public var nextGenguImg:feathers.controls.UIAsset;

		public var page:feathers.controls.Label;

		public var rightBtn:feathers.controls.Button;

		public var rightGroup:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountIntensifySkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 524;
			this.width = 703;
			labelFilterBlack_i();
			this.elementsContent = [imgBg_i(),leftGroup_i(),rightGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountIntensifySkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "坐骑携带等级越高。其根骨上限越高";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 408;
			temp.x = 0;
			temp.y = 126;
			return temp;
		}

		private function __MountIntensifySkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "请放入材料坐骑或锻骨丹";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 140;
			temp.y = 409;
			return temp;
		}

		private function __MountIntensifySkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 25;
			temp.fontSize = 14;
			temp.text = "拥有银两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 10;
			temp.y = 443;
			return temp;
		}

		private function __MountIntensifySkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "拥有绑银";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 10;
			temp.y = 470;
			return temp;
		}

		private function __MountIntensifySkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 3;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __MountIntensifySkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 15;
			temp.repeatScale9Skin = false;
			temp.styleName = "ui/component/progress/skin_mount/jin_du_tiao_di.png";
			temp.width = 392;
			temp.x = 10;
			temp.y = 145;
			return temp;
		}

		private function __MountIntensifySkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/backgound/mount_di.png";
			temp.width = 100;
			temp.x = 96;
			temp.y = 405;
			return temp;
		}

		private function __MountIntensifySkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 5;
			return temp;
		}

		private function __MountIntensifySkin_VerticalLayout2_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 5;
			return temp;
		}

		private function __MountIntensifySkin_VerticalLayout3_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 1;
			temp.paddingTop = -2;
			return temp;
		}

		private function btnRefine_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefine = temp;
			temp.name = "btnRefine";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "提升根骨";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 130;
			temp.y = 469;
			return temp;
		}

		private function curGenguImg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			curGenguImg = temp;
			temp.name = "curGenguImg";
			temp.styleName = "ui/app/mount/char/dang_qian_gen_gu.png";
			temp.x = 15;
			temp.y = 55;
			return temp;
		}

		private function grid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid0 = temp;
			temp.name = "grid0";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 169;
			temp.y = 49;
			return temp;
		}

		private function gridList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			gridList = temp;
			temp.name = "gridList";
			temp.height = 385;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin4;
			temp.width = 300;
			temp.x = 2;
			temp.y = 12;
			temp.layout = __MountIntensifySkin_TileLayout1_i();
			return temp;
		}

		private function group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group1 = temp;
			temp.name = "group1";
			temp.height = 116;
			temp.width = 91;
			temp.x = 264;
			temp.y = 278;
			temp.layout = __MountIntensifySkin_VerticalLayout2_i();
			return temp;
		}

		private function groupIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupIcon = temp;
			temp.name = "groupIcon";
			temp.height = 116;
			temp.width = 20;
			temp.x = 243;
			temp.y = 275;
			temp.layout = __MountIntensifySkin_VerticalLayout3_i();
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 116;
			temp.width = 127;
			temp.x = 115;
			temp.y = 278;
			temp.layout = __MountIntensifySkin_VerticalLayout1_i();
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.styleName = "ui/app/mount/img/di.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgNoMount1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgNoMount1 = temp;
			temp.name = "imgNoMount1";
			temp.styleName = "ui/app/mount/char/fang_ru_zuo_qi.png";
			temp.x = 140;
			temp.y = 210;
			return temp;
		}

		private function imgNoMount2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgNoMount2 = temp;
			temp.name = "imgNoMount2";
			temp.styleName = "ui/app/mount/char/fang_ru_zuo_qi.png";
			temp.x = 140;
			temp.y = 310;
			return temp;
		}

		private function imgProgress_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgProgress = temp;
			temp.name = "imgProgress";
			temp.height = 8;
			temp.styleName = "ui/component/progress/skin_mount/jin_du_tiao.png";
			temp.width = 375;
			temp.x = 18;
			temp.y = 148;
			return temp;
		}

		private function imgTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTips = temp;
			temp.name = "imgTips";
			temp.styleName = "ui/common/icon/bangzhu.png";
			temp.x = 10;
			temp.y = 485;
			return temp;
		}

		private function labBangyin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBangyin = temp;
			temp.name = "labBangyin";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "消耗金钱不足";
			temp.color = 0xEF0202;
			temp.width = 123;
			temp.x = 284;
			temp.y = 494;
			return temp;
		}

		private function labBindSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBindSilver = temp;
			temp.name = "labBindSilver";
			temp.height = 21;
			temp.text = "100锭50两9文";
			temp.textAlign = "left";
			temp.color = 0xC8B58B;
			temp.width = 170;
			temp.x = 74;
			temp.y = 471;
			return temp;
		}

		private function labConsume2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labConsume2 = temp;
			temp.name = "labConsume2";
			temp.height = 20;
			temp.text = "本次消耗：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 267;
			temp.x = 140;
			temp.y = 437;
			return temp;
		}

		private function labConsume_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labConsume = temp;
			temp.name = "labConsume";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "本次消耗：x级强化石x个";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 272;
			temp.x = 125;
			temp.y = 205;
			return temp;
		}

		private function labCurGengu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurGengu = temp;
			temp.name = "labCurGengu";
			temp.height = 21;
			temp.fontSize = 16;
			temp.text = "+9";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 30;
			temp.x = 80;
			temp.y = 55;
			return temp;
		}

		private function labDesc1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc1 = temp;
			temp.name = "labDesc1";
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "越高携带等级，越高品质的坐骑，提升根骨等级需要更多经验";
			temp.textAlign = "center";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 405;
			temp.x = 5;
			temp.y = 185;
			return temp;
		}

		private function labDesc2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc2 = temp;
			temp.name = "labDesc2";
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "坐骑根骨提升后，只提升坐骑属性转化效果";
			temp.textAlign = "center";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 405;
			temp.x = 5;
			temp.y = 260;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.height = 21;
			temp.fontSize = 16;
			temp.text = "100/200（+1）";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 408;
			temp.x = 0;
			temp.y = 160;
			return temp;
		}

		private function labGetExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGetExp = temp;
			temp.name = "labGetExp";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "获得强化经验：XXXXXXXX";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 272;
			temp.x = 125;
			temp.y = 230;
			return temp;
		}

		private function labGold_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGold = temp;
			temp.name = "labGold";
			temp.height = 21;
			temp.text = "49999万9999";
			temp.textAlign = "left";
			temp.color = 0xC8B58B;
			temp.width = 170;
			temp.x = 74;
			temp.y = 443;
			return temp;
		}

		private function labNextGengu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labNextGengu = temp;
			temp.name = "labNextGengu";
			temp.height = 21;
			temp.fontSize = 16;
			temp.text = "+10";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 30;
			temp.x = 375;
			temp.y = 55;
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
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
			temp.x = 65;
			temp.y = 405;
			return temp;
		}

		private function leftGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			leftGroup = temp;
			temp.name = "leftGroup";
			temp.height = 519;
			temp.width = 409;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [grid0_i(),curGenguImg_i(),nextGenguImg_i(),labCurGengu_i(),labNextGengu_i(),__MountIntensifySkin_Label1_i(),__MountIntensifySkin_UIAsset1_i(),imgProgress_i(),labExp_i(),labDesc1_i(),labConsume_i(),labGetExp_i(),labDesc2_i(),group_i(),group1_i(),groupIcon_i(),__MountIntensifySkin_Label2_i(),labConsume2_i(),mainGrid1_i(),labBangyin_i(),btnRefine_i(),imgTips_i(),imgNoMount1_i(),imgNoMount2_i()];
			return temp;
		}

		private function mainGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid1 = temp;
			temp.name = "mainGrid1";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 70;
			temp.y = 408;
			return temp;
		}

		private function nextGenguImg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			nextGenguImg = temp;
			temp.name = "nextGenguImg";
			temp.styleName = "ui/app/mount/char/sheng_hou_gen_gu.png";
			temp.x = 295;
			temp.y = 55;
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
			temp.x = 98;
			temp.y = 406;
			return temp;
		}

		private function rightBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rightBtn = temp;
			temp.name = "rightBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
			temp.x = 203;
			temp.y = 405;
			return temp;
		}

		private function rightGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rightGroup = temp;
			temp.name = "rightGroup";
			temp.height = 520;
			temp.width = 290;
			temp.x = 409;
			temp.y = 0;
			temp.elementsContent = [gridList_i(),labGold_i(),labBindSilver_i(),__MountIntensifySkin_Label3_i(),__MountIntensifySkin_Label4_i(),__MountIntensifySkin_UIAsset2_i(),leftBtn_i(),rightBtn_i(),page_i()];
			return temp;
		}

	}
}