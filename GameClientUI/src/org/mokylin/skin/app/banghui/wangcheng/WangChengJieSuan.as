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
	import org.mokylin.skin.app.banghui.number.UINumberJiesuannum;
	import org.mokylin.skin.app.banghui.wangcheng.WangChengPaiHangList;
	import org.mokylin.skin.app.banghui.wangcheng.WangCheng_JinDu;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

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
		public var gid3_1:feathers.controls.UIAsset;

		public var gid3_2:feathers.controls.UIAsset;

		public var gid3_3:feathers.controls.UIAsset;

		public var gid3_4:feathers.controls.UIAsset;

		public var gid3_5:feathers.controls.UIAsset;

		public var gid3_6:feathers.controls.UIAsset;

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
			this.height = 600;
			this.width = 947;
			this.elementsContent = [__WangChengJieSuan_UIAsset2_i(),__WangChengJieSuan_UIAsset3_i(),__WangChengJieSuan_UIAsset4_i(),__WangChengJieSuan_UIAsset5_i(),uiShibai_i(),uiShengli_i(),__WangChengJieSuan_UIAsset6_i(),lbBang1_i(),lbBang2_i(),skinList_i(),__WangChengJieSuan_UIAsset7_i(),__WangChengJieSuan_UIAsset8_i(),__WangChengJieSuan_UIAsset9_i(),__WangChengJieSuan_UIAsset10_i(),__WangChengJieSuan_UIAsset11_i(),grpGrid_i(),numPaiming_i(),numJisha_i(),numJifen_i(),__WangChengJieSuan_Button1_i(),lbTime_i(),__WangChengJieSuan_UIAsset12_i(),skinBar_i(),lbBar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WangChengJieSuan_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "领取奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 118;
			temp.x = 414;
			temp.y = 546;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/gerenjifen.png";
			temp.x = 710;
			temp.y = 441;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/wodejiangli.png";
			temp.x = 44;
			temp.y = 484;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/jindu/jindutiaodi.png";
			temp.width = 429;
			temp.x = 300;
			temp.y = 125;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/wangcheng/xiaban.png";
			temp.x = 17;
			temp.y = 539;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/banghui/wcjs_bg.jpg";
			temp.x = 18;
			temp.y = 81;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/bangpaizongjifen.png";
			temp.x = 193;
			temp.y = 120;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/gerenjifenpaihangbang.png";
			temp.x = 352;
			temp.y = 150;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/VS.png";
			temp.x = 448;
			temp.y = 82;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/wodezhanji.png";
			temp.x = 44;
			temp.y = 442;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/paiming.png";
			temp.x = 202;
			temp.y = 441;
			return temp;
		}

		private function __WangChengJieSuan_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/jiesuan/jisha.png";
			temp.x = 476;
			temp.y = 441;
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

		private function gid3_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_2 = temp;
			temp.name = "gid3_2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function gid3_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_3 = temp;
			temp.name = "gid3_3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 138;
			temp.y = 0;
			return temp;
		}

		private function gid3_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_4 = temp;
			temp.name = "gid3_4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 211;
			temp.y = 0;
			return temp;
		}

		private function gid3_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_5 = temp;
			temp.name = "gid3_5";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 281;
			temp.y = 0;
			return temp;
		}

		private function gid3_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			gid3_6 = temp;
			temp.name = "gid3_6";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 349;
			temp.y = 0;
			return temp;
		}

		private function grpGrid_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpGrid = temp;
			temp.name = "grpGrid";
			temp.x = 119;
			temp.y = 468;
			temp.elementsContent = [gid3_1_i(),gid3_2_i(),gid3_3_i(),gid3_4_i(),gid3_5_i(),gid3_6_i()];
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
			temp.x = 210;
			temp.y = 93;
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
			temp.x = 594;
			temp.y = 93;
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
			temp.x = 456;
			temp.y = 129;
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
			temp.x = 545;
			temp.y = 553;
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
			temp.x = 790;
			temp.y = 441;
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
			temp.x = 528;
			temp.y = 441;
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
			temp.x = 255;
			temp.y = 441;
			return temp;
		}

		private function skinBar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			skinBar = temp;
			temp.name = "skinBar";
			temp.styleClass = org.mokylin.skin.app.banghui.wangcheng.WangCheng_JinDu;
			temp.value = 60;
			temp.x = 335;
			temp.y = 128;
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
			temp.x = 34;
			temp.y = 185;
			return temp;
		}

		private function uiShengli_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShengli = temp;
			temp.name = "uiShengli";
			temp.styleName = "ui/app/banghui/jiesuan/shengli.png";
			temp.x = 101;
			temp.y = 84;
			return temp;
		}

		private function uiShibai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiShibai = temp;
			temp.name = "uiShibai";
			temp.styleName = "ui/app/banghui/jiesuan/shibai.png";
			temp.x = 762;
			temp.y = 84;
			return temp;
		}

	}
}