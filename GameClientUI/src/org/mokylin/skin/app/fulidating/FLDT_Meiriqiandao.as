package org.mokylin.skin.app.fulidating
{
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.app.fulidating.number.UINumberShuzi;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_putong3;
	import org.mokylin.skin.component.button.ButtonSkin_putong4;
	import org.mokylin.skin.component.button.ButtonSkin_putong5;
	import org.mokylin.skin.component.tabbar.TabBarSkin_pack;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FLDT_Meiriqiandao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnLingjiang:feathers.controls.Button;

		public var btnLingqu:feathers.controls.Button;

		public var btnQiandao:feathers.controls.Button;

		public var btnVIP:feathers.controls.Button;

		public var days_container:feathers.controls.SkinnableContainer;

		public var grpDate:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var lb0:feathers.controls.Label;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var lb3:feathers.controls.Label;

		public var lb4:feathers.controls.Label;

		public var lb5:feathers.controls.Label;

		public var lb6:feathers.controls.Label;

		public var lbDate:feathers.controls.Label;

		public var num:feathers.controls.UINumber;

		public var qicon1:feathers.controls.UIAsset;

		public var qicon2:feathers.controls.UIAsset;

		public var tab_pack:feathers.controls.TabBar;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FLDT_Meiriqiandao()
		{
			super();
			
			this.currentState = "normal";
			this.width = 768;
			this.elementsContent = [__FLDT_Meiriqiandao_UIAsset1_i(),__FLDT_Meiriqiandao_UIAsset2_i(),__FLDT_Meiriqiandao_UIAsset3_i(),__FLDT_Meiriqiandao_Group1_i(),grpDate_i(),__FLDT_Meiriqiandao_UIAsset11_i(),__FLDT_Meiriqiandao_UIAsset12_i(),qicon1_i(),__FLDT_Meiriqiandao_UIAsset13_i(),qicon2_i(),btnQiandao_i(),btnLingqu_i(),tab_pack_i(),__FLDT_Meiriqiandao_UIAsset14_i(),icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i(),btnLingjiang_i(),__FLDT_Meiriqiandao_UIAsset15_i(),__FLDT_Meiriqiandao_Label1_i(),btnVIP_i(),lbDate_i(),days_container_i(),__FLDT_Meiriqiandao_Group2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FLDT_Meiriqiandao_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['签到2次','签到5次','签到10次','签到17次','签到26次'];
			return temp;
		}

		private function __FLDT_Meiriqiandao_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 41;
			temp.elementsContent = [__FLDT_Meiriqiandao_UIAsset4_i(),__FLDT_Meiriqiandao_UIAsset5_i(),__FLDT_Meiriqiandao_UIAsset6_i(),__FLDT_Meiriqiandao_UIAsset7_i(),__FLDT_Meiriqiandao_UIAsset8_i(),__FLDT_Meiriqiandao_UIAsset9_i(),__FLDT_Meiriqiandao_UIAsset10_i()];
			return temp;
		}

		private function __FLDT_Meiriqiandao_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.height = 30;
			temp.width = 200;
			temp.x = 544;
			temp.y = 5;
			temp.layout = __FLDT_Meiriqiandao_HorizontalLayout2_i();
			temp.elementsContent = [__FLDT_Meiriqiandao_UIAsset16_i(),num_i()];
			return temp;
		}

		private function __FLDT_Meiriqiandao_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 2;
			return temp;
		}

		private function __FLDT_Meiriqiandao_HorizontalLayout2_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.horizontalAlign = "right";
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __FLDT_Meiriqiandao_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = 0;
			temp.text = "您暂未激活至尊VIP";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 510;
			temp.y = 476;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/fyx.png";
			temp.x = 486;
			temp.y = 8;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/qdbg.jpg";
			temp.x = 571;
			temp.y = 41;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/word/qdjkhd.png";
			temp.x = 570;
			temp.y = 49;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/word/vipewlq.png";
			temp.x = 570;
			temp.y = 197;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/qtxia.jpg";
			temp.x = 2;
			temp.y = 374;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/word/bjvipkzdqd.png";
			temp.x = 14;
			temp.y = 473;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/word/byljqdcs.png";
			temp.x = 450;
			temp.y = -104;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/qtshang.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_3.png";
			temp.x = 246;
			temp.y = 12;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/common/wenshi/huawen_3.png";
			temp.x = 470;
			temp.y = 12;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/qd_xiaodi.png";
			temp.width = 570;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/fyx.png";
			temp.x = 81;
			temp.y = 8;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/fyx.png";
			temp.x = 163;
			temp.y = 8;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/fyx.png";
			temp.x = 244;
			temp.y = 8;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/fyx.png";
			temp.x = 324;
			temp.y = 8;
			return temp;
		}

		private function __FLDT_Meiriqiandao_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fulidating/fyx.png";
			temp.x = 405;
			temp.y = 8;
			return temp;
		}

		private function btnLingjiang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingjiang = temp;
			temp.name = "btnLingjiang";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 110;
			temp.x = 604;
			temp.y = 399;
			return temp;
		}

		private function btnLingqu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingqu = temp;
			temp.name = "btnLingqu";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领 取";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong5;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 614;
			temp.y = 303;
			return temp;
		}

		private function btnQiandao_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQiandao = temp;
			temp.name = "btnQiandao";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "签 到";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xEAEABC;
			temp.width = 90;
			temp.x = 614;
			temp.y = 161;
			return temp;
		}

		private function btnVIP_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnVIP = temp;
			temp.name = "btnVIP";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "成为VIP";
			temp.labelOffsetY = 1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong4;
			temp.color = 0xEAEABC;
			temp.x = 645;
			temp.y = 471;
			return temp;
		}

		private function days_container_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			days_container = temp;
			temp.name = "days_container";
			temp.height = 266;
			temp.width = 569;
			temp.x = 1;
			temp.y = 78;
			return temp;
		}

		private function grpDate_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpDate = temp;
			temp.name = "grpDate";
			temp.x = 17;
			temp.y = 49;
			temp.elementsContent = [lb0_i(),lb1_i(),lb2_i(),lb3_i(),lb4_i(),lb5_i(),lb6_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 24;
			temp.y = 383;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 106;
			temp.y = 383;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 188;
			temp.y = 383;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 271;
			temp.y = 383;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 353;
			temp.y = 383;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 435;
			temp.y = 383;
			return temp;
		}

		private function lb0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb0 = temp;
			temp.name = "lb0";
			temp.fontSize = 16;
			temp.text = "星期日";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.fontSize = 16;
			temp.text = "星期一";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 82;
			temp.y = 0;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.fontSize = 16;
			temp.text = "星期二";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 164;
			temp.y = 0;
			return temp;
		}

		private function lb3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb3 = temp;
			temp.name = "lb3";
			temp.fontSize = 16;
			temp.text = "星期三";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 244;
			temp.y = 0;
			return temp;
		}

		private function lb4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb4 = temp;
			temp.name = "lb4";
			temp.fontSize = 16;
			temp.text = "星期四";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 324;
			temp.y = 0;
			return temp;
		}

		private function lb5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb5 = temp;
			temp.name = "lb5";
			temp.fontSize = 16;
			temp.text = "星期五";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 404;
			temp.y = 0;
			return temp;
		}

		private function lb6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb6 = temp;
			temp.name = "lb6";
			temp.fontSize = 16;
			temp.text = "星期六";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 485;
			temp.y = 0;
			return temp;
		}

		private function lbDate_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDate = temp;
			temp.name = "lbDate";
			temp.leading = 0;
			temp.letterSpacing = 1;
			temp.fontSize = 16;
			temp.text = "2017年8月";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 317;
			temp.y = 9;
			return temp;
		}

		private function num_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			num = temp;
			temp.name = "num";
			temp.gap = 0;
			temp.height = 25;
			temp.label = "1";
			temp.styleClass = org.mokylin.skin.app.fulidating.number.UINumberShuzi;
			temp.textAlign = "left";
			temp.width = 50;
			temp.x = 583;
			temp.y = -106;
			return temp;
		}

		private function qicon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qicon1 = temp;
			temp.name = "qicon1";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 621;
			temp.y = 79;
			return temp;
		}

		private function qicon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qicon2 = temp;
			temp.name = "qicon2";
			temp.styleName = "ui/app/fulidating/tubiaokuang.png";
			temp.x = 621;
			temp.y = 227;
			return temp;
		}

		private function tab_pack_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tab_pack = temp;
			temp.name = "tab_pack";
			temp.btnWidth = 97;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarSkin_pack;
			temp.width = 331;
			temp.x = 11;
			temp.y = 346;
			temp.layout = __FLDT_Meiriqiandao_HorizontalLayout1_i();
			temp.dataProvider = __FLDT_Meiriqiandao_ArrayCollection1_i();
			return temp;
		}

	}
}