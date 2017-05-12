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
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.beibao.VS_Skin;
	import org.mokylin.skin.app.beibao.button.ButtonCangku;
	import org.mokylin.skin.app.beibao.button.ButtonChushou;
	import org.mokylin.skin.app.beibao.button.ButtonPaimaihang;
	import org.mokylin.skin.app.beibao.button.ButtonShangdian;
	import org.mokylin.skin.app.beibao.button.ButtonZhengli;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.progress.progress_role1_Skin;
	import org.mokylin.skin.component.progress.progress_role2_Skin;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;
	import org.mokylin.skin.component.uinumber.UINumberSkin_miaoshang;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

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
		public var Icons:feathers.controls.Group;

		public var LoveIcon:feathers.controls.UIAsset;

		public var Num_zhandouli:feathers.controls.UINumber;

		public var btn_cangku:feathers.controls.Button;

		public var btn_chushou:feathers.controls.Button;

		public var btn_getYuanbao:feathers.controls.Button;

		public var btn_jineng:feathers.controls.Radio;

		public var btn_juese:feathers.controls.Radio;

		public var btn_paimaihang:feathers.controls.Button;

		public var btn_shangdian:feathers.controls.Button;

		public var btn_zhengli:feathers.controls.Button;

		public var duibi_panel:feathers.controls.SkinnablePanel;

		public var footMsg:feathers.controls.Group;

		public var headMsg:feathers.controls.Group;

		public var icon_lijin:feathers.controls.UIAsset;

		public var icon_yingzi:feathers.controls.UIAsset;

		public var icon_yingzibang:feathers.controls.UIAsset;

		public var icon_yuanbao:feathers.controls.UIAsset;

		public var lbl_baojijiacheng:feathers.controls.Label;

		public var lbl_baojikangxing:feathers.controls.Label;

		public var lbl_baojilv:feathers.controls.Label;

		public var lbl_bishanlv:feathers.controls.Label;

		public var lbl_fangyubaifenbi:feathers.controls.Label;

		public var lbl_genggu:feathers.controls.Label;

		public var lbl_gongsu:feathers.controls.Label;

		public var lbl_huigeng:feathers.controls.Label;

		public var lbl_jingyan:feathers.controls.Label;

		public var lbl_lidao:feathers.controls.Label;

		public var lbl_minzhonglv:feathers.controls.Label;

		public var lbl_neigong:feathers.controls.Label;

		public var lbl_qixue:feathers.controls.Label;

		public var lbl_shenfa:feathers.controls.Label;

		public var lbl_shengminhuifu:feathers.controls.Label;

		public var lbl_waigong:feathers.controls.Label;

		public var lbl_zhenqi:feathers.controls.Label;

		public var lbl_zhiliaotishen:feathers.controls.Label;

		public var lst_pack:feathers.controls.List;

		public var money:feathers.controls.Group;

		public var msIcon:feathers.controls.UIAsset;

		public var msName:feathers.controls.UIAsset;

		public var num_miaoshang:feathers.controls.UINumber;

		public var packs:feathers.controls.Group;

		public var pro_jinyan:feathers.controls.ProgressBar;

		public var pro_zhenqi:feathers.controls.ProgressBar;

		public var roleZone:feathers.controls.UIAsset;

		public var tab_pack:feathers.controls.TabBar;

		public var txt:feathers.controls.Group;

		public var txt_baojijiacheng:feathers.controls.Label;

		public var txt_baojikangxing:feathers.controls.Label;

		public var txt_baojilv:feathers.controls.Label;

		public var txt_bishanlv:feathers.controls.Label;

		public var txt_fangyubaifenbi:feathers.controls.Label;

		public var txt_genggu:feathers.controls.Label;

		public var txt_gongsu:feathers.controls.Label;

		public var txt_huigeng:feathers.controls.Label;

		public var txt_jinyan:feathers.controls.Label;

		public var txt_level:feathers.controls.Label;

		public var txt_lidao:feathers.controls.Label;

		public var txt_lijin:feathers.controls.Label;

		public var txt_loveName:feathers.controls.Label;

		public var txt_mingzhonglv:feathers.controls.Label;

		public var txt_neigong:feathers.controls.Label;

		public var txt_qixue:feathers.controls.Label;

		public var txt_roleName:feathers.controls.Label;

		public var txt_shenfa:feathers.controls.Label;

		public var txt_shengminhuifu:feathers.controls.Label;

		public var txt_team:feathers.controls.Label;

		public var txt_type:feathers.controls.Label;

		public var txt_waigong:feathers.controls.Label;

		public var txt_yingzi:feathers.controls.Label;

		public var txt_yingzibang:feathers.controls.Label;

		public var txt_yuanbao:feathers.controls.Label;

		public var txt_zhenqi:feathers.controls.Label;

		public var txt_zhiliaotishen:feathers.controls.Label;

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
			this.height = 587;
			this.width = 947;
			this.elementsContent = [__juese_Skin_UIAsset2_i(),weapons_i(),headMsg_i(),footMsg_i(),values_i(),packs_i(),duibi_panel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.x = 12;
			temp.y = 405;
			temp.elementsContent = [btn_getYuanbao_i(),btn_chushou_i(),btn_zhengli_i(),btn_cangku_i(),btn_shangdian_i(),btn_paimaihang_i()];
			return temp;
		}

		private function LoveIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			LoveIcon = temp;
			temp.name = "LoveIcon";
			temp.styleName = "ui/app/beibao/xin.png";
			temp.x = 128;
			temp.y = 20;
			return temp;
		}

		private function Num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_zhandouli = temp;
			temp.name = "Num_zhandouli";
			temp.gap = -3;
			temp.height = 25;
			temp.number = 021222;
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 147;
			temp.x = 128;
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
			temp.x = 11;
			temp.y = 109;
			temp.elementsContent = [lbl_lidao_i(),lbl_genggu_i(),lbl_huigeng_i(),lbl_shenfa_i(),lbl_qixue_i(),lbl_waigong_i(),lbl_neigong_i(),lbl_gongsu_i(),lbl_minzhonglv_i(),lbl_baojikangxing_i(),lbl_bishanlv_i(),lbl_fangyubaifenbi_i(),lbl_shengminhuifu_i(),lbl_zhiliaotishen_i(),lbl_baojilv_i(),lbl_baojijiacheng_i()];
			return temp;
		}

		private function __juese_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -2;
			return temp;
		}

		private function __juese_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "关键属性";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 9;
			return temp;
		}

		private function __juese_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 12;
			temp.text = "基础属性";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 70;
			temp.y = 56;
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
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 333;
			temp.x = 5;
			temp.y = 340;
			return temp;
		}

		private function __juese_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyexian.png";
			temp.width = 333;
			temp.x = 5;
			temp.y = 398;
			return temp;
		}

		private function __juese_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 128;
			temp.x = 0;
			temp.y = 26;
			return temp;
		}

		private function __juese_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 128;
			temp.x = 163;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 23;
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 128;
			temp.x = 163;
			temp.y = 26;
			return temp;
		}

		private function __juese_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/bg.png";
			temp.x = 20;
			temp.y = 76;
			return temp;
		}

		private function __juese_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = -15;
			temp.y = 12;
			return temp;
		}

		private function __juese_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 278;
			temp.y = 12;
			return temp;
		}

		private function __juese_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shuxingkuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 449;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 343;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __juese_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 421;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 339;
			temp.x = 2;
			temp.y = 27;
			return temp;
		}

		private function __juese_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/huawendi.png";
			temp.x = 6;
			temp.y = 404;
			return temp;
		}

		private function btn_cangku_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cangku = temp;
			temp.name = "btn_cangku";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonCangku;
			temp.x = 87;
			temp.y = 0;
			return temp;
		}

		private function btn_chushou_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_chushou = temp;
			temp.name = "btn_chushou";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonChushou;
			temp.x = -1;
			temp.y = 0;
			return temp;
		}

		private function btn_getYuanbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_getYuanbao = temp;
			temp.name = "btn_getYuanbao";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "获取元宝";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 243;
			temp.y = 4;
			return temp;
		}

		private function btn_paimaihang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_paimaihang = temp;
			temp.name = "btn_paimaihang";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonPaimaihang;
			temp.x = 174;
			temp.y = 0;
			return temp;
		}

		private function btn_shangdian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shangdian = temp;
			temp.name = "btn_shangdian";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonShangdian;
			temp.x = 130;
			temp.y = 0;
			return temp;
		}

		private function btn_zhengli_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zhengli = temp;
			temp.name = "btn_zhengli";
			temp.styleClass = org.mokylin.skin.app.beibao.button.ButtonZhengli;
			temp.x = 43;
			temp.y = 0;
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
			temp.x = 590;
			temp.y = 65;
			return temp;
		}

		private function footMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			footMsg = temp;
			temp.name = "footMsg";
			temp.x = 237;
			temp.y = 488;
			temp.elementsContent = [__juese_Skin_UIAsset4_i(),__juese_Skin_UIAsset5_i(),ui_zhandou_i(),Num_zhandouli_i()];
			return temp;
		}

		private function headMsg_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			headMsg = temp;
			temp.name = "headMsg";
			temp.width = 362;
			temp.x = 225;
			temp.y = 91;
			temp.elementsContent = [txt_level_i(),txt_type_i(),LoveIcon_i(),txt_loveName_i(),txt_roleName_i(),txt_team_i()];
			return temp;
		}

		private function icon_lijin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_lijin = temp;
			temp.name = "icon_lijin";
			temp.styleName = "ui/common/tubiao/lijin_24.png";
			temp.x = 296;
			temp.y = 26;
			return temp;
		}

		private function icon_yingzi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_yingzi = temp;
			temp.name = "icon_yingzi";
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 131;
			temp.y = 0;
			return temp;
		}

		private function icon_yingzibang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_yingzibang = temp;
			temp.name = "icon_yingzibang";
			temp.styleName = "ui/common/tubiao/yinzib_24.png";
			temp.x = 298;
			temp.y = 0;
			return temp;
		}

		private function icon_yuanbao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_yuanbao = temp;
			temp.name = "icon_yuanbao";
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 133;
			temp.y = 27;
			return temp;
		}

		private function lbl_baojijiacheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_baojijiacheng = temp;
			temp.name = "lbl_baojijiacheng";
			temp.letterSpacing = -1;
			temp.text = "暴击加成：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 295;
			return temp;
		}

		private function lbl_baojikangxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_baojikangxing = temp;
			temp.name = "lbl_baojikangxing";
			temp.letterSpacing = -1;
			temp.text = "暴击抗性：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 178;
			return temp;
		}

		private function lbl_baojilv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_baojilv = temp;
			temp.name = "lbl_baojilv";
			temp.letterSpacing = -1;
			temp.text = "暴击率：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 276;
			return temp;
		}

		private function lbl_bishanlv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_bishanlv = temp;
			temp.name = "lbl_bishanlv";
			temp.letterSpacing = -1;
			temp.text = "避闪值：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 198;
			return temp;
		}

		private function lbl_fangyubaifenbi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_fangyubaifenbi = temp;
			temp.name = "lbl_fangyubaifenbi";
			temp.letterSpacing = -1;
			temp.text = "防御值：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 217;
			return temp;
		}

		private function lbl_genggu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_genggu = temp;
			temp.name = "lbl_genggu";
			temp.letterSpacing = -1;
			temp.text = "根骨：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 22;
			return temp;
		}

		private function lbl_gongsu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_gongsu = temp;
			temp.name = "lbl_gongsu";
			temp.letterSpacing = -1;
			temp.text = "攻速：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 139;
			return temp;
		}

		private function lbl_huigeng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_huigeng = temp;
			temp.name = "lbl_huigeng";
			temp.letterSpacing = -1;
			temp.text = "慧根：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 42;
			return temp;
		}

		private function lbl_jingyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_jingyan = temp;
			temp.name = "lbl_jingyan";
			temp.fontSize = 13;
			temp.text = "经验：";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 11;
			temp.y = 72;
			return temp;
		}

		private function lbl_lidao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lidao = temp;
			temp.name = "lbl_lidao";
			temp.letterSpacing = -1;
			temp.text = "力道：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function lbl_minzhonglv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_minzhonglv = temp;
			temp.name = "lbl_minzhonglv";
			temp.letterSpacing = -1;
			temp.text = "命中值：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 159;
			return temp;
		}

		private function lbl_neigong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_neigong = temp;
			temp.name = "lbl_neigong";
			temp.letterSpacing = -1;
			temp.text = "内功：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 120;
			return temp;
		}

		private function lbl_qixue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_qixue = temp;
			temp.name = "lbl_qixue";
			temp.letterSpacing = -1;
			temp.text = "气血：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 81;
			return temp;
		}

		private function lbl_shenfa_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_shenfa = temp;
			temp.name = "lbl_shenfa";
			temp.letterSpacing = -1;
			temp.text = "身法：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 61;
			return temp;
		}

		private function lbl_shengminhuifu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_shengminhuifu = temp;
			temp.name = "lbl_shengminhuifu";
			temp.letterSpacing = -1;
			temp.text = "生命恢复速度：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 237;
			return temp;
		}

		private function lbl_waigong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_waigong = temp;
			temp.name = "lbl_waigong";
			temp.letterSpacing = -1;
			temp.text = "外功：";
			temp.color = 0x99915C;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 100;
			return temp;
		}

		private function lbl_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhenqi = temp;
			temp.name = "lbl_zhenqi";
			temp.fontSize = 13;
			temp.text = "真气：";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 11;
			temp.y = 90;
			return temp;
		}

		private function lbl_zhiliaotishen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_zhiliaotishen = temp;
			temp.name = "lbl_zhiliaotishen";
			temp.letterSpacing = -1;
			temp.text = "治疗效果提升：";
			temp.color = 0xA79F4F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 256;
			return temp;
		}

		private function lst_pack_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			lst_pack = temp;
			temp.name = "lst_pack";
			temp.height = 313;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 337;
			temp.x = 4;
			temp.y = 32;
			temp.layout = __juese_Skin_TileLayout1_i();
			return temp;
		}

		private function money_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			money = temp;
			temp.name = "money";
			temp.x = 12;
			temp.y = 347;
			temp.elementsContent = [__juese_Skin_UIAsset12_i(),__juese_Skin_UIAsset13_i(),__juese_Skin_UIAsset14_i(),__juese_Skin_UIAsset15_i(),txt_yingzi_i(),txt_yuanbao_i(),txt_yingzibang_i(),txt_lijin_i(),icon_yingzi_i(),icon_yuanbao_i(),icon_yingzibang_i(),icon_lijin_i()];
			return temp;
		}

		private function msIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			msIcon = temp;
			temp.name = "msIcon";
			temp.styleName = "ui/app/beibao/tb.png";
			temp.x = 27;
			temp.y = 30;
			return temp;
		}

		private function msName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			msName = temp;
			temp.name = "msName";
			temp.styleName = "ui/app/beibao/miaos.png";
			temp.x = 54;
			temp.y = 30;
			return temp;
		}

		private function num_miaoshang_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_miaoshang = temp;
			temp.name = "num_miaoshang";
			temp.gap = -6;
			temp.height = 25;
			temp.label = "4512";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_miaoshang;
			temp.width = 50;
			temp.x = 93;
			temp.y = 31;
			return temp;
		}

		private function packs_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			packs = temp;
			temp.name = "packs";
			temp.x = 590;
			temp.y = 73;
			temp.elementsContent = [__juese_Skin_UIAsset7_i(),__juese_Skin_UIAsset8_i(),__juese_Skin_UIAsset9_i(),__juese_Skin_UIAsset10_i(),__juese_Skin_UIAsset11_i(),tab_pack_i(),money_i(),Icons_i(),lst_pack_i()];
			return temp;
		}

		private function pro_jinyan_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jinyan = temp;
			temp.name = "pro_jinyan";
			temp.height = 10;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role1_Skin;
			temp.value = 0;
			temp.width = 131;
			temp.x = 48;
			temp.y = 77;
			return temp;
		}

		private function pro_zhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zhenqi = temp;
			temp.name = "pro_zhenqi";
			temp.height = 10;
			temp.styleClass = org.mokylin.skin.component.progress.progress_role2_Skin;
			temp.value = 0;
			temp.width = 131;
			temp.x = 48;
			temp.y = 95;
			return temp;
		}

		private function roleZone_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			roleZone = temp;
			temp.name = "roleZone";
			temp.alpha = 0;
			temp.height = 311;
			temp.styleName = "ui/common/tips/tips_di2.png";
			temp.width = 244;
			temp.x = 61;
			temp.y = 5;
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 67;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 326;
			temp.x = 9;
			temp.y = -1;
			temp.layout = __juese_Skin_HorizontalLayout1_i();
			temp.dataProvider = __juese_Skin_ArrayCollection1_i();
			return temp;
		}

		private function txt_baojijiacheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_baojijiacheng = temp;
			temp.name = "txt_baojijiacheng";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 294;
			return temp;
		}

		private function txt_baojikangxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_baojikangxing = temp;
			temp.name = "txt_baojikangxing";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 178;
			return temp;
		}

		private function txt_baojilv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_baojilv = temp;
			temp.name = "txt_baojilv";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 275;
			return temp;
		}

		private function txt_bishanlv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_bishanlv = temp;
			temp.name = "txt_bishanlv";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 197;
			return temp;
		}

		private function txt_fangyubaifenbi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_fangyubaifenbi = temp;
			temp.name = "txt_fangyubaifenbi";
			temp.text = "26.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 216;
			return temp;
		}

		private function txt_genggu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_genggu = temp;
			temp.name = "txt_genggu";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 22;
			return temp;
		}

		private function txt_gongsu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_gongsu = temp;
			temp.name = "txt_gongsu";
			temp.text = "125/5秒";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 139;
			return temp;
		}

		private function txt_huigeng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_huigeng = temp;
			temp.name = "txt_huigeng";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 42;
			return temp;
		}

		private function txt_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			txt = temp;
			temp.name = "txt";
			temp.x = 70;
			temp.y = 110;
			temp.elementsContent = [txt_lidao_i(),txt_genggu_i(),txt_huigeng_i(),txt_shenfa_i(),txt_qixue_i(),txt_waigong_i(),txt_neigong_i(),txt_gongsu_i(),txt_mingzhonglv_i(),txt_baojikangxing_i(),txt_bishanlv_i(),txt_fangyubaifenbi_i(),txt_shengminhuifu_i(),txt_zhiliaotishen_i(),txt_baojilv_i(),txt_baojijiacheng_i()];
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
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 74;
			return temp;
		}

		private function txt_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_level = temp;
			temp.name = "txt_level";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "Lv100";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function txt_lidao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_lidao = temp;
			temp.name = "txt_lidao";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function txt_lijin_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_lijin = temp;
			temp.name = "txt_lijin";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 172;
			temp.y = 29;
			return temp;
		}

		private function txt_loveName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_loveName = temp;
			temp.name = "txt_loveName";
			temp.letterSpacing = -1;
			temp.text = "配偶名字六字";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 145;
			temp.y = 17;
			return temp;
		}

		private function txt_mingzhonglv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_mingzhonglv = temp;
			temp.name = "txt_mingzhonglv";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 158;
			return temp;
		}

		private function txt_neigong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_neigong = temp;
			temp.name = "txt_neigong";
			temp.text = "5272";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 119;
			return temp;
		}

		private function txt_qixue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_qixue = temp;
			temp.name = "txt_qixue";
			temp.text = "47732157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 81;
			return temp;
		}

		private function txt_roleName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_roleName = temp;
			temp.name = "txt_roleName";
			temp.bold = false;
			temp.text = "[1区]名字共六个字";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 186;
			temp.x = 84;
			temp.y = 2;
			return temp;
		}

		private function txt_shenfa_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_shenfa = temp;
			temp.name = "txt_shenfa";
			temp.text = "32157";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 61;
			return temp;
		}

		private function txt_shengminhuifu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_shengminhuifu = temp;
			temp.name = "txt_shengminhuifu";
			temp.text = "125/5秒";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 236;
			return temp;
		}

		private function txt_team_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_team = temp;
			temp.name = "txt_team";
			temp.letterSpacing = -1;
			temp.text = "[帮会名字]";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 237;
			temp.y = 2;
			return temp;
		}

		private function txt_type_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_type = temp;
			temp.name = "txt_type";
			temp.letterSpacing = -1;
			temp.text = "兵家";
			temp.color = 0xABAD97;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 40;
			temp.y = 3;
			return temp;
		}

		private function txt_waigong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_waigong = temp;
			temp.name = "txt_waigong";
			temp.text = "5272";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 100;
			return temp;
		}

		private function txt_yingzi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yingzi = temp;
			temp.name = "txt_yingzi";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 2;
			temp.y = 4;
			return temp;
		}

		private function txt_yingzibang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yingzibang = temp;
			temp.name = "txt_yingzibang";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 172;
			temp.y = 4;
			return temp;
		}

		private function txt_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_yuanbao = temp;
			temp.name = "txt_yuanbao";
			temp.text = "1000";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 116;
			temp.x = 2;
			temp.y = 29;
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
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 92;
			return temp;
		}

		private function txt_zhiliaotishen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_zhiliaotishen = temp;
			temp.name = "txt_zhiliaotishen";
			temp.text = "66.30%";
			temp.textAlign = "right";
			temp.color = 0xE3D9BF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 0;
			temp.y = 255;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 76;
			temp.y = 1;
			return temp;
		}

		private function values_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			values = temp;
			temp.name = "values";
			temp.x = 25;
			temp.y = 78;
			temp.elementsContent = [__juese_Skin_UIAsset6_i(),__juese_Skin_Label1_i(),__juese_Skin_Label2_i(),lbl_jingyan_i(),lbl_zhenqi_i(),pro_jinyan_i(),pro_zhenqi_i(),txt_jinyan_i(),txt_zhenqi_i(),__juese_Skin_Group1_i(),txt_i(),msIcon_i(),msName_i(),num_miaoshang_i()];
			return temp;
		}

		private function weapons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			weapons = temp;
			temp.name = "weapons";
			temp.height = 329;
			temp.width = 368;
			temp.x = 219;
			temp.y = 149;
			temp.elementsContent = [roleZone_i()];
			return temp;
		}

	}
}