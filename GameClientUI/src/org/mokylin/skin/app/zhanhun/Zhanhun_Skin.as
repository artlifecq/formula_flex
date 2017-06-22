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
	import org.mokylin.skin.app.zhanhun.Shuxing_Skin;
	import org.mokylin.skin.app.zhanhun.button.ButtonJiantou;
	import org.mokylin.skin.app.zhanhun.button.Zhanhun_shengji;
	import org.mokylin.skin.app.zhanhun.progress_jindu;
	import org.mokylin.skin.app.zhanhun.uinumber.UINumberDengji;
	import org.mokylin.skin.app.zhanhun.uinumber.UINumberLv;
	import org.mokylin.skin.common.yiji_panelbg2_Skin;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;
	import org.mokylin.skin.component.list.ListSkin1;
	import org.mokylin.skin.component.progress.Pro_jindu2_Skin;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

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

		public var grp_current:feathers.controls.Group;

		public var grp_dengji:feathers.controls.UIAsset;

		public var grp_jindu:feathers.controls.Group;

		public var grp_zhandouli:feathers.controls.Group;

		public var lab_prop1:feathers.controls.SkinnableContainer;

		public var lab_prop2:feathers.controls.SkinnableContainer;

		public var lab_prop3:feathers.controls.SkinnableContainer;

		public var lab_prop4:feathers.controls.SkinnableContainer;

		public var lab_prop5:feathers.controls.SkinnableContainer;

		public var lab_prop6:feathers.controls.SkinnableContainer;

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
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),__Zhanhun_Skin_UIAsset3_i(),__Zhanhun_Skin_UIAsset4_i(),__Zhanhun_Skin_UIAsset5_i(),modecontent_i(),btn_prev_i(),btn_next_i(),grp_zhandouli_i(),__Zhanhun_Skin_Group1_i(),zhanhunName_i(),__Zhanhun_Skin_UIAsset6_i(),__Zhanhun_Skin_UIAsset7_i(),__Zhanhun_Skin_Group2_i(),grp_jindu_i(),__Zhanhun_Skin_Group3_i(),List_i(),grp_current_i(),btn_shuoming_i()];
			
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
			temp.height = 318;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 265;
			temp.x = 657;
			temp.y = 106;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -13;
			temp.height = 33;
			temp.label = "1364364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 148;
			temp.x = 55;
			temp.y = 7;
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
			temp.x = 74;
			temp.y = 1;
			return temp;
		}

		private function __Zhanhun_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 240;
			temp.y = 365;
			temp.elementsContent = [grp_dengji_i(),Num_dengji_i(),lb_time_i(),ui_huanhua_i(),btn_huanhua_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 94;
			temp.y = 422;
			temp.elementsContent = [lab_prop1_i(),lab_prop2_i(),lab_prop3_i(),lab_prop4_i(),lab_prop5_i(),lab_prop6_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 656;
			temp.y = 78;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset15_i(),__Zhanhun_Skin_Label1_i(),__Zhanhun_Skin_Label2_i(),__Zhanhun_Skin_Label3_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Group5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 70;
			temp.y = 100;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset23_i(),__Zhanhun_Skin_UIAsset24_i(),__Zhanhun_Skin_UIAsset25_i()];
			return temp;
		}

		private function __Zhanhun_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "途径";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 44;
			temp.y = 4;
			return temp;
		}

		private function __Zhanhun_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "次数";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 138;
			temp.y = 4;
			return temp;
		}

		private function __Zhanhun_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "单次经验";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 196;
			temp.y = 4;
			return temp;
		}

		private function __Zhanhun_Skin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "50";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 27;
			temp.y = 82;
			return temp;
		}

		private function __Zhanhun_Skin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 88;
			temp.y = 82;
			return temp;
		}

		private function __Zhanhun_Skin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "150";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 148;
			temp.y = 82;
			return temp;
		}

		private function __Zhanhun_Skin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "200";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 31;
			temp.x = 211;
			temp.y = 82;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/app/zhanhun/dengjikuang.png";
			temp.width = 68;
			temp.x = 502;
			temp.y = 10;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/dengji.png";
			temp.x = 3;
			temp.y = 14;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/dengji.png";
			temp.x = 506;
			temp.y = 14;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/tiao_zuo.png";
			temp.x = 89;
			temp.y = 14;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/zhanhun/tiao_zuo.png";
			temp.x = 474;
			temp.y = 14;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/mingzitiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/youdi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/jrkhd.png";
			temp.x = 51;
			temp.y = 9;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/tiao_di.png";
			temp.x = 5;
			temp.y = 98;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaoxian.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaoxian.png";
			temp.x = 61;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/lantiaoxian.png";
			temp.x = 122;
			temp.y = 0;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanhun/bg.jpg";
			temp.x = 18;
			temp.y = 71;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/shuxing.png";
			temp.x = 25;
			temp.y = 389;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/zhanhun/zh.png";
			temp.x = 449;
			temp.y = 13;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/sxjc.png";
			temp.x = 47;
			temp.y = 420;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanhun/jn.png";
			temp.x = 495;
			temp.y = 420;
			return temp;
		}

		private function __Zhanhun_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/app/zhanhun/dengjikuang.png";
			temp.width = 68;
			temp.x = 0;
			temp.y = 10;
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

		private function btn_huanhua_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_huanhua = temp;
			temp.name = "btn_huanhua";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "幻 化";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xCFC6AE;
			temp.x = 63;
			temp.y = 6;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.app.zhanhun.button.ButtonJiantou;
			temp.x = 607;
			temp.y = 253;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.app.zhanhun.button.ButtonJiantou;
			temp.x = 79;
			temp.y = 253;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 34;
			temp.y = 87;
			return temp;
		}

		private function btn_up_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_up = temp;
			temp.name = "btn_up";
			temp.styleClass = org.mokylin.skin.app.zhanhun.button.Zhanhun_shengji;
			temp.x = 226;
			temp.y = 43;
			return temp;
		}

		private function grp_current_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_current = temp;
			temp.name = "grp_current";
			temp.x = 656;
			temp.y = 426;
			temp.elementsContent = [__Zhanhun_Skin_UIAsset16_i(),__Zhanhun_Skin_UIAsset17_i(),__Zhanhun_Skin_UIAsset22_i(),pro_zongjindu_i(),__Zhanhun_Skin_Group5_i(),__Zhanhun_Skin_Label4_i(),__Zhanhun_Skin_Label5_i(),__Zhanhun_Skin_Label6_i(),__Zhanhun_Skin_Label7_i(),lb_jindu_i()];
			return temp;
		}

		private function grp_dengji_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grp_dengji = temp;
			temp.name = "grp_dengji";
			temp.styleName = "ui/app/zhanhun/kejihuo.png";
			temp.x = 40;
			temp.y = 0;
			return temp;
		}

		private function grp_jindu_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_jindu = temp;
			temp.name = "grp_jindu";
			temp.x = 57;
			temp.y = 484;
			temp.elementsContent = [btn_up_i(),__Zhanhun_Skin_UIAsset9_i(),__Zhanhun_Skin_UIAsset10_i(),__Zhanhun_Skin_UIAsset11_i(),__Zhanhun_Skin_UIAsset12_i(),num_current_i(),num_next_i(),track_i(),pro_jindu_i(),lb_progress_i(),__Zhanhun_Skin_UIAsset13_i(),__Zhanhun_Skin_UIAsset14_i()];
			return temp;
		}

		private function grp_zhandouli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_zhandouli = temp;
			temp.name = "grp_zhandouli";
			temp.x = 37;
			temp.y = 371;
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i(),num_lv_i()];
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
			temp.width = 150;
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
			temp.width = 150;
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
			temp.width = 150;
			temp.x = 0;
			temp.y = 44;
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
			temp.width = 150;
			temp.x = 169;
			temp.y = 0;
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
			temp.width = 150;
			temp.x = 169;
			temp.y = 22;
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
			temp.width = 150;
			temp.x = 169;
			temp.y = 44;
			return temp;
		}

		private function lb_jindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_jindu = temp;
			temp.name = "lb_jindu";
			temp.leading = 0;
			temp.letterSpacing = 0;
			temp.fontSize = 12;
			temp.text = "总进度：0/200点";
			temp.textAlign = "center";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 150;
			temp.x = 65;
			temp.y = 119;
			return temp;
		}

		private function lb_progress_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_progress = temp;
			temp.name = "lb_progress";
			temp.text = "333/333";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 217;
			temp.y = 14;
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
			temp.x = 3;
			temp.y = 21;
			return temp;
		}

		private function modecontent_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			modecontent = temp;
			temp.name = "modecontent";
			temp.x = 0;
			temp.y = 0;
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
			temp.styleClass = org.mokylin.skin.app.zhanhun.uinumber.UINumberDengji;
			temp.width = 50;
			temp.x = 35;
			temp.y = 16;
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
			temp.x = 166;
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
			temp.styleClass = org.mokylin.skin.app.zhanhun.uinumber.UINumberDengji;
			temp.width = 50;
			temp.x = 538;
			temp.y = 16;
			return temp;
		}

		private function pro_jindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_jindu = temp;
			temp.name = "pro_jindu";
			temp.maximum = 400;
			temp.styleClass = org.mokylin.skin.component.progress.Pro_jindu2_Skin;
			temp.value = 90;
			temp.x = 90;
			temp.y = 15;
			return temp;
		}

		private function pro_zongjindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_zongjindu = temp;
			temp.name = "pro_zongjindu";
			temp.styleClass = org.mokylin.skin.app.zhanhun.progress_jindu;
			temp.value = 20;
			temp.x = 12;
			temp.y = 101;
			return temp;
		}

		private function track_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			track = temp;
			temp.name = "track";
			temp.styleName = "ui/component/progress/skin_jindu2/thumb.png";
			temp.width = 429;
			temp.x = 67;
			temp.y = 12;
			return temp;
		}

		private function ui_huanhua_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_huanhua = temp;
			temp.name = "ui_huanhua";
			temp.styleName = "ui/app/zhanhun/yihuanhua.png";
			temp.x = 62;
			temp.y = 8;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zdl2.png";
			temp.x = -16;
			temp.y = -3;
			return temp;
		}

		private function zhanhunName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			zhanhunName = temp;
			temp.name = "zhanhunName";
			temp.styleName = "ui/app/zhanhun/modename/1.png";
			temp.x = 593;
			temp.y = 80;
			return temp;
		}

	}
}