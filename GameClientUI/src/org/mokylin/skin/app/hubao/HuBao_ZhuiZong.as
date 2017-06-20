package org.mokylin.skin.app.hubao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuBao_ZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var btn_shuoming:feathers.controls.Button;

		public var icons:feathers.controls.UIAsset;

		public var ionbg:feathers.controls.UIAsset;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var lb3:feathers.controls.Label;

		public var lbHeadName:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbTaget:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var scroll_box:feathers.controls.Group;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuBao_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 297;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuBao_ZhuiZong_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "目的地：";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 82;
			temp.x = 20;
			temp.y = 113;
			return temp;
		}

		private function __HuBao_ZhuiZong_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "剩余时间：";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 74;
			temp.x = 20;
			temp.y = 138;
			return temp;
		}

		private function __HuBao_ZhuiZong_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "本次护送对象：<font color='#5DBD37'>(进行中)</font>";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 6;
			return temp;
		}

		private function __HuBao_ZhuiZong_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "护送第一阶段奖励：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 141;
			temp.x = 19;
			temp.y = 163;
			return temp;
		}

		private function __HuBao_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 297;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuBao_ZhuiZong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuBao_ZhuiZong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 35;
			temp.y = 12;
			return temp;
		}

		private function __HuBao_ZhuiZong_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 210;
			temp.y = 12;
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

		private function btn_shuoming_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_shuoming = temp;
			temp.name = "btn_shuoming";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 208;
			temp.y = 0;
			return temp;
		}

		private function icons_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icons = temp;
			temp.name = "icons";
			temp.styleName = "ui/app/hubao/icon/inlvyi.png";
			temp.x = 20;
			temp.y = 35;
			return temp;
		}

		private function ionbg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ionbg = temp;
			temp.name = "ionbg";
			temp.styleName = "ui/app/hubao/quan.png";
			temp.x = 12;
			temp.y = 24;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.fontSize = 12;
			temp.text = "999999";
			temp.textAlign = "right";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 44;
			temp.x = 25;
			temp.y = 224;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.fontSize = 12;
			temp.text = "999999";
			temp.textAlign = "right";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 44;
			temp.x = 77;
			temp.y = 224;
			return temp;
		}

		private function lb3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb3 = temp;
			temp.name = "lb3";
			temp.fontSize = 12;
			temp.text = "999999";
			temp.textAlign = "right";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 44;
			temp.x = 129;
			temp.y = 224;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "江湖护宝";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 93;
			temp.x = 76;
			temp.y = 6;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "金缕玉衣";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 123;
			temp.y = 57;
			return temp;
		}

		private function lbTaget_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTaget = temp;
			temp.name = "lbTaget";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "目的地：";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 145;
			temp.x = 90;
			temp.y = 113;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "剩余时间：";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = false;
			temp.width = 144;
			temp.x = 90;
			temp.y = 138;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.height = 247;
			temp.width = 234;
			temp.x = 12;
			temp.y = 37;
			temp.elementsContent = [__HuBao_ZhuiZong_Label1_i(),__HuBao_ZhuiZong_Label2_i(),lbTaget_i(),lbTime_i(),lbName_i(),ionbg_i(),__HuBao_ZhuiZong_Label3_i(),icons_i(),__HuBao_ZhuiZong_Label4_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),lb1_i(),lb2_i(),lb3_i(),btn_shuoming_i()];
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 23;
			temp.y = 193;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 75;
			temp.y = 193;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 127;
			temp.y = 193;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.height = 287;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [lbHeadName_i(),__HuBao_ZhuiZong_UIAsset3_i(),__HuBao_ZhuiZong_UIAsset4_i(),scroll_box_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.height = 289;
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__HuBao_ZhuiZong_UIAsset1_i(),__HuBao_ZhuiZong_UIAsset2_i(),secondary_box_i()];
			return temp;
		}

	}
}