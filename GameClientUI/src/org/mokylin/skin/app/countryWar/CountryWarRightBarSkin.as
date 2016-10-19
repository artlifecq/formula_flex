package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.version_3.J_jindutiao.ProgressBar_Yellow_1Skin;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyongxialada;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyongxialada1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarRightBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgDesc:feathers.controls.UIAsset;

		public var bgFrame:feathers.controls.UIAsset;

		public var bgFrameTitle:feathers.controls.UIAsset;

		public var bgTitle:feathers.controls.UIAsset;

		public var btnFold:feathers.controls.Button;

		public var btnUnfold:feathers.controls.Button;

		public var groupBottom:feathers.controls.Group;

		public var groupDesc:feathers.controls.Group;

		public var headingBg:feathers.controls.UIAsset;

		public var headingLine1:feathers.controls.UIAsset;

		public var headingLine2:feathers.controls.UIAsset;

		public var headingLine3:feathers.controls.UIAsset;

		public var imageIcon:feathers.controls.UIAsset;

		public var lbDecorate:feathers.controls.UIAsset;

		public var lbDesc:feathers.controls.Label;

		public var lbHeading1:feathers.controls.Label;

		public var lbHeading2:feathers.controls.Label;

		public var lbHeading3:feathers.controls.Label;

		public var lbHeading4:feathers.controls.Label;

		public var lbReliveDesc:feathers.controls.Label;

		public var lbReliveName:feathers.controls.Label;

		public var lbScore:feathers.controls.Label;

		public var lbScoreDesc:feathers.controls.Label;

		public var lbTime:feathers.controls.Label;

		public var lbTimeValue:feathers.controls.Label;

		public var lbTitle:feathers.controls.Label;

		public var lbTitle0:feathers.controls.Label;

		public var listRank:feathers.controls.List;

		public var pbScore:feathers.controls.ProgressBar;

		public var titleDecorate:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarRightBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 250;
			this.elementsContent = [bg_i(),bgTitle_i(),lbTitle_i(),headingBg_i(),lbHeading1_i(),lbHeading2_i(),lbHeading3_i(),lbHeading4_i(),headingLine1_i(),headingLine2_i(),headingLine3_i(),titleDecorate_i(),btnUnfold_i(),btnFold_i(),listRank_i(),lbTime_i(),lbTimeValue_i(),groupBottom_i(),groupDesc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgDesc_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgDesc = temp;
			temp.name = "bgDesc";
			temp.height = 128;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 210;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function bgFrameTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgFrameTitle = temp;
			temp.name = "bgFrameTitle";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title.png";
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function bgFrame_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgFrame = temp;
			temp.name = "bgFrame";
			temp.height = 128;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bgTitle_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgTitle = temp;
			temp.name = "bgTitle";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title.png";
			temp.visible = false;
			temp.x = 1;
			temp.y = 2;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 319;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnFold_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFold = temp;
			temp.name = "btnFold";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyongxialada1;
			temp.x = 52;
			temp.y = 297;
			return temp;
		}

		private function btnUnfold_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUnfold = temp;
			temp.name = "btnUnfold";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyongxialada;
			temp.x = 72;
			temp.y = 295;
			return temp;
		}

		private function groupBottom_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupBottom = temp;
			temp.name = "groupBottom";
			temp.x = 0;
			temp.y = 328;
			temp.elementsContent = [bgFrame_i(),bgFrameTitle_i(),imageIcon_i(),pbScore_i(),lbScoreDesc_i(),lbReliveDesc_i(),lbReliveName_i(),lbDecorate_i(),lbTitle0_i(),lbScore_i()];
			return temp;
		}

		private function groupDesc_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			groupDesc = temp;
			temp.name = "groupDesc";
			temp.x = -215;
			temp.y = 328;
			temp.elementsContent = [bgDesc_i(),lbDesc_i()];
			return temp;
		}

		private function headingBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingBg = temp;
			temp.name = "headingBg";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-bg.png";
			temp.width = 248;
			temp.x = 1;
			temp.y = 32;
			return temp;
		}

		private function headingLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine1 = temp;
			temp.name = "headingLine1";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 42;
			temp.y = 32;
			return temp;
		}

		private function headingLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine2 = temp;
			temp.name = "headingLine2";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 149;
			temp.y = 32;
			return temp;
		}

		private function headingLine3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine3 = temp;
			temp.name = "headingLine3";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 190;
			temp.y = 32;
			return temp;
		}

		private function imageIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageIcon = temp;
			temp.name = "imageIcon";
			temp.styleName = "ui/common/tubiao/bangpaizijin48.png";
			temp.x = 10;
			temp.y = 37;
			return temp;
		}

		private function lbDecorate_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lbDecorate = temp;
			temp.name = "lbDecorate";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 51;
			temp.y = -5;
			return temp;
		}

		private function lbDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDesc = temp;
			temp.name = "lbDesc";
			temp.leading = 6;
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 202;
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function lbHeading1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading1 = temp;
			temp.name = "lbHeading1";
			temp.text = "排名";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 8;
			temp.y = 35;
			return temp;
		}

		private function lbHeading2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading2 = temp;
			temp.name = "lbHeading2";
			temp.text = "名称";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 84;
			temp.y = 35;
			return temp;
		}

		private function lbHeading3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading3 = temp;
			temp.name = "lbHeading3";
			temp.text = "国家";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 157;
			temp.y = 35;
			return temp;
		}

		private function lbHeading4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHeading4 = temp;
			temp.name = "lbHeading4";
			temp.text = "击杀数";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 197;
			temp.y = 35;
			return temp;
		}

		private function lbReliveDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbReliveDesc = temp;
			temp.name = "lbReliveDesc";
			temp.text = "当前复活点:";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 62;
			temp.y = 99;
			return temp;
		}

		private function lbReliveName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbReliveName = temp;
			temp.name = "lbReliveName";
			temp.text = "标签";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 55;
			temp.x = 145;
			temp.y = 100;
			return temp;
		}

		private function lbScoreDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbScoreDesc = temp;
			temp.name = "lbScoreDesc";
			temp.text = "获取积分";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 102;
			temp.y = 72;
			return temp;
		}

		private function lbScore_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbScore = temp;
			temp.name = "lbScore";
			temp.fontSize = 14;
			temp.text = "70/100";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 92;
			temp.x = 81;
			temp.y = 52;
			return temp;
		}

		private function lbTimeValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTimeValue = temp;
			temp.name = "lbTimeValue";
			temp.fontSize = 18;
			temp.text = "00:00";
			temp.textAlign = "left";
			temp.color = 0xFF4500;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 93;
			temp.x = 154;
			temp.y = 276;
			return temp;
		}

		private function lbTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTime = temp;
			temp.name = "lbTime";
			temp.height = 23;
			temp.fontSize = 18;
			temp.text = "国战倒计时：";
			temp.textAlign = "center";
			temp.color = 0xFF4500;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 115;
			temp.x = 46;
			temp.y = 276;
			return temp;
		}

		private function lbTitle0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle0 = temp;
			temp.name = "lbTitle0";
			temp.fontSize = 16;
			temp.text = "当前国战积分";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 104;
			temp.x = 74;
			temp.y = 4;
			return temp;
		}

		private function lbTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTitle = temp;
			temp.name = "lbTitle";
			temp.fontSize = 16;
			temp.text = "战神榜";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 97;
			temp.y = 4;
			return temp;
		}

		private function listRank_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listRank = temp;
			temp.name = "listRank";
			temp.height = 217;
			temp.width = 248;
			temp.x = 1;
			temp.y = 55;
			return temp;
		}

		private function pbScore_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			pbScore = temp;
			temp.name = "pbScore";
			temp.styleClass = org.mokylin.skin.common.version_3.J_jindutiao.ProgressBar_Yellow_1Skin;
			temp.width = 174;
			temp.x = 59;
			temp.y = 53;
			return temp;
		}

		private function titleDecorate_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titleDecorate = temp;
			temp.name = "titleDecorate";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 51;
			temp.y = -5;
			return temp;
		}

	}
}