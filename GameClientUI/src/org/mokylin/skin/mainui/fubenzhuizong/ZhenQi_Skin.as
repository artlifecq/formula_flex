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
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.progress.progress_jindutiao;
	import org.mokylin.skin.mainui.renwu.Renwu_Item2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ZhenQi_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var headName:feathers.controls.Label;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var killbut_0:feathers.controls.SkinnableContainer;

		public var killbut_1:feathers.controls.SkinnableContainer;

		public var killbut_2:feathers.controls.SkinnableContainer;

		public var killbut_3:feathers.controls.SkinnableContainer;

		public var killbut_4:feathers.controls.SkinnableContainer;

		public var navi0:feathers.controls.Label;

		public var navi1:feathers.controls.Label;

		public var per_group:feathers.controls.Group;

		public var pro_bar:feathers.controls.ProgressBar;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_time:feathers.controls.Label;

		public var sec_time2:feathers.controls.Label;

		public var task_box:feathers.controls.Group;

		public var uiKill:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ZhenQi_Skin()
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
		private function __ZhenQi_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __ZhenQi_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao/jdtbg.png";
			temp.width = 192;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 221;
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
			temp.x = 243;
			temp.y = 8;
			return temp;
		}

		private function headName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			headName = temp;
			temp.name = "headName";
			temp.fontSize = 16;
			temp.text = "真气副本";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 205;
			temp.x = 24;
			temp.y = 8;
			return temp;
		}

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 38;
			temp.y = 15;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 213;
			temp.y = 15;
			return temp;
		}

		private function killbut_0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_0 = temp;
			temp.name = "killbut_0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.width = 169;
			temp.x = 25;
			temp.y = 116;
			return temp;
		}

		private function killbut_1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_1 = temp;
			temp.name = "killbut_1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.width = 169;
			temp.x = 25;
			temp.y = 64;
			return temp;
		}

		private function killbut_2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_2 = temp;
			temp.name = "killbut_2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.width = 169;
			temp.x = 25;
			temp.y = 90;
			return temp;
		}

		private function killbut_3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_3 = temp;
			temp.name = "killbut_3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.width = 169;
			temp.x = 25;
			temp.y = 141;
			return temp;
		}

		private function killbut_4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_4 = temp;
			temp.name = "killbut_4";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.mainui.renwu.Renwu_Item2()
			temp.skin = skin
			temp.width = 169;
			temp.x = 25;
			temp.y = 167;
			return temp;
		}

		private function navi0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			navi0 = temp;
			temp.name = "navi0";
			temp.text = "【挑战目标】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 40;
			return temp;
		}

		private function navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			navi1 = temp;
			temp.name = "navi1";
			temp.text = "【通关奖励】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 10;
			temp.y = 203;
			return temp;
		}

		private function per_group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			per_group = temp;
			temp.name = "per_group";
			temp.height = 13;
			temp.x = 27;
			temp.y = 327;
			temp.elementsContent = [__ZhenQi_Skin_UIAsset2_i(),pro_bar_i()];
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
			temp.x = 7;
			temp.y = 2;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 99;
			temp.y = 230;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 36;
			temp.label = "退出副本";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 80;
			temp.y = 349;
			return temp;
		}

		private function sec_time2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_time2 = temp;
			temp.name = "sec_time2";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "三星通关倒计时：00：1：5";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 202;
			temp.x = 25;
			temp.y = 302;
			return temp;
		}

		private function sec_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_time = temp;
			temp.name = "sec_time";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "副本倒计时：00：1：5";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 202;
			temp.x = 25;
			temp.y = 283;
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
			temp.elementsContent = [ui_bg_i(),__ZhenQi_Skin_UIAsset1_i(),headName_i(),head_left_i(),head_right_i(),sec_subbut1_i(),sec_time_i(),sec_time2_i(),killbut_0_i(),killbut_1_i(),killbut_2_i(),killbut_3_i(),killbut_4_i(),per_group_i(),sec_ico1_0_i(),navi0_i(),navi1_i(),uiKill_i()];
			return temp;
		}

		private function uiKill_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiKill = temp;
			temp.name = "uiKill";
			temp.styleName = "ui/common/yijisha.png";
			temp.x = 67;
			temp.y = 79;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 397;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}