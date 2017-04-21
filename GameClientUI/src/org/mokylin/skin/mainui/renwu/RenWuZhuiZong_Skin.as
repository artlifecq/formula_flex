package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
	import org.mokylin.skin.mainui.renwu.RenWu_jindu;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenWuZhuiZong_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var but_openBg:feathers.controls.UIAsset;

		public var pri_ico0:feathers.controls.UIAsset;

		public var pri_ico1:feathers.controls.UIAsset;

		public var pri_ico2:feathers.controls.UIAsset;

		public var pri_ico3:feathers.controls.UIAsset;

		public var pri_ico4:feathers.controls.UIAsset;

		public var pri_ico5:feathers.controls.UIAsset;

		public var pri_killbut1:feathers.controls.SkinnableContainer;

		public var pri_killbut2:feathers.controls.SkinnableContainer;

		public var pri_killbut3:feathers.controls.SkinnableContainer;

		public var pri_navi1:feathers.controls.Label;

		public var pri_navi2:feathers.controls.Label;

		public var pri_navi3:feathers.controls.Label;

		public var pri_probar:feathers.controls.SkinnableContainer;

		public var pri_title:feathers.controls.Label;

		public var pri_txt:feathers.controls.Label;

		public var primary_box:feathers.controls.Group;

		public var scroll_bar:feathers.controls.ScrollContainer;

		public var scroll_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var sec_ico1_3:feathers.controls.UIAsset;

		public var sec_ico1_4:feathers.controls.UIAsset;

		public var sec_ico1_5:feathers.controls.UIAsset;

		public var sec_ico2_0:feathers.controls.UIAsset;

		public var sec_ico2_1:feathers.controls.UIAsset;

		public var sec_ico2_2:feathers.controls.UIAsset;

		public var sec_ico2_3:feathers.controls.UIAsset;

		public var sec_ico2_4:feathers.controls.UIAsset;

		public var sec_ico2_5:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_killbut1:feathers.controls.SkinnableContainer;

		public var sec_killbut2:feathers.controls.SkinnableContainer;

		public var sec_killbut3:feathers.controls.SkinnableContainer;

		public var sec_navi1:feathers.controls.Label;

		public var sec_navi2:feathers.controls.Label;

		public var sec_navi3:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_subbut2:feathers.controls.Button;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var task_effect:feathers.controls.Group;

		public var ui_head:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWuZhuiZong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 335;
			this.width = 253;
			this.elementsContent = [task_effect_i(),task_box_i(),but_openBg_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWuZhuiZong_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 335;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __RenWuZhuiZong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.visible = false;
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function but_openBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			but_openBg = temp;
			temp.name = "but_openBg";
			temp.styleName = "ui/mainui/renwu/rwzz_shu.png";
			temp.visible = false;
			temp.x = 234;
			temp.y = 7;
			return temp;
		}

		private function pri_ico0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico0 = temp;
			temp.name = "pri_ico0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 20;
			temp.y = 235;
			return temp;
		}

		private function pri_ico1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico1 = temp;
			temp.name = "pri_ico1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 74;
			temp.y = 235;
			return temp;
		}

		private function pri_ico2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico2 = temp;
			temp.name = "pri_ico2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 127;
			temp.y = 235;
			return temp;
		}

		private function pri_ico3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico3 = temp;
			temp.name = "pri_ico3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 20;
			temp.y = 286;
			return temp;
		}

		private function pri_ico4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico4 = temp;
			temp.name = "pri_ico4";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 74;
			temp.y = 286;
			return temp;
		}

		private function pri_ico5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico5 = temp;
			temp.name = "pri_ico5";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 127;
			temp.y = 286;
			return temp;
		}

		private function pri_killbut1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_killbut1 = temp;
			temp.name = "pri_killbut1";
			temp.height = 22;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 214;
			temp.x = 18;
			temp.y = 166;
			return temp;
		}

		private function pri_killbut2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_killbut2 = temp;
			temp.name = "pri_killbut2";
			temp.height = 22;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 214;
			temp.x = 18;
			temp.y = 189;
			return temp;
		}

		private function pri_killbut3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_killbut3 = temp;
			temp.name = "pri_killbut3";
			temp.height = 22;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 214;
			temp.x = 18;
			temp.y = 212;
			return temp;
		}

		private function pri_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_navi1 = temp;
			temp.name = "pri_navi1";
			temp.htmlText = "[章节任务]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 231;
			temp.x = 2;
			temp.y = 32;
			return temp;
		}

		private function pri_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_navi2 = temp;
			temp.name = "pri_navi2";
			temp.htmlText = "[任务描述]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 234;
			temp.x = 2;
			temp.y = 75;
			return temp;
		}

		private function pri_navi3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_navi3 = temp;
			temp.name = "pri_navi3";
			temp.htmlText = "[任务进度]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 217;
			temp.x = 2;
			temp.y = 148;
			return temp;
		}

		private function pri_probar_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_probar = temp;
			temp.name = "pri_probar";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWu_jindu()
			temp.skin = skin
			temp.width = 215;
			temp.x = 18;
			temp.y = 55;
			return temp;
		}

		private function pri_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_title = temp;
			temp.name = "pri_title";
			temp.fontSize = 16;
			temp.text = "第九十九章：名字六个字符";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 224;
			temp.x = 10;
			temp.y = 5;
			return temp;
		}

		private function pri_txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_txt = temp;
			temp.name = "pri_txt";
			temp.htmlText = "任务描述任务描述任务描述任务描述任务描述任务描述任务描述任务描述任务描述任务描述";
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 216;
			temp.x = 18;
			temp.y = 96;
			return temp;
		}

		private function primary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			primary_box = temp;
			temp.name = "primary_box";
			temp.height = 335;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [pri_title_i(),pri_navi1_i(),pri_probar_i(),pri_navi2_i(),pri_txt_i(),pri_navi3_i(),pri_killbut1_i(),pri_killbut2_i(),pri_killbut3_i(),pri_ico0_i(),pri_ico1_i(),pri_ico2_i(),pri_ico3_i(),pri_ico4_i(),pri_ico5_i()];
			return temp;
		}

		private function scroll_bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroll_bar = temp;
			temp.name = "scroll_bar";
			temp.height = 297;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
			temp.width = 250;
			temp.x = 0;
			temp.y = 34;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.width = 250;
			temp.x = 0;
			temp.y = 34;
			temp.elementsContent = [sec_navi1_i(),sec_killbut1_i(),sec_navi2_i(),sec_killbut2_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_ico1_3_i(),sec_ico1_4_i(),sec_ico1_5_i(),sec_subbut1_i(),sec_navi3_i(),sec_info_i(),sec_killbut3_i(),sec_ico2_0_i(),sec_ico2_1_i(),sec_ico2_2_i(),sec_ico2_3_i(),sec_ico2_4_i(),sec_ico2_5_i(),sec_subbut2_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 45;
			temp.y = 93;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 99;
			temp.y = 93;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 152;
			temp.y = 93;
			return temp;
		}

		private function sec_ico1_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_3 = temp;
			temp.name = "sec_ico1_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 45;
			temp.y = 146;
			return temp;
		}

		private function sec_ico1_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_4 = temp;
			temp.name = "sec_ico1_4";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 99;
			temp.y = 146;
			return temp;
		}

		private function sec_ico1_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_5 = temp;
			temp.name = "sec_ico1_5";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 152;
			temp.y = 146;
			return temp;
		}

		private function sec_ico2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_0 = temp;
			temp.name = "sec_ico2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 45;
			temp.y = 298;
			return temp;
		}

		private function sec_ico2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_1 = temp;
			temp.name = "sec_ico2_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 99;
			temp.y = 298;
			return temp;
		}

		private function sec_ico2_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_2 = temp;
			temp.name = "sec_ico2_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 152;
			temp.y = 298;
			return temp;
		}

		private function sec_ico2_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_3 = temp;
			temp.name = "sec_ico2_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 45;
			temp.y = 351;
			return temp;
		}

		private function sec_ico2_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_4 = temp;
			temp.name = "sec_ico2_4";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 99;
			temp.y = 351;
			return temp;
		}

		private function sec_ico2_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_5 = temp;
			temp.name = "sec_ico2_5";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 152;
			temp.y = 351;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.height = 18;
			temp.htmlText = "完成<font color='#ff0000'>99</font>环可获得额外奖励：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 177;
			temp.x = 47;
			temp.y = 313;
			return temp;
		}

		private function sec_killbut1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1 = temp;
			temp.name = "sec_killbut1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 44;
			temp.y = 17;
			return temp;
		}

		private function sec_killbut2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut2 = temp;
			temp.name = "sec_killbut2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 44;
			temp.y = 62;
			return temp;
		}

		private function sec_killbut3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut3 = temp;
			temp.name = "sec_killbut3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 44;
			temp.y = 255;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.htmlText = "[主线]第六章 嵩山问鼎<font color='#8b8d7b'>(未完成)</font>";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 1;
			temp.y = 0;
			return temp;
		}

		private function sec_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi2 = temp;
			temp.name = "sec_navi2";
			temp.htmlText = "[支线]战斗力提升<font color='#8b8d7b'>(未完成)</font>";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 1;
			temp.y = 45;
			return temp;
		}

		private function sec_navi3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi3 = temp;
			temp.name = "sec_navi3";
			temp.htmlText = "[环式]日常任务<font color='#ffffff'>(10/20)</font><font color='#8b8d7b'>(未完成)</font>";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 1;
			temp.y = 238;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 87;
			temp.y = 198;
			return temp;
		}

		private function sec_subbut2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut2 = temp;
			temp.name = "sec_subbut2";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 87;
			temp.y = 403;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.height = 335;
			temp.visible = false;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_head_i(),scroll_bar_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 335;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__RenWuZhuiZong_Skin_UIAsset1_i(),__RenWuZhuiZong_Skin_UIAsset2_i(),primary_box_i(),secondary_box_i()];
			return temp;
		}

		private function task_effect_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_effect = temp;
			temp.name = "task_effect";
			return temp;
		}

		private function ui_head_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_head = temp;
			temp.name = "ui_head";
			temp.styleName = "ui/mainui/renwu/rwzz.png";
			temp.x = 37;
			temp.y = 5;
			return temp;
		}

	}
}