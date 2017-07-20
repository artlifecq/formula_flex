package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnablePanel;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.beibao.Pro_roleJY;
	import org.mokylin.skin.app.beibao.Pro_roleSM;
	import org.mokylin.skin.app.beibao.Pro_roleZQ;
	import org.mokylin.skin.app.beibao.VS_Skin;
	import org.mokylin.skin.app.beibao.button.ButtonCangku;
	import org.mokylin.skin.app.beibao.button.ButtonChushou;
	import org.mokylin.skin.app.beibao.button.ButtonShangdian;
	import org.mokylin.skin.app.beibao.button.ButtonZhengli;
	import org.mokylin.skin.app.beibao.number.UINumberLv;
	import org.mokylin.skin.app.beibao.number.UINumberMs;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class juese_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icbg10:feathers.controls.UIAsset;

		public var Icbg11:feathers.controls.UIAsset;

		public var Icons:feathers.controls.Group;

		public var NumZhanli:feathers.controls.UINumber;

		public var avatarGrp:feathers.controls.Group;

		public var btn_cangku:feathers.controls.Button;

		public var btn_chushou:feathers.controls.Button;

		public var btn_getYuanbao:feathers.controls.Button;

		public var btn_shangdian:feathers.controls.Button;

		public var btn_zhengli:feathers.controls.Button;

		public var duibi_panel:feathers.controls.SkinnablePanel;

		public var footMsg:feathers.controls.Group;

		public var grpShuxing:feathers.controls.Group;

		public var headMsg:feathers.controls.Group;

		public var icon_lijin:feathers.controls.UIAsset;

		public var icon_yingzi:feathers.controls.UIAsset;

		public var icon_yingzibang:feathers.controls.UIAsset;

		public var icon_yuanbao:feathers.controls.UIAsset;

		public var imgBg:feathers.controls.UIAsset;

		public var lst_pack:feathers.controls.List;

		public var money:feathers.controls.Group;

		public var msName:feathers.controls.UIAsset;

		public var numLevel:feathers.controls.UINumber;

		public var num_miaoshang:feathers.controls.UINumber;

		public var packs:feathers.controls.Group;

		public var pro_jinyan:feathers.controls.ProgressBar;

		public var pro_shengmin:feathers.controls.ProgressBar;

		public var pro_zhenqi:feathers.controls.ProgressBar;

		public var tab_pack:feathers.controls.TabBar;

		public var txt:feathers.controls.Group;

		public var txt_baoji:feathers.controls.Label;

		public var txt_baoshang:feathers.controls.Label;

		public var txt_fangyu:feathers.controls.Label;

		public var txt_gengu:feathers.controls.Label;

		public var txt_gongji:feathers.controls.Label;

		public var txt_gongsu:feathers.controls.Label;

		public var txt_jinyan:feathers.controls.Label;

		public var txt_lidao:feathers.controls.Label;

		public var txt_lijin:feathers.controls.Label;

		public var txt_loveName:feathers.controls.Label;

		public var txt_mingzhong:feathers.controls.Label;

		public var txt_roleName:feathers.controls.Label;

		public var txt_shanbi:feathers.controls.Label;

		public var txt_shenfa:feathers.controls.Label;

		public var txt_shengmin:feathers.controls.Label;

		public var txt_team:feathers.controls.Label;

		public var txt_yingzi:feathers.controls.Label;

		public var txt_yingzibang:feathers.controls.Label;

		public var txt_yuanbao:feathers.controls.Label;

		public var txt_zhenqi:feathers.controls.Label;

		public var uiBj:feathers.controls.UIAsset;

		public var uiBs:feathers.controls.UIAsset;

		public var uiFy:feathers.controls.UIAsset;

		public var uiGj:feathers.controls.UIAsset;

		public var uiGs:feathers.controls.UIAsset;

		public var uiHg:feathers.controls.UIAsset;

		public var uiJy:feathers.controls.UIAsset;

		public var uiLd:feathers.controls.UIAsset;

		public var uiMz:feathers.controls.UIAsset;

		public var uiSb:feathers.controls.UIAsset;

		public var uiSf:feathers.controls.UIAsset;

		public var uiSm:feathers.controls.UIAsset;

		public var uiZq:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;

		public var values:feathers.controls.Group;

		public var weapons:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function juese_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__juese_Skin_UIAsset2_i(),avatarGrp_i(),weapons_i(),headMsg_i(),footMsg_i(),values_i(),packs_i(),duibi_panel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icbg10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg10 = temp;
			temp.name = "Icbg10";
			temp.styleName = "ui/common/grid/equip/11hunjie.png";
			temp.x = 0;
			temp.y = 296;
			return temp;
		}

		private function Icbg11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icbg11 = temp;
			temp.name = "Icbg11";
			temp.styleName = "ui/common/grid/equip/12lingpai.png";
			temp.x = 294;
			temp.y = 296;
			return temp;
		}

		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.x = 14;
			temp.y = 393;
			temp.elementsContent = [btn_getYuanbao_i(),btn_chushou_i(),btn_zhengli_i(),btn_cangku_i(),btn_shangdian_i()];
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "10";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 127;
			temp.x = 77;
			temp.y = 6;
			return temp;
		}

		private function __juese_Skin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['全部','装备','药品','材料','其他'];
			return temp;
		}

		private function __juese_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 29;
			temp.width = 175;
			temp.x = 21;
			temp.y = 35;
			temp.layout = __juese_Skin_HorizontalLayout2_i();
			temp.elementsContent = [msName_i(),num_miaoshang_i()];
			return temp;
		}

		private function __juese_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 65;
			temp.y = 105;
			temp.elementsContent = [__juese_Skin_UIAsset8_i(),__juese_Skin_UIAsset9_i(),__juese_Skin_UIAsset10_i(),__juese_Skin_UIAsset11_i(),__juese_Skin_UIAsset12_i(),__juese_Skin_UIAsset13_i(),__juese_Skin_UIAsset14_i(),__juese_Skin_UIAsset15_i(),__juese_Skin_UIAsset16_i(),__juese_Skin_UIAsset17_i(),__juese_Skin_UIAsset18_i(),__juese_Skin_UIAsset19_i(),__juese_Skin_UIAsset20_i()];
			return temp;
		}

		private function __juese_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -6;
			temp.horizontalAlign = "center";
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __juese_Skin_HorizontalLayout2_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -6;
			temp.horizontalAlign = "center";
			temp.verticalAlign = "top";
			return temp;
		}

		private function __juese_Skin_HorizontalLayout3_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 1;
			return temp;
		}

		private function __juese_Skin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			return temp;
		}

		private function __juese_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/scrollbar/jdt.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function __juese_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 59;
			return temp;
		}

		private function __juese_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 79;
			return temp;
		}

		private function __juese_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 99;
			return temp;
		}

		private function __juese_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 119;
			return temp;
		}

		private function __juese_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 139;
			return temp;
		}

		private function __juese_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 189;
			return temp;
		}

		private function __juese_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 209;
			return temp;
		}

		private function __juese_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 229;
			return temp;
		}

		private function __juese_Skin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 249;
			return temp;
		}

		private function __juese_Skin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 127;
			temp.x = 1;
			temp.y = 269;
			return temp;
		}

		private function __juese_Skin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/youbg.jpg";
			temp.x = 7;
			temp.y = 342;
			return temp;
		}

		private function __juese_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 93;
			temp.x = 59;
			temp.y = 1;
			return temp;
		}

		private function __juese_Skin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 93;
			temp.x = 59;
			temp.y = 25;
			return temp;
		}

		private function __juese_Skin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 93;
			temp.x = 220;
			temp.y = 1;
			return temp;
		}

		private function __juese_Skin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/component/text/flip_bg.png";
			temp.width = 93;
			temp.x = 220;
			temp.y = 25;
			return temp;
		}

		private function __juese_Skin_UIAsset26_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/yl.png";
			temp.x = 25;
			temp.y = 2;
			return temp;
		}

		private function __juese_Skin_UIAsset27_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/yb.png";
			temp.x = 25;
			temp.y = 27;
			return temp;
		}

		private function __juese_Skin_UIAsset28_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/lj.png";
			temp.x = 185;
			temp.y = 27;
			return temp;
		}

		private function __juese_Skin_UIAsset29_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/by.png";
			temp.x = 185;
			temp.y = 2;
			return temp;
		}

		private function __juese_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/bg.jpg";
			temp.x = 232;
			temp.y = 87;
			return temp;
		}

		private function __juese_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxing/lv.png";
			temp.x = 9;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxingkuang.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxing/zhandousuxing.png";
			temp.x = 1;
			temp.y = 4;
			return temp;
		}

		private function __juese_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxing/jichushuxing.png";
			temp.x = 4;
			temp.y = 77;
			return temp;
		}

		private function __juese_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxing/teshusuxing.png";
			temp.x = 1;
			temp.y = 267;
			return temp;
		}

		private function __juese_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/scrollbar/jdt.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/scrollbar/jdt.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function avatarGrp_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			avatarGrp = temp;
			temp.name = "avatarGrp";
			temp.height = 360;
			temp.width = 237;
			temp.x = 297;
			temp.y = 139;
			return temp;
		}

		private function btn_cangku_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cangku = temp;
			temp.name = "btn_cangku";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonCangku;
			temp.x = 106;
			temp.y = -1;
			return temp;
		}

		private function btn_chushou_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chushou = temp;
			temp.name = "btn_chushou";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonChushou;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_getYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_getYuanbao = temp;
			temp.name = "btn_getYuanbao";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "充 值";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 88;
			temp.x = 228;
			temp.y = 7;
			return temp;
		}

		private function btn_shangdian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shangdian = temp;
			temp.name = "btn_shangdian";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonShangdian;
			temp.x = 159;
			temp.y = 0;
			return temp;
		}

		private function btn_zhengli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zhengli = temp;
			temp.name = "btn_zhengli";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonZhengli;
			temp.x = 58;
			temp.y = 2;
			return temp;
		}

		private function duibi_panel_i():feathers.controls.SkinnablePanel
		{
			var temp:feathers.controls.SkinnablePanel = new feathers.controls.SkinnablePanel();
			duibi_panel = temp;
			temp.name = "duibi_panel";
			temp.height = 463;
			temp.styleClass = org.mokylin.skin.app.beibao.VS_Skin;
			temp.visible = false;
			temp.width = 344;
			temp.x = 594;
			temp.y = 76;
			return temp;
		}

		private function footMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			footMsg = temp;
			temp.name = "footMsg";
			temp.height = 43;
			temp.width = 359;
			temp.x = 235;
			temp.y = 484;
			temp.layout = __juese_Skin_HorizontalLayout1_i();
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i()];
			return temp;
		}

		private function grpShuxing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpShuxing = temp;
			temp.name = "grpShuxing";
			temp.x = 12;
			temp.y = 103;
			temp.elementsContent = [uiSm_i(),uiZq_i(),uiJy_i(),uiLd_i(),uiHg_i(),uiSf_i(),uiGj_i(),uiFy_i(),uiMz_i(),uiSb_i(),uiBj_i(),uiBs_i(),uiGs_i()];
			return temp;
		}

		private function headMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			headMsg = temp;
			temp.name = "headMsg";
			temp.width = 362;
			temp.x = 231;
			temp.y = 98;
			temp.elementsContent = [txt_loveName_i(),txt_roleName_i(),txt_team_i(),__juese_Skin_UIAsset3_i(),numLevel_i()];
			return temp;
		}

		private function icon_lijin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_lijin = temp;
			temp.name = "icon_lijin";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 158;
			temp.y = 24;
			return temp;
		}

		private function icon_yingzi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_yingzi = temp;
			temp.name = "icon_yingzi";
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon_yingzibang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_yingzibang = temp;
			temp.name = "icon_yingzibang";
			temp.styleName = "ui/common/tubiao/yinzib_24.png";
			temp.x = 158;
			temp.y = 0;
			return temp;
		}

		private function icon_yuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_yuanbao = temp;
			temp.name = "icon_yuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 0;
			temp.y = 25;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 419;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 338;
			temp.x = 4;
			temp.y = 25;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 313;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 334;
			temp.x = 7;
			temp.y = 28;
			temp.layout = __juese_Skin_TileLayout1_i();
			return temp;
		}

		private function money_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			money = temp;
			temp.name = "money";
			temp.x = 17;
			temp.y = 345;
			temp.elementsContent = [__juese_Skin_UIAsset22_i(),__juese_Skin_UIAsset23_i(),__juese_Skin_UIAsset24_i(),__juese_Skin_UIAsset25_i(),__juese_Skin_UIAsset26_i(),__juese_Skin_UIAsset27_i(),__juese_Skin_UIAsset28_i(),__juese_Skin_UIAsset29_i(),txt_yingzi_i(),txt_yuanbao_i(),txt_yingzibang_i(),txt_lijin_i(),icon_yingzi_i(),icon_yuanbao_i(),icon_yingzibang_i(),icon_lijin_i()];
			return temp;
		}

		private function msName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			msName = temp;
			temp.name = "msName";
			temp.styleName = "ui/app/beibao/shuxing/ms.png";
			temp.x = 16;
			temp.y = 12;
			return temp;
		}

		private function numLevel_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numLevel = temp;
			temp.name = "numLevel";
			temp.gap = -4;
			temp.height = 18;
			temp.label = "15";
			temp.styleClass = org.mokylin.skin.app.beibao.number.UINumberLv;
			temp.textAlign = "-4";
			temp.width = 148;
			temp.x = 41;
			temp.y = 2;
			return temp;
		}

		private function num_miaoshang_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_miaoshang = temp;
			temp.name = "num_miaoshang";
			temp.gap = -11;
			temp.height = 25;
			temp.label = "4512";
			temp.styleClass = org.mokylin.skin.app.beibao.number.UINumberMs;
			temp.width = 50;
			temp.x = 78;
			temp.y = 5;
			return temp;
		}

		private function packs_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			packs = temp;
			temp.name = "packs";
			temp.x = 594;
			temp.y = 87;
			temp.elementsContent = [imgBg_i(),__juese_Skin_UIAsset21_i(),tab_pack_i(),money_i(),Icons_i(),lst_pack_i()];
			return temp;
		}

		private function pro_jinyan_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jinyan = temp;
			temp.name = "pro_jinyan";
			temp.height = 10;
			temp.maximum = 100;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.app.beibao.Pro_roleJY;
			temp.value = 0;
			temp.width = 112;
			temp.x = 73;
			temp.y = 147;
			return temp;
		}

		private function pro_shengmin_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_shengmin = temp;
			temp.name = "pro_shengmin";
			temp.height = 10;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.app.beibao.Pro_roleSM;
			temp.value = 50;
			temp.width = 112;
			temp.x = 73;
			temp.y = 108;
			return temp;
		}

		private function pro_zhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zhenqi = temp;
			temp.name = "pro_zhenqi";
			temp.height = 10;
			temp.minimum = 0;
			temp.styleClass = org.mokylin.skin.app.beibao.Pro_roleZQ;
			temp.value = 0;
			temp.width = 112;
			temp.x = 73;
			temp.y = 127;
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 65;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 331;
			temp.x = 11;
			temp.y = -3;
			temp.layout = __juese_Skin_HorizontalLayout3_i();
			temp.dataProvider = __juese_Skin_ArrayCollection1_i();
			return temp;
		}

		private function txt_baoji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_baoji = temp;
			temp.name = "txt_baoji";
			temp.text = "66.30%";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 171;
			return temp;
		}

		private function txt_baoshang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_baoshang = temp;
			temp.name = "txt_baoshang";
			temp.text = "26.30%";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 191;
			return temp;
		}

		private function txt_fangyu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_fangyu = temp;
			temp.name = "txt_fangyu";
			temp.text = "5272";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 80;
			return temp;
		}

		private function txt_gengu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_gengu = temp;
			temp.name = "txt_gengu";
			temp.text = "32157";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 20;
			return temp;
		}

		private function txt_gongji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_gongji = temp;
			temp.name = "txt_gongji";
			temp.text = "5272";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 60;
			return temp;
		}

		private function txt_gongsu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_gongsu = temp;
			temp.name = "txt_gongsu";
			temp.text = "26.30%";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 211;
			return temp;
		}

		private function txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			txt = temp;
			temp.name = "txt";
			temp.x = 74;
			temp.y = 164;
			temp.elementsContent = [txt_lidao_i(),txt_gengu_i(),txt_shenfa_i(),txt_gongji_i(),txt_fangyu_i(),txt_mingzhong_i(),txt_shanbi_i(),txt_baoji_i(),txt_baoshang_i(),txt_gongsu_i()];
			return temp;
		}

		private function txt_jinyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_jinyan = temp;
			temp.name = "txt_jinyan";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 112;
			temp.x = 73;
			temp.y = 144;
			return temp;
		}

		private function txt_lidao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_lidao = temp;
			temp.name = "txt_lidao";
			temp.text = "32157";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_lijin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_lijin = temp;
			temp.name = "txt_lijin";
			temp.text = "1000";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 227;
			temp.y = 28;
			return temp;
		}

		private function txt_loveName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_loveName = temp;
			temp.name = "txt_loveName";
			temp.letterSpacing = -1;
			temp.text = "伴侣：无";
			temp.textAlign = "center";
			temp.color = 0xEE0699;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 362;
			temp.x = 3;
			temp.y = 20;
			return temp;
		}

		private function txt_mingzhong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_mingzhong = temp;
			temp.name = "txt_mingzhong";
			temp.text = "26.30%";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 130;
			return temp;
		}

		private function txt_roleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_roleName = temp;
			temp.name = "txt_roleName";
			temp.bold = false;
			temp.text = "名字共六个字";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 362;
			temp.x = 3;
			temp.y = 2;
			return temp;
		}

		private function txt_shanbi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_shanbi = temp;
			temp.name = "txt_shanbi";
			temp.text = "125/5秒";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 151;
			return temp;
		}

		private function txt_shenfa_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_shenfa = temp;
			temp.name = "txt_shenfa";
			temp.text = "47732157";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 40;
			return temp;
		}

		private function txt_shengmin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_shengmin = temp;
			temp.name = "txt_shengmin";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 112;
			temp.x = 73;
			temp.y = 105;
			return temp;
		}

		private function txt_team_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_team = temp;
			temp.name = "txt_team";
			temp.letterSpacing = 0;
			temp.text = "【帮会名字七个字】";
			temp.color = 0x14A3F3;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 140;
			temp.x = 225;
			temp.y = 2;
			return temp;
		}

		private function txt_yingzi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yingzi = temp;
			temp.name = "txt_yingzi";
			temp.text = "1000";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 66;
			temp.y = 3;
			return temp;
		}

		private function txt_yingzibang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yingzibang = temp;
			temp.name = "txt_yingzibang";
			temp.text = "1000";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 227;
			temp.y = 3;
			return temp;
		}

		private function txt_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yuanbao = temp;
			temp.name = "txt_yuanbao";
			temp.text = "1000";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 66;
			temp.y = 28;
			return temp;
		}

		private function txt_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_zhenqi = temp;
			temp.name = "txt_zhenqi";
			temp.fontSize = 12;
			temp.text = "1254/2544";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 112;
			temp.x = 73;
			temp.y = 124;
			return temp;
		}

		private function uiBj_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBj = temp;
			temp.name = "uiBj";
			temp.styleName = "ui/common/shuxing/bjz.png";
			temp.x = 0;
			temp.y = 230;
			return temp;
		}

		private function uiBs_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBs = temp;
			temp.name = "uiBs";
			temp.styleName = "ui/common/shuxing/bjjc.png";
			temp.x = 0;
			temp.y = 249;
			return temp;
		}

		private function uiFy_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFy = temp;
			temp.name = "uiFy";
			temp.styleName = "ui/common/shuxing/fyz.png";
			temp.x = 0;
			temp.y = 140;
			return temp;
		}

		private function uiGj_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGj = temp;
			temp.name = "uiGj";
			temp.styleName = "ui/common/shuxing/gjl.png";
			temp.x = 0;
			temp.y = 118;
			return temp;
		}

		private function uiGs_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGs = temp;
			temp.name = "uiGs";
			temp.styleName = "ui/common/shuxing/gjsd.png";
			temp.x = 0;
			temp.y = 270;
			return temp;
		}

		private function uiHg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHg = temp;
			temp.name = "uiHg";
			temp.styleName = "ui/common/shuxing/gg.png";
			temp.x = 0;
			temp.y = 79;
			return temp;
		}

		private function uiJy_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJy = temp;
			temp.name = "uiJy";
			temp.styleName = "ui/common/shuxing/jyz.png";
			temp.x = 0;
			temp.y = 39;
			return temp;
		}

		private function uiLd_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLd = temp;
			temp.name = "uiLd";
			temp.styleName = "ui/common/shuxing/ld.png";
			temp.x = 0;
			temp.y = 59;
			return temp;
		}

		private function uiMz_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMz = temp;
			temp.name = "uiMz";
			temp.styleName = "ui/common/shuxing/mz.png";
			temp.x = 0;
			temp.y = 189;
			return temp;
		}

		private function uiSb_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSb = temp;
			temp.name = "uiSb";
			temp.styleName = "ui/common/shuxing/sb.png";
			temp.x = 0;
			temp.y = 209;
			return temp;
		}

		private function uiSf_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSf = temp;
			temp.name = "uiSf";
			temp.styleName = "ui/common/shuxing/sf.png";
			temp.x = 0;
			temp.y = 98;
			return temp;
		}

		private function uiSm_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSm = temp;
			temp.name = "uiSm";
			temp.styleName = "ui/common/shuxing/sbz.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiZq_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiZq = temp;
			temp.name = "uiZq";
			temp.styleName = "ui/common/shuxing/zqz.png";
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli1.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function values_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			values = temp;
			temp.name = "values";
			temp.x = 22;
			temp.y = 86;
			temp.elementsContent = [__juese_Skin_UIAsset4_i(),__juese_Skin_Group1_i(),__juese_Skin_UIAsset5_i(),__juese_Skin_UIAsset6_i(),__juese_Skin_UIAsset7_i(),grpShuxing_i(),__juese_Skin_Group2_i(),pro_shengmin_i(),pro_zhenqi_i(),pro_jinyan_i(),txt_shengmin_i(),txt_zhenqi_i(),txt_jinyan_i(),txt_i()];
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.height = 364;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.width = 368;
			temp.x = 234;
			temp.y = 137;
			temp.elementsContent = [Icbg10_i(),Icbg11_i()];
			return temp;
		}

	}
}