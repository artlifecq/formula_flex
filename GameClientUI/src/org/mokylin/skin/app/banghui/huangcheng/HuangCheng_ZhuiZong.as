package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item;
	import org.mokylin.skin.component.button.ButtonSkin_hide;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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
		public var bg:feathers.controls.UIAsset;

		public var btn_close:feathers.controls.Button;

		public var btn_open:feathers.controls.Button;

		public var grpFoot:feathers.controls.Group;

		public var grpList:feathers.controls.Group;

		public var item1:feathers.controls.SkinnableContainer;

		public var item2:feathers.controls.SkinnableContainer;

		public var item3:feathers.controls.SkinnableContainer;

		public var lbHeadName:feathers.controls.Label;

		public var lbInfo0:feathers.controls.Label;

		public var lbInfo1:feathers.controls.Label;

		public var lbInfo2:feathers.controls.Label;

		public var lbInfo3:feathers.controls.Label;

		public var lbInfo4:feathers.controls.Label;

		public var lbInfo5:feathers.controls.Label;

		public var lbJifen:feathers.controls.Label;

		public var lbJisha:feathers.controls.Label;

		public var lbPaiming:feathers.controls.Label;

		public var lbShangjiao:feathers.controls.Label;

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
			this.height = 527;
			this.width = 248;
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
			temp.styleName = "ui/app/banghui/huangcheng/jifen.png";
			temp.x = 193;
			temp.y = 8;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/renwuzhuizongbg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 35;
			temp.y = 15;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/mainui/fubenzhuizong/zs.png";
			temp.x = 210;
			temp.y = 15;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 101;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 25;
			temp.styleName = "ui/app/banghui/itembg2.png";
			temp.width = 239;
			temp.x = 4;
			temp.y = 4;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 238;
			temp.x = 5;
			temp.y = 52;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 238;
			temp.x = 5;
			temp.y = 75;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/paiming.png";
			temp.x = 17;
			temp.y = 8;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/mingzi.png";
			temp.x = 101;
			temp.y = 8;
			return temp;
		}

		private function __HuangCheng_ZhuiZong_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 527;
			temp.styleName = "ui/mainui/renwu/bg.png";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_close_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_close = temp;
			temp.name = "btn_close";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 221;
			temp.y = 8;
			return temp;
		}

		private function btn_open_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_open = temp;
			temp.name = "btn_open";
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_hide;
			temp.x = 243;
			temp.y = 8;
			return temp;
		}

		private function grpFoot_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpFoot = temp;
			temp.name = "grpFoot";
			temp.height = 450;
			temp.width = 248;
			temp.x = 0;
			temp.y = 80;
			temp.elementsContent = [lbInfo1_i(),lbInfo3_i(),lbInfo2_i(),lbInfo5_i(),lbInfo0_i(),lbInfo4_i(),sec_ico1_0_i(),sec_ico1_1_i(),sec_ico1_2_i(),sec_Exit_i(),line1_i(),grpList_i(),lbTime_i(),lbJifen_i(),lbPaiming_i(),lbJisha_i(),lbShangjiao_i()];
			return temp;
		}

		private function grpList_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpList = temp;
			temp.name = "grpList";
			temp.x = 0;
			temp.y = 201;
			temp.elementsContent = [__HuangCheng_ZhuiZong_UIAsset4_i(),__HuangCheng_ZhuiZong_UIAsset5_i(),__HuangCheng_ZhuiZong_UIAsset6_i(),__HuangCheng_ZhuiZong_UIAsset7_i(),item1_i(),item2_i(),item3_i(),__HuangCheng_ZhuiZong_UIAsset8_i(),__HuangCheng_ZhuiZong_UIAsset9_i(),__HuangCheng_ZhuiZong_UIAsset10_i()];
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

		private function item3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			item3 = temp;
			temp.name = "item3";
			temp.height = 20;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.huangcheng.HuangChengJiFen_Item()
			temp.skin = skin
			temp.width = 215;
			temp.x = 24;
			temp.y = 79;
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
			temp.y = 8;
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
			temp.x = 85;
			temp.y = 15;
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
			temp.width = 105;
			temp.x = 85;
			temp.y = 41;
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
			temp.x = 85;
			temp.y = 70;
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
			temp.width = 105;
			temp.x = 85;
			temp.y = 95;
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
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 104;
			temp.x = 85;
			temp.y = 150;
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
			temp.x = 85;
			temp.y = 120;
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
			temp.x = 17;
			temp.y = 310;
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
			temp.x = 17;
			temp.y = 350;
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
			temp.x = 17;
			temp.y = 330;
			return temp;
		}

		private function lbShangjiao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShangjiao = temp;
			temp.name = "lbShangjiao";
			temp.height = 17;
			temp.leading = 3;
			temp.letterSpacing = -1;
			temp.fontSize = 14;
			temp.text = "前往矿石上交区";
			temp.textAlign = "center";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.width = 182;
			temp.x = 36;
			temp.y = 177;
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
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 182;
			temp.x = 34;
			temp.y = 375;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 238;
			temp.x = 5;
			temp.y = 0;
			return temp;
		}

		private function scroll_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			scroll_box = temp;
			temp.name = "scroll_box";
			temp.x = 3;
			temp.y = 40;
			temp.layout = __HuangCheng_ZhuiZong_VerticalLayout1_i();
			temp.elementsContent = [];
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
			temp.x = 81;
			temp.y = 399;
			return temp;
		}

		private function sec_ico1_0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_0 = temp;
			temp.name = "sec_ico1_0";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 25;
			temp.y = 11;
			return temp;
		}

		private function sec_ico1_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_1 = temp;
			temp.name = "sec_ico1_1";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 25;
			temp.y = 65;
			return temp;
		}

		private function sec_ico1_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sec_ico1_2 = temp;
			temp.name = "sec_ico1_2";
			temp.styleName = "ui/mainui/renwu/tbk.png";
			temp.x = 25;
			temp.y = 119;
			return temp;
		}

		private function secondary_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			secondary_box = temp;
			temp.name = "secondary_box";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [lbHeadName_i(),__HuangCheng_ZhuiZong_UIAsset2_i(),__HuangCheng_ZhuiZong_UIAsset3_i()];
			return temp;
		}

		private function task_box_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			task_box = temp;
			temp.name = "task_box";
			temp.width = 248;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [bg_i(),__HuangCheng_ZhuiZong_UIAsset1_i(),secondary_box_i(),scroll_box_i(),grpFoot_i()];
			return temp;
		}

	}
}