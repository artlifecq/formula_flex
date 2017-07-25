package org.mokylin.skin.app.zhanhun
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanhun.Progress_jindu2;
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;
	import org.mokylin.skin.app.zhanhun.progress_jindu;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.uinumber.UINumberLevel;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Zhanhun_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var List:feathers.controls.List;

		public var NumZhanli:feathers.controls.UINumber;

		public var Num_dengji:feathers.controls.UINumber;

		public var bg:feathers.controls.SkinnableContainer;

		public var btn_huanhua:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var btn_up:feathers.controls.Button;

		public var grpCenter:feathers.controls.Group;

		public var grpShuxing:feathers.controls.Group;

		public var grp_current:feathers.controls.Group;

		public var grp_dengji:feathers.controls.UIAsset;

		public var grp_jindu:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var icon:feathers.controls.UIAsset;

		public var itemGroup:feathers.controls.Group;

		public var item_icon1:feathers.controls.UIAsset;

		public var item_icon2:feathers.controls.UIAsset;

		public var item_icon3:feathers.controls.UIAsset;

		public var item_icon4:feathers.controls.UIAsset;

		public var lab_prop1:feathers.controls.SkinnableContainer;

		public var lab_prop2:feathers.controls.SkinnableContainer;

		public var lab_prop3:feathers.controls.SkinnableContainer;

		public var lab_prop4:feathers.controls.SkinnableContainer;

		public var lab_prop5:feathers.controls.SkinnableContainer;

		public var lab_prop6:feathers.controls.SkinnableContainer;

		public var lbText1:feathers.controls.Label;

		public var lbText2:feathers.controls.Label;

		public var lbText3:feathers.controls.Label;

		public var lbText4:feathers.controls.Label;

		public var lbTiao:feathers.controls.UIAsset;

		public var lb_jindu:feathers.controls.Label;

		public var lb_progress:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;

		public var modecontent:feathers.controls.Group;

		public var num_current:feathers.controls.UINumber;

		public var num_lv:feathers.controls.UINumber;

		public var num_next:feathers.controls.UINumber;

		public var pro_jindu:feathers.controls.ProgressBar;

		public var pro_zongjindu:feathers.controls.ProgressBar;

		public var track:feathers.controls.UIAsset;

		public var uiFy:feathers.controls.UIAsset;

		public var uiGg:feathers.controls.UIAsset;

		public var uiGj:feathers.controls.UIAsset;

		public var uiLd:feathers.controls.UIAsset;

		public var uiLv:feathers.controls.UIAsset;

		public var uiMz:feathers.controls.UIAsset;

		public var uiQx:feathers.controls.UIAsset;

		public var ui_huanhua:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;

		public var zhanhunName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhanhun_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__Zhanhun_Skin_UIAsset2_i(),__Zhanhun_Skin_UIAsset3_i(),__Zhanhun_Skin_UIAsset4_i(),__Zhanhun_Skin_UIAsset5_i(),__Zhanhun_Skin_UIAsset6_i(),modecontent_i(),btn_prev_i(),btn_next_i(),grp_zhandouli_i(),grpCenter_i(),zhanhunName_i(),__Zhanhun_Skin_UIAsset8_i(),__Zhanhun_Skin_UIAsset9_i(),grpShuxing_i(),__Zhanhun_Skin_UIAsset16_i(),icon_i(),grp_jindu_i(),__Zhanhun_Skin_Group1_i(),grp_current_i(),btn_shuoming_i(),List_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function List_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			List = temp;
			temp.name = "List";
			temp.height = 330;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 265;
			temp.x = 669;
			temp.y = 114;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -6;
			temp.height = 25;
			temp.label = "629845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 142;
			temp.x = 60;
			temp.y = 10;
			return temp;
		}

		private function Num_dengji_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_dengji = temp;
			temp.name = "Num_dengji";
			temp.gap = -3;
			temp.height = 17;
			temp.label = "100";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberLevel;
			temp.width = 54;
			temp.x = 70;
			temp.y = 2;
			return temp;
		}

		private function __Zhanhun_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 668;
			temp.y = 89;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset19_i(),__Zhanhun_Skin_UIAsset20_i(),__Zhanhun_Skin_UIAsset21_i(),__Zhanhun_Skin_UIAsset22_i(),__Zhanhun_Skin_UIAsset23_i(),__Zhanhun_Skin_UIAsset24_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 70;
			temp.y = 99;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset27_i(),__Zhanhun_Skin_UIAsset28_i(),__Zhanhun_Skin_UIAsset29_i()];
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 47;
			temp.y = 2;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 47;
			temp.y = 29;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 186;
			temp.y = 2;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 186;
			temp.y = 29;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 326;
			temp.y = 2;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/itembg.png";
			temp.width = 85;
			temp.x = 326;
			temp.y = 29;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 57;
			temp.styleName = "ui/app/zhanhun/jndi.png";
			temp.width = 91;
			temp.x = 559;
			temp.y = 455;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/lv.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/lv.png";
			temp.x = 535;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 108;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 58;
			temp.x = 108;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 99;
			temp.x = 166;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/tj.png";
			temp.x = 36;
			temp.y = 5;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/cs.png";
			temp.x = 121;
			temp.y = 5;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/dcjy.png";
			temp.x = 178;
			temp.y = 5;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/jrkhd.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset26_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaodi.png";
			temp.x = 4;
			temp.y = 97;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset27_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaoxian.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset28_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaoxian.png";
			temp.x = 61;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset29_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaoxian.png";
			temp.x = 122;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 504;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 271;
			temp.x = 665;
			temp.y = 86;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanhun/bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 140;
			temp.styleName = "ui/app/zhanhun/dikuang.png";
			temp.width = 633;
			temp.x = 28;
			temp.y = 447;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanhun/zhanhun.png";
			temp.x = 450;
			temp.y = 17;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/zdldi.png";
			temp.x = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/sxjc.png";
			temp.x = 57;
			temp.y = 453;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/jn.png";
			temp.x = 537;
			temp.y = 453;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_huanhua_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_huanhua = temp;
			temp.name = "btn_huanhua";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "幻 化";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.visible = false;
			temp.width = 90;
			temp.x = 63;
			temp.y = 6;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 631;
			temp.y = 285;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 59;
			temp.y = 285;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 38;
			temp.y = 100;
			return temp;
		}

		private function btn_up_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_up = temp;
			temp.name = "btn_up";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "升 级";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 108;
			temp.x = 232;
			temp.y = 27;
			return temp;
		}

		private function grpCenter_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCenter = temp;
			temp.name = "grpCenter";
			temp.x = 244;
			temp.y = 378;
			temp.elementsContent = [grp_dengji_i(),Num_dengji_i(),uiLv_i(),lb_time_i(),btn_huanhua_i(),ui_huanhua_i()];
			return temp;
		}

		private function grpShuxing_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpShuxing = temp;
			temp.name = "grpShuxing";
			temp.x = 86;
			temp.y = 459;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset10_i(),__Zhanhun_Skin_UIAsset11_i(),__Zhanhun_Skin_UIAsset12_i(),__Zhanhun_Skin_UIAsset13_i(),__Zhanhun_Skin_UIAsset14_i(),__Zhanhun_Skin_UIAsset15_i(),lab_prop1_i(),lab_prop2_i(),lab_prop3_i(),lab_prop4_i(),lab_prop5_i(),lab_prop6_i(),uiGj_i(),uiLd_i(),uiGg_i(),uiFy_i(),uiMz_i(),uiQx_i()];
			return temp;
		}

		private function grp_current_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_current = temp;
			temp.name = "grp_current";
			temp.x = 668;
			temp.y = 447;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset25_i(),itemGroup_i(),__Zhanhun_Skin_UIAsset26_i(),pro_zongjindu_i(),__Zhanhun_Skin_Group2_i(),lbText1_i(),lbText2_i(),lbText3_i(),lbText4_i(),lb_jindu_i()];
			return temp;
		}

		private function grp_dengji_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grp_dengji = temp;
			temp.name = "grp_dengji";
			temp.styleName = "ui/app/zhanhun/kejihuo.png";
			temp.x = 115;
			temp.y = 0;
			return temp;
		}

		private function grp_jindu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jindu = temp;
			temp.name = "grp_jindu";
			temp.x = 53;
			temp.y = 516;
			temp.elementsContent = [btn_up_i(),__Zhanhun_Skin_UIAsset17_i(),__Zhanhun_Skin_UIAsset18_i(),num_current_i(),num_next_i(),track_i(),pro_jindu_i(),lbTiao_i(),lb_progress_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 28;
			temp.y = 405;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset7_i(),ui_zhandou_i(),NumZhanli_i(),num_lv_i()];
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 578;
			temp.y = 459;
			return temp;
		}

		private function itemGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			itemGroup = temp;
			temp.name = "itemGroup";
			temp.x = 18;
			temp.y = 30;
			temp.elementsContent = [item_icon1_i(),item_icon2_i(),item_icon3_i(),item_icon4_i()];
			return temp;
		}

		private function item_icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			item_icon1 = temp;
			temp.name = "item_icon1";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function item_icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			item_icon2 = temp;
			temp.name = "item_icon2";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 61;
			temp.y = 0;
			return temp;
		}

		private function item_icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			item_icon3 = temp;
			temp.name = "item_icon3";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 122;
			temp.y = 0;
			return temp;
		}

		private function item_icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			item_icon4 = temp;
			temp.name = "item_icon4";
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 183;
			temp.y = 0;
			return temp;
		}

		private function lab_prop1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop1 = temp;
			temp.name = "lab_prop1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 51;
			temp.y = 1;
			return temp;
		}

		private function lab_prop2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop2 = temp;
			temp.name = "lab_prop2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 51;
			temp.y = 28;
			return temp;
		}

		private function lab_prop3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop3 = temp;
			temp.name = "lab_prop3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 189;
			temp.y = 1;
			return temp;
		}

		private function lab_prop4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop4 = temp;
			temp.name = "lab_prop4";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 189;
			temp.y = 28;
			return temp;
		}

		private function lab_prop5_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop5 = temp;
			temp.name = "lab_prop5";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 329;
			temp.y = 1;
			return temp;
		}

		private function lab_prop6_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_prop6 = temp;
			temp.name = "lab_prop6";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Skin()
			temp.skin = skin
			temp.x = 329;
			temp.y = 28;
			return temp;
		}

		private function lbText1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbText1 = temp;
			temp.name = "lbText1";
			temp.text = "50";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 23;
			temp.y = 81;
			return temp;
		}

		private function lbText2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbText2 = temp;
			temp.name = "lbText2";
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 87;
			temp.y = 81;
			return temp;
		}

		private function lbText3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbText3 = temp;
			temp.name = "lbText3";
			temp.text = "150";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 149;
			temp.y = 81;
			return temp;
		}

		private function lbText4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbText4 = temp;
			temp.name = "lbText4";
			temp.text = "200";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 212;
			temp.y = 81;
			return temp;
		}

		private function lbTiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lbTiao = temp;
			temp.name = "lbTiao";
			temp.styleName = "ui/app/zhanhun/tiaoxian.png";
			temp.x = 286;
			temp.y = -5;
			return temp;
		}

		private function lb_jindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jindu = temp;
			temp.name = "lb_jindu";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "总进度：0/200点";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 150;
			temp.x = 70;
			temp.y = 117;
			return temp;
		}

		private function lb_progress_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_progress = temp;
			temp.name = "lb_progress";
			temp.text = "333/333";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 223;
			temp.x = 180;
			temp.y = 3;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.letterSpacing = 1;
			temp.text = "（约第99天可获取）";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 200;
			temp.x = 3;
			temp.y = 21;
			return temp;
		}

		private function modecontent_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			modecontent = temp;
			temp.name = "modecontent";
			temp.x = 4;
			temp.y = 13;
			return temp;
		}

		private function num_current_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_current = temp;
			temp.name = "num_current";
			temp.gap = -3;
			temp.height = 18;
			temp.label = "1";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberLevel;
			temp.width = 50;
			temp.x = 31;
			temp.y = 2;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -2;
			temp.height = 13;
			temp.label = "x100";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
			temp.width = 64;
			temp.x = 143;
			temp.y = 21;
			return temp;
		}

		private function num_next_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_next = temp;
			temp.name = "num_next";
			temp.gap = -3;
			temp.height = 18;
			temp.label = "2";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberLevel;
			temp.width = 50;
			temp.x = 567;
			temp.y = 2;
			return temp;
		}

		private function pro_jindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jindu = temp;
			temp.name = "pro_jindu";
			temp.maximum = 400;
			temp.styleClass = org.mokylin.skin.app.zhanhun.progress_jindu;
			temp.value = 200;
			temp.x = 79;
			temp.y = 4;
			return temp;
		}

		private function pro_zongjindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zongjindu = temp;
			temp.name = "pro_zongjindu";
			temp.styleClass = org.mokylin.skin.app.zhanhun.Progress_jindu2;
			temp.value = 60;
			temp.width = 239;
			temp.x = 11;
			temp.y = 100;
			return temp;
		}

		private function track_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			track = temp;
			temp.name = "track";
			temp.styleName = "ui/app/zhanhun/tiao_di.png";
			temp.width = 463;
			temp.x = 60;
			temp.y = 0;
			return temp;
		}

		private function uiFy_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFy = temp;
			temp.name = "uiFy";
			temp.styleName = "ui/common/shuxing/fyz.png";
			temp.x = 277;
			temp.y = 0;
			return temp;
		}

		private function uiGg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGg = temp;
			temp.name = "uiGg";
			temp.styleName = "ui/common/shuxing/gg.png";
			temp.x = 136;
			temp.y = 28;
			return temp;
		}

		private function uiGj_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiGj = temp;
			temp.name = "uiGj";
			temp.styleName = "ui/common/shuxing/gjl.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiLd_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLd = temp;
			temp.name = "uiLd";
			temp.styleName = "ui/common/shuxing/ld.png";
			temp.x = 0;
			temp.y = 28;
			return temp;
		}

		private function uiLv_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLv = temp;
			temp.name = "uiLv";
			temp.styleName = "ui/common/shuxing/lv.png";
			temp.x = 34;
			temp.y = 0;
			return temp;
		}

		private function uiMz_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMz = temp;
			temp.name = "uiMz";
			temp.styleName = "ui/common/shuxing/mz.png";
			temp.x = 277;
			temp.y = 28;
			return temp;
		}

		private function uiQx_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiQx = temp;
			temp.name = "uiQx";
			temp.styleName = "ui/common/shuxing/qx.png";
			temp.x = 136;
			temp.y = 0;
			return temp;
		}

		private function ui_huanhua_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_huanhua = temp;
			temp.name = "ui_huanhua";
			temp.styleName = "ui/app/zhanhun/yihuanhua.png";
			temp.visible = false;
			temp.x = 73;
			temp.y = 5;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 4;
			temp.y = 7;
			return temp;
		}

		private function zhanhunName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhanhunName = temp;
			temp.name = "zhanhunName";
			temp.styleName = "ui/app/zhanhun/modename/1.png";
			temp.x = 605;
			temp.y = 91;
			return temp;
		}

	}
}