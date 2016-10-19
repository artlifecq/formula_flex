package org.mokylin.skin.app.daTi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_close_4;
	import org.mokylin.skin.component.text.TextBlankSkin;
	import org.mokylin.skin.component.uinumber.UINumberSkin_da_ti;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DaTiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var iamgeMask:feathers.controls.UIAsset;

		public var imageBangShangYouMing:feathers.controls.UIAsset;

		public var imageCountDown:feathers.controls.UIAsset;

		public var imageFace:feathers.controls.UIAsset;

		public var imageGlow:feathers.controls.UIAsset;

		public var imageLineLeft:feathers.controls.UIAsset;

		public var imageLineLeft1:feathers.controls.UIAsset;

		public var imageLineRight:feathers.controls.UIAsset;

		public var imageLineRight1:feathers.controls.UIAsset;

		public var imageRankTitleBg:feathers.controls.UIAsset;

		public var imageResultBg:feathers.controls.UIAsset;

		public var imageResultBg0:feathers.controls.UIAsset;

		public var imageTextResult:feathers.controls.UIAsset;

		public var imageTextStart:feathers.controls.UIAsset;

		public var imageTextWait:feathers.controls.UIAsset;

		public var imageWoDeZhanJi:feathers.controls.UIAsset;

		public var lbDeFen:feathers.controls.Label;

		public var lbGuoJia:feathers.controls.Label;

		public var lbJueSeMing:feathers.controls.Label;

		public var lbNameCount:feathers.controls.Label;

		public var lbNameRanking:feathers.controls.Label;

		public var lbNameScore:feathers.controls.Label;

		public var lbNameTime:feathers.controls.Label;

		public var lbPaiMing:feathers.controls.Label;

		public var lbValueCount:feathers.controls.Label;

		public var lbValueRanking:feathers.controls.Label;

		public var lbValueScore:feathers.controls.Label;

		public var lbValueTime:feathers.controls.Label;

		public var listAnswer:feathers.controls.List;

		public var listProp:feathers.controls.List;

		public var listRank:feathers.controls.List;

		public var textQuestion:feathers.controls.TextArea;

		public var title:feathers.controls.UIAsset;

		public var uiNumberMinute:feathers.controls.UINumber;

		public var uiNumberSecond:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DaTiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),textQuestion_i(),listAnswer_i(),lbNameTime_i(),lbValueTime_i(),lbValueCount_i(),lbNameCount_i(),lbValueScore_i(),lbNameScore_i(),lbValueRanking_i(),lbNameRanking_i(),iamgeMask_i(),imageCountDown_i(),imageTextWait_i(),imageTextStart_i(),uiNumberMinute_i(),uiNumberSecond_i(),imageLineLeft1_i(),imageLineRight1_i(),imageWoDeZhanJi_i(),listRank_i(),imageRankTitleBg_i(),lbPaiMing_i(),lbJueSeMing_i(),lbGuoJia_i(),lbDeFen_i(),imageLineLeft_i(),imageLineRight_i(),imageBangShangYouMing_i(),listProp_i(),title_i(),imageResultBg_i(),imageResultBg0_i(),imageGlow_i(),imageFace_i(),imageTextResult_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DaTiSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 574;
			temp.styleName = "ui/app/daTi/juan-zhou.png";
			temp.width = 861;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close_4;
			temp.x = 814;
			temp.y = 61;
			return temp;
		}

		private function iamgeMask_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iamgeMask = temp;
			temp.name = "iamgeMask";
			temp.height = 228;
			temp.styleName = "ui/app/daTi/meng-ban-bg.png";
			temp.width = 449;
			temp.x = 68;
			temp.y = 80;
			return temp;
		}

		private function imageBangShangYouMing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageBangShangYouMing = temp;
			temp.name = "imageBangShangYouMing";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/daTi/bang-shang-you-ming.png";
			temp.x = 627;
			temp.y = 81;
			return temp;
		}

		private function imageCountDown_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageCountDown = temp;
			temp.name = "imageCountDown";
			temp.styleName = "ui/app/daTi/kai-shi-dao-ji-shi.png";
			temp.x = 107;
			temp.y = 167;
			return temp;
		}

		private function imageFace_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageFace = temp;
			temp.name = "imageFace";
			temp.styleName = "ui/app/daTi/zheng-que-icon.png";
			temp.x = 294;
			temp.y = 213;
			return temp;
		}

		private function imageGlow_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageGlow = temp;
			temp.name = "imageGlow";
			temp.styleName = "ui/app/daTi/zheng-que-bg.png";
			temp.x = 351;
			temp.y = 240;
			return temp;
		}

		private function imageLineLeft1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageLineLeft1 = temp;
			temp.name = "imageLineLeft1";
			temp.styleName = "ui/app/daTi/fen-ge.png";
			temp.x = 504;
			temp.y = 441;
			return temp;
		}

		private function imageLineLeft_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageLineLeft = temp;
			temp.name = "imageLineLeft";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/daTi/fen-ge.png";
			temp.x = 501;
			temp.y = 89;
			return temp;
		}

		private function imageLineRight1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageLineRight1 = temp;
			temp.name = "imageLineRight1";
			temp.scaleX = -1;
			temp.styleName = "ui/app/daTi/fen-ge.png";
			temp.x = 846;
			temp.y = 441;
			return temp;
		}

		private function imageLineRight_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageLineRight = temp;
			temp.name = "imageLineRight";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.scaleX = -1;
			temp.styleName = "ui/app/daTi/fen-ge.png";
			temp.x = 843;
			temp.y = 89;
			return temp;
		}

		private function imageRankTitleBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageRankTitleBg = temp;
			temp.name = "imageRankTitleBg";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/daTi/title.png";
			temp.x = 522;
			temp.y = 112;
			return temp;
		}

		private function imageResultBg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageResultBg0 = temp;
			temp.name = "imageResultBg0";
			temp.height = 78;
			temp.styleName = "ui/app/daTi/an-niu-bg.png";
			temp.width = 209;
			temp.x = 353;
			temp.y = 238;
			return temp;
		}

		private function imageResultBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageResultBg = temp;
			temp.name = "imageResultBg";
			temp.height = 78;
			temp.styleName = "ui/common/kang/tips_di.png";
			temp.width = 209;
			temp.x = 353;
			temp.y = 238;
			return temp;
		}

		private function imageTextResult_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextResult = temp;
			temp.name = "imageTextResult";
			temp.styleName = "ui/app/daTi/hui-da-zheng-que.png";
			temp.x = 422;
			temp.y = 249;
			return temp;
		}

		private function imageTextStart_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextStart = temp;
			temp.name = "imageTextStart";
			temp.styleName = "ui/app/daTi/zhi-shi-jing-sai-kai-shi.png";
			temp.x = 190;
			temp.y = 178;
			return temp;
		}

		private function imageTextWait_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageTextWait = temp;
			temp.name = "imageTextWait";
			temp.styleName = "ui/app/daTi/yi-cuo-guo-ben-ti.png";
			temp.x = 141;
			temp.y = 176;
			return temp;
		}

		private function imageWoDeZhanJi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageWoDeZhanJi = temp;
			temp.name = "imageWoDeZhanJi";
			temp.styleName = "ui/app/daTi/wo-de-zhan-ji.png";
			temp.x = 630;
			temp.y = 433;
			return temp;
		}

		private function lbDeFen_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDeFen = temp;
			temp.name = "lbDeFen";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "得分";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 754;
			temp.y = 115;
			return temp;
		}

		private function lbGuoJia_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbGuoJia = temp;
			temp.name = "lbGuoJia";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "国家";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 704;
			temp.y = 115;
			return temp;
		}

		private function lbJueSeMing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJueSeMing = temp;
			temp.name = "lbJueSeMing";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "角色名";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 620;
			temp.y = 115;
			return temp;
		}

		private function lbNameCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameCount = temp;
			temp.name = "lbNameCount";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "当前题数：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 94;
			temp.x = 264;
			temp.y = 319;
			return temp;
		}

		private function lbNameRanking_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameRanking = temp;
			temp.name = "lbNameRanking";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "当前排名：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 91;
			temp.x = 674;
			temp.y = 463;
			return temp;
		}

		private function lbNameScore_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameScore = temp;
			temp.name = "lbNameScore";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "当前得分：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 97;
			temp.x = 532;
			temp.y = 463;
			return temp;
		}

		private function lbNameTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameTime = temp;
			temp.name = "lbNameTime";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "剩余答题时间：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 123;
			temp.x = 78;
			temp.y = 319;
			return temp;
		}

		private function lbPaiMing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPaiMing = temp;
			temp.name = "lbPaiMing";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "排名";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 553;
			temp.y = 115;
			return temp;
		}

		private function lbValueCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueCount = temp;
			temp.name = "lbValueCount";
			temp.fontSize = 16;
			temp.text = "0/20";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 57;
			temp.x = 355;
			temp.y = 319;
			return temp;
		}

		private function lbValueRanking_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueRanking = temp;
			temp.name = "lbValueRanking";
			temp.fontSize = 16;
			temp.text = "50名";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 760;
			temp.y = 463;
			return temp;
		}

		private function lbValueScore_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueScore = temp;
			temp.name = "lbValueScore";
			temp.fontSize = 16;
			temp.text = "999分";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 611;
			temp.y = 463;
			return temp;
		}

		private function lbValueTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueTime = temp;
			temp.name = "lbValueTime";
			temp.fontSize = 16;
			temp.text = "0秒";
			temp.color = 0xC21515;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 74;
			temp.x = 190;
			temp.y = 319;
			return temp;
		}

		private function listAnswer_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listAnswer = temp;
			temp.name = "listAnswer";
			temp.height = 120;
			temp.width = 437;
			temp.x = 73;
			temp.y = 169;
			return temp;
		}

		private function listProp_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listProp = temp;
			temp.name = "listProp";
			temp.height = 123;
			temp.width = 450;
			temp.x = 68;
			temp.y = 370;
			temp.layout = __DaTiSkin_HorizontalLayout1_i();
			return temp;
		}

		private function listRank_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listRank = temp;
			temp.name = "listRank";
			temp.height = 282;
			temp.width = 254;
			temp.x = 550;
			temp.y = 138;
			return temp;
		}

		private function textQuestion_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textQuestion = temp;
			temp.name = "textQuestion";
			temp.bold = true;
			temp.isEditable = false;
			temp.height = 65;
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.text.TextBlankSkin;
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 431;
			temp.x = 77;
			temp.y = 94;
			return temp;
		}

		private function title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			title = temp;
			temp.name = "title";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/daTi/zhi-shi-jing-sai-bt.png";
			temp.x = 290;
			temp.y = 24;
			return temp;
		}

		private function uiNumberMinute_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiNumberMinute = temp;
			temp.name = "uiNumberMinute";
			temp.height = 25;
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_da_ti;
			temp.width = 22;
			temp.x = 288;
			temp.y = 202;
			return temp;
		}

		private function uiNumberSecond_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiNumberSecond = temp;
			temp.name = "uiNumberSecond";
			temp.gap = -4;
			temp.height = 25;
			temp.number = 25;
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_da_ti;
			temp.width = 38;
			temp.x = 330;
			temp.y = 202;
			return temp;
		}

	}
}