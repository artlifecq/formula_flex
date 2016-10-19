package org.mokylin.skin.app.spell
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace1;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace2;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace3;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace4;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace5;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace6;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace7;
	import org.mokylin.skin.app.spell.radio.RadioButtonRace8;
	import org.mokylin.skin.component.button.ButtonSkin_red_3;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_spell_s_left;
	import org.mokylin.skin.component.button.ButtonV3_spell_s_right;
	import org.mokylin.skin.component.tabbar.TabBarV3_spellBtn_1;
	import org.mokylin.skin.component.tabbar.TabBarV3_spellBtn_2;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SpellPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnChangeSpell:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnRace1:feathers.controls.Radio;

		public var btnRace2:feathers.controls.Radio;

		public var btnRace3:feathers.controls.Radio;

		public var btnRace4:feathers.controls.Radio;

		public var btnRace5:feathers.controls.Radio;

		public var btnRace6:feathers.controls.Radio;

		public var btnRace7:feathers.controls.Radio;

		public var btnRace8:feathers.controls.Radio;

		public var groupButtom:feathers.controls.Group;

		public var groupMiddle:feathers.controls.Group;

		public var groupTop:feathers.controls.Group;

		public var groupbtn:feathers.controls.Group;

		public var imgBg1:feathers.controls.UIAsset;

		public var imgBg2:feathers.controls.UIAsset;

		public var imgMain:feathers.controls.UIAsset;

		public var imgOpen:feathers.controls.UIAsset;

		public var imgRace:feathers.controls.UIAsset;

		public var imgSecond:feathers.controls.UIAsset;

		public var labCurRaceSpellTypeAllPoint:feathers.controls.Label;

		public var labSpellAll:feathers.controls.Label;

		public var labSpellPoint:feathers.controls.Label;

		public var labWebURL:feathers.controls.Label;

		public var left:feathers.controls.Button;

		public var maskGroup:feathers.controls.Group;

		public var rece1:feathers.controls.Group;

		public var rece2:feathers.controls.Group;

		public var rece3:feathers.controls.Group;

		public var rece4:feathers.controls.Group;

		public var rece5:feathers.controls.Group;

		public var rece6:feathers.controls.Group;

		public var rece7:feathers.controls.Group;

		public var rece8:feathers.controls.Group;

		public var right:feathers.controls.Button;

		public var scrollBar1:feathers.controls.ScrollContainer;

		public var scrollBar2:feathers.controls.ScrollContainer;

		public var tabBar1:feathers.controls.TabBar;

		public var tabBar2:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SpellPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 627;
			this.width = 715;
			this.elementsContent = [__SpellPanelSkin_UIAsset1_i(),__SpellPanelSkin_UIAsset2_i(),btnClose_i(),__SpellPanelSkin_UIAsset3_i(),__SpellPanelSkin_UIAsset4_i(),groupTop_i(),groupMiddle_i(),groupButtom_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SpellPanelSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['重剑'];
			return temp;
		}

		private function __SpellPanelSkin_ArrayCollection2_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['刺杀','影遁'];
			return temp;
		}

		private function __SpellPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 0;
			return temp;
		}

		private function __SpellPanelSkin_HorizontalLayout2_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 3;
			return temp;
		}

		private function __SpellPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "50级之前可免费洗点";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 115;
			temp.y = 387;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/gong.png";
			temp.x = 27;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/fu.png";
			temp.x = 28;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/qi_ta.png";
			temp.x = 26;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/spell.png";
			temp.x = -1;
			temp.y = 2;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/spell.png";
			temp.x = 336;
			temp.y = 2;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 381;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/D_di/kuang.png";
			temp.width = 677;
			temp.x = 1;
			temp.y = -2;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 65;
			temp.styleName = "ui/common/version_3/D_di/di.png";
			temp.width = 693;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 628;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 712;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 680;
			temp.x = 23;
			temp.y = 4;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/spell/char/ji_neng.png";
			temp.x = 342;
			temp.y = 6;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 520;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_4.png";
			temp.width = 687;
			temp.x = 12;
			temp.y = 40;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/jian.png";
			temp.x = 27;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/dao.png";
			temp.x = 28;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/qiang.png";
			temp.x = 28;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/shan.png";
			temp.x = 28;
			temp.y = 70;
			return temp;
		}

		private function __SpellPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/spell/char/zhang.png";
			temp.x = 28;
			temp.y = 70;
			return temp;
		}

		private function btnChangeSpell_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChangeSpell = temp;
			temp.name = "btnChangeSpell";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "洗点";
			temp.leading = 2;
			temp.letterSpacing = 5;
			temp.fontSize = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_red_3);
			temp.color = 0xF9F0CC;
			temp.width = 150;
			temp.x = 440;
			temp.y = 15;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 685;
			temp.y = 0;
			return temp;
		}

		private function btnRace1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace1 = temp;
			temp.name = "btnRace1";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace1);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace2 = temp;
			temp.name = "btnRace2";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace2);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace3_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace3 = temp;
			temp.name = "btnRace3";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace3);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace4_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace4 = temp;
			temp.name = "btnRace4";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace4);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace5_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace5 = temp;
			temp.name = "btnRace5";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace5);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace6_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace6 = temp;
			temp.name = "btnRace6";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace6);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace7_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace7 = temp;
			temp.name = "btnRace7";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace7);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnRace8_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnRace8 = temp;
			temp.name = "btnRace8";
			temp.groupName = "spellPanel_groupBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.spell.radio.RadioButtonRace8);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function groupButtom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupButtom = temp;
			temp.name = "groupButtom";
			temp.x = 10;
			temp.y = 554;
			temp.elementsContent = [__SpellPanelSkin_UIAsset16_i(),labSpellPoint_i(),labSpellAll_i(),imgMain_i(),imgSecond_i(),btnChangeSpell_i()];
			return temp;
		}

		private function groupMiddle_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupMiddle = temp;
			temp.name = "groupMiddle";
			temp.height = 415;
			temp.x = 16;
			temp.y = 140;
			temp.elementsContent = [__SpellPanelSkin_UIAsset13_i(),__SpellPanelSkin_UIAsset14_i(),scrollBar1_i(),labCurRaceSpellTypeAllPoint_i(),imgBg1_i(),scrollBar2_i(),imgBg2_i(),__SpellPanelSkin_Label1_i(),labWebURL_i(),tabBar1_i(),tabBar2_i(),maskGroup_i(),__SpellPanelSkin_UIAsset15_i(),imgOpen_i()];
			return temp;
		}

		private function groupTop_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupTop = temp;
			temp.name = "groupTop";
			temp.height = 98;
			temp.x = 10;
			temp.y = 41;
			temp.elementsContent = [imgRace_i(),left_i(),right_i(),groupbtn_i()];
			return temp;
		}

		private function groupbtn_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupbtn = temp;
			temp.name = "groupbtn";
			temp.height = 92;
			temp.width = 650;
			temp.x = 8;
			temp.y = 5;
			temp.elementsContent = [rece1_i(),rece2_i(),rece3_i(),rece4_i(),rece5_i(),rece6_i(),rece7_i(),rece8_i()];
			return temp;
		}

		private function imgBg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg1 = temp;
			temp.name = "imgBg1";
			return temp;
		}

		private function imgBg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg2 = temp;
			temp.name = "imgBg2";
			temp.x = 345;
			temp.y = 47;
			return temp;
		}

		private function imgMain_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMain = temp;
			temp.name = "imgMain";
			temp.styleName = "ui/app/spell/zhu_shuxing.png";
			temp.x = 350;
			temp.y = 6;
			return temp;
		}

		private function imgOpen_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgOpen = temp;
			temp.name = "imgOpen";
			temp.styleName = "ui/app/spell/char/kai_qi.png";
			temp.x = 400;
			temp.y = 115;
			return temp;
		}

		private function imgRace_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgRace = temp;
			temp.name = "imgRace";
			temp.height = 92;
			temp.styleName = "ui/app/spell/raceChar/2.png";
			temp.width = 680;
			temp.x = 4;
			temp.y = 3;
			return temp;
		}

		private function imgSecond_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgSecond = temp;
			temp.name = "imgSecond";
			temp.styleName = "ui/app/spell/ci_shuxing.png";
			temp.x = 516;
			temp.y = 6;
			return temp;
		}

		private function labCurRaceSpellTypeAllPoint_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCurRaceSpellTypeAllPoint = temp;
			temp.name = "labCurRaceSpellTypeAllPoint";
			temp.bold = false;
			temp.height = 18;
			temp.color = 0xDDDABA;
			temp.width = 287;
			temp.x = 7;
			temp.y = 341;
			return temp;
		}

		private function labSpellAll_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpellAll = temp;
			temp.name = "labSpellAll";
			temp.bold = true;
			temp.text = "前提点数之和：0";
			temp.color = 0xDDDABA;
			temp.width = 150;
			temp.x = 137;
			temp.y = 39;
			return temp;
		}

		private function labSpellPoint_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSpellPoint = temp;
			temp.name = "labSpellPoint";
			temp.bold = true;
			temp.text = "技能点数：0";
			temp.color = 0xDDDABA;
			temp.width = 150;
			temp.x = 135;
			temp.y = 13;
			return temp;
		}

		private function labWebURL_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labWebURL = temp;
			temp.name = "labWebURL";
			temp.bold = false;
			temp.fontSize = 16;
			temp.text = "去官网查看技能加点攻略";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.x = 438;
			temp.y = 386;
			return temp;
		}

		private function left_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			left = temp;
			temp.name = "left";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_spell_s_left);
			temp.x = 656;
			temp.y = 28;
			return temp;
		}

		private function maskGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			maskGroup = temp;
			temp.name = "maskGroup";
			temp.height = 357;
			temp.width = 329;
			temp.x = 341;
			temp.y = 8;
			return temp;
		}

		private function rece1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece1 = temp;
			temp.name = "rece1";
			temp.height = 92;
			temp.width = 85;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [btnRace1_i(),__SpellPanelSkin_UIAsset5_i()];
			return temp;
		}

		private function rece2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece2 = temp;
			temp.name = "rece2";
			temp.height = 92;
			temp.width = 85;
			temp.x = 80;
			temp.y = 0;
			temp.elementsContent = [btnRace2_i(),__SpellPanelSkin_UIAsset6_i()];
			return temp;
		}

		private function rece3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece3 = temp;
			temp.name = "rece3";
			temp.height = 92;
			temp.width = 85;
			temp.x = 160;
			temp.y = 0;
			temp.elementsContent = [btnRace3_i(),__SpellPanelSkin_UIAsset7_i()];
			return temp;
		}

		private function rece4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece4 = temp;
			temp.name = "rece4";
			temp.height = 92;
			temp.width = 85;
			temp.x = 240;
			temp.y = 0;
			temp.elementsContent = [btnRace4_i(),__SpellPanelSkin_UIAsset8_i()];
			return temp;
		}

		private function rece5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece5 = temp;
			temp.name = "rece5";
			temp.height = 92;
			temp.width = 85;
			temp.x = 320;
			temp.y = 0;
			temp.elementsContent = [btnRace5_i(),__SpellPanelSkin_UIAsset9_i()];
			return temp;
		}

		private function rece6_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece6 = temp;
			temp.name = "rece6";
			temp.height = 92;
			temp.width = 85;
			temp.x = 400;
			temp.y = 0;
			temp.elementsContent = [btnRace6_i(),__SpellPanelSkin_UIAsset10_i()];
			return temp;
		}

		private function rece7_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece7 = temp;
			temp.name = "rece7";
			temp.height = 92;
			temp.width = 85;
			temp.x = 480;
			temp.y = 0;
			temp.elementsContent = [btnRace7_i(),__SpellPanelSkin_UIAsset11_i()];
			return temp;
		}

		private function rece8_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			rece8 = temp;
			temp.name = "rece8";
			temp.height = 92;
			temp.width = 85;
			temp.x = 560;
			temp.y = 0;
			temp.elementsContent = [btnRace8_i(),__SpellPanelSkin_UIAsset12_i()];
			return temp;
		}

		private function right_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			right = temp;
			temp.name = "right";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_spell_s_right);
			temp.x = 656;
			temp.y = 28;
			return temp;
		}

		private function scrollBar1_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollBar1 = temp;
			temp.name = "scrollBar1";
			temp.height = 315;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 321;
			temp.x = 7;
			temp.y = 45;
			return temp;
		}

		private function scrollBar2_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollBar2 = temp;
			temp.name = "scrollBar2";
			temp.height = 315;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 324;
			temp.x = 344;
			temp.y = 45;
			return temp;
		}

		private function tabBar1_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar1 = temp;
			temp.name = "tabBar1";
			temp.btnWidth = 333;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarV3_spellBtn_2);
			temp.width = 330;
			temp.x = 3;
			temp.y = 11;
			temp.layout = __SpellPanelSkin_HorizontalLayout1_i();
			temp.dataProvider = __SpellPanelSkin_ArrayCollection1_i();
			return temp;
		}

		private function tabBar2_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabBar2 = temp;
			temp.name = "tabBar2";
			temp.btnWidth = 163;
			temp.height = 41;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.tabbar.TabBarV3_spellBtn_1);
			temp.width = 330;
			temp.x = 344;
			temp.y = 12;
			temp.layout = __SpellPanelSkin_HorizontalLayout2_i();
			temp.dataProvider = __SpellPanelSkin_ArrayCollection2_i();
			return temp;
		}

	}
}