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
	import org.mokylin.skin.app.zhanhun.Shuxing_Ohter_Skin;
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;
	import org.mokylin.skin.app.zhanhun.button.Zhanhun_shengji;
	import org.mokylin.skin.app.zhanhun.progress_jindu;
	import org.mokylin.skin.app.zhanhun.uinumber.UINumberLv;
	import org.mokylin.skin.common.yiji_panelbg2_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.progress.pro_jindu_Skin;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

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

		public var Num_dengji:feathers.controls.UINumber;

		public var Num_zhandouli:feathers.controls.UINumber;

		public var arrow_up:feathers.controls.UIAsset;

		public var bg:feathers.controls.SkinnableContainer;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_up:feathers.controls.Button;

		public var grp_dengji:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var lab_other_prop1:feathers.controls.SkinnableContainer;

		public var lab_other_prop2:feathers.controls.SkinnableContainer;

		public var lab_other_prop3:feathers.controls.SkinnableContainer;

		public var lab_prop1:feathers.controls.SkinnableContainer;

		public var lab_prop2:feathers.controls.SkinnableContainer;

		public var lab_prop3:feathers.controls.SkinnableContainer;

		public var lb_current:feathers.controls.Label;

		public var lb_jindu:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;

		public var lb_up:feathers.controls.Label;

		public var pro_shengji:feathers.controls.ProgressBar;

		public var pro_zongjindu:feathers.controls.ProgressBar;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Zhanhun_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),__Zhanhun_Skin_UIAsset1_i(),__Zhanhun_Skin_UIAsset2_i(),__Zhanhun_Skin_UIAsset3_i(),__Zhanhun_Skin_UIAsset4_i(),__Zhanhun_Skin_UIAsset5_i(),btn_prev_i(),btn_next_i(),grp_zhandouli_i(),grp_dengji_i(),__Zhanhun_Skin_UIAsset8_i(),__Zhanhun_Skin_UIAsset9_i(),__Zhanhun_Skin_Group1_i(),lb_current_i(),pro_shengji_i(),lb_up_i(),btn_up_i(),__Zhanhun_Skin_Group2_i(),List_i(),__Zhanhun_Skin_Group3_i(),pro_zongjindu_i(),__Zhanhun_Skin_Label6_i(),__Zhanhun_Skin_Label7_i(),__Zhanhun_Skin_Label8_i(),__Zhanhun_Skin_Label9_i(),lb_jindu_i()];
			
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
			temp.height = 314;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 275;
			temp.x = 654;
			temp.y = 117;
			return temp;
		}

		private function Num_dengji_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_dengji = temp;
			temp.name = "Num_dengji";
			temp.height = 15;
			temp.label = "100";
			temp.styleClass = org.mokylin.skin.app.zhanhun.uinumber.UINumberLv;
			temp.width = 37;
			temp.x = 75;
			temp.y = 1;
			return temp;
		}

		private function Num_zhandouli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Num_zhandouli = temp;
			temp.name = "Num_zhandouli";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "652147";
			temp.number = 21222;
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;
			temp.width = 147;
			temp.x = 50;
			temp.y = 11;
			return temp;
		}

		private function __Zhanhun_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 87;
			temp.y = 399;
			temp.elementsContent = [lab_prop1_i(),lab_prop2_i(),lab_prop3_i(),lab_other_prop1_i(),lab_other_prop2_i(),lab_other_prop3_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 652;
			temp.y = 84;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset11_i(),__Zhanhun_Skin_Label2_i(),__Zhanhun_Skin_Label3_i(),__Zhanhun_Skin_Label4_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 652;
			temp.y = 434;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset12_i(),__Zhanhun_Skin_Label5_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 1;
			temp.text = "20";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 160;
			temp.y = 15;
			return temp;
		}

		private function __Zhanhun_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "途径";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 40;
			temp.y = 6;
			return temp;
		}

		private function __Zhanhun_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "次数";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 128;
			temp.y = 6;
			return temp;
		}

		private function __Zhanhun_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "单次经验";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 195;
			temp.y = 6;
			return temp;
		}

		private function __Zhanhun_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "今日可获得";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 96;
			temp.y = 6;
			return temp;
		}

		private function __Zhanhun_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "50";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 681;
			temp.y = 522;
			return temp;
		}

		private function __Zhanhun_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 749;
			temp.y = 522;
			return temp;
		}

		private function __Zhanhun_Skin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "150";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 807;
			temp.y = 522;
			return temp;
		}

		private function __Zhanhun_Skin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "200";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 866;
			temp.y = 522;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/mingzitiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/mingzitiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 498;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 73;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 487;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 285;
			temp.x = 647;
			temp.y = 79;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/shuxing.png";
			temp.x = 21;
			temp.y = 386;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/zhanhun/zh.png";
			temp.x = 449;
			temp.y = 13;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/zhmz.png";
			temp.x = 601;
			temp.y = 84;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/di.png";
			temp.visible = false;
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/kejihuo.png";
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/sxjc.png";
			temp.x = 37;
			temp.y = 401;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/jn.png";
			temp.x = 533;
			temp.y = 401;
			return temp;
		}

		private function arrow_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			arrow_up = temp;
			temp.name = "arrow_up";
			temp.styleName = "ui/common/tubiao/tu_up.png";
			temp.x = 149;
			temp.y = 17;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.common.yiji_panelbg2_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 602;
			temp.y = 209;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 70;
			temp.y = 209;
			return temp;
		}

		private function btn_up_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_up = temp;
			temp.name = "btn_up";
			temp.styleClass = org.mokylin.skin.app.zhanhun.button.Zhanhun_shengji;
			temp.x = 293;
			temp.y = 520;
			return temp;
		}

		private function grp_dengji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_dengji = temp;
			temp.name = "grp_dengji";
			temp.x = 241;
			temp.y = 329;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset7_i(),Num_dengji_i(),lb_time_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 29;
			temp.y = 345;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset6_i(),ui_zhandou_i(),Num_zhandouli_i(),arrow_up_i(),__Zhanhun_Skin_Label1_i()];
			return temp;
		}

		private function lab_other_prop1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_other_prop1 = temp;
			temp.name = "lab_other_prop1";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Ohter_Skin()
			temp.skin = skin
			temp.width = 283;
			temp.x = 137;
			temp.y = 0;
			return temp;
		}

		private function lab_other_prop2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_other_prop2 = temp;
			temp.name = "lab_other_prop2";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Ohter_Skin()
			temp.skin = skin
			temp.width = 283;
			temp.x = 137;
			temp.y = 22;
			return temp;
		}

		private function lab_other_prop3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lab_other_prop3 = temp;
			temp.name = "lab_other_prop3";
			temp.height = 24;
			var skin:StateSkin = new org.mokylin.skin.app.zhanhun.Shuxing_Ohter_Skin()
			temp.skin = skin
			temp.width = 283;
			temp.x = 137;
			temp.y = 44;
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
			temp.width = 130;
			temp.x = 0;
			temp.y = 0;
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
			temp.width = 130;
			temp.x = 0;
			temp.y = 22;
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
			temp.width = 130;
			temp.x = 0;
			temp.y = 44;
			return temp;
		}

		private function lb_current_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_current = temp;
			temp.name = "lb_current";
			temp.bold = true;
			temp.text = "等级1";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 83;
			temp.y = 492;
			return temp;
		}

		private function lb_jindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jindu = temp;
			temp.name = "lb_jindu";
			temp.text = "总进度：0/200点";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 150;
			temp.x = 718;
			temp.y = 542;
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
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 200;
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function lb_up_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_up = temp;
			temp.name = "lb_up";
			temp.bold = true;
			temp.text = "等级2";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 48;
			temp.x = 574;
			temp.y = 492;
			return temp;
		}

		private function pro_shengji_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_shengji = temp;
			temp.name = "pro_shengji";
			temp.maximum = 400;
			temp.styleClass = org.mokylin.skin.component.progress.pro_jindu_Skin;
			temp.value = 0;
			temp.width = 435;
			temp.x = 124;
			temp.y = 479;
			return temp;
		}

		private function pro_zongjindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zongjindu = temp;
			temp.name = "pro_zongjindu";
			temp.styleClass = org.mokylin.skin.app.zhanhun.progress_jindu;
			temp.value = 20;
			temp.x = 665;
			temp.y = 522;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 0;
			temp.y = 10;
			return temp;
		}

	}
}