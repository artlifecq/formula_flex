package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.Rect;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_close_4;
	import org.mokylin.skin.component.scrollbar.skin_red.VScrollBarRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarResultPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var iconAttackWin:feathers.controls.UIAsset;

		public var iconDefenceWin:feathers.controls.UIAsset;

		public var iconPos:feathers.controls.Rect;

		public var lbAttackFuHuoCount:feathers.controls.Label;

		public var lbAttackFuHuoPlayerName:feathers.controls.Label;

		public var lbAttackHighestScorePlayer:feathers.controls.Label;

		public var lbAttackHighestScoreValue:feathers.controls.Label;

		public var lbAttackLianShaPlayerName:feathers.controls.Label;

		public var lbAttackLianShaValue:feathers.controls.Label;

		public var lbAttackName:feathers.controls.Label;

		public var lbAttackShaDiPlayerName:feathers.controls.Label;

		public var lbAttackShaDiValue:feathers.controls.Label;

		public var lbAttackZhuGongPlayerName:feathers.controls.Label;

		public var lbAttackZhuGongValue:feathers.controls.Label;

		public var lbDefenceFuHuoCount:feathers.controls.Label;

		public var lbDefenceFuHuoPlayerName:feathers.controls.Label;

		public var lbDefenceHighestScorePlayer:feathers.controls.Label;

		public var lbDefenceHighestScoreValue:feathers.controls.Label;

		public var lbDefenceLianShaPlayerName:feathers.controls.Label;

		public var lbDefenceLianShaValue:feathers.controls.Label;

		public var lbDefenceName:feathers.controls.Label;

		public var lbDefenceShaDiPlayerName:feathers.controls.Label;

		public var lbDefenceShaDiValue:feathers.controls.Label;

		public var lbDefenceZhuGongPlayerName:feathers.controls.Label;

		public var lbDefenceZhuGongValue:feathers.controls.Label;

		public var lbEventList:feathers.controls.Label;

		public var lbSelfBeiShaCountDesc:feathers.controls.Label;

		public var lbSelfBeiShaCountValue:feathers.controls.Label;

		public var lbSelfFuHuoCountDesc:feathers.controls.Label;

		public var lbSelfFuHuoCountValue:feathers.controls.Label;

		public var lbSelfHighestScoreDesc:feathers.controls.Label;

		public var lbSelfHighestScoreValue:feathers.controls.Label;

		public var lbSelfScoreDesc:feathers.controls.Label;

		public var lbSelfScoreValue:feathers.controls.Label;

		public var lbSelfZhanShaDesc:feathers.controls.Label;

		public var lbSelfZhanShaValue:feathers.controls.Label;

		public var lbZhanShaCountDesc:feathers.controls.Label;

		public var lbZhanShaCountValue:feathers.controls.Label;

		public var line:feathers.controls.UIAsset;

		public var line0:feathers.controls.UIAsset;

		public var line1:feathers.controls.UIAsset;

		public var line2:feathers.controls.UIAsset;

		public var line3:feathers.controls.UIAsset;

		public var posHeadAttackFuHuo:feathers.controls.Rect;

		public var posHeadAttackLianSha:feathers.controls.Rect;

		public var posHeadAttackShaDi:feathers.controls.Rect;

		public var posHeadAttackZhuGong:feathers.controls.Rect;

		public var posHeadDefenceFuHuo:feathers.controls.Rect;

		public var posHeadDefenceLianSha:feathers.controls.Rect;

		public var posHeadDefenceShaDi:feathers.controls.Rect;

		public var posHeadDefenceZhuGong:feathers.controls.Rect;

		public var scroller:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarResultPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnClose_i(),lbAttackName_i(),lbDefenceName_i(),lbAttackHighestScoreValue_i(),lbAttackHighestScorePlayer_i(),lbAttackFuHuoCount_i(),lbAttackFuHuoPlayerName_i(),lbDefenceFuHuoCount_i(),lbDefenceFuHuoPlayerName_i(),lbDefenceLianShaValue_i(),lbDefenceLianShaPlayerName_i(),lbDefenceShaDiValue_i(),lbDefenceShaDiPlayerName_i(),lbDefenceZhuGongValue_i(),lbDefenceZhuGongPlayerName_i(),lbAttackLianShaValue_i(),lbAttackLianShaPlayerName_i(),lbAttackShaDiValue_i(),lbAttackShaDiPlayerName_i(),lbAttackZhuGongValue_i(),lbAttackZhuGongPlayerName_i(),lbDefenceHighestScoreValue_i(),lbDefenceHighestScorePlayer_i(),lbSelfZhanShaDesc_i(),lbSelfScoreDesc_i(),lbSelfBeiShaCountDesc_i(),lbSelfFuHuoCountDesc_i(),lbZhanShaCountDesc_i(),lbSelfScoreValue_i(),lbSelfHighestScoreDesc_i(),lbSelfHighestScoreValue_i(),lbSelfZhanShaValue_i(),lbSelfBeiShaCountValue_i(),lbSelfFuHuoCountValue_i(),lbZhanShaCountValue_i(),iconAttackWin_i(),iconDefenceWin_i(),line_i(),line0_i(),line1_i(),line2_i(),line3_i(),scroller_i(),lbEventList_i(),iconPos_i(),posHeadAttackFuHuo_i(),posHeadAttackLianSha_i(),posHeadAttackShaDi_i(),posHeadAttackZhuGong_i(),posHeadDefenceFuHuo_i(),posHeadDefenceLianSha_i(),posHeadDefenceShaDi_i(),posHeadDefenceZhuGong_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/countryWar/result_bg.png";
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
			temp.x = 931;
			temp.y = 58;
			return temp;
		}

		private function iconAttackWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconAttackWin = temp;
			temp.name = "iconAttackWin";
			temp.styleName = "ui/app/countryWar/text_sheng.png";
			temp.x = 140;
			temp.y = 28;
			return temp;
		}

		private function iconDefenceWin_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDefenceWin = temp;
			temp.name = "iconDefenceWin";
			temp.styleName = "ui/app/countryWar/text_sheng.png";
			temp.x = 775;
			temp.y = 28;
			return temp;
		}

		private function iconPos_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			iconPos = temp;
			temp.name = "iconPos";
			temp.height = 46;
			temp.width = 46;
			temp.x = 748;
			temp.y = 548;
			return temp;
		}

		private function lbAttackFuHuoCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackFuHuoCount = temp;
			temp.name = "lbAttackFuHuoCount";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 307;
			temp.y = 204;
			return temp;
		}

		private function lbAttackFuHuoPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackFuHuoPlayerName = temp;
			temp.name = "lbAttackFuHuoPlayerName";
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 227;
			temp.y = 222;
			return temp;
		}

		private function lbAttackHighestScorePlayer_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackHighestScorePlayer = temp;
			temp.name = "lbAttackHighestScorePlayer";
			temp.text = "标签";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 249;
			temp.y = 153;
			return temp;
		}

		private function lbAttackHighestScoreValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackHighestScoreValue = temp;
			temp.name = "lbAttackHighestScoreValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 249;
			temp.y = 133;
			return temp;
		}

		private function lbAttackLianShaPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackLianShaPlayerName = temp;
			temp.name = "lbAttackLianShaPlayerName";
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 227;
			temp.y = 277;
			return temp;
		}

		private function lbAttackLianShaValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackLianShaValue = temp;
			temp.name = "lbAttackLianShaValue";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 307;
			temp.y = 259;
			return temp;
		}

		private function lbAttackName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackName = temp;
			temp.name = "lbAttackName";
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0x9FDCED;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 124;
			temp.x = 276;
			temp.y = 67;
			return temp;
		}

		private function lbAttackShaDiPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackShaDiPlayerName = temp;
			temp.name = "lbAttackShaDiPlayerName";
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 227;
			temp.y = 331;
			return temp;
		}

		private function lbAttackShaDiValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackShaDiValue = temp;
			temp.name = "lbAttackShaDiValue";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 307;
			temp.y = 313;
			return temp;
		}

		private function lbAttackZhuGongPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackZhuGongPlayerName = temp;
			temp.name = "lbAttackZhuGongPlayerName";
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 227;
			temp.y = 384;
			return temp;
		}

		private function lbAttackZhuGongValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAttackZhuGongValue = temp;
			temp.name = "lbAttackZhuGongValue";
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 307;
			temp.y = 366;
			return temp;
		}

		private function lbDefenceFuHuoCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceFuHuoCount = temp;
			temp.name = "lbDefenceFuHuoCount";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 744;
			temp.y = 205;
			return temp;
		}

		private function lbDefenceFuHuoPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceFuHuoPlayerName = temp;
			temp.name = "lbDefenceFuHuoPlayerName";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 747;
			temp.y = 223;
			return temp;
		}

		private function lbDefenceHighestScorePlayer_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceHighestScorePlayer = temp;
			temp.name = "lbDefenceHighestScorePlayer";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 726;
			temp.y = 153;
			return temp;
		}

		private function lbDefenceHighestScoreValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceHighestScoreValue = temp;
			temp.name = "lbDefenceHighestScoreValue";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 726;
			temp.y = 134;
			return temp;
		}

		private function lbDefenceLianShaPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceLianShaPlayerName = temp;
			temp.name = "lbDefenceLianShaPlayerName";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 747;
			temp.y = 279;
			return temp;
		}

		private function lbDefenceLianShaValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceLianShaValue = temp;
			temp.name = "lbDefenceLianShaValue";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 744;
			temp.y = 260;
			return temp;
		}

		private function lbDefenceName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceName = temp;
			temp.name = "lbDefenceName";
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 130;
			temp.x = 676;
			temp.y = 67;
			return temp;
		}

		private function lbDefenceShaDiPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceShaDiPlayerName = temp;
			temp.name = "lbDefenceShaDiPlayerName";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 747;
			temp.y = 333;
			return temp;
		}

		private function lbDefenceShaDiValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceShaDiValue = temp;
			temp.name = "lbDefenceShaDiValue";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 744;
			temp.y = 315;
			return temp;
		}

		private function lbDefenceZhuGongPlayerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceZhuGongPlayerName = temp;
			temp.name = "lbDefenceZhuGongPlayerName";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 111;
			temp.x = 747;
			temp.y = 384;
			return temp;
		}

		private function lbDefenceZhuGongValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDefenceZhuGongValue = temp;
			temp.name = "lbDefenceZhuGongValue";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 33;
			temp.x = 744;
			temp.y = 367;
			return temp;
		}

		private function lbEventList_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbEventList = temp;
			temp.name = "lbEventList";
			temp.height = 158;
			temp.leading = 6;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 325;
			temp.x = 205;
			temp.y = 441;
			return temp;
		}

		private function lbSelfBeiShaCountDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfBeiShaCountDesc = temp;
			temp.name = "lbSelfBeiShaCountDesc";
			temp.bold = true;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 161;
			temp.x = 557;
			temp.y = 487;
			return temp;
		}

		private function lbSelfBeiShaCountValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfBeiShaCountValue = temp;
			temp.name = "lbSelfBeiShaCountValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 49;
			temp.x = 716;
			temp.y = 487;
			return temp;
		}

		private function lbSelfFuHuoCountDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfFuHuoCountDesc = temp;
			temp.name = "lbSelfFuHuoCountDesc";
			temp.bold = true;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 176;
			temp.x = 557;
			temp.y = 506;
			return temp;
		}

		private function lbSelfFuHuoCountValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfFuHuoCountValue = temp;
			temp.name = "lbSelfFuHuoCountValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 48;
			temp.x = 731;
			temp.y = 506;
			return temp;
		}

		private function lbSelfHighestScoreDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfHighestScoreDesc = temp;
			temp.name = "lbSelfHighestScoreDesc";
			temp.bold = true;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 74;
			temp.x = 791;
			temp.y = 446;
			return temp;
		}

		private function lbSelfHighestScoreValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfHighestScoreValue = temp;
			temp.name = "lbSelfHighestScoreValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 41;
			temp.x = 866;
			temp.y = 446;
			return temp;
		}

		private function lbSelfScoreDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfScoreDesc = temp;
			temp.name = "lbSelfScoreDesc";
			temp.bold = true;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 118;
			temp.x = 557;
			temp.y = 446;
			return temp;
		}

		private function lbSelfScoreValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfScoreValue = temp;
			temp.name = "lbSelfScoreValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 100;
			temp.x = 676;
			temp.y = 446;
			return temp;
		}

		private function lbSelfZhanShaDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfZhanShaDesc = temp;
			temp.name = "lbSelfZhanShaDesc";
			temp.bold = true;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 147;
			temp.x = 557;
			temp.y = 466;
			return temp;
		}

		private function lbSelfZhanShaValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSelfZhanShaValue = temp;
			temp.name = "lbSelfZhanShaValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 51;
			temp.x = 704;
			temp.y = 466;
			return temp;
		}

		private function lbZhanShaCountDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanShaCountDesc = temp;
			temp.name = "lbZhanShaCountDesc";
			temp.bold = true;
			temp.text = "标签";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 147;
			temp.x = 557;
			temp.y = 525;
			return temp;
		}

		private function lbZhanShaCountValue_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanShaCountValue = temp;
			temp.name = "lbZhanShaCountValue";
			temp.text = "标签";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 56;
			temp.x = 706;
			temp.y = 525;
			return temp;
		}

		private function line0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line0 = temp;
			temp.name = "line0";
			temp.styleName = "ui/app/countryWar/heng_xian.png";
			temp.x = 555;
			temp.y = 484;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/app/countryWar/heng_xian.png";
			temp.x = 555;
			temp.y = 504;
			return temp;
		}

		private function line2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line2 = temp;
			temp.name = "line2";
			temp.styleName = "ui/app/countryWar/heng_xian.png";
			temp.x = 555;
			temp.y = 524;
			return temp;
		}

		private function line3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line3 = temp;
			temp.name = "line3";
			temp.styleName = "ui/app/countryWar/heng_xian.png";
			temp.x = 555;
			temp.y = 544;
			return temp;
		}

		private function line_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line = temp;
			temp.name = "line";
			temp.styleName = "ui/app/countryWar/heng_xian.png";
			temp.x = 555;
			temp.y = 464;
			return temp;
		}

		private function posHeadAttackFuHuo_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadAttackFuHuo = temp;
			temp.name = "posHeadAttackFuHuo";
			temp.height = 10;
			temp.width = 10;
			temp.x = 192;
			temp.y = 244;
			return temp;
		}

		private function posHeadAttackLianSha_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadAttackLianSha = temp;
			temp.name = "posHeadAttackLianSha";
			temp.height = 10;
			temp.width = 10;
			temp.x = 192;
			temp.y = 297;
			return temp;
		}

		private function posHeadAttackShaDi_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadAttackShaDi = temp;
			temp.name = "posHeadAttackShaDi";
			temp.height = 10;
			temp.width = 10;
			temp.x = 192;
			temp.y = 350;
			return temp;
		}

		private function posHeadAttackZhuGong_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadAttackZhuGong = temp;
			temp.name = "posHeadAttackZhuGong";
			temp.height = 10;
			temp.width = 10;
			temp.x = 192;
			temp.y = 404;
			return temp;
		}

		private function posHeadDefenceFuHuo_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadDefenceFuHuo = temp;
			temp.name = "posHeadDefenceFuHuo";
			temp.height = 10;
			temp.width = 10;
			temp.x = 888;
			temp.y = 243;
			return temp;
		}

		private function posHeadDefenceLianSha_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadDefenceLianSha = temp;
			temp.name = "posHeadDefenceLianSha";
			temp.height = 10;
			temp.width = 10;
			temp.x = 888;
			temp.y = 297;
			return temp;
		}

		private function posHeadDefenceShaDi_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadDefenceShaDi = temp;
			temp.name = "posHeadDefenceShaDi";
			temp.height = 10;
			temp.width = 10;
			temp.x = 888;
			temp.y = 351;
			return temp;
		}

		private function posHeadDefenceZhuGong_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			posHeadDefenceZhuGong = temp;
			temp.name = "posHeadDefenceZhuGong";
			temp.height = 10;
			temp.width = 10;
			temp.x = 888;
			temp.y = 404;
			return temp;
		}

		private function scroller_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroller = temp;
			temp.name = "scroller";
			temp.height = 150;
			temp.styleClass = org.mokylin.skin.component.scrollbar.skin_red.VScrollBarRedSkin;
			temp.width = 348;
			temp.x = 183;
			temp.y = 444;
			return temp;
		}

	}
}