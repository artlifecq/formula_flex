package org.mokylin.skin.mainui.fubenzhuizong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LunJian_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var killName:feathers.controls.Label;

		public var lbHeadName:feathers.controls.Label;

		public var scroll_box:feathers.controls.Group;

		public var sec_info:feathers.controls.Label;

		public var sec_subbut1:feathers.controls.Button;

		public var sec_time:feathers.controls.Label;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;

		public var ui_head:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LunJian_Skin()
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
		private function __LunJian_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 335;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __LunJian_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __LunJian_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 11;
			temp.y = 12;
			return temp;
		}

		private function __LunJian_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 226;
			temp.y = 12;
			return temp;
		}

		private function __LunJian_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/lunjian/fbmb.png";
			temp.x = 3;
			temp.y = -1;
			return temp;
		}

		private function __LunJian_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/lunjian/tzdjs.png";
			temp.x = 3;
			temp.y = 59;
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

		private function killName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			killName = temp;
			temp.name = "killName";
			temp.htmlText = "击杀：<u>秦国士兵</u><font color='#cfc6ae'>(0/30)</font>";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 186;
			temp.x = 54;
			temp.y = 30;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "第一层";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.x = 93;
			temp.y = 6;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.height = 346;
			temp.width = 250;
			temp.x = 5;
			temp.y = 39;
			temp.elementsContent = [__LunJian_Skin_UIAsset5_i(),sec_subbut1_i(),sec_time_i(),sec_info_i(),__LunJian_Skin_UIAsset6_i(),killName_i()];
			return temp;
		}

		private function sec_info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_info = temp;
			temp.name = "sec_info";
			temp.height = 70;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "注意：倒计时结束时未击败对手或者挑战过程中死亡都视为挑战失败";
			temp.textAlign = "left";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 202;
			temp.x = 25;
			temp.y = 121;
			return temp;
		}

		private function sec_subbut1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_subbut1 = temp;
			temp.name = "sec_subbut1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "退出试炼";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 81;
			temp.y = 202;
			return temp;
		}

		private function sec_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			sec_time = temp;
			temp.name = "sec_time";
			temp.height = 18;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "00：22：08";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 174;
			temp.x = 56;
			temp.y = 82;
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
			temp.elementsContent = [ui_head_i(),lbHeadName_i(),__LunJian_Skin_UIAsset3_i(),__LunJian_Skin_UIAsset4_i(),scroll_box_i()];
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
			temp.elementsContent = [__LunJian_Skin_UIAsset1_i(),__LunJian_Skin_UIAsset2_i(),secondary_box_i()];
			return temp;
		}

		private function ui_head_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ui_head = temp;
			temp.name = "ui_head";
			temp.styleName = "ui/mainui/fubenzhuizong/lunjian/pt.png";
			temp.x = 58;
			temp.y = 4;
			return temp;
		}

	}
}