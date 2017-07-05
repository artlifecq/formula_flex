package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shouhui;
	import org.mokylin.skin.component.button.ButtonSkin_zhankai;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HuangCheng_ZhuiZong extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var grpList:feathers.controls.Group;

		public var item1:feathers.controls.SkinnableContainer;

		public var item2:feathers.controls.SkinnableContainer;

		public var lbHeadName:feathers.controls.Label;

		public var lbInfo0:feathers.controls.Label;

		public var lbInfo1:feathers.controls.Label;

		public var lbInfo2:feathers.controls.Label;

		public var lbInfo3:feathers.controls.Label;

		public var lbInfo4:feathers.controls.Label;

		public var lbInfo5:feathers.controls.Label;

		public var lbJifen:feathers.controls.Label;

		public var lbJisha:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbName0:feathers.controls.Label;

		public var lbNum:feathers.controls.SkinnableContainer;

		public var lbPaiming:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var scroll_box:feathers.controls.Group;

		public var sec_Exit:feathers.controls.Button;

		public var sec_ico1_0:feathers.controls.UIAsset;

		public var sec_ico1_1:feathers.controls.UIAsset;

		public var sec_ico1_2:feathers.controls.UIAsset;

		public var secondary_box:feathers.controls.Group;

		public var task_box:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HuangCheng_ZhuiZong()
		{
			super();
			
			this.currentState = "normal";
			this.height = 541;
			this.width = 253;
			this.elementsContent = [task_box_i(),btn_open_i(),btn_close_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HuangCheng_ZhuiZong_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/mingzi.png";
			temp.x = 101;
			temp.y = 8;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/jifen.png";
			temp.x = 193;
			temp.y = 8;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 541;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/hengtiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 35;
			temp.y = 12;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 210;
			temp.y = 12;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 101;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/banghui/itembg2.png";
			temp.width = 239;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 238;
			temp.x = 5;
			temp.y = 52;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 238;
			temp.x = 5;
			temp.y = 75;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/paiming.png";
			temp.x = 17;
			temp.y = 8;
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

		private function grpList_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpList = temp;
			temp.name = "grpList";
			temp.x = -1;
			temp.y = 240;
			temp.elementsContent = [__HuangCheng_ZhuiZong_UIAsset5_i(),__HuangCheng_ZhuiZong_UIAsset6_i(),__HuangCheng_ZhuiZong_UIAsset7_i(),__HuangCheng_ZhuiZong_UIAsset8_i(),item1_i(),item2_i(),lbNum_i(),__HuangCheng_ZhuiZong_UIAsset9_i(),__HuangCheng_ZhuiZong_UIAsset10_i(),__HuangCheng_ZhuiZong_UIAsset11_i()];
			return temp;
		}

		private function item1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			item1 = temp;
			temp.name = "item1";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item()
			temp.skin = skin
			temp.width = 215;
			temp.x = 24;
			temp.y = 31;
			return temp;
		}

		private function item2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			item2 = temp;
			temp.name = "item2";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item()
			temp.skin = skin
			temp.width = 215;
			temp.x = 24;
			temp.y = 56;
			return temp;
		}

		private function lbHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeadName = temp;
			temp.name = "lbHeadName";
			temp.fontSize = 16;
			temp.text = "东卫争夺战";
			temp.textAlign = "center";
			temp.color = 0xFFF2B7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlue"];
			temp.width = 93;
			temp.x = 76;
			temp.y = 6;
			return temp;
		}

		private function lbInfo0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo0 = temp;
			temp.name = "lbInfo0";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "剩余:$";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.width = 92;
			temp.x = 74;
			temp.y = 64;
			return temp;
		}

		private function lbInfo1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo1 = temp;
			temp.name = "lbInfo1";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "前往采集";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 63;
			temp.x = 74;
			temp.y = 90;
			return temp;
		}

		private function lbInfo2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo2 = temp;
			temp.name = "lbInfo2";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "剩余:$";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 92;
			temp.x = 74;
			temp.y = 127;
			return temp;
		}

		private function lbInfo3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo3 = temp;
			temp.name = "lbInfo3";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "前往采集";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 63;
			temp.x = 74;
			temp.y = 152;
			return temp;
		}

		private function lbInfo4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo4 = temp;
			temp.name = "lbInfo4";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "00:15秒后刷出";
			temp.textAlign = "left";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 74;
			temp.y = 215;
			return temp;
		}

		private function lbInfo5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbInfo5 = temp;
			temp.name = "lbInfo5";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "剩余:$";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.width = 92;
			temp.x = 74;
			temp.y = 185;
			return temp;
		}

		private function lbJifen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJifen = temp;
			temp.name = "lbJifen";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "本人积分：$";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 182;
			temp.x = 18;
			temp.y = 352;
			return temp;
		}

		private function lbJisha_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJisha = temp;
			temp.name = "lbJisha";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "累计击杀玩家数：$";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 182;
			temp.x = 18;
			temp.y = 400;
			return temp;
		}

		private function lbName0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName0 = temp;
			temp.name = "lbName0";
			temp.fontSize = 14;
			temp.text = "帮派名称七个字总积分:100000/200000";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 0;
			temp.y = 24;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 14;
			temp.text = "帮派名称七个字总积分:100000/200000";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 247;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function lbNum_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			lbNum = temp;
			temp.name = "lbNum";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item()
			temp.skin = skin
			temp.width = 215;
			temp.x = 24;
			temp.y = 79;
			return temp;
		}

		private function lbPaiming_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiming = temp;
			temp.name = "lbPaiming";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "本人排名：$";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 182;
			temp.x = 18;
			temp.y = 376;
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
			temp.text = "活动结束倒计时：00:22:08";
			temp.textAlign = "center";
			temp.color = 0xD23735;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 182;
			temp.x = 33;
			temp.y = 434;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 238;
			temp.x = 4;
			temp.y = 49;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.x = 3;
			temp.y = 37;
			temp.elementsContent = [lbInfo1_i(),lbInfo3_i(),lbInfo2_i(),lbInfo5_i(),lbInfo0_i(),lbInfo4_i(),lbName_i(),lbName0_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_Exit_i(),line1_i(),grpList_i(),lbTime_i(),lbJifen_i(),lbPaiming_i(),lbJisha_i()];
			return temp;
		}

		private function sec_Exit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sec_Exit = temp;
			temp.name = "sec_Exit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出活动";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xE1D4A9;
			temp.width = 86;
			temp.x = 80;
			temp.y = 462;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 14;
			temp.y = 60;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 14;
			temp.y = 122;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 14;
			temp.y = 184;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [lbHeadName_i(),__HuangCheng_ZhuiZong_UIAsset3_i(),__HuangCheng_ZhuiZong_UIAsset4_i(),scroll_box_i()];
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
			temp.elementsContent = [__HuangCheng_ZhuiZong_UIAsset1_i(),__HuangCheng_ZhuiZong_UIAsset2_i(),secondary_box_i()];
			return temp;
		}

	}
}