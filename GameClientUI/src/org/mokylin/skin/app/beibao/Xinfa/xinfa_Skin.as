package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.Xinfa.btnGruop_Skin;
	import org.mokylin.skin.app.beibao.Xinfa.button.ButtonJihuo;
	import org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipDengji;
	import org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipMingcheng;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonJiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli;

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

		public var Num_zhandouli:feathers.controls.UINumber;

		public var btnGroup:feathers.controls.SkinnableContainer;

		public var btn_hecheng:feathers.controls.Button;

		public var btn_jihuo:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var grid_1:feathers.controls.UIAsset;

		public var grid_2:feathers.controls.UIAsset;

		public var grid_3:feathers.controls.UIAsset;

		public var grid_item_1:feathers.controls.UIAsset;

		public var imgFight:feathers.controls.UIAsset;

		public var imgLevelBg:feathers.controls.UIAsset;

		public var imgSkill:feathers.controls.UIAsset;

		public var imgYuan:feathers.controls.UIAsset;

		public var lab_Content:feathers.controls.Label;

		public var lab_Skill:feathers.controls.Label;

		public var lab_Weijihuo:feathers.controls.Label;

		public var lab_jiangli:feathers.controls.Label;

		public var lab_shuxing:feathers.controls.Label;

		public var mc_Level:feathers.controls.UIMovieClip;

		public var mc_Name:feathers.controls.UIMovieClip;

		public var num_xinfazhanli:feathers.controls.Label;

		public var num_zhenqi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function xinfa_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 1013;
			this.elementsContent = [Bg_i(),imgYuan_i(),__xinfa_Skin_UIAsset1_i(),__xinfa_Skin_UIAsset2_i(),lab_Weijihuo_i(),lab_jiangli_i(),lab_Skill_i(),lab_shuxing_i(),__xinfa_Skin_UIAsset3_i(),__xinfa_Skin_UIAsset4_i(),__xinfa_Skin_UIAsset5_i(),__xinfa_Skin_UIAsset6_i(),__xinfa_Skin_UIAsset7_i(),imgSkill_i(),__xinfa_Skin_UIAsset8_i(),imgFight_i(),imgLevelBg_i(),mc_Level_i(),__xinfa_Skin_UIAsset9_i(),Num_zhandouli_i(),num_xinfazhanli_i(),grid_1_i(),grid_2_i(),grid_3_i(),__xinfa_Skin_UIAsset10_i(),num_zhenqi_i(),btn_hecheng_i(),grid_item_1_i(),btn_jihuo_i(),btn_shuoming_i(),btn_prev_i(),btnGroup_i(),btn_next_i(),lab_Content_i(),mc_Name_i()];
			
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
			temp.styleName = "ui/big_bg/beibao/jingmai/bg.jpg";
			temp.x = 20;
			temp.y = 74;
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
			temp.x = 80;
			temp.y = 82;
			return temp;
		}

		private function __xinfa_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/zhenqi.png";
			temp.x = 26;
			temp.y = 41;
			return temp;
		}

		private function __xinfa_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/shuxingbg.jpg";
			temp.x = 767;
			temp.y = 74;
			return temp;
		}

		private function __xinfa_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/wenzidi3.png";
			temp.x = 140;
			temp.y = 467;
			return temp;
		}

		private function __xinfa_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/wenzidi2.png";
			temp.x = 773;
			temp.y = 380;
			return temp;
		}

		private function __xinfa_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/wenzidi2.png";
			temp.x = 773;
			temp.y = 195;
			return temp;
		}

		private function __xinfa_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/jihuojiangli.png";
			temp.x = 776;
			temp.y = 383;
			return temp;
		}

		private function __xinfa_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/shengjixinfa.png";
			temp.x = 776;
			temp.y = 198;
			return temp;
		}

		private function __xinfa_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/wenzidi.png";
			temp.x = 274;
			temp.y = 475;
			return temp;
		}

		private function __xinfa_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/xinfa/xiangsheng.png";
			temp.x = 634;
			temp.y = 79;
			return temp;
		}

		private function __xinfa_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 27;
			temp.y = 84;
			return temp;
		}

		private function btnGroup_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btnGroup = temp;
			temp.name = "btnGroup";
			temp.height = 302;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.Xinfa.btnGruop_Skin()
			temp.skin = skin
			temp.width = 111;
			temp.x = 27;
			temp.y = 160;
			return temp;
		}

		private function btn_hecheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "砭石合成";
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 75;
			temp.x = 809;
			temp.y = 477;
			return temp;
		}

		private function btn_jihuo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jihuo = temp;
			temp.name = "btn_jihuo";
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.button.ButtonJihuo;
			temp.x = 396;
			temp.y = 430;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.rotation = 1.5707963267948966;
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonJiantou;
			temp.x = 110;
			temp.y = 510;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.rotation = 1.5707963267948966;
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonJiantou;
			temp.x = 109;
			temp.y = 121;
			return temp;
		}

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 732;
			temp.y = 437;
			return temp;
		}

		private function grid_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_1 = temp;
			temp.name = "grid_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 624;
			temp.y = 93;
			return temp;
		}

		private function grid_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_2 = temp;
			temp.name = "grid_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 666;
			temp.y = 93;
			return temp;
		}

		private function grid_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_3 = temp;
			temp.name = "grid_3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/36.png";
			temp.x = 708;
			temp.y = 93;
			return temp;
		}

		private function grid_item_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid_item_1 = temp;
			temp.name = "grid_item_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 216;
			temp.y = 467;
			return temp;
		}

		private function imgFight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgFight = temp;
			temp.name = "imgFight";
			temp.styleName = "ui/app/beibao/xinfa/xinfazhandouli.png";
			temp.x = 775;
			temp.y = 155;
			return temp;
		}

		private function imgLevelBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgLevelBg = temp;
			temp.name = "imgLevelBg";
			temp.styleName = "ui/app/beibao/xinfa/yinzhang.png";
			temp.x = 894;
			temp.y = 83;
			return temp;
		}

		private function imgSkill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSkill = temp;
			temp.name = "imgSkill";
			temp.styleName = "ui/app/beibao/xinfa/tiaohe.png";
			temp.x = 273;
			temp.y = 475;
			return temp;
		}

		private function imgYuan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgYuan = temp;
			temp.name = "imgYuan";
			temp.height = 431;
			temp.styleName = "ui/big_bg/beibao/jingmai/bg2.png";
			temp.width = 493;
			temp.x = 200;
			temp.y = 70;
			return temp;
		}

		private function lab_Content_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_Content = temp;
			temp.name = "lab_Content";
			temp.letterSpacing = -1;
			temp.text = "攻击：";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 229;
			temp.x = 341;
			temp.y = 437;
			return temp;
		}

		private function lab_Skill_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_Skill = temp;
			temp.name = "lab_Skill";
			temp.letterSpacing = -1;
			temp.text = "攻击：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 489;
			temp.x = 272;
			temp.y = 497;
			return temp;
		}

		private function lab_Weijihuo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_Weijihuo = temp;
			temp.name = "lab_Weijihuo";
			temp.letterSpacing = -1;
			temp.text = "未激活";
			temp.textAlign = "center";
			temp.color = 0xE1201C;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 133;
			temp.x = 781;
			temp.y = 173;
			return temp;
		}

		private function lab_jiangli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_jiangli = temp;
			temp.name = "lab_jiangli";
			temp.letterSpacing = -1;
			temp.text = "攻击：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 128;
			temp.x = 777;
			temp.y = 405;
			return temp;
		}

		private function lab_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_shuxing = temp;
			temp.name = "lab_shuxing";
			temp.letterSpacing = -1;
			temp.text = "攻击：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 133;
			temp.x = 777;
			temp.y = 223;
			return temp;
		}

		private function mc_Level_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_Level = temp;
			temp.name = "mc_Level";
			temp.height = 51;
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipDengji;
			temp.width = 20;
			temp.x = 897;
			temp.y = 89;
			return temp;
		}

		private function mc_Name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_Name = temp;
			temp.name = "mc_Name";
			temp.autoPlay = false;
			temp.height = 38;
			temp.styleClass = org.mokylin.skin.app.beibao.Xinfa.mc.UIMovieClipMingcheng;
			temp.width = 70;
			temp.x = 811;
			temp.y = 94;
			return temp;
		}

		private function num_xinfazhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			num_xinfazhanli = temp;
			temp.name = "num_xinfazhanli";
			temp.text = "0123456789";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 845;
			temp.y = 152;
			return temp;
		}

		private function num_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			num_zhenqi = temp;
			temp.name = "num_zhenqi";
			temp.text = "62154550";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 68;
			temp.y = 43;
			return temp;
		}

	}
}