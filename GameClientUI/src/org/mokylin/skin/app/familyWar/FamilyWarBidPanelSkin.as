package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.list.EquipListSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarBidPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bidFanrong:feathers.controls.Label;

		public var closeBtn:feathers.controls.Button;

		public var endTime:feathers.controls.Label;

		public var fanrongdu:feathers.controls.Label;

		public var getPrize:feathers.controls.Label;

		public var jionWar:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var rank:feathers.controls.Label;

		public var upBid:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarBidPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__FamilyWarBidPanelSkin_UIAsset1_i(),__FamilyWarBidPanelSkin_UIAsset2_i(),__FamilyWarBidPanelSkin_UIAsset3_i(),__FamilyWarBidPanelSkin_UIAsset4_i(),__FamilyWarBidPanelSkin_UIAsset5_i(),__FamilyWarBidPanelSkin_UIAsset6_i(),closeBtn_i(),__FamilyWarBidPanelSkin_Label1_i(),__FamilyWarBidPanelSkin_Label2_i(),__FamilyWarBidPanelSkin_Label3_i(),__FamilyWarBidPanelSkin_Label4_i(),fanrongdu_i(),upBid_i(),jionWar_i(),getPrize_i(),endTime_i(),rank_i(),__FamilyWarBidPanelSkin_Label5_i(),bidFanrong_i(),list_i(),__FamilyWarBidPanelSkin_UIAsset7_i(),__FamilyWarBidPanelSkin_UIAsset8_i(),__FamilyWarBidPanelSkin_UIAsset9_i(),__FamilyWarBidPanelSkin_UIAsset10_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyWarBidPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "竞标排名";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 98;
			temp.x = 26;
			temp.y = 68;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "帮派名称";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 119;
			temp.x = 145;
			temp.y = 68;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "竞标繁荣度";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 284;
			temp.y = 68;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "本帮派排名：";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 94;
			temp.x = 153;
			temp.y = 38;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "竞标繁荣度：";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 261;
			temp.y = 38;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/ling_qu_jiang_li.png";
			temp.x = 32;
			temp.y = 372;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 508;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 422;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 468;
			temp.styleName = "ui/common/kang/beijingtu.jpg";
			temp.width = 404;
			temp.x = 9;
			temp.y = 33;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/xiaoneikuang.png";
			temp.width = 390;
			temp.x = 15;
			temp.y = 413;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 213;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 397;
			temp.x = 13;
			temp.y = 63;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/liebiao/liebiao.png";
			temp.width = 389;
			temp.x = 18;
			temp.y = 69;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 409;
			temp.x = 3;
			temp.y = 9;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/app/familyWar/wang_cheng_jun_shou_biaoti.png";
			temp.x = 163;
			temp.y = 8;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/wang_cheng_zhan.png";
			temp.x = 31;
			temp.y = 328;
			return temp;
		}

		private function __FamilyWarBidPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/wang_cheng_zhan.png";
			temp.x = 31;
			temp.y = 288;
			return temp;
		}

		private function bidFanrong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bidFanrong = temp;
			temp.name = "bidFanrong";
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 350;
			temp.y = 38;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 389;
			temp.y = 5;
			return temp;
		}

		private function endTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			endTime = temp;
			temp.name = "endTime";
			temp.height = 24;
			temp.fontSize = 14;
			temp.color = 0xFF4500;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 297;
			temp.x = 87;
			temp.y = 426;
			return temp;
		}

		private function fanrongdu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fanrongdu = temp;
			temp.name = "fanrongdu";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "0";
			temp.textAlign = "right";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 333;
			temp.x = 70;
			temp.y = 469;
			return temp;
		}

		private function getPrize_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			getPrize = temp;
			temp.name = "getPrize";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "领取占领奖励";
			temp.textAlign = "left";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 207;
			temp.x = 61;
			temp.y = 373;
			return temp;
		}

		private function jionWar_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jionWar = temp;
			temp.name = "jionWar";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "进入王城争霸活动";
			temp.textAlign = "left";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 207;
			temp.x = 61;
			temp.y = 330;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 175;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.EquipListSkin);
			temp.width = 384;
			temp.x = 19;
			temp.y = 97;
			return temp;
		}

		private function rank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rank = temp;
			temp.name = "rank";
			temp.fontSize = 14;
			temp.text = "0";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 56;
			temp.x = 238;
			temp.y = 38;
			return temp;
		}

		private function upBid_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			upBid = temp;
			temp.name = "upBid";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "竞标王城争霸资格";
			temp.textAlign = "left";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = true;
			temp.width = 207;
			temp.x = 63;
			temp.y = 291;
			return temp;
		}

	}
}