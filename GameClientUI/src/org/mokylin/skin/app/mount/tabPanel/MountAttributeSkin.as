package org.mokylin.skin.app.mount.tabPanel
{
	import feathers.controls.text.Fontter;
	import flash.filters.GlowFilter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_right;
	import org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MountAttributeSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnChuZhan:feathers.controls.Button;

		public var btnDrill:feathers.controls.Button;

		public var btnExhibition:feathers.controls.Button;

		public var btnIsRideFalse:feathers.controls.Button;

		public var btnIsRideTrue:feathers.controls.Button;

		public var btnRowei:feathers.controls.Button;

		public var btnXiuXi:feathers.controls.Button;

		public var equipGrid0:feathers.controls.UIAsset;

		public var equipGrid1:feathers.controls.UIAsset;

		public var equipGrid2:feathers.controls.UIAsset;

		public var equipGrid3:feathers.controls.UIAsset;

		public var equipGrid4:feathers.controls.UIAsset;

		public var equipGrid5:feathers.controls.UIAsset;

		public var groupEquip:feathers.controls.Group;

		public var groupOpen:feathers.controls.Group;

		public var imgBg:feathers.controls.UIAsset;

		public var imgProgress:feathers.controls.UIAsset;

		public var imgSex:feathers.controls.UIAsset;

		public var imgStatus:feathers.controls.UIAsset;

		public var img_zizhi:feathers.controls.UIAsset;

		public var imgbg:feathers.controls.UIAsset;

		public var labConditions:feathers.controls.Label;

		public var labDesc1:feathers.controls.Label;

		public var labDesc2:feathers.controls.Label;

		public var labDesc3:feathers.controls.Label;

		public var labDesc4:feathers.controls.Label;

		public var labDesc5:feathers.controls.Label;

		public var labDesc6:feathers.controls.Label;

		public var labExp:feathers.controls.Label;

		public var labGoTo:feathers.controls.Label;

		public var labMountLevel:feathers.controls.Label;

		public var labMountName:feathers.controls.Label;

		public var labMountStatus:feathers.controls.Label;

		public var labVitality:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leftGroup:feathers.controls.Group;

		public var rightGroup:feathers.controls.Group;

		public var skillGrid0:feathers.controls.UIAsset;

		public var skillGrid1:feathers.controls.UIAsset;

		public var skillGrid2:feathers.controls.UIAsset;

		public var skillGrid3:feathers.controls.UIAsset;

		public var skillGrid4:feathers.controls.UIAsset;

		public var skillGrid5:feathers.controls.UIAsset;

		public var tabBar:feathers.controls.TabBar;

		public var zd_left:feathers.controls.Button;

		public var zd_right:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountAttributeSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 533;
			this.width = 714;
			labelFilterBlack_i();
			this.elementsContent = [imgBg_i(),leftGroup_i(),groupEquip_i(),rightGroup_i(),groupOpen_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MountAttributeSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['属性','装备','喂养'];
			return temp;
		}

		private function __MountAttributeSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 15;
			temp.repeatScale9Skin = false;
			temp.styleName = "ui/component/progress/skin_mount/jin_du_tiao_di.png";
			temp.width = 300;
			temp.x = 15;
			temp.y = 45;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/level/zi_zhi.png";
			temp.x = 25;
			temp.y = 75;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/mount/char/ji_neng.png";
			temp.x = 2;
			temp.y = 455;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/icon.png";
			temp.x = 415;
			temp.y = 17;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/icon.png";
			temp.x = 415;
			temp.y = 77;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/icon.png";
			temp.x = 415;
			temp.y = 138;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/icon.png";
			temp.x = 415;
			temp.y = 196;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/icon.png";
			temp.x = 415;
			temp.y = 277;
			return temp;
		}

		private function __MountAttributeSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/icon.png";
			temp.x = 415;
			temp.y = 339;
			return temp;
		}

		private function btnChuZhan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChuZhan = temp;
			temp.name = "btnChuZhan";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "出战";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 129;
			temp.y = 401;
			return temp;
		}

		private function btnDrill_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDrill = temp;
			temp.name = "btnDrill";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "训练";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 285;
			temp.y = 407;
			return temp;
		}

		private function btnExhibition_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnExhibition = temp;
			temp.name = "btnExhibition";
			temp.height = 20;
			temp.label = "展示";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu;
			temp.width = 46;
			temp.x = 352;
			temp.y = 113;
			return temp;
		}

		private function btnIsRideFalse_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnIsRideFalse = temp;
			temp.name = "btnIsRideFalse";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "下马";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 171;
			temp.y = 364;
			return temp;
		}

		private function btnIsRideTrue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnIsRideTrue = temp;
			temp.name = "btnIsRideTrue";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "上马";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 171;
			temp.y = 364;
			return temp;
		}

		private function btnRowei_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRowei = temp;
			temp.name = "btnRowei";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 33;
			temp.label = "放生";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 72;
			temp.x = 57;
			temp.y = 407;
			return temp;
		}

		private function btnXiuXi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnXiuXi = temp;
			temp.name = "btnXiuXi";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "休息";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_da;
			temp.color = 0xDDDABA;
			temp.x = 129;
			temp.y = 401;
			return temp;
		}

		private function equipGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			equipGrid0 = temp;
			temp.name = "equipGrid0";
			temp.styleName = "ui/app/mount/equipIcon/ma_an.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function equipGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			equipGrid1 = temp;
			temp.name = "equipGrid1";
			temp.styleName = "ui/app/mount/equipIcon/ma_deng.png";
			temp.x = 0;
			temp.y = 77;
			return temp;
		}

		private function equipGrid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			equipGrid2 = temp;
			temp.name = "equipGrid2";
			temp.styleName = "ui/app/mount/equipIcon/jiang_sheng.png";
			temp.x = 0;
			temp.y = 155;
			return temp;
		}

		private function equipGrid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			equipGrid3 = temp;
			temp.name = "equipGrid3";
			temp.styleName = "ui/app/mount/equipIcon/ma_ti_tie.png";
			temp.x = 335;
			temp.y = 0;
			return temp;
		}

		private function equipGrid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			equipGrid4 = temp;
			temp.name = "equipGrid4";
			temp.styleName = "ui/app/mount/equipIcon/ma_mian.png";
			temp.x = 335;
			temp.y = 77;
			return temp;
		}

		private function equipGrid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			equipGrid5 = temp;
			temp.name = "equipGrid5";
			temp.styleName = "ui/app/mount/equipIcon/ma_bian.png";
			temp.x = 335;
			temp.y = 155;
			return temp;
		}

		private function groupEquip_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupEquip = temp;
			temp.name = "groupEquip";
			temp.x = 15;
			temp.y = 140;
			temp.elementsContent = [equipGrid5_i(),equipGrid4_i(),equipGrid3_i(),equipGrid2_i(),equipGrid1_i(),equipGrid0_i()];
			return temp;
		}

		private function groupOpen_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupOpen = temp;
			temp.name = "groupOpen";
			temp.height = 468;
			temp.visible = false;
			temp.width = 682;
			temp.x = 12;
			temp.y = 40;
			temp.elementsContent = [imgbg_i(),labConditions_i(),labGoTo_i(),__MountAttributeSkin_UIAsset4_i(),__MountAttributeSkin_UIAsset5_i(),__MountAttributeSkin_UIAsset6_i(),__MountAttributeSkin_UIAsset7_i(),__MountAttributeSkin_UIAsset8_i(),__MountAttributeSkin_UIAsset9_i(),labDesc1_i(),labDesc2_i(),labDesc3_i(),labDesc4_i(),labDesc5_i(),labDesc6_i()];
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.styleName = "ui/app/mount/img/bei_jing_tu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgProgress_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgProgress = temp;
			temp.name = "imgProgress";
			temp.height = 8;
			temp.styleName = "ui/component/progress/skin_mount/jin_du_tiao.png";
			temp.width = 282;
			temp.x = 24;
			temp.y = 48;
			return temp;
		}

		private function imgSex_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSex = temp;
			temp.name = "imgSex";
			temp.styleName = "ui/common/icon/nv.png";
			temp.x = 80;
			temp.y = 24;
			return temp;
		}

		private function imgStatus_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgStatus = temp;
			temp.name = "imgStatus";
			temp.styleName = "ui/app/mount/icon/ji.png";
			temp.x = 358;
			temp.y = 80;
			return temp;
		}

		private function img_zizhi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			img_zizhi = temp;
			temp.name = "img_zizhi";
			temp.styleName = "ui/app/mount/level/pu_tong.png";
			temp.x = 63;
			temp.y = 70;
			return temp;
		}

		private function imgbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgbg = temp;
			temp.name = "imgbg";
			temp.height = 90;
			temp.styleName = "ui/common/version_3/D_di/di_3.png";
			temp.width = 390;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labConditions_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labConditions = temp;
			temp.name = "labConditions";
			temp.height = 50;
			temp.leading = 10;
			temp.text = "您当前还没有拥有坐骑，您可以通过完成主线任务或前往御马场获取坐骑";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 349;
			temp.x = 18;
			temp.y = 10;
			return temp;
		}

		private function labDesc1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc1 = temp;
			temp.name = "labDesc1";
			temp.height = 50;
			temp.leading = 10;
			temp.text = "玩家可骑乘坐骑，提高行进速度";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 445;
			temp.y = 20;
			return temp;
		}

		private function labDesc2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc2 = temp;
			temp.name = "labDesc2";
			temp.height = 50;
			temp.leading = 10;
			temp.text = "玩家可在骑乘坐骑时进行战斗";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 445;
			temp.y = 80;
			return temp;
		}

		private function labDesc3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc3 = temp;
			temp.name = "labDesc3";
			temp.height = 50;
			temp.leading = 10;
			temp.text = "坐骑将给予主人大量属性加成效果";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 445;
			temp.y = 140;
			return temp;
		}

		private function labDesc4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc4 = temp;
			temp.name = "labDesc4";
			temp.height = 80;
			temp.leading = 10;
			temp.text = "坐骑等级越高，品质越好，根骨更强时，给予主人加成的属性效果越好";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 445;
			temp.y = 200;
			return temp;
		}

		private function labDesc5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc5 = temp;
			temp.name = "labDesc5";
			temp.height = 50;
			temp.leading = 10;
			temp.text = "坐骑可以穿戴装备，获得更多属性效果";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 445;
			temp.y = 280;
			return temp;
		}

		private function labDesc6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labDesc6 = temp;
			temp.name = "labDesc6";
			temp.height = 50;
			temp.leading = 10;
			temp.text = "坐骑可以领悟技能，拥有更多战斗效果";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 445;
			temp.y = 340;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.height = 21;
			temp.text = "100/200";
			temp.textAlign = "center";
			temp.width = 280;
			temp.x = 26;
			temp.y = 42;
			return temp;
		}

		private function labGoTo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGoTo = temp;
			temp.name = "labGoTo";
			temp.text = "前去御马场";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 80;
			temp.x = 19;
			temp.y = 65;
			return temp;
		}

		private function labMountLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMountLevel = temp;
			temp.name = "labMountLevel";
			temp.bold = false;
			temp.height = 27;
			temp.fontSize = 20;
			temp.text = "125级";
			temp.textAlign = "center";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 67;
			temp.x = 5;
			temp.y = 18;
			return temp;
		}

		private function labMountName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMountName = temp;
			temp.name = "labMountName";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "勇猛的紫金赤兔（珍稀）";
			temp.textAlign = "left";
			temp.color = 0xE530EC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 260;
			temp.x = 145;
			temp.y = 23;
			return temp;
		}

		private function labMountStatus_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMountStatus = temp;
			temp.name = "labMountStatus";
			temp.bold = false;
			temp.height = 20;
			temp.text = "当前可繁育";
			temp.color = 0xDDDABA;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 315;
			temp.y = 43;
			return temp;
		}

		private function labVitality_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labVitality = temp;
			temp.name = "labVitality";
			temp.bold = false;
			temp.fontSize = 20;
			temp.text = "+230";
			temp.textAlign = "left";
			temp.color = 0xE530EC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 100;
			temp.y = 20;
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

		private function leftGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			leftGroup = temp;
			temp.name = "leftGroup";
			temp.height = 518;
			temp.width = 409;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [labMountName_i(),labVitality_i(),labMountLevel_i(),__MountAttributeSkin_UIAsset1_i(),imgProgress_i(),labMountStatus_i(),btnExhibition_i(),zd_left_i(),zd_right_i(),btnRowei_i(),btnChuZhan_i(),btnXiuXi_i(),btnDrill_i(),img_zizhi_i(),__MountAttributeSkin_UIAsset2_i(),imgStatus_i(),imgSex_i(),__MountAttributeSkin_UIAsset3_i(),labExp_i(),skillGrid0_i(),skillGrid1_i(),skillGrid2_i(),skillGrid3_i(),skillGrid4_i(),skillGrid5_i(),btnIsRideFalse_i(),btnIsRideTrue_i()];
			return temp;
		}

		private function rightGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rightGroup = temp;
			temp.name = "rightGroup";
			temp.height = 517;
			temp.width = 293;
			temp.x = 410;
			temp.y = 1;
			temp.elementsContent = [tabBar_i()];
			return temp;
		}

		private function skillGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid0 = temp;
			temp.name = "skillGrid0";
			temp.styleName = "ui/common/grid/normal/46_1.png";
			temp.x = 20;
			temp.y = 446;
			return temp;
		}

		private function skillGrid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid1 = temp;
			temp.name = "skillGrid1";
			temp.styleName = "ui/common/grid/normal/46_1.png";
			temp.x = 85;
			temp.y = 446;
			return temp;
		}

		private function skillGrid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid2 = temp;
			temp.name = "skillGrid2";
			temp.styleName = "ui/common/grid/normal/46_1.png";
			temp.x = 150;
			temp.y = 446;
			return temp;
		}

		private function skillGrid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid3 = temp;
			temp.name = "skillGrid3";
			temp.styleName = "ui/common/grid/normal/46_1.png";
			temp.x = 215;
			temp.y = 446;
			return temp;
		}

		private function skillGrid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid4 = temp;
			temp.name = "skillGrid4";
			temp.styleName = "ui/common/grid/normal/46_1.png";
			temp.x = 280;
			temp.y = 446;
			return temp;
		}

		private function skillGrid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skillGrid5 = temp;
			temp.name = "skillGrid5";
			temp.styleName = "ui/common/grid/normal/46_1.png";
			temp.x = 345;
			temp.y = 446;
			return temp;
		}

		private function tabBar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar = temp;
			temp.name = "tabBar";
			temp.btnWidth = 80;
			temp.height = 29;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_mount_fenye_heng;
			temp.width = 260;
			temp.x = 15;
			temp.y = 11;
			temp.layout = __MountAttributeSkin_HorizontalLayout1_i();
			temp.dataProvider = __MountAttributeSkin_ArrayCollection1_i();
			return temp;
		}

		private function zd_left_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			zd_left = temp;
			temp.name = "zd_left";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_left;
			temp.x = 130;
			temp.y = 370;
			return temp;
		}

		private function zd_right_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			zd_right = temp;
			temp.name = "zd_right";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_zd_right;
			temp.x = 250;
			temp.y = 370;
			return temp;
		}

	}
}