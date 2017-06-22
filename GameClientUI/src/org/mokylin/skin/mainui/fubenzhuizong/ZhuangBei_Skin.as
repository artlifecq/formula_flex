package org.mokylin.skin.mainui.fubenzhuizong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.component.progress.progress_jindutiao;
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhuangBei_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var lbNum:feathers.controls.Label;

		public var lbshuliang:feathers.controls.Label;

		public var pro_bar:feathers.controls.ProgressBar;

		public var scroll_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var sec_killbut1_1:feathers.controls.SkinnableContainer;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_time:feathers.controls.Label;

		public var sec_time2:feathers.controls.Label;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var uiKill:feathers.controls.UIAsset;

		public var ui_head:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhuangBei_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 397;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ZhuangBei_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 397;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhuangBei_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhuangBei_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 35;
			temp.y = 12;
			return temp;
		}

		private function __ZhuangBei_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 210;
			temp.y = 12;
			return temp;
		}

		private function __ZhuangBei_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/richangfuben/tiaozhanmubiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhuangBei_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/richangfuben/tongguanjiangli.png";
			temp.x = 0;
			temp.y = 167;
			return temp;
		}

		private function __ZhuangBei_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao/jdtbg.png";
			temp.width = 192;
			temp.x = 16;
			temp.y = 296;
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

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.fontSize = 12;
			temp.text = "85/99";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 78;
			temp.y = 295;
			return temp;
		}

		private function lbshuliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbshuliang = temp;
			temp.name = "lbshuliang";
			temp.fontSize = 12;
			temp.text = "999999";
			temp.textAlign = "right";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 44;
			temp.x = 42;
			temp.y = 221;
			return temp;
		}

		private function pro_bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pro_bar = temp;
			temp.name = "pro_bar";
			temp.styleClass = org.mokylin.skin.component.progress.progress_jindutiao;
			temp.value = 40;
			temp.width = 178;
			temp.x = 23;
			temp.y = 298;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.height = 343;
			temp.width = 237;
			temp.x = 12;
			temp.y = 37;
			temp.elementsContent = [__ZhuangBei_Skin_UIAsset5_i(),sec_subbut1_i(),sec_time_i(),sec_time2_i(),__ZhuangBei_Skin_UIAsset6_i(),sec_killbut1_1_i(),__ZhuangBei_Skin_UIAsset7_i(),pro_bar_i(),lbNum_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),lbshuliang_i(),uiKill_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 40;
			temp.y = 190;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 92;
			temp.y = 190;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 144;
			temp.y = 190;
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
			temp.x = 5;
			temp.y = 27;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "离开副本";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 75;
			temp.y = 315;
			return temp;
		}

		private function sec_time2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_time2 = temp;
			temp.name = "sec_time2";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "三星通关倒计时：00：1：5";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 202;
			temp.x = 13;
			temp.y = 269;
			return temp;
		}

		private function sec_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_time = temp;
			temp.name = "sec_time";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "副本倒计时：00：1：5";
			temp.textAlign = "center";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 202;
			temp.x = 13;
			temp.y = 247;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.height = 388;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_head_i(),__ZhuangBei_Skin_UIAsset3_i(),__ZhuangBei_Skin_UIAsset4_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 396;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__ZhuangBei_Skin_UIAsset1_i(),__ZhuangBei_Skin_UIAsset2_i(),secondary_box_i()];
			return temp;
		}

		private function uiKill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiKill = temp;
			temp.name = "uiKill";
			temp.styleName = "ui/common/yijisha.png";
			temp.x = 62;
			temp.y = 56;
			return temp;
		}

		private function ui_head_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_head = temp;
			temp.name = "ui_head";
			temp.styleName = "ui/mainui/fubenzhuizong/richangfuben/zhuangbeifuben.png";
			temp.x = 87;
			temp.y = 4;
			return temp;
		}

	}
}