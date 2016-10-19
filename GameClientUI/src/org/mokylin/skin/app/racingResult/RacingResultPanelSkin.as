package org.mokylin.skin.app.racingResult
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RacingResultPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var head_bg:feathers.controls.UIAsset;

		public var imgCountry0:feathers.controls.UIAsset;

		public var imgCountry1:feathers.controls.UIAsset;

		public var imgCountry2:feathers.controls.UIAsset;

		public var imgCountry3:feathers.controls.UIAsset;

		public var lbName0:feathers.controls.Label;

		public var lbName1:feathers.controls.Label;

		public var lbName2:feathers.controls.Label;

		public var lbName3:feathers.controls.Label;

		public var lbName4:feathers.controls.Label;

		public var lbName5:feathers.controls.Label;

		public var lbName6:feathers.controls.Label;

		public var lbNextTime:feathers.controls.Label;

		public var lbQiZongZui:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RacingResultPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 654;
			this.width = 1072;
			this.elementsContent = [bg_i(),head_bg_i(),btnClose_i(),__RacingResultPanelSkin_UIAsset1_i(),__RacingResultPanelSkin_UIAsset2_i(),__RacingResultPanelSkin_UIAsset3_i(),__RacingResultPanelSkin_UIAsset4_i(),__RacingResultPanelSkin_UIAsset5_i(),lbNextTime_i(),lbQiZongZui_i(),__RacingResultPanelSkin_UIAsset6_i(),__RacingResultPanelSkin_UIAsset7_i(),__RacingResultPanelSkin_UIAsset8_i(),__RacingResultPanelSkin_UIAsset9_i(),__RacingResultPanelSkin_UIAsset10_i(),__RacingResultPanelSkin_UIAsset11_i(),__RacingResultPanelSkin_UIAsset12_i(),__RacingResultPanelSkin_UIAsset13_i(),__RacingResultPanelSkin_UIAsset14_i(),imgCountry1_i(),imgCountry0_i(),imgCountry3_i(),imgCountry2_i(),lbName0_i(),lbName1_i(),lbName2_i(),lbName3_i(),lbName4_i(),lbName5_i(),lbName6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RacingResultPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/ben-guo-di-er.png";
			temp.x = 803;
			temp.y = 175;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/ben-guo-di-san.png";
			temp.x = 929;
			temp.y = 282;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/ben-guo-di-yi.png";
			temp.x = 677;
			temp.y = 133;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/jiu-zhou-di-er.png";
			temp.x = 203;
			temp.y = 175;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/jiu-zhou-di-san.png";
			temp.x = 62;
			temp.y = 282;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/sai-ma-da-hui.png";
			temp.x = 491;
			temp.y = 8;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/bg.jpg";
			temp.x = 15;
			temp.y = 40;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/qi-shou-bang.png";
			temp.x = 957;
			temp.y = 37;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/qi-zong-zui.png";
			temp.x = 273;
			temp.y = 370;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/xia-jie-sai-ma-da-hui.png";
			temp.x = 377;
			temp.y = 559;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/zui-gao-ji-lu2.png";
			temp.x = 481;
			temp.y = 78;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/title2.png";
			temp.x = 324;
			temp.y = 125;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/activityHall/racing/title1.png";
			temp.x = 484;
			temp.y = 100;
			return temp;
		}

		private function __RacingResultPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingResult/jiu-zhou-di-yi.png";
			temp.x = 344;
			temp.y = 102;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 654;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/di_ban.png";
			temp.width = 1072;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 1039;
			temp.y = 2;
			return temp;
		}

		private function head_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			head_bg = temp;
			temp.name = "head_bg";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/gao_guang.png";
			temp.width = 1037;
			temp.x = 19;
			temp.y = 8;
			return temp;
		}

		private function imgCountry0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgCountry0 = temp;
			temp.name = "imgCountry0";
			temp.height = 23;
			temp.styleName = "ui/app/racingResult/country1.png";
			temp.width = 25;
			temp.x = 452;
			temp.y = 127;
			return temp;
		}

		private function imgCountry1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgCountry1 = temp;
			temp.name = "imgCountry1";
			temp.height = 23;
			temp.styleName = "ui/app/racingResult/country1.png";
			temp.width = 25;
			temp.x = 294;
			temp.y = 158;
			return temp;
		}

		private function imgCountry2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgCountry2 = temp;
			temp.name = "imgCountry2";
			temp.height = 23;
			temp.styleName = "ui/app/racingResult/country1.png";
			temp.width = 25;
			temp.x = 170;
			temp.y = 196;
			return temp;
		}

		private function imgCountry3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgCountry3 = temp;
			temp.name = "imgCountry3";
			temp.height = 23;
			temp.styleName = "ui/app/racingResult/country1.png";
			temp.width = 25;
			temp.x = 25;
			temp.y = 302;
			return temp;
		}

		private function lbName0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName0 = temp;
			temp.name = "lbName0";
			temp.text = "玩家名字七个字 10分31秒";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 479;
			temp.y = 129;
			return temp;
		}

		private function lbName1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName1 = temp;
			temp.name = "lbName1";
			temp.text = "玩家名字七个字 10分31秒";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 318;
			temp.y = 158;
			return temp;
		}

		private function lbName2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName2 = temp;
			temp.name = "lbName2";
			temp.text = "玩家名字七个字 10分31秒";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 193;
			temp.y = 199;
			return temp;
		}

		private function lbName3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName3 = temp;
			temp.name = "lbName3";
			temp.text = "玩家名字七个字 10分31秒";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 46;
			temp.y = 303;
			return temp;
		}

		private function lbName4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName4 = temp;
			temp.name = "lbName4";
			temp.text = "玩家名字七个字 10分31秒";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 169;
			temp.x = 626;
			temp.y = 158;
			return temp;
		}

		private function lbName5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName5 = temp;
			temp.name = "lbName5";
			temp.text = "玩家名字七个字 10分31秒";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 169;
			temp.x = 759;
			temp.y = 199;
			return temp;
		}

		private function lbName6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName6 = temp;
			temp.name = "lbName6";
			temp.text = "玩家名字七个字 10分31秒";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 168;
			temp.x = 885;
			temp.y = 303;
			return temp;
		}

		private function lbNextTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNextTime = temp;
			temp.name = "lbNextTime";
			temp.height = 24;
			temp.fontSize = 20;
			temp.text = "1月2日 19:00";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 201;
			temp.x = 437;
			temp.y = 601;
			return temp;
		}

		private function lbQiZongZui_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbQiZongZui = temp;
			temp.name = "lbQiZongZui";
			temp.height = 162;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.leading = 6;
			temp.text = "最捣乱【燕州】的玩家名字七个字共造成了1993人次的赛马事故最捣乱【燕州】的玩家名字七个字共造成了1993人次的赛马事故";
			temp.width = 457;
			temp.x = 308;
			temp.y = 396;
			return temp;
		}

	}
}