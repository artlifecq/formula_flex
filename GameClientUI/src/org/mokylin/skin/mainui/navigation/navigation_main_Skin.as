package org.mokylin.skin.mainui.navigation
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_banghui;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_beibao;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_juese;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_wuxue;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhanhun;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhuangbei;
	import org.mokylin.skin.mainui.navigation.button.ButtonSkin_zuoqi;
	import org.mokylin.skin.mainui.navigation.mc.UIMovieClipQipaoNumber;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class navigation_main_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_banghui:feathers.controls.Button;

		public var btn_beibao:feathers.controls.Button;

		public var btn_close:feathers.controls.Button;

		public var btn_juese:feathers.controls.Button;

		public var btn_lunjian:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_shangcheng:feathers.controls.Button;

		public var btn_wuxue:feathers.controls.Button;

		public var btn_zhanhun:feathers.controls.Button;

		public var btn_zhuangbei:feathers.controls.Button;

		public var btn_zuoqi:feathers.controls.Button;

		public var btns:feathers.controls.Group;

		public var qi_bg:feathers.controls.UIAsset;

		public var qi_mc:feathers.controls.UIMovieClip;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function navigation_main_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 70;
			this.width = 465;
			this.elementsContent = [btns_i(),btn_close_i(),btn_open_i(),qi_bg_i(),qi_mc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __navigation_main_Skin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = -4;
			temp.verticalAlign = "middle";
			return temp;
		}

		private function btn_banghui_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_banghui = temp;
			temp.name = "btn_banghui";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_banghui;
			temp.x = 330;
			temp.y = 17;
			return temp;
		}

		private function btn_beibao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_beibao = temp;
			temp.name = "btn_beibao";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_beibao;
			temp.x = 152;
			temp.y = 17;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shouhui;
			temp.x = 445;
			temp.y = 23;
			return temp;
		}

		private function btn_juese_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_juese = temp;
			temp.name = "btn_juese";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_juese;
			temp.x = 108;
			temp.y = 17;
			return temp;
		}

		private function btn_lunjian_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_lunjian = temp;
			temp.name = "btn_lunjian";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhanhun;
			temp.x = 63;
			temp.y = 17;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_zhankai;
			temp.x = 445;
			temp.y = 23;
			return temp;
		}

		private function btn_shangcheng_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shangcheng = temp;
			temp.name = "btn_shangcheng";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_shangcheng;
			temp.x = 372;
			temp.y = 0;
			return temp;
		}

		private function btn_wuxue_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_wuxue = temp;
			temp.name = "btn_wuxue";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_wuxue;
			temp.x = 286;
			temp.y = 17;
			return temp;
		}

		private function btn_zhanhun_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zhanhun = temp;
			temp.name = "btn_zhanhun";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhanhun;
			temp.x = 15;
			temp.y = 17;
			return temp;
		}

		private function btn_zhuangbei_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zhuangbei = temp;
			temp.name = "btn_zhuangbei";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_zhuangbei;
			temp.x = 241;
			temp.y = 17;
			return temp;
		}

		private function btn_zuoqi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_zuoqi = temp;
			temp.name = "btn_zuoqi";
			temp.styleClass = org.mokylin.skin.mainui.navigation.button.ButtonSkin_zuoqi;
			temp.x = 197;
			temp.y = 17;
			return temp;
		}

		private function btns_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btns = temp;
			temp.name = "btns";
			temp.height = 70;
			temp.width = 442;
			temp.x = -1;
			temp.y = 0;
			temp.layout = __navigation_main_Skin_HorizontalLayout1_i();
			temp.elementsContent = [btn_lunjian_i(),btn_zhanhun_i(),btn_juese_i(),btn_beibao_i(),btn_zuoqi_i(),btn_zhuangbei_i(),btn_wuxue_i(),btn_banghui_i(),btn_shangcheng_i()];
			return temp;
		}

		private function qi_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qi_bg = temp;
			temp.name = "qi_bg";
			temp.styleName = "ui/common/tubiao/qipao.png";
			temp.x = 181;
			temp.y = 7;
			return temp;
		}

		private function qi_mc_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			qi_mc = temp;
			temp.name = "qi_mc";
			temp.autoPlay = false;
			temp.height = 14;
			temp.styleClass = org.mokylin.skin.mainui.navigation.mc.UIMovieClipQipaoNumber;
			temp.width = 13;
			temp.x = 183;
			temp.y = 8;
			return temp;
		}

	}
}