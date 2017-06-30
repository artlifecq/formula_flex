package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonChongmai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonDaimai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonDumai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonJiantou;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonRenmai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonYangqiaomai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonYinqiaomai;
	import org.mokylin.skin.app.beibao.jingmai.mc.UIMovieClipJingmai;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Jingmai_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var NumZhanli:feathers.controls.UINumber;

		public var btn_hecheng:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var chk_dengji:feathers.controls.Check;

		public var chk_shuxing:feathers.controls.Check;

		public var imgBg:feathers.controls.UIAsset;

		public var lb_zhenqi:feathers.controls.Label;

		public var mc_name:feathers.controls.UIMovieClip;

		public var rdo_chongmai:feathers.controls.Radio;

		public var rdo_daimai:feathers.controls.Radio;

		public var rdo_dumai:feathers.controls.Radio;

		public var rdo_renmai:feathers.controls.Radio;

		public var rdo_yangqiaomai:feathers.controls.Radio;

		public var rdo_yinqiaomai:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jingmai_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [imgBg_i(),lb_zhenqi_i(),__Jingmai_Skin_UIAsset2_i(),__Jingmai_Skin_UIAsset3_i(),NumZhanli_i(),__Jingmai_Skin_UIAsset4_i(),mc_name_i(),chk_shuxing_i(),chk_dengji_i(),btn_hecheng_i(),btn_prev_i(),btn_next_i(),rdo_renmai_i(),rdo_dumai_i(),rdo_chongmai_i(),rdo_daimai_i(),rdo_yinqiaomai_i(),rdo_yangqiaomai_i(),__Jingmai_Skin_UIAsset5_i()];
			
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
			temp.x = 89;
			temp.y = 95;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/zhenqi.png";
			temp.x = 53;
			temp.y = 57;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zdl2.png";
			temp.x = 18;
			temp.y = 85;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/di.png";
			temp.x = 690;
			temp.y = 132;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/fengexian.png";
			temp.x = 178;
			temp.y = 448;
			return temp;
		}

		private function btn_hecheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "砭石合成";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xFFFFFF;
			temp.width = 90;
			temp.x = 826;
			temp.y = 126;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonJiantou;
			temp.x = 720;
			temp.y = 299;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonJiantou;
			temp.x = 245;
			temp.y = 299;
			return temp;
		}

		private function chk_dengji_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_dengji = temp;
			temp.name = "chk_dengji";
			temp.label = "显示穴位层数/等级";
			temp.labelOffsetX = -1;
			temp.letterSpacing = -2;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.width = 134;
			temp.x = 792;
			temp.y = 97;
			return temp;
		}

		private function chk_shuxing_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_shuxing = temp;
			temp.name = "chk_shuxing";
			temp.label = "显示加成总属性";
			temp.labelOffsetX = -1;
			temp.letterSpacing = -2;
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.width = 118;
			temp.x = 664;
			temp.y = 97;
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 450;
			temp.styleName = "ui/big_bg/beibao/jingmai/bg.jpg";
			temp.width = 911;
			temp.x = 22;
			temp.y = 88;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.text = "62154550";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 117;
			temp.x = 94;
			temp.y = 58;
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.autoPlay = false;
			temp.height = 133;
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.mc.UIMovieClipJingmai;
			temp.width = 52;
			temp.x = 691;
			temp.y = 132;
			return temp;
		}

		private function rdo_chongmai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_chongmai = temp;
			temp.name = "rdo_chongmai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonChongmai;
			temp.x = 429;
			temp.y = 457;
			return temp;
		}

		private function rdo_daimai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_daimai = temp;
			temp.name = "rdo_daimai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonDaimai;
			temp.x = 490;
			temp.y = 457;
			return temp;
		}

		private function rdo_dumai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_dumai = temp;
			temp.name = "rdo_dumai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonDumai;
			temp.x = 367;
			temp.y = 457;
			return temp;
		}

		private function rdo_renmai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_renmai = temp;
			temp.name = "rdo_renmai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonRenmai;
			temp.x = 306;
			temp.y = 457;
			return temp;
		}

		private function rdo_yangqiaomai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_yangqiaomai = temp;
			temp.name = "rdo_yangqiaomai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonYangqiaomai;
			temp.x = 613;
			temp.y = 457;
			return temp;
		}

		private function rdo_yinqiaomai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_yinqiaomai = temp;
			temp.name = "rdo_yinqiaomai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonYinqiaomai;
			temp.x = 552;
			temp.y = 457;
			return temp;
		}

	}
}