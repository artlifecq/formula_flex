package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.banghui.button.ButtonLingqujiangli;
	import org.mokylin.skin.app.banghui.number.UINumberJiesuannum;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiHangList;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_JinDu;
	import org.mokylin.skin.common.TongYongPanelbg1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangChengJieSuan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnLingQu:feathers.controls.Button;

		public var gid3_1:feathers.controls.UIAsset;

		public var grpGrid:feathers.controls.Group;

		public var lbBang1:feathers.controls.Label;

		public var lbBang2:feathers.controls.Label;

		public var lbBar:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var numJifen:feathers.controls.UINumber;

		public var numJisha:feathers.controls.UINumber;

		public var numPaiming:feathers.controls.UINumber;

		public var skinBar:feathers.controls.ProgressBar;

		public var skinList:feathers.controls.SkinnableContainer;

		public var uiShengli:feathers.controls.UIAsset;

		public var uiShibai:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengJieSuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__WangChengJieSuan_UIAsset1_i(),__WangChengJieSuan_UIAsset2_i(),__WangChengJieSuan_UIAsset3_i(),__WangChengJieSuan_UIAsset4_i(),__WangChengJieSuan_UIAsset5_i(),uiShibai_i(),uiShengli_i(),__WangChengJieSuan_UIAsset6_i(),lbBang1_i(),lbBang2_i(),skinList_i(),__WangChengJieSuan_UIAsset7_i(),__WangChengJieSuan_UIAsset8_i(),__WangChengJieSuan_UIAsset9_i(),__WangChengJieSuan_UIAsset10_i(),__WangChengJieSuan_UIAsset11_i(),grpGrid_i(),numPaiming_i(),numJisha_i(),numJifen_i(),btnLingQu_i(),lbTime_i(),__WangChengJieSuan_UIAsset12_i(),skinBar_i(),lbBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WangChengJieSuan_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/gerenjifen.png";
			temp.x = 714;
			temp.y = 448;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/wodejiangli.png";
			temp.x = 48;
			temp.y = 491;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/jindu/jindutiaodi.png";
			temp.width = 429;
			temp.x = 304;
			temp.y = 132;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaban.png";
			temp.x = 21;
			temp.y = 544;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/wcjs_bg.jpg";
			temp.x = 22;
			temp.y = 88;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/bangpaizongjifen.png";
			temp.x = 197;
			temp.y = 127;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/gerenjifenpaihangbang.png";
			temp.x = 356;
			temp.y = 157;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/VS.png";
			temp.x = 452;
			temp.y = 89;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/wodezhanji.png";
			temp.x = 48;
			temp.y = 449;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/paiming.png";
			temp.x = 206;
			temp.y = 448;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/jisha.png";
			temp.x = 480;
			temp.y = 448;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnLingQu_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLingQu = temp;
			temp.name = "btnLingQu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.styleClass = org.mokylin.skin.app.banghui.button.ButtonLingqujiangli;
			temp.color = 0xCFC6AE;
			temp.width = 118;
			temp.x = 418;
			temp.y = 555;
			return temp;
		}

		private function gid3_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_1 = temp;
			temp.name = "gid3_1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpGrid_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpGrid = temp;
			temp.name = "grpGrid";
			temp.x = 123;
			temp.y = 475;
			temp.elementsContent = [gid3_1_i()];
			return temp;
		}

		private function lbBang1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBang1 = temp;
			temp.name = "lbBang1";
			temp.fontSize = 16;
			temp.text = "帮派名称七个字";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 126;
			temp.x = 214;
			temp.y = 100;
			return temp;
		}

		private function lbBang2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBang2 = temp;
			temp.name = "lbBang2";
			temp.fontSize = 16;
			temp.text = "帮派名称七个字";
			temp.color = 0xD02525;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 126;
			temp.x = 598;
			temp.y = 100;
			return temp;
		}

		private function lbBar_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbBar = temp;
			temp.name = "lbBar";
			temp.text = "600/3000";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 131;
			temp.x = 460;
			temp.y = 136;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.text = "15秒后自动领取并退出";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 182;
			temp.x = 549;
			temp.y = 560;
			return temp;
		}

		private function numJifen_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numJifen = temp;
			temp.name = "numJifen";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "500";
			temp.styleClass = org.mokylin.skin.app.banghui.number.UINumberJiesuannum;
			temp.width = 70;
			temp.x = 794;
			temp.y = 448;
			return temp;
		}

		private function numJisha_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numJisha = temp;
			temp.name = "numJisha";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "20";
			temp.styleClass = org.mokylin.skin.app.banghui.number.UINumberJiesuannum;
			temp.width = 70;
			temp.x = 532;
			temp.y = 448;
			return temp;
		}

		private function numPaiming_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numPaiming = temp;
			temp.name = "numPaiming";
			temp.gap = -3;
			temp.height = 25;
			temp.label = "20";
			temp.styleClass = org.mokylin.skin.app.banghui.number.UINumberJiesuannum;
			temp.width = 70;
			temp.x = 259;
			temp.y = 448;
			return temp;
		}

		private function skinBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			skinBar = temp;
			temp.name = "skinBar";
			temp.styleClass = org.mokylin.skin.app.banghui.wangcheng.WangCheng_JinDu;
			temp.value = 60;
			temp.x = 339;
			temp.y = 135;
			return temp;
		}

		private function skinList_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinList = temp;
			temp.name = "skinList";
			temp.height = 247;
			var skin:StateSkin = new org.mokylin.skin.app.banghui.wangcheng.WangChengPaiHangList()
			temp.skin = skin
			temp.width = 880;
			temp.x = 38;
			temp.y = 192;
			return temp;
		}

		private function uiShengli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShengli = temp;
			temp.name = "uiShengli";
			temp.styleName = "ui/app/banghui/jiesuan/shengli.png";
			temp.x = 105;
			temp.y = 91;
			return temp;
		}

		private function uiShibai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShibai = temp;
			temp.name = "uiShibai";
			temp.styleName = "ui/app/banghui/jiesuan/shibai.png";
			temp.x = 766;
			temp.y = 91;
			return temp;
		}

	}
}