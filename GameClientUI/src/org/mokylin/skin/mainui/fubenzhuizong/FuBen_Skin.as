package org.mokylin.skin.mainui.fubenzhuizong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var lbMiaoshu:feathers.controls.Label;

		public var scroll_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var sec_ico1_3:feathers.controls.UIAsset;

		public var sec_ico1_4:feathers.controls.UIAsset;

		public var sec_ico1_5:feathers.controls.UIAsset;

		public var sec_ico1_6:feathers.controls.UIAsset;

		public var sec_ico1_7:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_killbut1_1:feathers.controls.SkinnableContainer;

		public var sec_killbut1_2:feathers.controls.SkinnableContainer;

		public var sec_killbut1_3:feathers.controls.SkinnableContainer;

		public var sec_navi1:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var uiXiangxi:feathers.controls.UIAsset;

		public var ui_head:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 335;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 335;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 40;
			temp.y = 12;
			return temp;
		}

		private function __FuBen_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 213;
			temp.y = 12;
			return temp;
		}

		private function __FuBen_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/tgjl.png";
			temp.x = 3;
			temp.y = 133;
			return temp;
		}

		private function __FuBen_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/bossyjldl.png";
			temp.x = 3;
			temp.y = 207;
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
			temp.x = 234;
			temp.y = 0;
			return temp;
		}

		private function lbMiaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMiaoshu = temp;
			temp.name = "lbMiaoshu";
			temp.text = "此处为当前阶段的剧情描述文字，";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 21;
			temp.y = 21;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.height = 346;
			temp.width = 250;
			temp.x = 5;
			temp.y = 39;
			temp.elementsContent = [sec_navi1_i(),sec_killbut1_1_i(),sec_killbut1_2_i(),sec_killbut1_3_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_ico1_3_i(),sec_ico1_4_i(),sec_ico1_5_i(),sec_ico1_6_i(),sec_ico1_7_i(),sec_subbut1_i(),sec_info_i(),__FuBen_Skin_UIAsset5_i(),__FuBen_Skin_UIAsset6_i(),lbMiaoshu_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 155;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 155;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 155;
			return temp;
		}

		private function sec_ico1_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_3 = temp;
			temp.name = "sec_ico1_3";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 177;
			temp.y = 155;
			return temp;
		}

		private function sec_ico1_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_4 = temp;
			temp.name = "sec_ico1_4";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 232;
			return temp;
		}

		private function sec_ico1_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_5 = temp;
			temp.name = "sec_ico1_5";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 232;
			return temp;
		}

		private function sec_ico1_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_6 = temp;
			temp.name = "sec_ico1_6";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 232;
			return temp;
		}

		private function sec_ico1_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_7 = temp;
			temp.name = "sec_ico1_7";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 177;
			temp.y = 232;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.height = 18;
			temp.letterSpacing = -1;
			temp.fontSize = 16;
			temp.text = "副本剩余时间：00：22：08";
			temp.textAlign = "center";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 210;
			temp.x = 23;
			temp.y = 289;
			return temp;
		}

		private function sec_killbut1_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1_1 = temp;
			temp.name = "sec_killbut1_1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.width = 169;
			temp.x = 50;
			temp.y = 62;
			return temp;
		}

		private function sec_killbut1_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1_2 = temp;
			temp.name = "sec_killbut1_2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.x = 50;
			temp.y = 84;
			return temp;
		}

		private function sec_killbut1_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			sec_killbut1_3 = temp;
			temp.name = "sec_killbut1_3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.x = 50;
			temp.y = 106;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.htmlText = "[阶段1]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 81;
			temp.y = 315;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.height = 386;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_head_i(),__FuBen_Skin_UIAsset3_i(),__FuBen_Skin_UIAsset4_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 391;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__FuBen_Skin_UIAsset1_i(),__FuBen_Skin_UIAsset2_i(),secondary_box_i(),uiXiangxi_i()];
			return temp;
		}

		private function uiXiangxi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiXiangxi = temp;
			temp.name = "uiXiangxi";
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/wenhao.png";
			temp.x = 7;
			temp.y = 6;
			return temp;
		}

		private function ui_head_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_head = temp;
			temp.name = "ui_head";
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/jgms.png";
			temp.x = 91;
			temp.y = 5;
			return temp;
		}

	}
}