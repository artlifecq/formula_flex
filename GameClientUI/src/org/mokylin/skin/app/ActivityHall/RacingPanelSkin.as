package org.mokylin.skin.app.ActivityHall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_d_daanniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RacingPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnApply:feathers.controls.Button;

		public var lbCountryLeft:feathers.controls.Label;

		public var lbCountryRight:feathers.controls.Label;

		public var lbIntroduce:feathers.controls.Label;

		public var lbLeftTime:feathers.controls.Label;

		public var lbNameLeft:feathers.controls.Label;

		public var lbNameRight:feathers.controls.Label;

		public var lbPrize0:feathers.controls.Label;

		public var lbPrize1:feathers.controls.Label;

		public var lbPrize2:feathers.controls.Label;

		public var lbPrize3:feathers.controls.Label;

		public var lbPrize4:feathers.controls.Label;

		public var lbPrize5:feathers.controls.Label;

		public var lbReward:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RacingPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 486;
			this.width = 764;
			this.elementsContent = [__RacingPanelSkin_Group1_i(),__RacingPanelSkin_UIAsset5_i(),__RacingPanelSkin_UIAsset6_i(),__RacingPanelSkin_UIAsset7_i(),__RacingPanelSkin_UIAsset8_i(),__RacingPanelSkin_UIAsset9_i(),__RacingPanelSkin_UIAsset10_i(),__RacingPanelSkin_UIAsset11_i(),__RacingPanelSkin_UIAsset12_i(),lbNameLeft_i(),lbCountryRight_i(),lbCountryLeft_i(),lbNameRight_i(),__RacingPanelSkin_Label3_i(),__RacingPanelSkin_Label4_i(),__RacingPanelSkin_Label5_i(),lbReward_i(),__RacingPanelSkin_Group2_i(),__RacingPanelSkin_Group3_i(),__RacingPanelSkin_Group4_i(),__RacingPanelSkin_Group5_i(),__RacingPanelSkin_Group6_i(),__RacingPanelSkin_Group7_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RacingPanelSkin_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__RacingPanelSkin_UIAsset2_i(),__RacingPanelSkin_UIAsset3_i(),__RacingPanelSkin_Label1_i(),__RacingPanelSkin_UIAsset4_i(),lbLeftTime_i(),__RacingPanelSkin_Label2_i(),lbIntroduce_i(),btnApply_i()];
			return temp;
		}

		private function __RacingPanelSkin_Group2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.x = 243;
			temp.y = 229;
			temp.elementsContent = [__RacingPanelSkin_UIAsset13_i(),__RacingPanelSkin_UIAsset14_i(),__RacingPanelSkin_Label6_i(),lbPrize0_i()];
			return temp;
		}

		private function __RacingPanelSkin_Group3_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.x = 442.5;
			temp.y = 229;
			temp.elementsContent = [__RacingPanelSkin_UIAsset15_i(),__RacingPanelSkin_UIAsset16_i(),__RacingPanelSkin_Label7_i(),lbPrize1_i()];
			return temp;
		}

		private function __RacingPanelSkin_Group4_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.x = 642;
			temp.y = 229;
			temp.elementsContent = [__RacingPanelSkin_UIAsset17_i(),__RacingPanelSkin_UIAsset18_i(),__RacingPanelSkin_Label8_i(),lbPrize2_i()];
			return temp;
		}

		private function __RacingPanelSkin_Group5_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.x = 243;
			temp.y = 334;
			temp.elementsContent = [__RacingPanelSkin_UIAsset19_i(),__RacingPanelSkin_UIAsset20_i(),__RacingPanelSkin_Label9_i(),lbPrize3_i()];
			return temp;
		}

		private function __RacingPanelSkin_Group6_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.x = 442;
			temp.y = 334;
			temp.elementsContent = [__RacingPanelSkin_UIAsset21_i(),__RacingPanelSkin_UIAsset22_i(),__RacingPanelSkin_Label10_i(),lbPrize4_i()];
			return temp;
		}

		private function __RacingPanelSkin_Group7_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.x = 642;
			temp.y = 334;
			temp.elementsContent = [__RacingPanelSkin_UIAsset23_i(),__RacingPanelSkin_UIAsset24_i(),__RacingPanelSkin_Label11_i(),lbPrize5_i()];
			return temp;
		}

		private function __RacingPanelSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "亚军";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 66;
			temp.y = 11;
			return temp;
		}

		private function __RacingPanelSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "季军";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 66;
			temp.y = 11;
			return temp;
		}

		private function __RacingPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 215;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.leading = 8;
			temp.fontSize = 16;
			temp.text = "近年战事连连，内有黄巾遗祸，外有南蛮犯境，骑兵紧缺，故此献帝昭告天下，从九州勇士中选拔出优秀的骑兵，各州均设赛马大会，凡在大会中一展英姿的勇士均可享受朝廷封赏，九州排名最前者，还可获得御赐恩赏。";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 189;
			temp.x = 13;
			temp.y = 9;
			return temp;
		}

		private function __RacingPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "每周二/四/六晚19：00开启";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 199;
			temp.x = 9;
			temp.y = 392;
			return temp;
		}

		private function __RacingPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "九州奖励（全服排名前三）";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 225;
			temp.y = 200;
			return temp;
		}

		private function __RacingPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "本国奖励（本国排名前三）";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 226;
			temp.y = 304;
			return temp;
		}

		private function __RacingPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "进度奖金";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 225;
			temp.y = 408;
			return temp;
		}

		private function __RacingPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冠军";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 66;
			temp.y = 11;
			return temp;
		}

		private function __RacingPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "亚军";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 66;
			temp.y = 11;
			return temp;
		}

		private function __RacingPanelSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "季军";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.x = 66;
			temp.y = 11;
			return temp;
		}

		private function __RacingPanelSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "冠军";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 66;
			temp.y = 11;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/title2.png";
			temp.x = 610;
			temp.y = 59;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/jin-jiang-she-zhi.png";
			temp.x = 208;
			temp.y = 166;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/shang-jie-jiu-zhou.png";
			temp.x = 504;
			temp.y = 13;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 62;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 62;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/racing/gold.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset15_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 62;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 62;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset16_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/racing/silver.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset17_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 62;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 62;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset18_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/racing/copper.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset19_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 62;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 62;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset20_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/racing/gold.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset21_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 62;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 62;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset22_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/racing/silver.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset23_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 62;
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.width = 62;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset24_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/activityHall/racing/copper.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 486;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/D_di/di_2.png";
			temp.width = 212;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/line/fgx.png";
			temp.width = 212;
			temp.x = 0;
			temp.y = 237;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/dao-ji-shi.png";
			temp.x = 60;
			temp.y = 253;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/zui-gao-ji-lu1.png";
			temp.x = 223;
			temp.y = 13;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/title1.png";
			temp.x = 329;
			temp.y = 59;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/fen_ge_xian.png";
			temp.width = 515;
			temp.x = 232;
			temp.y = 202;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/fen_ge_xian.png";
			temp.width = 515;
			temp.x = 232;
			temp.y = 411;
			return temp;
		}

		private function __RacingPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/fen_ge_xian.png";
			temp.width = 515;
			temp.x = 232;
			temp.y = 306;
			return temp;
		}

		private function btnApply_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnApply = temp;
			temp.name = "btnApply";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "我要报名";
			temp.fontSize = 20;
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_d_daanniu;
			temp.color = 0xF9F0CC;
			temp.x = 28;
			temp.y = 428;
			return temp;
		}

		private function lbCountryLeft_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountryLeft = temp;
			temp.name = "lbCountryLeft";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "国家：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 333;
			temp.y = 116;
			return temp;
		}

		private function lbCountryRight_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountryRight = temp;
			temp.name = "lbCountryRight";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "国家：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 613;
			temp.y = 116;
			return temp;
		}

		private function lbIntroduce_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbIntroduce = temp;
			temp.name = "lbIntroduce";
			temp.fontSize = 16;
			temp.text = "活动介绍";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.underline = true;
			temp.width = 70;
			temp.x = 12;
			temp.y = 365;
			return temp;
		}

		private function lbLeftTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbLeftTime = temp;
			temp.name = "lbLeftTime";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 24;
			temp.text = "29:59";
			temp.textAlign = "center";
			temp.color = 0xCC99BB;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 88;
			temp.x = 66;
			temp.y = 289;
			return temp;
		}

		private function lbNameLeft_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameLeft = temp;
			temp.name = "lbNameLeft";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "玩家名称七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 334;
			temp.y = 95;
			return temp;
		}

		private function lbNameRight_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameRight = temp;
			temp.name = "lbNameRight";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "玩家名称七个字";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 614;
			temp.y = 95;
			return temp;
		}

		private function lbPrize0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPrize0 = temp;
			temp.name = "lbPrize0";
			temp.text = "99锭";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 66;
			temp.y = 32;
			return temp;
		}

		private function lbPrize1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPrize1 = temp;
			temp.name = "lbPrize1";
			temp.text = "99锭";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 66;
			temp.y = 32;
			return temp;
		}

		private function lbPrize2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPrize2 = temp;
			temp.name = "lbPrize2";
			temp.text = "99锭";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 60;
			temp.x = 66;
			temp.y = 32;
			return temp;
		}

		private function lbPrize3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPrize3 = temp;
			temp.name = "lbPrize3";
			temp.text = "99锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 66;
			temp.y = 32;
			return temp;
		}

		private function lbPrize4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPrize4 = temp;
			temp.name = "lbPrize4";
			temp.text = "99锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 66;
			temp.y = 32;
			return temp;
		}

		private function lbPrize5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPrize5 = temp;
			temp.name = "lbPrize5";
			temp.text = "99锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 66;
			temp.y = 32;
			return temp;
		}

		private function lbReward_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbReward = temp;
			temp.name = "lbReward";
			temp.height = 41;
			temp.leading = 6;
			temp.fontSize = 14;
			temp.text = "每通过一次验证即可获得60两每通过一次验证即可获得60两每通过一次验证即可获得60两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 514;
			temp.x = 224;
			temp.y = 435;
			return temp;
		}

	}
}