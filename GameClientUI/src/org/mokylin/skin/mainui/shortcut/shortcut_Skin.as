package org.mokylin.skin.mainui.shortcut
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.mainui.juexue.Juexue_mc;
	import org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
	import org.mokylin.skin.mainui.shortcut.button.ButtonSkin_guaji;
	import org.mokylin.skin.mainui.shortcut.button.ButtonSkin_jiehun;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class shortcut_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Iconbg1:feathers.controls.UIAsset;

		public var Iconbg2:feathers.controls.UIAsset;

		public var Iconbg3:feathers.controls.UIAsset;

		public var Iconbg4:feathers.controls.UIAsset;

		public var Iconbg5:feathers.controls.UIAsset;

		public var Iconbg6:feathers.controls.UIAsset;

		public var Iconbg7:feathers.controls.UIAsset;

		public var Iconbg8:feathers.controls.UIAsset;

		public var Icons:feathers.controls.Group;

		public var btnGuaJi:feathers.controls.Button;

		public var btnJieHun:feathers.controls.Button;

		public var btn_juexue:feathers.controls.Button;

		public var fangun:feathers.controls.Group;

		public var fangun_n1:feathers.controls.UIAsset;

		public var fangun_n2:feathers.controls.UIAsset;

		public var fangun_n3:feathers.controls.UIAsset;

		public var fangun_tiao:feathers.controls.UIAsset;

		public var fangun_tishi:feathers.controls.UIAsset;

		public var jingzhen_yijia:feathers.controls.Group;

		public var juexuegroup:feathers.controls.Group;

		public var lbl_lastNum:feathers.controls.Label;

		public var lbl_times:feathers.controls.Label;

		public var left_red:feathers.controls.UIAsset;

		public var left_xuecao:feathers.controls.UIAsset;

		public var left_xuecaoMask:feathers.controls.UIAsset;

		public var mc_juexue:feathers.controls.UIMovieClip;

		public var right_blue:feathers.controls.UIAsset;

		public var right_jintiao:feathers.controls.UIAsset;

		public var right_nengliang:feathers.controls.UIAsset;

		public var right_nengliangMask:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function shortcut_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 140;
			this.width = 839;
			this.elementsContent = [right_nengliang_i(),right_jintiao_i(),right_nengliangMask_i(),right_blue_i(),left_xuecao_i(),left_xuecaoMask_i(),left_red_i(),__shortcut_Skin_UIAsset1_i(),Icons_i(),juexuegroup_i(),fangun_i(),jingzhen_yijia_i(),btnGuaJi_i(),btnJieHun_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Iconbg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg1 = temp;
			temp.name = "Iconbg1";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function Iconbg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg2 = temp;
			temp.name = "Iconbg2";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function Iconbg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg3 = temp;
			temp.name = "Iconbg3";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 112;
			temp.y = 0;
			return temp;
		}

		private function Iconbg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg4 = temp;
			temp.name = "Iconbg4";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 168;
			temp.y = 0;
			return temp;
		}

		private function Iconbg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg5 = temp;
			temp.name = "Iconbg5";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 224;
			temp.y = 0;
			return temp;
		}

		private function Iconbg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg6 = temp;
			temp.name = "Iconbg6";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 280;
			temp.y = 0;
			return temp;
		}

		private function Iconbg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg7 = temp;
			temp.name = "Iconbg7";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 336;
			temp.y = 0;
			return temp;
		}

		private function Iconbg8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Iconbg8 = temp;
			temp.name = "Iconbg8";
			temp.styleName = "ui/mainui/shortcut/kuang.png";
			temp.x = 392;
			temp.y = 0;
			return temp;
		}

		private function Icons_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			Icons = temp;
			temp.name = "Icons";
			temp.x = 191;
			temp.y = 77;
			temp.elementsContent = [Iconbg1_i(),Iconbg2_i(),Iconbg3_i(),Iconbg4_i(),Iconbg5_i(),Iconbg6_i(),Iconbg7_i(),Iconbg8_i()];
			return temp;
		}

		private function __shortcut_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/mainui/shortcut/dikuang.png";
			temp.x = 0;
			temp.y = 41;
			return temp;
		}

		private function __shortcut_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/shortcut/zhenheibai.png";
			temp.x = 48;
			temp.y = 20;
			return temp;
		}

		private function btnGuaJi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGuaJi = temp;
			temp.name = "btnGuaJi";
			temp.styleClass = org.mokylin.skin.mainui.shortcut.button.ButtonSkin_guaji;
			temp.x = 17;
			temp.y = 89;
			return temp;
		}

		private function btnJieHun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJieHun = temp;
			temp.name = "btnJieHun";
			temp.styleClass = org.mokylin.skin.mainui.shortcut.button.ButtonSkin_jiehun;
			temp.x = 34;
			temp.y = 58;
			return temp;
		}

		private function btn_juexue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_juexue = temp;
			temp.name = "btn_juexue";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function fangun_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			fangun = temp;
			temp.name = "fangun";
			temp.height = 48;
			temp.width = 80;
			temp.x = 84;
			temp.y = 93;
			temp.elementsContent = [fangun_n1_i(),fangun_n2_i(),fangun_n3_i(),fangun_tiao_i(),fangun_tishi_i(),lbl_times_i()];
			return temp;
		}

		private function fangun_n1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_n1 = temp;
			temp.name = "fangun_n1";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_1.png";
			temp.x = 2;
			temp.y = 13;
			return temp;
		}

		private function fangun_n2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_n2 = temp;
			temp.name = "fangun_n2";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_2.png";
			temp.x = 17;
			temp.y = 4;
			return temp;
		}

		private function fangun_n3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_n3 = temp;
			temp.name = "fangun_n3";
			temp.styleName = "ui/mainui/shortcut/lvse/lvse_3.png";
			temp.x = 59;
			temp.y = 14;
			return temp;
		}

		private function fangun_tiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_tiao = temp;
			temp.name = "fangun_tiao";
			temp.styleName = "ui/mainui/shortcut/chengbanyuan.png";
			temp.x = 14;
			temp.y = 17;
			return temp;
		}

		private function fangun_tishi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fangun_tishi = temp;
			temp.name = "fangun_tishi";
			temp.styleName = "ui/mainui/shortcut/jiao.png";
			temp.x = 32;
			temp.y = 27;
			return temp;
		}

		private function jingzhen_yijia_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			jingzhen_yijia = temp;
			temp.name = "jingzhen_yijia";
			temp.x = 602;
			temp.y = 65;
			temp.elementsContent = [__shortcut_Skin_UIAsset2_i(),lbl_lastNum_i()];
			return temp;
		}

		private function juexuegroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			juexuegroup = temp;
			temp.name = "juexuegroup";
			temp.x = 781;
			temp.y = 90;
			temp.elementsContent = [mc_juexue_i(),btn_juexue_i()];
			return temp;
		}

		private function lbl_lastNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_lastNum = temp;
			temp.name = "lbl_lastNum";
			temp.fontSize = 12;
			temp.text = "5/5";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 28;
			temp.x = 87;
			temp.y = 59;
			return temp;
		}

		private function lbl_times_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_times = temp;
			temp.name = "lbl_times";
			temp.height = 16;
			temp.fontSize = 12;
			temp.text = "15s";
			temp.textAlign = "center";
			temp.color = 0xB1ACA6;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 0;
			temp.y = 29;
			return temp;
		}

		private function left_red_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			left_red = temp;
			temp.name = "left_red";
			temp.styleName = "ui/mainui/shortcut/hongdi.png";
			temp.x = 44;
			temp.y = 54;
			return temp;
		}

		private function left_xuecaoMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			left_xuecaoMask = temp;
			temp.name = "left_xuecaoMask";
			temp.styleName = "ui/mainui/shortcut/hongdizhezhao.png";
			temp.x = 44;
			temp.y = 54;
			return temp;
		}

		private function left_xuecao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			left_xuecao = temp;
			temp.name = "left_xuecao";
			temp.styleName = "ui/mainui/shortcut/hongtiao.png";
			temp.x = 44;
			temp.y = 54;
			return temp;
		}

		private function mc_juexue_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_juexue = temp;
			temp.name = "mc_juexue";
			temp.autoPlay = false;
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.Juexue_mc;
			temp.width = 30;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function right_blue_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_blue = temp;
			temp.name = "right_blue";
			temp.styleName = "ui/mainui/shortcut/landi.png";
			temp.x = 647;
			temp.y = 54;
			return temp;
		}

		private function right_jintiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_jintiao = temp;
			temp.name = "right_jintiao";
			temp.styleName = "ui/mainui/shortcut/huangtiao.png";
			temp.x = 647;
			temp.y = 54;
			return temp;
		}

		private function right_nengliangMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_nengliangMask = temp;
			temp.name = "right_nengliangMask";
			temp.styleName = "ui/mainui/shortcut/landizhezhao.png";
			temp.x = 647;
			temp.y = 54;
			return temp;
		}

		private function right_nengliang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right_nengliang = temp;
			temp.name = "right_nengliang";
			temp.styleName = "ui/mainui/shortcut/lantiao.png";
			temp.x = 647;
			temp.y = 54;
			return temp;
		}

	}
}