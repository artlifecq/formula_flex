package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.Radio;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.jingmai.Jianmai_Bianxian;
	import org.mokylin.skin.app.beibao.jingmai.Pro_JinMai_ZQ;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonChongmai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonDaimai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonDumai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonRenmai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonYangqiaomai;
	import org.mokylin.skin.app.beibao.jingmai.button.ButtonYinqiaomai;
	import org.mokylin.skin.app.beibao.jingmai.mc.UIMovieClipJingmai;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_you;
	import org.mokylin.skin.component.button.ButtonSkin_zuo;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;

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

		public var btnClose:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btn_hecheng:feathers.controls.Button;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;

		public var grpZhenqi:feathers.controls.Group;

		public var imgBg:feathers.controls.UIAsset;

		public var lb_zhenqi:feathers.controls.Label;

		public var mc_name:feathers.controls.UIMovieClip;

		public var proZhenqi:feathers.controls.ProgressBar;

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
			this.elementsContent = [imgBg_i(),__Jingmai_Skin_UIAsset3_i(),grpZhenqi_i(),mc_name_i(),btn_prev_i(),btn_next_i(),rdo_renmai_i(),rdo_dumai_i(),rdo_chongmai_i(),rdo_daimai_i(),rdo_yinqiaomai_i(),rdo_yangqiaomai_i(),__Jingmai_Skin_SkinnableContainer2_i(),btnClose_i(),btn_hecheng_i(),__Jingmai_Skin_UIAsset5_i(),NumZhanli_i(),__Jingmai_Skin_Label1_i(),btnOpen_i()];
			
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
			temp.gap = -6;
			temp.height = 25;
			temp.label = "629845";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhujuezhandouli;
			temp.width = 142;
			temp.x = 88;
			temp.y = 98;
			return temp;
		}

		private function __Jingmai_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "显示加成总属性";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 798;
			temp.y = 97;
			return temp;
		}

		private function __Jingmai_Skin_SkinnableContainer2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 442;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.scaleX = -1;
			var skin:StateSkin = new org.mokylin.skin.app.beibao.jingmai.Jianmai_Bianxian()
			temp.skin = skin
			temp.x = 213;
			temp.y = 88;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/shuxing/zqz.png";
			temp.x = 36;
			temp.y = 56;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/scrollbar/jdt2.png";
			temp.width = 243;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __Jingmai_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/zhandouli2.png";
			temp.x = 33;
			temp.y = 95;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zuo;
			temp.x = 902;
			temp.y = 96;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_you;
			temp.x = 902;
			temp.y = 95;
			return temp;
		}

		private function btn_hecheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_hecheng = temp;
			temp.name = "btn_hecheng";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "砭石合成";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xFFFFFF;
			temp.width = 88;
			temp.x = 836;
			temp.y = 124;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 714;
			temp.y = 251;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.x = 244;
			temp.y = 251;
			return temp;
		}

		private function grpZhenqi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpZhenqi = temp;
			temp.name = "grpZhenqi";
			temp.x = 83;
			temp.y = 57;
			temp.elementsContent = [__Jingmai_Skin_UIAsset4_i(),proZhenqi_i(),lb_zhenqi_i()];
			return temp;
		}

		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 443;
			temp.styleName = "ui/big_bg/beibao/jingmai/bg.jpg";
			temp.width = 912;
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function lb_zhenqi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_zhenqi = temp;
			temp.name = "lb_zhenqi";
			temp.text = "6215/4550";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 186;
			temp.x = 25;
			temp.y = 0;
			return temp;
		}

		private function mc_name_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mc_name = temp;
			temp.name = "mc_name";
			temp.autoPlay = false;
			temp.height = 109;
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.mc.UIMovieClipJingmai;
			temp.width = 57;
			temp.x = 640;
			temp.y = 124;
			return temp;
		}

		private function proZhenqi_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			proZhenqi = temp;
			temp.name = "proZhenqi";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.Pro_JinMai_ZQ;
			temp.value = 70;
			temp.width = 229;
			temp.x = 7;
			temp.y = 4;
			return temp;
		}

		private function rdo_chongmai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_chongmai = temp;
			temp.name = "rdo_chongmai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonChongmai;
			temp.x = 395;
			temp.y = 443;
			return temp;
		}

		private function rdo_daimai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_daimai = temp;
			temp.name = "rdo_daimai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonDaimai;
			temp.x = 482;
			temp.y = 443;
			return temp;
		}

		private function rdo_dumai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_dumai = temp;
			temp.name = "rdo_dumai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonDumai;
			temp.x = 309;
			temp.y = 443;
			return temp;
		}

		private function rdo_renmai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_renmai = temp;
			temp.name = "rdo_renmai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonRenmai;
			temp.x = 223;
			temp.y = 443;
			return temp;
		}

		private function rdo_yangqiaomai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_yangqiaomai = temp;
			temp.name = "rdo_yangqiaomai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonYangqiaomai;
			temp.x = 655;
			temp.y = 443;
			return temp;
		}

		private function rdo_yinqiaomai_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			rdo_yinqiaomai = temp;
			temp.name = "rdo_yinqiaomai";
			temp.groupName = "rdoJingmaiBtn";
			temp.styleClass = org.mokylin.skin.app.beibao.jingmai.button.ButtonYinqiaomai;
			temp.x = 568;
			temp.y = 443;
			return temp;
		}

	}
}