package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.ProJindu_Up;
	import org.mokylin.skin.app.banghui.button.ButtonBh_juanxian;
	import org.mokylin.skin.app.banghui.button.ButtonBh_renwu;
	import org.mokylin.skin.app.banghui.button.ButtonBh_zhengba;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BangHui_Up extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnJuanxian:feathers.controls.Button;

		public var btnRenwu:feathers.controls.Button;

		public var btnUp:feathers.controls.Button;

		public var btnZhengba:feathers.controls.Button;

		public var gNext:feathers.controls.Group;

		public var imgGirl:feathers.controls.UIAsset;

		public var imgmax:feathers.controls.UIAsset;

		public var lbBanhuiDengji:feathers.controls.Label;

		public var lbBanhuiZhanli:feathers.controls.Label;

		public var lbJindu:feathers.controls.Label;

		public var lbMsg1:feathers.controls.Label;

		public var lbMsg2:feathers.controls.Label;

		public var proJindu:feathers.controls.ProgressBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BangHui_Up()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [imgGirl_i(),__BangHui_Up_UIAsset2_i(),__BangHui_Up_UIAsset3_i(),__BangHui_Up_UIAsset4_i(),__BangHui_Up_UIAsset5_i(),__BangHui_Up_UIAsset6_i(),__BangHui_Up_UIAsset7_i(),__BangHui_Up_UIAsset8_i(),__BangHui_Up_Group1_i(),lbMsg1_i(),gNext_i(),btnRenwu_i(),btnZhengba_i(),btnJuanxian_i(),proJindu_i(),lbJindu_i(),__BangHui_Up_Label1_i(),lbBanhuiZhanli_i(),lbBanhuiDengji_i(),__BangHui_Up_Label2_i(),btnUp_i(),imgmax_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BangHui_Up_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 57;
			temp.y = 496;
			temp.elementsContent = [__BangHui_Up_UIAsset9_i(),__BangHui_Up_UIAsset10_i(),__BangHui_Up_UIAsset11_i()];
			return temp;
		}

		private function __BangHui_Up_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派战力：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 307;
			temp.y = 551;
			return temp;
		}

		private function __BangHui_Up_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派等级：";
			temp.color = 0xD2CA78;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 459;
			temp.y = 551;
			return temp;
		}

		private function __BangHui_Up_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __BangHui_Up_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/banghui/huawen1.png";
			temp.x = 200;
			temp.y = 4;
			return temp;
		}

		private function __BangHui_Up_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/itembg1.png";
			temp.x = 5;
			temp.y = 0;
			return temp;
		}

		private function __BangHui_Up_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/xiajitequan.png";
			temp.x = 63;
			temp.y = 3;
			return temp;
		}

		private function __BangHui_Up_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/dibg.png";
			temp.x = 293;
			temp.y = 528;
			return temp;
		}

		private function __BangHui_Up_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/bg1_left.png";
			temp.x = 23;
			temp.y = 86;
			return temp;
		}

		private function __BangHui_Up_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.width = 261;
			temp.x = 28;
			temp.y = 91;
			return temp;
		}

		private function __BangHui_Up_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/xiangqingtequan.png";
			temp.x = 126;
			temp.y = 96;
			return temp;
		}

		private function __BangHui_Up_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 374;
			temp.styleName = "ui/app/banghui/kuang2.png";
			temp.width = 240;
			temp.x = 38;
			temp.y = 122;
			return temp;
		}

		private function __BangHui_Up_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/itembg1.png";
			temp.x = 69;
			temp.y = 131;
			return temp;
		}

		private function __BangHui_Up_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/dangqiantequan.png";
			temp.x = 127;
			temp.y = 134;
			return temp;
		}

		private function __BangHui_Up_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/word/shengjitujing.png";
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function btnJuanxian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJuanxian = temp;
			temp.name = "btnJuanxian";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonBh_juanxian;
			temp.x = 203;
			temp.y = 513;
			return temp;
		}

		private function btnRenwu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRenwu = temp;
			temp.name = "btnRenwu";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonBh_renwu;
			temp.x = 37;
			temp.y = 513;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "升级";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 815;
			temp.y = 542;
			return temp;
		}

		private function btnZhengba_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhengba = temp;
			temp.name = "btnZhengba";
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonBh_zhengba;
			temp.x = 121;
			temp.y = 513;
			return temp;
		}

		private function gNext_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gNext = temp;
			temp.name = "gNext";
			temp.x = 64;
			temp.y = 312;
			temp.elementsContent = [__BangHui_Up_UIAsset12_i(),__BangHui_Up_UIAsset13_i(),lbMsg2_i()];
			return temp;
		}

		private function imgGirl_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgGirl = temp;
			temp.name = "imgGirl";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/big_bg/banghui/bg3.png";
			temp.x = 291;
			temp.y = 59;
			return temp;
		}

		private function imgmax_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgmax = temp;
			temp.name = "imgmax";
			temp.styleName = "ui/app/banghui/yimanji.png";
			temp.x = 793;
			temp.y = 497;
			return temp;
		}

		private function lbBanhuiDengji_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBanhuiDengji = temp;
			temp.name = "lbBanhuiDengji";
			temp.text = "89";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 81;
			temp.x = 531;
			temp.y = 551;
			return temp;
		}

		private function lbBanhuiZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBanhuiZhanli = temp;
			temp.name = "lbBanhuiZhanli";
			temp.text = "9999999999";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 81;
			temp.x = 378;
			temp.y = 551;
			return temp;
		}

		private function lbJindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJindu = temp;
			temp.name = "lbJindu";
			temp.text = "5000/10000";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 183;
			temp.x = 522;
			temp.y = 466;
			return temp;
		}

		private function lbMsg1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg1 = temp;
			temp.name = "lbMsg1";
			temp.height = 146;
			temp.text = "1.帮派人数可提升至900人";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 190;
			temp.x = 68;
			temp.y = 161;
			return temp;
		}

		private function lbMsg2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg2 = temp;
			temp.name = "lbMsg2";
			temp.height = 146;
			temp.text = "1.帮派人数可提升至900人";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 190;
			temp.x = 0;
			temp.y = 25;
			return temp;
		}

		private function proJindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			proJindu = temp;
			temp.name = "proJindu";
			temp.styleClass = org.mokylin.skin.app.banghui.ProJindu_Up;
			temp.value = 50;
			temp.x = 409;
			temp.y = 467;
			return temp;
		}

	}
}