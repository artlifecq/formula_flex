package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
	import org.mokylin.skin.mainui.renwu.RenWuTitle_Skin;
	import org.mokylin.skin.mainui.renwu.RenWu_jindu;
	import org.mokylin.skin.mainui.renwu.Renwu_Item;
	import org.mokylin.skin.mainui.renwu.button.ButtonJixurenwu;

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
		public var auto:feathers.controls.Group;

		public var auto1:feathers.controls.Group;

		public var btnContinue:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var but_openBg:feathers.controls.UIAsset;

		public var chkAuto:feathers.controls.Check;

		public var chkAuto1:feathers.controls.Check;

		public var lbInfo:feathers.controls.Label;

		public var pri_ico0:feathers.controls.UIAsset;

		public var pri_killbut_1:feathers.controls.SkinnableContainer;

		public var pri_killbut_2:feathers.controls.SkinnableContainer;

		public var pri_killbut_3:feathers.controls.SkinnableContainer;

		public var pri_navi0:feathers.controls.UIAsset;

		public var pri_navi1:feathers.controls.UIAsset;

		public var pri_navi1_txt:feathers.controls.Label;

		public var pri_navi2:feathers.controls.UIAsset;

		public var pri_navi3:feathers.controls.UIAsset;

		public var pri_probar:feathers.controls.SkinnableContainer;

		public var pri_txt:feathers.controls.Label;

		public var primary_box:feathers.controls.Group;

		public var scroll_bar:feathers.controls.ScrollContainer;

		public var scroll_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico2_0:feathers.controls.UIAsset;

		public var sec_ico3_0:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_killbut1_1:feathers.controls.SkinnableContainer;

		public var sec_killbut1_2:feathers.controls.SkinnableContainer;

		public var sec_killbut1_3:feathers.controls.SkinnableContainer;

		public var sec_killbut2_1:feathers.controls.SkinnableContainer;

		public var sec_killbut2_2:feathers.controls.SkinnableContainer;

		public var sec_killbut2_3:feathers.controls.SkinnableContainer;

		public var sec_killbut3_1:feathers.controls.SkinnableContainer;

		public var sec_killbut3_2:feathers.controls.SkinnableContainer;

		public var sec_killbut3_3:feathers.controls.SkinnableContainer;

		public var sec_killbut4_1:feathers.controls.SkinnableContainer;

		public var sec_killbut4_2:feathers.controls.SkinnableContainer;

		public var sec_killbut4_3:feathers.controls.SkinnableContainer;

		public var sec_navi1:feathers.controls.SkinnableContainer;

		public var sec_navi2:feathers.controls.SkinnableContainer;

		public var sec_navi3:feathers.controls.SkinnableContainer;

		public var sec_navi4:feathers.controls.SkinnableContainer;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_tuijian:feathers.controls.Label;

		public var sec_txt:feathers.controls.Label;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var task_effect:feathers.controls.Group;

		public var uibg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenWuZhuiZong_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 253;
			this.elementsContent = [task_effect_i(),task_box_i(),but_openBg_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenWuZhuiZong_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 24;
			temp.y = 2.5;
			return temp;
		}

		private function __RenWuZhuiZong_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "自动";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 24;
			temp.y = 2.5;
			return temp;
		}

		private function __RenWuZhuiZong_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 7;
			temp.y = 0;
			return temp;
		}

		private function __RenWuZhuiZong_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/mainui/renwu/renwuzhuizong.png";
			temp.x = 67;
			temp.y = 6;
			return temp;
		}

		private function auto1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			auto1 = temp;
			temp.name = "auto1";
			temp.x = 180;
			temp.y = 198;
			temp.elementsContent = [chkAuto1_i(),__RenWuZhuiZong_Skin_Label2_i()];
			return temp;
		}

		private function auto_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			auto = temp;
			temp.name = "auto";
			temp.visible = false;
			temp.x = 180;
			temp.y = 198;
			temp.elementsContent = [chkAuto_i(),__RenWuZhuiZong_Skin_Label1_i()];
			return temp;
		}

		private function btnContinue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnContinue = temp;
			temp.name = "btnContinue";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 49;
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.mainui.renwu.button.ButtonJixurenwu;
			temp.color = 0xEAEABC;
			temp.x = 46;
			temp.y = 331;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 227;
			temp.y = 8;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.visible = false;
			temp.x = 249;
			temp.y = 8;
			return temp;
		}

		private function but_openBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			but_openBg = temp;
			temp.name = "but_openBg";
			temp.styleName = "ui/mainui/renwu/rwzz_shu.png";
			temp.visible = false;
			temp.x = 229;
			temp.y = 8;
			return temp;
		}

		private function chkAuto1_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkAuto1 = temp;
			temp.name = "chkAuto1";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function chkAuto_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chkAuto = temp;
			temp.name = "chkAuto";
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo = temp;
			temp.name = "lbInfo";
			temp.text = "本任务需要60级开启";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.visible = false;
			temp.width = 206;
			temp.x = 12;
			temp.y = 24;
			return temp;
		}

		private function pri_ico0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_ico0 = temp;
			temp.name = "pri_ico0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 108;
			temp.y = 268;
			return temp;
		}

		private function pri_killbut_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_killbut_1 = temp;
			temp.name = "pri_killbut_1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 32;
			temp.y = 234;
			return temp;
		}

		private function pri_killbut_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_killbut_2 = temp;
			temp.name = "pri_killbut_2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 32;
			temp.y = 234;
			return temp;
		}

		private function pri_killbut_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_killbut_3 = temp;
			temp.name = "pri_killbut_3";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 32;
			temp.y = 234;
			return temp;
		}

		private function pri_navi0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_navi0 = temp;
			temp.name = "pri_navi0";
			temp.styleName = "ui/art_txt/mainui/renwu/renwumingchen.png";
			temp.x = 18;
			temp.y = 40;
			return temp;
		}

		private function pri_navi1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_navi1 = temp;
			temp.name = "pri_navi1";
			temp.styleName = "ui/art_txt/mainui/renwu/zhangjiejindu.png";
			temp.x = 18;
			temp.y = 89;
			return temp;
		}

		private function pri_navi1_txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_navi1_txt = temp;
			temp.name = "pri_navi1_txt";
			temp.htmlText = "第4章 觉醒(未完成)";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 208;
			temp.x = 32;
			temp.y = 64;
			return temp;
		}

		private function pri_navi2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_navi2 = temp;
			temp.name = "pri_navi2";
			temp.styleName = "ui/art_txt/mainui/renwu/renwumiaoshu.png";
			temp.x = 18;
			temp.y = 140;
			return temp;
		}

		private function pri_navi3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			pri_navi3 = temp;
			temp.name = "pri_navi3";
			temp.styleName = "ui/art_txt/mainui/renwu/renwujindu.png";
			temp.x = 18;
			temp.y = 212;
			return temp;
		}

		private function pri_probar_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			pri_probar = temp;
			temp.name = "pri_probar";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWu_jindu()
			temp.skin = skin
			temp.x = 34;
			temp.y = 114;
			return temp;
		}

		private function pri_txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pri_txt = temp;
			temp.name = "pri_txt";
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.text = "任务描述任务描述任务描述任务描述任务描述任务描述任务";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 199;
			temp.x = 32;
			temp.y = 165;
			return temp;
		}

		private function primary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			primary_box = temp;
			temp.name = "primary_box";
			temp.visible = false;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [pri_navi1_i(),pri_navi0_i(),pri_navi2_i(),pri_navi3_i(),pri_navi1_txt_i(),pri_probar_i(),pri_txt_i(),pri_killbut_1_i(),pri_killbut_2_i(),pri_killbut_3_i(),pri_ico0_i(),btnContinue_i()];
			return temp;
		}

		private function scroll_bar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroll_bar = temp;
			temp.name = "scroll_bar";
			temp.height = 295;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_pack;
			temp.x = 236;
			temp.y = 39;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.width = 243;
			temp.x = 10;
			temp.y = 39;
			temp.elementsContent = [sec_killbut1_1_i(),sec_killbut1_2_i(),sec_killbut1_3_i(),sec_killbut2_1_i(),sec_killbut2_2_i(),sec_killbut2_3_i(),sec_ico1_0_i(),sec_info_i(),sec_killbut3_1_i(),sec_killbut3_2_i(),sec_killbut3_3_i(),sec_killbut4_1_i(),sec_killbut4_2_i(),sec_killbut4_3_i(),sec_ico2_0_i(),sec_ico3_0_i(),sec_subbut1_i(),sec_navi1_i(),sec_navi2_i(),sec_navi3_i(),sec_navi4_i(),auto_i(),auto1_i(),sec_txt_i(),sec_tuijian_i(),lbInfo_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 90;
			temp.y = 121;
			return temp;
		}

		private function sec_ico2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_0 = temp;
			temp.name = "sec_ico2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.visible = false;
			temp.x = 90;
			temp.y = 269;
			return temp;
		}

		private function sec_ico3_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico3_0 = temp;
			temp.name = "sec_ico3_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 90;
			temp.y = 269;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.height = 18;
			temp.text = "完成N环可获得额外奖励：";
			temp.textAlign = "left";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 11;
			temp.y = 249;
			return temp;
		}

		private function sec_killbut1_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1_1 = temp;
			temp.name = "sec_killbut1_1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 57;
			return temp;
		}

		private function sec_killbut1_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1_2 = temp;
			temp.name = "sec_killbut1_2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 57;
			return temp;
		}

		private function sec_killbut1_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1_3 = temp;
			temp.name = "sec_killbut1_3";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 57;
			return temp;
		}

		private function sec_killbut2_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut2_1 = temp;
			temp.name = "sec_killbut2_1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 99;
			return temp;
		}

		private function sec_killbut2_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut2_2 = temp;
			temp.name = "sec_killbut2_2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 99;
			return temp;
		}

		private function sec_killbut2_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut2_3 = temp;
			temp.name = "sec_killbut2_3";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 99;
			return temp;
		}

		private function sec_killbut3_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut3_1 = temp;
			temp.name = "sec_killbut3_1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.visible = false;
			temp.width = 170;
			temp.x = 12;
			temp.y = 222;
			return temp;
		}

		private function sec_killbut3_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut3_2 = temp;
			temp.name = "sec_killbut3_2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.visible = false;
			temp.width = 170;
			temp.x = 12;
			temp.y = 222;
			return temp;
		}

		private function sec_killbut3_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut3_3 = temp;
			temp.name = "sec_killbut3_3";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.visible = false;
			temp.width = 170;
			temp.x = 12;
			temp.y = 222;
			return temp;
		}

		private function sec_killbut4_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut4_1 = temp;
			temp.name = "sec_killbut4_1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 222;
			return temp;
		}

		private function sec_killbut4_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut4_2 = temp;
			temp.name = "sec_killbut4_2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 222;
			return temp;
		}

		private function sec_killbut4_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut4_3 = temp;
			temp.name = "sec_killbut4_3";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item()
			temp.skin = skin
			temp.width = 170;
			temp.x = 12;
			temp.y = 222;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWuTitle_Skin()
			temp.skin = skin
			temp.width = 238;
			temp.x = 0;
			temp.y = -2;
			return temp;
		}

		private function sec_navi2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_navi2 = temp;
			temp.name = "sec_navi2";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWuTitle_Skin()
			temp.skin = skin
			temp.width = 238;
			temp.x = 0;
			temp.y = 80;
			return temp;
		}

		private function sec_navi3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_navi3 = temp;
			temp.name = "sec_navi3";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWuTitle_Skin()
			temp.skin = skin
			temp.visible = false;
			temp.width = 238;
			temp.x = 0;
			temp.y = 198;
			return temp;
		}

		private function sec_navi4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_navi4 = temp;
			temp.name = "sec_navi4";
			temp.height = 23;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.RenWuTitle_Skin()
			temp.skin = skin
			temp.width = 238;
			temp.x = 0;
			temp.y = 198;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 25;
			temp.label = "领取奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.x = 74;
			temp.y = 171;
			return temp;
		}

		private function sec_tuijian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_tuijian = temp;
			temp.name = "sec_tuijian";
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.text = "推荐：";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.visible = false;
			temp.width = 53;
			temp.x = 12;
			temp.y = 39;
			return temp;
		}

		private function sec_txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_txt = temp;
			temp.name = "sec_txt";
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.text = "描述任务描述任务描述任务描述任务描述任务描述任务";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 199;
			temp.x = 12;
			temp.y = 23;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [scroll_bar_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [uibg_i(),__RenWuZhuiZong_Skin_UIAsset1_i(),__RenWuZhuiZong_Skin_UIAsset2_i(),primary_box_i(),secondary_box_i()];
			return temp;
		}

		private function task_effect_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_effect = temp;
			temp.name = "task_effect";
			temp.x = 0;
			return temp;
		}

		private function uibg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uibg = temp;
			temp.name = "uibg";
			temp.height = 395;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 244;
			temp.x = 9;
			temp.y = 0;
			return temp;
		}

	}
}