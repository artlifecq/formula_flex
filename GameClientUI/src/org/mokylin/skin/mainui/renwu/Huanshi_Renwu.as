package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Huanshi_Renwu extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var ioc_1_0:feathers.controls.UIAsset;

		public var ioc_1_1:feathers.controls.UIAsset;

		public var ioc_1_2:feathers.controls.UIAsset;

		public var ioc_1_3:feathers.controls.UIAsset;

		public var ioc_2_0:feathers.controls.UIAsset;

		public var ioc_2_1:feathers.controls.UIAsset;

		public var ioc_2_2:feathers.controls.UIAsset;

		public var ioc_2_3:feathers.controls.UIAsset;

		public var lab_navi1:feathers.controls.Label;

		public var lab_navi2:feathers.controls.Label;

		public var lab_txt1:feathers.controls.Label;

		public var lab_txt2:feathers.controls.Label;

		public var lab_txt3:feathers.controls.Label;

		public var lb_time:feathers.controls.Label;

		public var lb_wancheng:feathers.controls.Label;

		public var lb_yinliang:feathers.controls.Label;

		public var lb_yuanbao:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;

		public var one_but:feathers.controls.Button;

		public var three_but:feathers.controls.Button;

		public var two_but:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Huanshi_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 376;
			this.width = 298;
			this.elementsContent = [bg_i(),__Huanshi_Renwu_UIAsset1_i(),lbl_title_i(),btnClose_i(),__Huanshi_Renwu_UIAsset2_i(),lb_wancheng_i(),lab_navi1_i(),ioc_1_0_i(),ioc_1_1_i(),ioc_1_2_i(),ioc_1_3_i(),lab_navi2_i(),ioc_2_0_i(),ioc_2_1_i(),ioc_2_2_i(),ioc_2_3_i(),lab_txt1_i(),__Huanshi_Renwu_UIAsset3_i(),__Huanshi_Renwu_UIAsset4_i(),lb_yuanbao_i(),lab_txt2_i(),__Huanshi_Renwu_UIAsset5_i(),__Huanshi_Renwu_UIAsset6_i(),lb_yinliang_i(),__Huanshi_Renwu_UIAsset7_i(),lab_txt3_i(),lb_time_i(),three_but_i(),two_but_i(),one_but_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Huanshi_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 13;
			temp.left = 16;
			temp.right = 14;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.top = 42;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.horizontalCenter = 0;
			temp.styleName = "ui/mainui/renwu/tiao.png";
			temp.y = 48;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao3.png";
			temp.x = 68;
			temp.y = 235;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 66;
			temp.y = 232;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao3.png";
			temp.x = 68;
			temp.y = 276;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/yinzi_24.png";
			temp.x = 66;
			temp.y = 273;
			return temp;
		}

		private function __Huanshi_Renwu_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/tiao3.png";
			temp.x = 67;
			temp.y = 314;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.top = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.right = 6;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.top = 6;
			return temp;
		}

		private function ioc_1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_0 = temp;
			temp.name = "ioc_1_0";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 25;
			temp.y = 98;
			return temp;
		}

		private function ioc_1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_1 = temp;
			temp.name = "ioc_1_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 77;
			temp.y = 98;
			return temp;
		}

		private function ioc_1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_2 = temp;
			temp.name = "ioc_1_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 130;
			temp.y = 98;
			return temp;
		}

		private function ioc_1_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_1_3 = temp;
			temp.name = "ioc_1_3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 182;
			temp.y = 98;
			return temp;
		}

		private function ioc_2_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_2_0 = temp;
			temp.name = "ioc_2_0";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 25;
			temp.y = 174;
			return temp;
		}

		private function ioc_2_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_2_1 = temp;
			temp.name = "ioc_2_1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 77;
			temp.y = 174;
			return temp;
		}

		private function ioc_2_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_2_2 = temp;
			temp.name = "ioc_2_2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 130;
			temp.y = 174;
			return temp;
		}

		private function ioc_2_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ioc_2_3 = temp;
			temp.name = "ioc_2_3";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 182;
			temp.y = 174;
			return temp;
		}

		private function lab_navi1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_navi1 = temp;
			temp.name = "lab_navi1";
			temp.text = "本环任务奖励：";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 79;
			return temp;
		}

		private function lab_navi2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_navi2 = temp;
			temp.name = "lab_navi2";
			temp.htmlText = "今日完成<font color='#5DBD37'>5</font>环后，额外奖励";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 32;
			temp.y = 155;
			return temp;
		}

		private function lab_txt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_txt1 = temp;
			temp.name = "lab_txt1";
			temp.text = "花费";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 31;
			temp.y = 236;
			return temp;
		}

		private function lab_txt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_txt2 = temp;
			temp.name = "lab_txt2";
			temp.text = "花费";
			temp.color = 0xBEA757;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 31;
			temp.y = 277;
			return temp;
		}

		private function lab_txt3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_txt3 = temp;
			temp.name = "lab_txt3";
			temp.text = "免费领取";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 90;
			temp.y = 315;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.text = "n秒后自动领取奖励";
			temp.textAlign = "center";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 139;
			temp.x = 79;
			temp.y = 341;
			return temp;
		}

		private function lb_wancheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_wancheng = temp;
			temp.name = "lb_wancheng";
			temp.horizontalCenter = 5.5;
			temp.text = "已完成环数：第2/20环";
			temp.color = 0x25931B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.y = 51;
			return temp;
		}

		private function lb_yinliang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yinliang = temp;
			temp.name = "lb_yinliang";
			temp.text = "9999999";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 91;
			temp.y = 277;
			return temp;
		}

		private function lb_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yuanbao = temp;
			temp.name = "lb_yuanbao";
			temp.text = "9999999";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 78;
			temp.x = 91;
			temp.y = 236;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.horizontalCenter = -1;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "环式任务";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 182;
			temp.y = 11;
			return temp;
		}

		private function one_but_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			one_but = temp;
			temp.name = "one_but";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "单倍领取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.color = 0xE1D4A9;
			temp.width = 79;
			temp.x = 191;
			temp.y = 305;
			return temp;
		}

		private function three_but_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			three_but = temp;
			temp.name = "three_but";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "三倍领取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 73;
			temp.x = 193;
			temp.y = 230;
			return temp;
		}

		private function two_but_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			two_but = temp;
			temp.name = "two_but";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "两倍领取";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 73;
			temp.x = 193;
			temp.y = 269;
			return temp;
		}

	}
}