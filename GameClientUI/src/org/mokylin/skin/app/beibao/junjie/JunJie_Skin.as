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
	import org.mokylin.skin.component.button.ButtonSkin_jiantou2;
	import org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_lv2;

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

		public var uiUpOK:feathers.controls.UIAsset;

		public var ui_zhandou:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JunJie_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__JunJie_Skin_UIAsset2_i(),roleCont_i(),__JunJie_Skin_UIAsset3_i(),btnJihuo_i(),ui_zhandou_i(),NumZhanli_i(),num_lv_i(),__JunJie_Skin_Group1_i(),__JunJie_Skin_Group2_i(),__JunJie_Skin_UIAsset10_i(),__JunJie_Skin_UIAsset11_i(),lbTiaojian_i(),contShuxing_i(),conTiaojian_i(),lb_wanchengdu_i(),uiUpOK_i(),btnPrev_i(),btnNext_i()];
			
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
			temp.gap = -15;
			temp.height = 40;
			temp.label = "62984567";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberJuese_zhanli;
			temp.width = 127;
			temp.x = 749;
			temp.y = 101;
			return temp;
		}

		private function __JunJie_Skin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 673;
			temp.y = 148;
			temp.elementsContent = [__JunJie_Skin_UIAsset4_i(),__JunJie_Skin_UIAsset5_i(),__JunJie_Skin_UIAsset6_i()];
			return temp;
		}

		private function __JunJie_Skin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 673;
			temp.y = 339;
			temp.elementsContent = [__JunJie_Skin_UIAsset7_i(),__JunJie_Skin_UIAsset8_i(),__JunJie_Skin_UIAsset9_i()];
			return temp;
		}

		private function __JunJie_Skin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/youjiushuxing.png";
			temp.x = 739;
			temp.y = 153;
			return temp;
		}

		private function __JunJie_Skin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/jihuotiaojian.png";
			temp.x = 736;
			temp.y = 344;
			return temp;
		}

		private function __JunJie_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/beibao/junjie/bg_1.png";
			temp.x = 24;
			temp.y = 87;
			return temp;
		}

		private function __JunJie_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/quxian.png";
			temp.x = 27;
			temp.y = 94;
			return temp;
		}

		private function __JunJie_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/tiao.png";
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function __JunJie_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 231;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/tiao.png";
			temp.x = 26;
			temp.y = 0;
			return temp;
		}

		private function __JunJie_Skin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function __JunJie_Skin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/app/beibao/junjie/fenge.png";
			temp.x = 231;
			temp.y = 6;
			return temp;
		}

		private function btnJihuo_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJihuo = temp;
			temp.name = "btnJihuo";
			temp.styleClass = org.mokylin.skin.app.beibao.junjie.button.ButtonJihuo;
			temp.x = 389;
			temp.y = 464;
			return temp;
		}

		private function btnNext_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnNext = temp;
			temp.name = "btnNext";
			temp.scaleY = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 118;
			temp.y = 437;
			return temp;
		}

		private function btnPrev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPrev = temp;
			temp.name = "btnPrev";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou2;
			temp.x = 161;
			temp.y = 78;
			return temp;
		}

		private function conTiaojian_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			conTiaojian = temp;
			temp.name = "conTiaojian";
			temp.height = 145;
			temp.width = 265;
			temp.x = 660;
			temp.y = 380;
			return temp;
		}

		private function contShuxing_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			contShuxing = temp;
			temp.name = "contShuxing";
			temp.height = 145;
			temp.width = 235;
			temp.x = 674;
			temp.y = 187;
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
			temp.x = 797;
			temp.y = 345;
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
			temp.x = 378;
			temp.y = 442;
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
			temp.x = 889;
			temp.y = 123;
			return temp;
		}

		private function roleCont_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			roleCont = temp;
			temp.name = "roleCont";
			temp.height = 394;
			temp.width = 250;
			temp.x = 348;
			temp.y = 102;
			return temp;
		}

		private function uiUpOK_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUpOK = temp;
			temp.name = "uiUpOK";
			temp.styleName = "ui/app/beibao/junjie/shengjiechenggong.png";
			temp.x = 330;
			temp.y = 84;
			return temp;
		}

		private function ui_zhandou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_zhandou = temp;
			temp.name = "ui_zhandou";
			temp.styleName = "ui/common/zhandouli1.png";
			temp.x = 672;
			temp.y = 98;
			return temp;
		}

	}
}