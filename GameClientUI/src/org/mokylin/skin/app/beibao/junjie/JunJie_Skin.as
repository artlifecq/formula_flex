package org.mokylin.skin.app.beibao.junjie
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.junjie.button.ButtonJihuo;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou3;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JunJie_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var btnJihuo:feathers.controls.Button;

		public var btnNext:feathers.controls.Button;

		public var btnPrev:feathers.controls.Button;

		public var conTiaojian:feathers.controls.SkinnableContainer;

		public var contShuxing:feathers.controls.SkinnableContainer;

		public var lbTiaojian:feathers.controls.Label;

		public var lb_wanchengdu:feathers.controls.Label;

		public var num_lv:feathers.controls.UINumber;

		public var roleCont:feathers.controls.SkinnableContainer;

		public var uiUp:feathers.controls.UIAsset;

		public var uiUpOK:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JunJie_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__JunJie_Skin_UIAsset3_i(),roleCont_i(),btnPrev_i(),btnNext_i(),__JunJie_Skin_UIAsset4_i(),btnJihuo_i(),__JunJie_Skin_UIAsset5_i(),NumZhanli_i(),num_lv_i(),uiUp_i(),__JunJie_Skin_Group1_i(),__JunJie_Skin_Group2_i(),__JunJie_Skin_UIAsset12_i(),__JunJie_Skin_UIAsset13_i(),lbTiaojian_i(),contShuxing_i(),conTiaojian_i(),lb_wanchengdu_i(),uiUpOK_i()];
			
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
			temp.label = "1364364";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 148;
			temp.x = 755;
			temp.y = 99;
			return temp;
		}

		private function __JunJie_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 669;
			temp.y = 141;
			temp.elementsContent = [__JunJie_Skin_UIAsset6_i(),__JunJie_Skin_UIAsset7_i(),__JunJie_Skin_UIAsset8_i()];
			return temp;
		}

		private function __JunJie_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 669;
			temp.y = 332;
			temp.elementsContent = [__JunJie_Skin_UIAsset9_i(),__JunJie_Skin_UIAsset10_i(),__JunJie_Skin_UIAsset11_i()];
			return temp;
		}

		private function __JunJie_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 231;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/youjiushuxing.png";
			temp.x = 735;
			temp.y = 146;
			return temp;
		}

		private function __JunJie_Skin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/jihuotiaojian.png";
			temp.x = 732;
			temp.y = 337;
			return temp;
		}

		private function __JunJie_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/junjie/bg_1.png";
			temp.x = 18;
			temp.y = 74;
			return temp;
		}

		private function __JunJie_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/quxian.png";
			temp.x = 25;
			temp.y = 87;
			return temp;
		}

		private function __JunJie_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 684;
			temp.y = 91;
			return temp;
		}

		private function __JunJie_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/tiao.png";
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function __JunJie_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 231;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/tiao.png";
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function btnJihuo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJihuo = temp;
			temp.name = "btnJihuo";
			temp.styleClass = org.mokylin.skin.app.beibao.junjie.button.ButtonJihuo;
			temp.x = 387;
			temp.y = 456;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.scaleY = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou3;
			temp.x = 115;
			temp.y = 420;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou3;
			temp.x = 157;
			temp.y = 77;
			return temp;
		}

		private function conTiaojian_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			conTiaojian = temp;
			temp.name = "conTiaojian";
			temp.height = 126;
			temp.width = 222;
			temp.x = 671;
			temp.y = 367;
			return temp;
		}

		private function contShuxing_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			contShuxing = temp;
			temp.name = "contShuxing";
			temp.height = 126;
			temp.width = 200;
			temp.x = 693;
			temp.y = 177;
			return temp;
		}

		private function lbTiaojian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTiaojian = temp;
			temp.name = "lbTiaojian";
			temp.text = "（4/5）";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 793;
			temp.y = 338;
			return temp;
		}

		private function lb_wanchengdu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_wanchengdu = temp;
			temp.name = "lb_wanchengdu";
			temp.height = 20;
			temp.textAlign = "center";
			temp.width = 200;
			temp.x = 380;
			temp.y = 432;
			return temp;
		}

		private function num_lv_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num_lv = temp;
			temp.name = "num_lv";
			temp.gap = -2;
			temp.height = 13;
			temp.label = "x100";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;
			temp.width = 64;
			temp.x = 877;
			temp.y = 114;
			return temp;
		}

		private function roleCont_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			roleCont = temp;
			temp.name = "roleCont";
			temp.height = 394;
			temp.width = 250;
			temp.x = 344;
			temp.y = 88;
			return temp;
		}

		private function uiUpOK_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUpOK = temp;
			temp.name = "uiUpOK";
			temp.styleName = "ui/app/beibao/junjie/shengjiechenggong.png";
			temp.x = 326;
			temp.y = 70;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/common/tubiao/xiangshang.png";
			temp.x = 865;
			temp.y = 112;
			return temp;
		}

	}
}