package org.mokylin.skin.app.hunyin
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.hunyin.FuQiFuBen_Item;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuQiFuBen_ZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var head_left:feathers.controls.UIAsset;

		public var head_right:feathers.controls.UIAsset;

		public var killbut_0:feathers.controls.SkinnableContainer;

		public var lbMiaoshu:feathers.controls.Label;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico2_0:feathers.controls.UIAsset;

		public var sec_ico2_1:feathers.controls.UIAsset;

		public var sec_ico2_2:feathers.controls.UIAsset;

		public var sec_info:feathers.controls.Label;

		public var sec_navi1:feathers.controls.Label;

		public var sec_navi2:feathers.controls.UIAsset;

		public var sec_navi3:feathers.controls.UIAsset;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_subbut2:feathers.controls.Button;

		public var task_box:feathers.controls.Group;

		public var uiXiangxi:feathers.controls.UIAsset;

		public var ui_bg:feathers.controls.UIAsset;

		public var ui_head:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuQiFuBen_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 333;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuQiFuBen_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
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

		private function head_left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_left = temp;
			temp.name = "head_left";
			temp.height = 10;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 40;
			temp.y = 12;
			return temp;
		}

		private function head_right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_right = temp;
			temp.name = "head_right";
			temp.height = 10;
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.width = 45;
			temp.x = 213;
			temp.y = 12;
			return temp;
		}

		private function killbut_0_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			killbut_0 = temp;
			temp.name = "killbut_0";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.hunyin.FuQiFuBen_Item()
			temp.skin = skin
			temp.width = 169;
			temp.x = 50;
			temp.y = 79;
			return temp;
		}

		private function lbMiaoshu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMiaoshu = temp;
			temp.name = "lbMiaoshu";
			temp.text = "此处为当前阶段的剧情描述文字，";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 215;
			temp.x = 21;
			temp.y = 58;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 127;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 127;
			return temp;
		}

		private function sec_ico2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_0 = temp;
			temp.name = "sec_ico2_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 21;
			temp.y = 203;
			return temp;
		}

		private function sec_ico2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_1 = temp;
			temp.name = "sec_ico2_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 73;
			temp.y = 203;
			return temp;
		}

		private function sec_ico2_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico2_2 = temp;
			temp.name = "sec_ico2_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 125;
			temp.y = 203;
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "副本剩余时间：00：22：08";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 209;
			temp.x = 23;
			temp.y = 259;
			return temp;
		}

		private function sec_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_navi1 = temp;
			temp.name = "sec_navi1";
			temp.htmlText = "[阶段1]";
			temp.color = 0xE8C958;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 33;
			return temp;
		}

		private function sec_navi2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_navi2 = temp;
			temp.name = "sec_navi2";
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/tgjl.png";
			temp.x = 3;
			temp.y = 105;
			return temp;
		}

		private function sec_navi3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_navi3 = temp;
			temp.name = "sec_navi3";
			temp.styleName = "ui/app/hunyin/fuqitongguanjiangli.png";
			temp.x = 3;
			temp.y = 181;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 36;
			temp.label = "邀请伴侣";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 27;
			temp.y = 284;
			return temp;
		}

		private function sec_subbut2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut2 = temp;
			temp.name = "sec_subbut2";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.height = 36;
			temp.label = "退出副本";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xEAEABC;
			temp.width = 88;
			temp.x = 141;
			temp.y = 284;
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [ui_bg_i(),__FuQiFuBen_ZhuiZong_UIAsset1_i(),ui_head_i(),head_left_i(),head_right_i(),uiXiangxi_i(),sec_navi1_i(),killbut_0_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico2_0_i(),sec_ico2_1_i(),sec_ico2_2_i(),sec_subbut1_i(),sec_subbut2_i(),sec_info_i(),sec_navi2_i(),sec_navi3_i(),lbMiaoshu_i()];
			return temp;
		}

		private function uiXiangxi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiXiangxi = temp;
			temp.name = "uiXiangxi";
			temp.styleName = "ui/mainui/fubenzhuizong/fuben/wenhao.png";
			temp.x = 7;
			temp.y = 6;
			return temp;
		}

		private function ui_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_bg = temp;
			temp.name = "ui_bg";
			temp.height = 333;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function ui_head_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_head = temp;
			temp.name = "ui_head";
			temp.styleName = "ui/app/hunyin/fuqifuben2.png";
			temp.x = 91;
			temp.y = 5;
			return temp;
		}

	}
}