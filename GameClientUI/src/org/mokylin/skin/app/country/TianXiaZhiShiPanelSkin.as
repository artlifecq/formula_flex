package org.mokylin.skin.app.country
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.tianxiayunshi.button.ButtonHuang_cheng_anniu;
	import org.mokylin.skin.app.country.tianxiayunshi.button.ButtonQing_zhou_anniu;
	import org.mokylin.skin.app.country.tianxiayunshi.button.ButtonXing_zhou_anniu;
	import org.mokylin.skin.app.country.tianxiayunshi.button.ButtonYang_zhou_anniu;
	import org.mokylin.skin.app.country.tianxiayunshi.button.ButtonYi_zhou_anniu;
	import org.mokylin.skin.app.country.tianxiayunshi.button.ButtonYou_zhou_anniu;
	import org.mokylin.skin.component.button.ButtonSkin_button;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TianXiaZhiShiPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var benJing:feathers.controls.UIAsset;

		public var benQing:feathers.controls.UIAsset;

		public var benYang:feathers.controls.UIAsset;

		public var benYi:feathers.controls.UIAsset;

		public var benYou:feathers.controls.UIAsset;

		public var countryHuangChengBtn:feathers.controls.Radio;

		public var countryInfoTxt:feathers.controls.Label;

		public var countryJingZhouBtn:feathers.controls.Radio;

		public var countryNameTxt:feathers.controls.Label;

		public var countryQingZhouBtn:feathers.controls.Radio;

		public var countryWarStatisticsBtn:feathers.controls.Button;

		public var countryYangZhouBtn:feathers.controls.Radio;

		public var countryYiZhouBtn:feathers.controls.Radio;

		public var countryYouZhouBtn:feathers.controls.Radio;

		public var jingToHuang:feathers.controls.UIAsset;

		public var jingToQing:feathers.controls.UIAsset;

		public var jingToYang:feathers.controls.UIAsset;

		public var jingToYi:feathers.controls.UIAsset;

		public var jingToYou:feathers.controls.UIAsset;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var mengJing:feathers.controls.UIAsset;

		public var mengQing:feathers.controls.UIAsset;

		public var mengYang:feathers.controls.UIAsset;

		public var mengYi:feathers.controls.UIAsset;

		public var mengYou:feathers.controls.UIAsset;

		public var newWarInfoTxtGroup1:feathers.controls.Group;

		public var newWarInfoTxtGroup2:feathers.controls.Group;

		public var newWarInfoTxt_countryLeft1:feathers.controls.Label;

		public var newWarInfoTxt_countryLeft2:feathers.controls.Label;

		public var newWarInfoTxt_countryRight1:feathers.controls.Label;

		public var newWarInfoTxt_countryRight2:feathers.controls.Label;

		public var newWarInfoTxt_time1:feathers.controls.Label;

		public var newWarInfoTxt_time2:feathers.controls.Label;

		public var occupyNameTxt:feathers.controls.Label;

		public var oldWarInfoTxtGroup1:feathers.controls.Group;

		public var oldWarInfoTxtGroup2:feathers.controls.Group;

		public var oldWarInfoTxt_countryLeft1:feathers.controls.Label;

		public var oldWarInfoTxt_countryLeft2:feathers.controls.Label;

		public var oldWarInfoTxt_countryRight1:feathers.controls.Label;

		public var oldWarInfoTxt_countryRight2:feathers.controls.Label;

		public var oldWarInfoTxt_time1:feathers.controls.Label;

		public var oldWarInfoTxt_time2:feathers.controls.Label;

		public var qingToHuang:feathers.controls.UIAsset;

		public var qingToJing:feathers.controls.UIAsset;

		public var qingToYang:feathers.controls.UIAsset;

		public var qingToYi:feathers.controls.UIAsset;

		public var qingToYou:feathers.controls.UIAsset;

		public var selfCountryNameTxt:feathers.controls.Label;

		public var yangToHuang:feathers.controls.UIAsset;

		public var yangToJing:feathers.controls.UIAsset;

		public var yangToQing:feathers.controls.UIAsset;

		public var yangToYi:feathers.controls.UIAsset;

		public var yangToYou:feathers.controls.UIAsset;

		public var yiToHuang:feathers.controls.UIAsset;

		public var yiToJing:feathers.controls.UIAsset;

		public var yiToQing:feathers.controls.UIAsset;

		public var yiToYang:feathers.controls.UIAsset;

		public var yiToYou:feathers.controls.UIAsset;

		public var youToHuang:feathers.controls.UIAsset;

		public var youToJing:feathers.controls.UIAsset;

		public var youToQing:feathers.controls.UIAsset;

		public var youToYang:feathers.controls.UIAsset;

		public var youToYi:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TianXiaZhiShiPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 495;
			labelFilterBlack_i();
			this.elementsContent = [__TianXiaZhiShiPanelSkin_UIAsset1_i(),countryNameTxt_i(),countryInfoTxt_i(),countryWarStatisticsBtn_i(),qingToHuang_i(),yiToHuang_i(),youToHuang_i(),youToJing_i(),youToYang_i(),jingToYou_i(),yangToYou_i(),occupyNameTxt_i(),newWarInfoTxtGroup1_i(),newWarInfoTxtGroup2_i(),oldWarInfoTxtGroup1_i(),oldWarInfoTxtGroup2_i(),benYou_i(),mengYou_i(),benQing_i(),mengQing_i(),benYang_i(),mengYang_i(),benJing_i(),mengJing_i(),benYi_i(),mengYi_i(),yangToQing_i(),jingToYi_i(),qingToYang_i(),yiToJing_i(),jingToHuang_i(),yangToHuang_i(),youToYi_i(),qingToYou_i(),youToQing_i(),yiToYou_i(),yangToJing_i(),jingToYang_i(),qingToYi_i(),yiToQing_i(),yangToYi_i(),yiToYang_i(),jingToQing_i(),qingToJing_i(),__TianXiaZhiShiPanelSkin_UIAsset10_i(),selfCountryNameTxt_i(),countryYiZhouBtn_i(),countryYouZhouBtn_i(),countryQingZhouBtn_i(),countryJingZhouBtn_i(),countryYangZhouBtn_i(),countryHuangChengBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TianXiaZhiShiPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/guojia_xianshi.png";
			temp.x = 30;
			temp.y = 24;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/vs.png";
			temp.x = 152;
			temp.y = 1;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/vs.png";
			temp.x = 152;
			temp.y = 1;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/bai.png";
			temp.x = 10;
			temp.y = 18;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/sheng.png";
			temp.x = 160;
			temp.y = 18;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/vs.png";
			temp.x = 92;
			temp.y = 34;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/bai.png";
			temp.x = 10;
			temp.y = 19;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/sheng.png";
			temp.x = 160;
			temp.y = 19;
			return temp;
		}

		private function __TianXiaZhiShiPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/tianxiayunshi/vs.png";
			temp.x = 92;
			temp.y = 34;
			return temp;
		}

		private function benJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			benJing = temp;
			temp.name = "benJing";
			temp.styleName = "ui/app/country/tianxiayunshi/benguo.png";
			temp.x = 136;
			temp.y = 328;
			return temp;
		}

		private function benQing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			benQing = temp;
			temp.name = "benQing";
			temp.styleName = "ui/app/country/tianxiayunshi/benguo.png";
			temp.x = 532;
			temp.y = 180;
			return temp;
		}

		private function benYang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			benYang = temp;
			temp.name = "benYang";
			temp.styleName = "ui/app/country/tianxiayunshi/benguo.png";
			temp.x = 474;
			temp.y = 328;
			return temp;
		}

		private function benYi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			benYi = temp;
			temp.name = "benYi";
			temp.styleName = "ui/app/country/tianxiayunshi/benguo.png";
			temp.x = 82;
			temp.y = 180;
			return temp;
		}

		private function benYou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			benYou = temp;
			temp.name = "benYou";
			temp.styleName = "ui/app/country/tianxiayunshi/benguo.png";
			temp.x = 370;
			temp.y = 38;
			return temp;
		}

		private function countryHuangChengBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			countryHuangChengBtn = temp;
			temp.name = "countryHuangChengBtn";
			temp.groupName = "CountryPanelTianXiaZhiShiRadioGroup";
			temp.height = 182;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.tianxiayunshi.button.ButtonHuang_cheng_anniu);
			temp.width = 182;
			temp.x = 217;
			temp.y = 146;
			return temp;
		}

		private function countryInfoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryInfoTxt = temp;
			temp.name = "countryInfoTxt";
			temp.bold = false;
			temp.height = 140;
			temp.htmlText = "";
			temp.leading = 6;
			temp.letterSpacing = 0;
			temp.fontSize = 14;
			temp.text = "国家等级";
			temp.color = 0xF9F0CC;
			temp.width = 200;
			temp.x = 639;
			temp.y = 286;
			return temp;
		}

		private function countryJingZhouBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			countryJingZhouBtn = temp;
			temp.name = "countryJingZhouBtn";
			temp.groupName = "CountryPanelTianXiaZhiShiRadioGroup";
			temp.height = 112;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.tianxiayunshi.button.ButtonXing_zhou_anniu);
			temp.width = 100;
			temp.x = 161;
			temp.y = 331;
			return temp;
		}

		private function countryNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryNameTxt = temp;
			temp.name = "countryNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 44;
			temp.maxWidth = 20;
			temp.fontSize = 14;
			temp.text = "幽州";
			temp.color = 0xF9F0CC;
			temp.width = 20;
			temp.x = 848;
			temp.y = 291;
			return temp;
		}

		private function countryQingZhouBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			countryQingZhouBtn = temp;
			temp.name = "countryQingZhouBtn";
			temp.groupName = "CountryPanelTianXiaZhiShiRadioGroup";
			temp.height = 112;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.tianxiayunshi.button.ButtonQing_zhou_anniu);
			temp.width = 100;
			temp.x = 429;
			temp.y = 181;
			return temp;
		}

		private function countryWarStatisticsBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			countryWarStatisticsBtn = temp;
			temp.name = "countryWarStatisticsBtn";
			temp.height = 35;
			temp.label = "国战统计";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 702;
			temp.y = 445;
			return temp;
		}

		private function countryYangZhouBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			countryYangZhouBtn = temp;
			temp.name = "countryYangZhouBtn";
			temp.groupName = "CountryPanelTianXiaZhiShiRadioGroup";
			temp.height = 112;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.tianxiayunshi.button.ButtonYang_zhou_anniu);
			temp.width = 100;
			temp.x = 371;
			temp.y = 331;
			return temp;
		}

		private function countryYiZhouBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			countryYiZhouBtn = temp;
			temp.name = "countryYiZhouBtn";
			temp.groupName = "CountryPanelTianXiaZhiShiRadioGroup";
			temp.height = 112;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.tianxiayunshi.button.ButtonYi_zhou_anniu);
			temp.width = 100;
			temp.x = 108;
			temp.y = 181;
			return temp;
		}

		private function countryYouZhouBtn_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			countryYouZhouBtn = temp;
			temp.name = "countryYouZhouBtn";
			temp.groupName = "CountryPanelTianXiaZhiShiRadioGroup";
			temp.height = 112;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.tianxiayunshi.button.ButtonYou_zhou_anniu);
			temp.width = 100;
			temp.x = 268;
			temp.y = 39;
			return temp;
		}

		private function jingToHuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingToHuang = temp;
			temp.name = "jingToHuang";
			temp.styleName = "ui/app/country/tianxiayunshi/xie.png";
			temp.x = 212;
			temp.y = 249;
			return temp;
		}

		private function jingToQing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingToQing = temp;
			temp.name = "jingToQing";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/changxie.png";
			temp.x = 467;
			temp.y = 243;
			return temp;
		}

		private function jingToYang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingToYang = temp;
			temp.name = "jingToYang";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.width = 160;
			temp.x = 392;
			temp.y = 367;
			return temp;
		}

		private function jingToYi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingToYi = temp;
			temp.name = "jingToYi";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/xie.png";
			temp.x = 230;
			temp.y = 246;
			return temp;
		}

		private function jingToYou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			jingToYou = temp;
			temp.name = "jingToYou";
			temp.scaleX = -1;
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/chang.png";
			temp.x = 326;
			temp.y = 371;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function mengJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mengJing = temp;
			temp.name = "mengJing";
			temp.styleName = "ui/app/country/tianxiayunshi/mengguo.png";
			temp.x = 136;
			temp.y = 328;
			return temp;
		}

		private function mengQing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mengQing = temp;
			temp.name = "mengQing";
			temp.styleName = "ui/app/country/tianxiayunshi/mengguo.png";
			temp.x = 532;
			temp.y = 180;
			return temp;
		}

		private function mengYang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mengYang = temp;
			temp.name = "mengYang";
			temp.styleName = "ui/app/country/tianxiayunshi/mengguo.png";
			temp.x = 474;
			temp.y = 328;
			return temp;
		}

		private function mengYi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mengYi = temp;
			temp.name = "mengYi";
			temp.styleName = "ui/app/country/tianxiayunshi/mengguo.png";
			temp.x = 82;
			temp.y = 180;
			return temp;
		}

		private function mengYou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			mengYou = temp;
			temp.name = "mengYou";
			temp.styleName = "ui/app/country/tianxiayunshi/mengguo.png";
			temp.x = 370;
			temp.y = 38;
			return temp;
		}

		private function newWarInfoTxtGroup1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			newWarInfoTxtGroup1 = temp;
			temp.name = "newWarInfoTxtGroup1";
			temp.x = 642;
			temp.y = 47;
			temp.elementsContent = [newWarInfoTxt_time1_i(),newWarInfoTxt_countryLeft1_i(),newWarInfoTxt_countryRight1_i(),__TianXiaZhiShiPanelSkin_UIAsset2_i()];
			return temp;
		}

		private function newWarInfoTxtGroup2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			newWarInfoTxtGroup2 = temp;
			temp.name = "newWarInfoTxtGroup2";
			temp.x = 642;
			temp.y = 77;
			temp.elementsContent = [newWarInfoTxt_countryRight2_i(),newWarInfoTxt_countryLeft2_i(),newWarInfoTxt_time2_i(),__TianXiaZhiShiPanelSkin_UIAsset3_i()];
			return temp;
		}

		private function newWarInfoTxt_countryLeft1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt_countryLeft1 = temp;
			temp.name = "newWarInfoTxt_countryLeft1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 118;
			temp.y = 2;
			return temp;
		}

		private function newWarInfoTxt_countryLeft2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt_countryLeft2 = temp;
			temp.name = "newWarInfoTxt_countryLeft2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 118;
			temp.y = 2;
			return temp;
		}

		private function newWarInfoTxt_countryRight1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt_countryRight1 = temp;
			temp.name = "newWarInfoTxt_countryRight1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 184;
			temp.y = 2;
			return temp;
		}

		private function newWarInfoTxt_countryRight2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt_countryRight2 = temp;
			temp.name = "newWarInfoTxt_countryRight2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 184;
			temp.y = 2;
			return temp;
		}

		private function newWarInfoTxt_time1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt_time1 = temp;
			temp.name = "newWarInfoTxt_time1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "时间：2015-11-25";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function newWarInfoTxt_time2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt_time2 = temp;
			temp.name = "newWarInfoTxt_time2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "时间：2015-11-25";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function occupyNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			occupyNameTxt = temp;
			temp.name = "occupyNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 28;
			temp.fontSize = 16;
			temp.text = "（扬州）";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 200;
			temp.x = 218;
			temp.y = 254;
			return temp;
		}

		private function oldWarInfoTxtGroup1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			oldWarInfoTxtGroup1 = temp;
			temp.name = "oldWarInfoTxtGroup1";
			temp.x = 650;
			temp.y = 125;
			temp.elementsContent = [__TianXiaZhiShiPanelSkin_UIAsset4_i(),__TianXiaZhiShiPanelSkin_UIAsset5_i(),oldWarInfoTxt_countryLeft1_i(),oldWarInfoTxt_countryRight1_i(),__TianXiaZhiShiPanelSkin_UIAsset6_i(),oldWarInfoTxt_time1_i()];
			return temp;
		}

		private function oldWarInfoTxtGroup2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			oldWarInfoTxtGroup2 = temp;
			temp.name = "oldWarInfoTxtGroup2";
			temp.x = 650;
			temp.y = 184;
			temp.elementsContent = [__TianXiaZhiShiPanelSkin_UIAsset7_i(),__TianXiaZhiShiPanelSkin_UIAsset8_i(),oldWarInfoTxt_countryLeft2_i(),oldWarInfoTxt_countryRight2_i(),__TianXiaZhiShiPanelSkin_UIAsset9_i(),oldWarInfoTxt_time2_i()];
			return temp;
		}

		private function oldWarInfoTxt_countryLeft1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			oldWarInfoTxt_countryLeft1 = temp;
			temp.name = "oldWarInfoTxt_countryLeft1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 58;
			temp.y = 35;
			return temp;
		}

		private function oldWarInfoTxt_countryLeft2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			oldWarInfoTxt_countryLeft2 = temp;
			temp.name = "oldWarInfoTxt_countryLeft2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 58;
			temp.y = 35;
			return temp;
		}

		private function oldWarInfoTxt_countryRight1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			oldWarInfoTxt_countryRight1 = temp;
			temp.name = "oldWarInfoTxt_countryRight1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 124;
			temp.y = 35;
			return temp;
		}

		private function oldWarInfoTxt_countryRight2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			oldWarInfoTxt_countryRight2 = temp;
			temp.name = "oldWarInfoTxt_countryRight2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 42;
			temp.x = 124;
			temp.y = 35;
			return temp;
		}

		private function oldWarInfoTxt_time1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			oldWarInfoTxt_time1 = temp;
			temp.name = "oldWarInfoTxt_time1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "时间：2015-11-25";
			temp.textAlign = "left";
			temp.color = 0xC09051;
			temp.width = 120;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function oldWarInfoTxt_time2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			oldWarInfoTxt_time2 = temp;
			temp.name = "oldWarInfoTxt_time2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "时间：2015-11-25";
			temp.textAlign = "left";
			temp.color = 0xC09051;
			temp.width = 120;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function qingToHuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qingToHuang = temp;
			temp.name = "qingToHuang";
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.x = 357;
			temp.y = 218;
			return temp;
		}

		private function qingToJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qingToJing = temp;
			temp.name = "qingToJing";
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/changxie.png";
			temp.x = 227;
			temp.y = 381;
			return temp;
		}

		private function qingToYang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qingToYang = temp;
			temp.name = "qingToYang";
			temp.scaleX = -1;
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/xie.png";
			temp.x = 484;
			temp.y = 371;
			return temp;
		}

		private function qingToYi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qingToYi = temp;
			temp.name = "qingToYi";
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.width = 270;
			temp.x = 178;
			temp.y = 218;
			return temp;
		}

		private function qingToYou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			qingToYou = temp;
			temp.name = "qingToYou";
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/zhong.png";
			temp.x = 348;
			temp.y = 212;
			return temp;
		}

		private function selfCountryNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			selfCountryNameTxt = temp;
			temp.name = "selfCountryNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 22;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "本国：幽州";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.width = 100;
			temp.x = 53;
			temp.y = 31;
			return temp;
		}

		private function yangToHuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yangToHuang = temp;
			temp.name = "yangToHuang";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/xie.png";
			temp.x = 425;
			temp.y = 249;
			return temp;
		}

		private function yangToJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yangToJing = temp;
			temp.name = "yangToJing";
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.width = 160;
			temp.x = 236;
			temp.y = 367;
			return temp;
		}

		private function yangToQing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yangToQing = temp;
			temp.name = "yangToQing";
			temp.styleName = "ui/app/country/tianxiayunshi/xie.png";
			temp.x = 402;
			temp.y = 247;
			return temp;
		}

		private function yangToYi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yangToYi = temp;
			temp.name = "yangToYi";
			temp.styleName = "ui/app/country/tianxiayunshi/changxie.png";
			temp.x = 167;
			temp.y = 246;
			return temp;
		}

		private function yangToYou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yangToYou = temp;
			temp.name = "yangToYou";
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/chang.png";
			temp.x = 303;
			temp.y = 372;
			return temp;
		}

		private function yiToHuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yiToHuang = temp;
			temp.name = "yiToHuang";
			temp.rotation = 3.141592653589793;
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.x = 278;
			temp.y = 253;
			return temp;
		}

		private function yiToJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yiToJing = temp;
			temp.name = "yiToJing";
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/xie.png";
			temp.x = 150;
			temp.y = 372;
			return temp;
		}

		private function yiToQing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yiToQing = temp;
			temp.name = "yiToQing";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.width = 270;
			temp.x = 460;
			temp.y = 218;
			return temp;
		}

		private function yiToYang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yiToYang = temp;
			temp.name = "yiToYang";
			temp.scaleX = -1;
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/changxie.png";
			temp.x = 408;
			temp.y = 385;
			return temp;
		}

		private function yiToYou_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			yiToYou = temp;
			temp.name = "yiToYou";
			temp.scaleX = -1;
			temp.scaleY = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/zhong.png";
			temp.x = 286;
			temp.y = 216;
			return temp;
		}

		private function youToHuang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			youToHuang = temp;
			temp.name = "youToHuang";
			temp.rotation = 1.5707963267948966;
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/duan.png";
			temp.x = 333;
			temp.y = 216;
			return temp;
		}

		private function youToJing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			youToJing = temp;
			temp.name = "youToJing";
			temp.styleName = "ui/app/country/tianxiayunshi/chang.png";
			temp.x = 216;
			temp.y = 124;
			return temp;
		}

		private function youToQing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			youToQing = temp;
			temp.name = "youToQing";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/zhong.png";
			temp.x = 474;
			temp.y = 83;
			return temp;
		}

		private function youToYang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			youToYang = temp;
			temp.name = "youToYang";
			temp.scaleX = -1;
			temp.styleName = "ui/app/country/tianxiayunshi/chang.png";
			temp.x = 413;
			temp.y = 124;
			return temp;
		}

		private function youToYi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			youToYi = temp;
			temp.name = "youToYi";
			temp.styleName = "ui/app/country/tianxiayunshi/zhong.png";
			temp.x = 158;
			temp.y = 90;
			return temp;
		}

	}
}