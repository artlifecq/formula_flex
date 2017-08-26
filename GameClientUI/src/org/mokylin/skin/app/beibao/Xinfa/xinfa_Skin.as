package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipDengji;
	import org.mokylin.skin.app.beibao.jingmai.Pro_JinMai_ZQ;
	import org.mokylin.skin.component.button.ButtonSkin_info;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou2;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_you;
	import org.mokylin.skin.component.button.ButtonSkin_zuo;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class xinfa_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Bg:feathers.controls.UIAsset;

		public var NumZhanli:feathers.controls.UINumber;

		public var btnClose:feathers.controls.Button;

		public var btnGroup:feathers.controls.SkinnableContainer;

		public var btnOpen:feathers.controls.Button;

		public var btn_hecheng:feathers.controls.Button;

		public var btn_jihuo:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var grid_1:feathers.controls.UIAsset;

		public var grid_2:feathers.controls.UIAsset;

		public var grid_3:feathers.controls.UIAsset;

		public var grid_item_1:feathers.controls.UIAsset;

		public var grpCenter:feathers.controls.Group;

		public var grpFoot:feathers.controls.Group;

		public var grpName:feathers.controls.Group;

		public var grpTop:feathers.controls.Group;

		public var grpXueWei:feathers.controls.Group;

		public var grpZhanli:feathers.controls.Group;

		public var grpZhenqi:feathers.controls.Group;

		public var imgLevelBg:feathers.controls.UIAsset;

		public var imgSkill:feathers.controls.UIAsset;

		public var lab_Skill:feathers.controls.Label;

		public var lbBJ:feathers.controls.Label;

		public var lbBS:feathers.controls.Label;

		public var lbCailiao:feathers.controls.Label;

		public var lbFY:feathers.controls.Label;

		public var lbGJ:feathers.controls.Label;

		public var lbJihuo:feathers.controls.Label;

		public var lbMZ:feathers.controls.Label;

		public var lbQX:feathers.controls.Label;

		public var lbSB:feathers.controls.Label;

		public var lbSF:feathers.controls.Label;

		public var lb_zhenqi:feathers.controls.Label;

		public var mc_Level:feathers.controls.UIMovieClip;

		public var proZhenqi:feathers.controls.ProgressBar;

		public var uiMapCon:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function xinfa_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 1013;
			this.elementsContent = [Bg_i(),grpZhanli_i(),__xinfa_Skin_UIAsset2_i(),grpZhenqi_i(),btn_jihuo_i(),btn_hecheng_i(),lbCailiao_i(),btn_shuoming_i(),btn_prev_i(),btnGroup_i(),btn_next_i(),grpTop_i(),grpCenter_i(),grpFoot_i(),grpName_i(),btnClose_i(),btnOpen_i(),__xinfa_Skin_Label1_i(),uiMapCon_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Bg = temp;
			temp.name = "Bg";
			temp.styleName = "ui/big_bg/beibao/xinfa/bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -15;
			temp.height = 40;
			temp.label = "62984567";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.textAlign = "left";
			temp.width = 167;
			temp.x = 77;
			temp.y = 3;
			return temp;
		}

		private function __xinfa_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__xinfa_Skin_UIAsset16_i(),__xinfa_Skin_UIAsset17_i(),__xinfa_Skin_UIAsset18_i()];
			return temp;
		}

		private function __xinfa_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__xinfa_Skin_UIAsset19_i(),__xinfa_Skin_UIAsset20_i(),__xinfa_Skin_UIAsset21_i()];
			return temp;
		}

		private function __xinfa_Skin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__xinfa_Skin_UIAsset23_i(),__xinfa_Skin_UIAsset24_i(),__xinfa_Skin_UIAsset25_i()];
			return temp;
		}

		private function __xinfa_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "显示加成总属性";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 773;
			temp.y = 98;
			return temp;
		}

		private function __xinfa_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/mz.png";
			temp.x = 12;
			temp.y = 60;
			return temp;
		}

		private function __xinfa_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/fyz.png";
			temp.x = 12;
			temp.y = 89;
			return temp;
		}

		private function __xinfa_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/qx.png";
			temp.x = 135;
			temp.y = 2;
			return temp;
		}

		private function __xinfa_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/sb.png";
			temp.x = 135;
			temp.y = 31;
			return temp;
		}

		private function __xinfa_Skin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/bjz.png";
			temp.x = 135;
			temp.y = 60;
			return temp;
		}

		private function __xinfa_Skin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/bjjc.png";
			temp.x = 135;
			temp.y = 89;
			return temp;
		}

		private function __xinfa_Skin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/xinfajiachengshuxing.png";
			temp.x = 72;
			temp.y = 0;
			return temp;
		}

		private function __xinfa_Skin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __xinfa_Skin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 6;
			return temp;
		}

		private function __xinfa_Skin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/xiangshengxinfa.png";
			temp.x = 84;
			temp.y = 0;
			return temp;
		}

		private function __xinfa_Skin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __xinfa_Skin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 6;
			return temp;
		}

		private function __xinfa_Skin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/wenzidi.png";
			temp.x = 15;
			temp.y = 25;
			return temp;
		}

		private function __xinfa_Skin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/xinfajineng.png";
			temp.x = 84;
			temp.y = 0;
			return temp;
		}

		private function __xinfa_Skin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __xinfa_Skin_UIAsset25_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 6;
			return temp;
		}

		private function __xinfa_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/zqz.png";
			temp.x = 36;
			temp.y = 56;
			return temp;
		}

		private function __xinfa_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/scrollbar/jdt2.png";
			temp.width = 243;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __xinfa_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __xinfa_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function __xinfa_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 58;
			return temp;
		}

		private function __xinfa_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 87;
			return temp;
		}

		private function __xinfa_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/sf.png";
			temp.x = 12;
			temp.y = 2;
			return temp;
		}

		private function __xinfa_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/gjl.png";
			temp.x = 12;
			temp.y = 31;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuo;
			temp.x = 877;
			temp.y = 96;
			return temp;
		}

		private function btnGroup_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btnGroup = temp;
			temp.name = "btnGroup";
			temp.height = 354;
			temp.width = 203;
			temp.x = 26;
			temp.y = 125;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_you;
			temp.x = 877;
			temp.y = 96;
			return temp;
		}

		private function btn_hecheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "砭石合成";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 430;
			temp.y = 476;
			return temp;
		}

		private function btn_jihuo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jihuo = temp;
			temp.name = "btn_jihuo";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "激  活";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 430;
			temp.y = 476;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.rotation = 0;
			temp.scaleY = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 104;
			temp.y = 518;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.rotation = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 104;
			temp.y = 99;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_info;
			temp.x = 901;
			temp.y = 96;
			return temp;
		}

		private function grid_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_1 = temp;
			temp.name = "grid_1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 46;
			temp.y = 25;
			return temp;
		}

		private function grid_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_2 = temp;
			temp.name = "grid_2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 98;
			temp.y = 25;
			return temp;
		}

		private function grid_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_3 = temp;
			temp.name = "grid_3";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 150;
			temp.y = 25;
			return temp;
		}

		private function grid_item_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_item_1 = temp;
			temp.name = "grid_item_1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 14;
			temp.y = 51;
			return temp;
		}

		private function grpCenter_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpCenter = temp;
			temp.name = "grpCenter";
			temp.x = 693;
			temp.y = 341;
			temp.elementsContent = [grid_1_i(),grid_2_i(),grid_3_i(),__xinfa_Skin_Group2_i()];
			return temp;
		}

		private function grpFoot_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFoot = temp;
			temp.name = "grpFoot";
			temp.x = 693;
			temp.y = 424;
			temp.elementsContent = [__xinfa_Skin_UIAsset22_i(),imgSkill_i(),grid_item_1_i(),__xinfa_Skin_Group3_i(),lbJihuo_i(),lab_Skill_i()];
			return temp;
		}

		private function grpName_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpName = temp;
			temp.name = "grpName";
			temp.x = 239;
			temp.y = 121;
			temp.elementsContent = [imgLevelBg_i(),mc_Level_i(),uiName_i()];
			return temp;
		}

		private function grpTop_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTop = temp;
			temp.name = "grpTop";
			temp.x = 693;
			temp.y = 184;
			temp.elementsContent = [grpXueWei_i(),__xinfa_Skin_Group1_i()];
			return temp;
		}

		private function grpXueWei_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpXueWei = temp;
			temp.name = "grpXueWei";
			temp.x = 5;
			temp.y = 26;
			temp.elementsContent = [__xinfa_Skin_UIAsset4_i(),__xinfa_Skin_UIAsset5_i(),__xinfa_Skin_UIAsset6_i(),__xinfa_Skin_UIAsset7_i(),__xinfa_Skin_UIAsset8_i(),lbSF_i(),lbGJ_i(),lbMZ_i(),lbFY_i(),lbQX_i(),lbSB_i(),lbBJ_i(),lbBS_i(),__xinfa_Skin_UIAsset9_i(),__xinfa_Skin_UIAsset10_i(),__xinfa_Skin_UIAsset11_i(),__xinfa_Skin_UIAsset12_i(),__xinfa_Skin_UIAsset13_i(),__xinfa_Skin_UIAsset14_i(),__xinfa_Skin_UIAsset15_i()];
			return temp;
		}

		private function grpZhanli_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhanli = temp;
			temp.name = "grpZhanli";
			temp.x = 695;
			temp.y = 126;
			temp.elementsContent = [ui_zhandou_i(),NumZhanli_i()];
			return temp;
		}

		private function grpZhenqi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhenqi = temp;
			temp.name = "grpZhenqi";
			temp.x = 83;
			temp.y = 57;
			temp.elementsContent = [__xinfa_Skin_UIAsset3_i(),proZhenqi_i(),lb_zhenqi_i()];
			return temp;
		}

		private function imgLevelBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLevelBg = temp;
			temp.name = "imgLevelBg";
			temp.styleName = "ui/app/beibao/xinfa/pomo.png";
			temp.x = 0;
			temp.y = 9;
			return temp;
		}

		private function imgSkill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSkill = temp;
			temp.name = "imgSkill";
			temp.styleName = "ui/app/beibao/xinfa/buff/tiaohe.png";
			temp.x = 17;
			temp.y = 25;
			return temp;
		}

		private function lab_Skill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_Skill = temp;
			temp.name = "lab_Skill";
			temp.height = 61;
			temp.htmlText = "攻击敌方单位时，造成伤害提升<font color='#00ff33'>6%</font>且伤害的<font color='#00ff33'>3%</font>转化为生命值";
			temp.leading = 4;
			temp.letterSpacing = -1;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 178;
			temp.x = 62;
			temp.y = 48;
			return temp;
		}

		private function lbBJ_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBJ = temp;
			temp.name = "lbBJ";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 179;
			temp.y = 61;
			return temp;
		}

		private function lbBS_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBS = temp;
			temp.name = "lbBS";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 179;
			temp.y = 90;
			return temp;
		}

		private function lbCailiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCailiao = temp;
			temp.name = "lbCailiao";
			temp.text = "收集3/25个龙象心法残页";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 349;
			temp.x = 311;
			temp.y = 445;
			return temp;
		}

		private function lbFY_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbFY = temp;
			temp.name = "lbFY";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 56;
			temp.y = 90;
			return temp;
		}

		private function lbGJ_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGJ = temp;
			temp.name = "lbGJ";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 56;
			temp.y = 32;
			return temp;
		}

		private function lbJihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJihuo = temp;
			temp.name = "lbJihuo";
			temp.text = "【未激活】";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 168;
			temp.y = 27;
			return temp;
		}

		private function lbMZ_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMZ = temp;
			temp.name = "lbMZ";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 56;
			temp.y = 61;
			return temp;
		}

		private function lbQX_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbQX = temp;
			temp.name = "lbQX";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 179;
			temp.y = 3;
			return temp;
		}

		private function lbSB_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSB = temp;
			temp.name = "lbSB";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 179;
			temp.y = 32;
			return temp;
		}

		private function lbSF_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSF = temp;
			temp.name = "lbSF";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 56;
			temp.y = 3;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.text = "6215/4550";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 186;
			temp.x = 25;
			temp.y = 0;
			return temp;
		}

		private function mc_Level_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_Level = temp;
			temp.name = "mc_Level";
			temp.autoPlay = false;
			temp.height = 41;
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipDengji;
			temp.width = 21;
			temp.x = 68;
			temp.y = 0;
			return temp;
		}

		private function proZhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			proZhenqi = temp;
			temp.name = "proZhenqi";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.Pro_JinMai_ZQ;
			temp.value = 70;
			temp.width = 229;
			temp.x = 7;
			temp.y = 4;
			return temp;
		}

		private function uiMapCon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiMapCon = temp;
			temp.name = "uiMapCon";
			temp.height = 10;
			temp.width = 10;
			temp.x = 479;
			temp.y = 280;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/beibao/xinfa/mingzi2/1.png";
			temp.x = 21;
			temp.y = 7;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/art_txt/common/zhandouli1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}