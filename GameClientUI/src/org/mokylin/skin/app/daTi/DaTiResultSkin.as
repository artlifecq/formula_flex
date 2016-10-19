package org.mokylin.skin.app.daTi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_4;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DaTiResultSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgMyResult:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btnSure:feathers.controls.Button;

		public var imageHuoDeJiangLi:feathers.controls.UIAsset;

		public var imageLineLeft:feathers.controls.UIAsset;

		public var imageLineRight:feathers.controls.UIAsset;

		public var imageNinDeBiaoXian:feathers.controls.UIAsset;

		public var imageRankTitleBg:feathers.controls.UIAsset;

		public var lbChengHao:feathers.controls.Label;

		public var lbDeFen:feathers.controls.Label;

		public var lbEWai:feathers.controls.Label;

		public var lbGuoJia:feathers.controls.Label;

		public var lbJueSeMing:feathers.controls.Label;

		public var lbNameExp:feathers.controls.Label;

		public var lbNameRanking:feathers.controls.Label;

		public var lbNameRightCount:feathers.controls.Label;

		public var lbNameScore:feathers.controls.Label;

		public var lbNameWrongCount:feathers.controls.Label;

		public var lbPaiMing:feathers.controls.Label;

		public var lbValueExp:feathers.controls.Label;

		public var lbValueRanking:feathers.controls.Label;

		public var lbValueRightCount:feathers.controls.Label;

		public var lbValueScore:feathers.controls.Label;

		public var lbValueWrongCount:feathers.controls.Label;

		public var listRank:feathers.controls.List;

		public var title:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DaTiResultSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),bgMyResult_i(),listRank_i(),imageRankTitleBg_i(),lbPaiMing_i(),lbJueSeMing_i(),lbGuoJia_i(),lbDeFen_i(),lbEWai_i(),lbChengHao_i(),imageLineLeft_i(),imageLineRight_i(),imageHuoDeJiangLi_i(),lbNameRightCount_i(),lbValueRightCount_i(),lbNameExp_i(),lbValueExp_i(),lbNameWrongCount_i(),lbValueWrongCount_i(),lbNameScore_i(),lbValueScore_i(),lbNameRanking_i(),lbValueRanking_i(),imageNinDeBiaoXian_i(),title_i(),btnSure_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgMyResult_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgMyResult = temp;
			temp.name = "bgMyResult";
			temp.height = 321;
			temp.styleName = "ui/app/daTi/bg1.png";
			temp.x = 484;
			temp.y = 92;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 492;
			temp.styleName = "ui/app/daTi/juan-zhou.png";
			temp.width = 739;
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
			temp.x = 695;
			temp.y = 52;
			return temp;
		}

		private function btnSure_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSure = temp;
			temp.name = "btnSure";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "确定";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
			temp.color = 0xF9F0CC;
			temp.width = 104;
			temp.x = 542;
			temp.y = 345;
			return temp;
		}

		private function imageHuoDeJiangLi_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageHuoDeJiangLi = temp;
			temp.name = "imageHuoDeJiangLi";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/daTi/huo-de-jiang-li.png";
			temp.x = 549;
			temp.y = 210;
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
			temp.width = 52;
			temp.x = 490;
			temp.y = 222;
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
			temp.width = 66;
			temp.x = 701;
			temp.y = 222;
			return temp;
		}

		private function imageNinDeBiaoXian_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageNinDeBiaoXian = temp;
			temp.name = "imageNinDeBiaoXian";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/daTi/nin-de-biao-xian.png";
			temp.x = 549;
			temp.y = 100;
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
			temp.width = 444;
			temp.x = 41;
			temp.y = 93;
			return temp;
		}

		private function lbChengHao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbChengHao = temp;
			temp.name = "lbChengHao";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "称号奖励";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 401;
			temp.y = 97;
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
			temp.x = 271;
			temp.y = 97;
			return temp;
		}

		private function lbEWai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbEWai = temp;
			temp.name = "lbEWai";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "额外奖励";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 69;
			temp.x = 322;
			temp.y = 97;
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
			temp.x = 224;
			temp.y = 97;
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
			temp.x = 137;
			temp.y = 97;
			return temp;
		}

		private function lbNameExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameExp = temp;
			temp.name = "lbNameExp";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "经验：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 55;
			temp.x = 490;
			temp.y = 243;
			return temp;
		}

		private function lbNameRanking_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameRanking = temp;
			temp.name = "lbNameRanking";
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "排名：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 55;
			temp.x = 595;
			temp.y = 167;
			return temp;
		}

		private function lbNameRightCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameRightCount = temp;
			temp.name = "lbNameRightCount";
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "答对：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 55;
			temp.x = 490;
			temp.y = 133;
			return temp;
		}

		private function lbNameScore_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameScore = temp;
			temp.name = "lbNameScore";
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "得分：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 55;
			temp.x = 490;
			temp.y = 167;
			return temp;
		}

		private function lbNameWrongCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNameWrongCount = temp;
			temp.name = "lbNameWrongCount";
			temp.bold = true;
			temp.height = 25;
			temp.fontSize = 16;
			temp.text = "答错：";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 55;
			temp.x = 595;
			temp.y = 133;
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
			temp.x = 72;
			temp.y = 97;
			return temp;
		}

		private function lbValueExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueExp = temp;
			temp.name = "lbValueExp";
			temp.fontSize = 16;
			temp.text = "99";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 146;
			temp.x = 535;
			temp.y = 243;
			return temp;
		}

		private function lbValueRanking_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueRanking = temp;
			temp.name = "lbValueRanking";
			temp.fontSize = 16;
			temp.text = "99";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 47;
			temp.x = 638;
			temp.y = 167;
			return temp;
		}

		private function lbValueRightCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueRightCount = temp;
			temp.name = "lbValueRightCount";
			temp.fontSize = 16;
			temp.text = "99";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 62;
			temp.x = 533;
			temp.y = 133;
			return temp;
		}

		private function lbValueScore_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueScore = temp;
			temp.name = "lbValueScore";
			temp.fontSize = 16;
			temp.text = "99";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 63;
			temp.x = 533;
			temp.y = 167;
			return temp;
		}

		private function lbValueWrongCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbValueWrongCount = temp;
			temp.name = "lbValueWrongCount";
			temp.fontSize = 16;
			temp.text = "99";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 638;
			temp.y = 133;
			return temp;
		}

		private function listRank_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listRank = temp;
			temp.name = "listRank";
			temp.height = 306;
			temp.width = 422;
			temp.x = 56;
			temp.y = 117;
			return temp;
		}

		private function title_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			title = temp;
			temp.name = "title";
			temp.styleName = "ui/app/daTi/jin-bang-ti-ming.png";
			temp.x = 254;
			temp.y = 27;
			return temp;
		}

	}
}