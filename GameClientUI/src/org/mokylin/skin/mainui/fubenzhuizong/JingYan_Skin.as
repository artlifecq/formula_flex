package org.mokylin.skin.mainui.fubenzhuizong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.component.progress.progress_jindutiao;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JingYan_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var killInfo:feathers.controls.Label;

		public var killName:feathers.controls.Label;

		public var killNum:feathers.controls.Label;

		public var lbJingyan:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var pro_bar:feathers.controls.ProgressBar;

		public var scroll_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_time:feathers.controls.Label;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var ui_head:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JingYan_Skin()
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
		private function __JingYan_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 335;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JingYan_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JingYan_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 35;
			temp.y = 12;
			return temp;
		}

		private function __JingYan_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 210;
			temp.y = 12;
			return temp;
		}

		private function __JingYan_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/richangfuben/tiaozhanmubiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __JingYan_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/richangfuben/leijihuodejingyan.png";
			temp.x = 0;
			temp.y = 167;
			return temp;
		}

		private function __JingYan_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/progress/jindutiao/jdtbg.png";
			temp.width = 192;
			temp.x = 16;
			temp.y = 133;
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

		private function killInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killInfo = temp;
			temp.name = "killInfo";
			temp.htmlText = "三星通关需击杀<font color='#6bcc08'>99</font>只怪";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 164;
			temp.x = 37;
			temp.y = 109;
			return temp;
		}

		private function killName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killName = temp;
			temp.name = "killName";
			temp.htmlText = "波  数：<font color='#6bcc08'>1/99</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 164;
			temp.x = 67;
			temp.y = 36;
			return temp;
		}

		private function killNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killNum = temp;
			temp.name = "killNum";
			temp.htmlText = "击杀数：<font color='#6bcc08'>1/99</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 164;
			temp.x = 67;
			temp.y = 63;
			return temp;
		}

		private function lbJingyan_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJingyan = temp;
			temp.name = "lbJingyan";
			temp.height = 18;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "999999";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 174;
			temp.x = 14;
			temp.y = 191;
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
			temp.y = 132;
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
			temp.y = 135;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.height = 273;
			temp.width = 250;
			temp.x = 12;
			temp.y = 37;
			temp.elementsContent = [__JingYan_Skin_UIAsset5_i(),sec_subbut1_i(),lbJingyan_i(),sec_time_i(),__JingYan_Skin_UIAsset6_i(),killName_i(),killNum_i(),killInfo_i(),sec_ico1_0_i(),__JingYan_Skin_UIAsset7_i(),pro_bar_i(),lbNum_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 13;
			temp.y = 35;
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
			temp.y = 250;
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
			temp.y = 225;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.height = 324;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_head_i(),__JingYan_Skin_UIAsset3_i(),__JingYan_Skin_UIAsset4_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 334;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__JingYan_Skin_UIAsset1_i(),__JingYan_Skin_UIAsset2_i(),secondary_box_i()];
			return temp;
		}

		private function ui_head_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_head = temp;
			temp.name = "ui_head";
			temp.styleName = "ui/mainui/fubenzhuizong/richangfuben/jingyanfuben.png";
			temp.x = 87;
			temp.y = 4;
			return temp;
		}

	}
}