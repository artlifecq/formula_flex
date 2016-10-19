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
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
	import org.mokylin.skin.component.list.ListSkin4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountSkillSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnSpell:feathers.controls.Button;

		public var gridList:feathers.controls.List;

		public var img1:feathers.controls.UIAsset;

		public var img2:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var labBindSilver:feathers.controls.Label;

		public var labChange:feathers.controls.Label;

		public var labGold:feathers.controls.Label;

		public var labMoney:feathers.controls.Label;

		public var labPercent:feathers.controls.Label;

		public var labStatus:feathers.controls.Label;

		public var labYinZi:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftBtn:feathers.controls.Button;

		public var leftGroup:feathers.controls.Group;

		public var mainGrid1:feathers.controls.UIAsset;

		public var page:feathers.controls.Label;

		public var rightBtn:feathers.controls.Button;

		public var rightGroup:feathers.controls.Group;

		public var skillGrid0:feathers.controls.UIAsset;

		public var skillGrid1:feathers.controls.UIAsset;

		public var skillGrid2:feathers.controls.UIAsset;

		public var skillGrid3:feathers.controls.UIAsset;

		public var skillGrid4:feathers.controls.UIAsset;

		public var skillGrid5:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountSkillSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 527;
			this.width = 708;
			labelFilterBlack_i();
			this.elementsContent = [imgBg_i(),rightGroup_i(),leftGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountSkillSkin_Label1_i():feathers.controls.Label
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
			temp.y = 439;
			return temp;
		}

		private function __MountSkillSkin_Label2_i():feathers.controls.Label
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
			temp.y = 466;
			return temp;
		}

		private function __MountSkillSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalGap = 3;
			temp.requestedColumnCount = 6;
			temp.requestedRowCount = 7;
			temp.verticalGap = 3;
			return temp;
		}

		private function __MountSkillSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/backgound/mount_di.png";
			temp.width = 100;
			temp.x = 96;
			temp.y = 405;
			return temp;
		}

		private function __MountSkillSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/img/spell_di.png";
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function btnSpell_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSpell = temp;
			temp.name = "btnSpell";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "开始领悟";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 129;
			temp.y = 470;
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
			temp.x = 0;
			temp.y = 15;
			temp.layout = __MountSkillSkin_TileLayout1_i();
			return temp;
		}

		private function img1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img1 = temp;
			temp.name = "img1";
			temp.height = 35;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang.png";
			temp.width = 320;
			temp.x = 45;
			temp.y = 390;
			return temp;
		}

		private function img2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img2 = temp;
			temp.name = "img2";
			temp.height = 35;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang.png";
			temp.width = 320;
			temp.x = 45;
			temp.y = 430;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.styleName = "ui/app/mount/img/di.png";
			temp.x = 0;
			temp.y = 0;
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
			temp.y = 468;
			return temp;
		}

		private function labChange_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labChange = temp;
			temp.name = "labChange";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "开启新技能成功几率：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 180;
			temp.x = 50;
			temp.y = 397;
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
			temp.y = 441;
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "1000W";
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.width = 223;
			temp.x = 140;
			temp.y = 437;
			return temp;
		}

		private function labPercent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPercent = temp;
			temp.name = "labPercent";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 18;
			temp.text = "100%";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 98;
			temp.x = 205;
			temp.y = 396;
			return temp;
		}

		private function labStatus_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labStatus = temp;
			temp.name = "labStatus";
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "消耗金钱不足";
			temp.color = 0xEF0202;
			temp.width = 125;
			temp.x = 280;
			temp.y = 493;
			return temp;
		}

		private function labYinZi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labYinZi = temp;
			temp.name = "labYinZi";
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 30;
			temp.fontSize = 16;
			temp.text = "消耗银子：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 90;
			temp.x = 50;
			temp.y = 437;
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
			temp.height = 518;
			temp.width = 400;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__MountSkillSkin_UIAsset2_i(),mainGrid1_i(),img1_i(),img2_i(),labChange_i(),labPercent_i(),labYinZi_i(),labMoney_i(),labStatus_i(),skillGrid0_i(),skillGrid1_i(),skillGrid2_i(),skillGrid3_i(),skillGrid4_i(),skillGrid5_i(),btnSpell_i()];
			return temp;
		}

		private function mainGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mainGrid1 = temp;
			temp.name = "mainGrid1";
			temp.styleName = "ui/common/grid/normal/60.png";
			temp.x = 169;
			temp.y = 162;
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
			temp.x = 410;
			temp.y = 0;
			temp.elementsContent = [gridList_i(),labGold_i(),labBindSilver_i(),__MountSkillSkin_Label1_i(),__MountSkillSkin_Label2_i(),__MountSkillSkin_UIAsset1_i(),leftBtn_i(),rightBtn_i(),page_i()];
			return temp;
		}

		private function skillGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid0 = temp;
			temp.name = "skillGrid0";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 180;
			temp.y = 15;
			return temp;
		}

		private function skillGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid1 = temp;
			temp.name = "skillGrid1";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 322;
			temp.y = 73;
			return temp;
		}

		private function skillGrid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid2 = temp;
			temp.name = "skillGrid2";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 320;
			temp.y = 266;
			return temp;
		}

		private function skillGrid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid3 = temp;
			temp.name = "skillGrid3";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 181;
			temp.y = 331;
			return temp;
		}

		private function skillGrid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid4 = temp;
			temp.name = "skillGrid4";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 42;
			temp.y = 265;
			return temp;
		}

		private function skillGrid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid5 = temp;
			temp.name = "skillGrid5";
			temp.styleName = "ui/common/kang/mount/tu_biao_kuang.png";
			temp.x = 40;
			temp.y = 73;
			return temp;
		}

	}
}