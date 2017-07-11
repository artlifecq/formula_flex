package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.hunyin.Pro_Hunyin;
	import org.mokylin.skin.app.hunyin.button.ButtonDongfang;
	import org.mokylin.skin.app.hunyin.button.ButtonFuqifuben;
	import org.mokylin.skin.app.hunyin.button.ButtonJishi;
	import org.mokylin.skin.app.hunyin.button.ButtonLiaotian;
	import org.mokylin.skin.app.hunyin.button.ButtonLihun;
	import org.mokylin.skin.app.hunyin.button.ButtonQinwen;
	import org.mokylin.skin.app.hunyin.button.ButtonSonghua;
	import org.mokylin.skin.app.hunyin.button.ButtonYongbao;
	import org.mokylin.skin.app.hunyin.number.UINumberHunyin_jie;
	import org.mokylin.skin.common.TongYongPanelbg1;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HunYin_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var barJindu:feathers.controls.ProgressBar;

		public var bg:feathers.controls.SkinnableContainer;

		public var btnDongfang:feathers.controls.Button;

		public var btnFuben:feathers.controls.Button;

		public var btnJinjie:feathers.controls.Button;

		public var btnJishi:feathers.controls.Button;

		public var btnLiaotian:feathers.controls.Button;

		public var btnLihun:feathers.controls.Button;

		public var btnQinwen:feathers.controls.Button;

		public var btnSonghua:feathers.controls.Button;

		public var btnYongbao:feathers.controls.Button;

		public var grpBar:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var lbJindu:feathers.controls.Label;

		public var lbLaoGong:feathers.controls.Label;

		public var lbLaoPo:feathers.controls.Label;

		public var numJie:feathers.controls.UINumber;

		public var skin_container:feathers.controls.SkinnableContainer;

		public var uiJie:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HunYin_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__HunYin_Skin_UIAsset1_i(),__HunYin_Skin_UIAsset2_i(),__HunYin_Skin_UIAsset3_i(),btnSonghua_i(),btnYongbao_i(),btnQinwen_i(),btnDongfang_i(),btnFuben_i(),btnLihun_i(),btnLiaotian_i(),btnJishi_i(),__HunYin_Skin_UIAsset4_i(),__HunYin_Skin_UIAsset5_i(),lbLaoPo_i(),lbLaoGong_i(),icon1_i(),icon2_i(),icon3_i(),ui_zhandou_i(),NumZhanli_i(),icon4_i(),__HunYin_Skin_UIAsset6_i(),uiJie_i(),numJie_i(),__HunYin_Skin_Group1_i(),__HunYin_Skin_Group2_i(),grpBar_i(),btnJinjie_i(),skin_container_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function NumZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			NumZhanli = temp;
			temp.name = "NumZhanli";
			temp.gap = -13;
			temp.height = 33;
			temp.label = "645718";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 140;
			temp.x = 796;
			temp.y = 109;
			return temp;
		}

		private function __HunYin_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 701;
			temp.y = 241;
			temp.elementsContent = [__HunYin_Skin_UIAsset7_i(),__HunYin_Skin_UIAsset8_i(),__HunYin_Skin_UIAsset9_i()];
			return temp;
		}

		private function __HunYin_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 701;
			temp.y = 487;
			temp.elementsContent = [__HunYin_Skin_UIAsset10_i(),__HunYin_Skin_UIAsset11_i(),__HunYin_Skin_UIAsset12_i()];
			return temp;
		}

		private function __HunYin_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __HunYin_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 4;
			return temp;
		}

		private function __HunYin_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/aiqingqingmidu.png";
			temp.x = 79;
			temp.y = 0;
			return temp;
		}

		private function __HunYin_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/pro_bg.png";
			temp.width = 226;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HunYin_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __HunYin_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/hunyin/hunyin_bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __HunYin_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hunyin/hunying.png";
			temp.x = 454;
			temp.y = 19;
			return temp;
		}

		private function __HunYin_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/laopo.png";
			temp.x = 164;
			temp.y = 98;
			return temp;
		}

		private function __HunYin_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/laogong.png";
			temp.x = 482;
			temp.y = 98;
			return temp;
		}

		private function __HunYin_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/jiehunjiezhi.png";
			temp.x = 790;
			temp.y = 171;
			return temp;
		}

		private function __HunYin_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __HunYin_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 4;
			return temp;
		}

		private function __HunYin_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/yongjiutishengshuxing.png";
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function barJindu_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			barJindu = temp;
			temp.name = "barJindu";
			temp.styleClass = org.mokylin.skin.app.hunyin.Pro_Hunyin;
			temp.value = 100;
			temp.x = 20;
			temp.y = 3;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnDongfang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDongfang = temp;
			temp.name = "btnDongfang";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonDongfang;
			temp.x = 38;
			temp.y = 318;
			return temp;
		}

		private function btnFuben_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFuben = temp;
			temp.name = "btnFuben";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonFuqifuben;
			temp.x = 31;
			temp.y = 386;
			return temp;
		}

		private function btnJinjie_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJinjie = temp;
			temp.name = "btnJinjie";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "进 阶";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 783;
			temp.y = 547;
			return temp;
		}

		private function btnJishi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJishi = temp;
			temp.name = "btnJishi";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonJishi;
			temp.x = 160;
			temp.y = 526;
			return temp;
		}

		private function btnLiaotian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLiaotian = temp;
			temp.name = "btnLiaotian";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonLiaotian;
			temp.x = 98;
			temp.y = 526;
			return temp;
		}

		private function btnLihun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLihun = temp;
			temp.name = "btnLihun";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonLihun;
			temp.x = 34;
			temp.y = 526;
			return temp;
		}

		private function btnQinwen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQinwen = temp;
			temp.name = "btnQinwen";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonQinwen;
			temp.x = 38;
			temp.y = 248;
			return temp;
		}

		private function btnSonghua_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSonghua = temp;
			temp.name = "btnSonghua";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonSonghua;
			temp.x = 38;
			temp.y = 107;
			return temp;
		}

		private function btnYongbao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnYongbao = temp;
			temp.name = "btnYongbao";
			temp.styleClass = org.mokylin.skin.app.hunyin.button.ButtonYongbao;
			temp.x = 38;
			temp.y = 177;
			return temp;
		}

		private function grpBar_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpBar = temp;
			temp.name = "grpBar";
			temp.x = 706;
			temp.y = 514;
			temp.elementsContent = [__HunYin_Skin_UIAsset13_i(),barJindu_i(),lbJindu_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.height = 56;
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.width = 56;
			temp.x = 280;
			temp.y = 524;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.height = 56;
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.width = 56;
			temp.x = 353;
			temp.y = 524;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.height = 56;
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.width = 56;
			temp.x = 426;
			temp.y = 524;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.height = 50;
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.width = 50;
			temp.x = 714;
			temp.y = 173;
			return temp;
		}

		private function lbJindu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJindu = temp;
			temp.name = "lbJindu";
			temp.text = "800/1000";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 106;
			temp.x = 59;
			temp.y = 3;
			return temp;
		}

		private function lbLaoGong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLaoGong = temp;
			temp.name = "lbLaoGong";
			temp.text = "扎穿了男子汉";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 138;
			temp.x = 502;
			temp.y = 137;
			return temp;
		}

		private function lbLaoPo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLaoPo = temp;
			temp.name = "lbLaoPo";
			temp.text = "我要买心相印";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 138;
			temp.x = 178;
			temp.y = 137;
			return temp;
		}

		private function numJie_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numJie = temp;
			temp.name = "numJie";
			temp.gap = -1;
			temp.height = 18;
			temp.label = "132";
			temp.styleClass = org.mokylin.skin.app.hunyin.number.UINumberHunyin_jie;
			temp.width = 46;
			temp.x = 812;
			temp.y = 203;
			return temp;
		}

		private function skin_container_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skin_container = temp;
			temp.name = "skin_container";
			temp.height = 220;
			temp.width = 225;
			temp.x = 709;
			temp.y = 263;
			return temp;
		}

		private function uiJie_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiJie = temp;
			temp.name = "uiJie";
			temp.styleName = "ui/app/hunyin/jie.png";
			temp.x = 843;
			temp.y = 202;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 719;
			temp.y = 99;
			return temp;
		}

	}
}