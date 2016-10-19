package org.mokylin.skin.app.worldMap
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
	import org.mokylin.skin.component.list.ListSkin2;
	import org.mokylin.skin.component.text.TextInputV3_2Skin;
	import org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SmallMapPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var clansmanBox:feathers.controls.Check;

		public var countryBox:feathers.controls.Check;

		public var enermyBox:feathers.controls.Check;

		public var gotoPosBtn:feathers.controls.Button;

		public var monsterList:feathers.controls.List;

		public var npcList:feathers.controls.List;

		public var npcNameInputTxt:feathers.controls.TextInput;

		public var seachListGroup:feathers.controls.Group;

		public var searchResultsList:feathers.controls.List;

		public var searchXInputTxt:feathers.controls.TextInput;

		public var searchYInputTxt:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SmallMapPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 564;
			this.width = 857;
			this.elementsContent = [__SmallMapPanelSkin_UIAsset1_i(),bg_i(),__SmallMapPanelSkin_Label1_i(),searchXInputTxt_i(),__SmallMapPanelSkin_Label2_i(),searchYInputTxt_i(),gotoPosBtn_i(),npcNameInputTxt_i(),npcList_i(),monsterList_i(),__SmallMapPanelSkin_UIAsset2_i(),__SmallMapPanelSkin_UIAsset3_i(),__SmallMapPanelSkin_Label3_i(),__SmallMapPanelSkin_Label4_i(),clansmanBox_i(),countryBox_i(),enermyBox_i(),__SmallMapPanelSkin_UIAsset4_i(),__SmallMapPanelSkin_UIAsset5_i(),__SmallMapPanelSkin_UIAsset6_i(),__SmallMapPanelSkin_UIAsset7_i(),seachListGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SmallMapPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "X";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 419;
			temp.y = 20;
			return temp;
		}

		private function __SmallMapPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "Y";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 487;
			temp.y = 20;
			return temp;
		}

		private function __SmallMapPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "NPC列表";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 682;
			temp.y = 52;
			return temp;
		}

		private function __SmallMapPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "怪物列表";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 682;
			temp.y = 292;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 494;
			temp.styleName = "ui/common/kang/nei_kuang.png";
			temp.width = 857;
			temp.x = 0;
			temp.y = 43;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 212;
			temp.x = 634;
			temp.y = 50;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/liebiao/lie_biao_di.png";
			temp.width = 210;
			temp.x = 634;
			temp.y = 290;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/map/flag/lv.png";
			temp.x = 397;
			temp.y = 540;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/map/flag/jia_zu.png";
			temp.x = 233;
			temp.y = 540;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/map/flag/di_guo.png";
			temp.x = 105;
			temp.y = 540;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 484;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/fen_ge_xian_shu.png";
			temp.x = 626;
			temp.y = 47;
			return temp;
		}

		private function __SmallMapPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 208;
			temp.styleName = "ui/common/version_3/D_di/di_7.png";
			temp.width = 212;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 478;
			temp.styleName = "ui/app/worldmap/smallBg.jpg";
			temp.width = 617;
			temp.x = 7;
			temp.y = 50;
			return temp;
		}

		private function clansmanBox_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			clansmanBox = temp;
			temp.name = "clansmanBox";
			temp.height = 20;
			temp.label = "显示族人";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold);
			temp.textAlign = "left";
			temp.width = 100;
			temp.x = 145;
			temp.y = 536;
			return temp;
		}

		private function countryBox_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			countryBox = temp;
			temp.name = "countryBox";
			temp.height = 20;
			temp.label = "显示本国和盟国";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold);
			temp.textAlign = "left";
			temp.width = 140;
			temp.x = 267;
			temp.y = 536;
			return temp;
		}

		private function enermyBox_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			enermyBox = temp;
			temp.name = "enermyBox";
			temp.height = 20;
			temp.label = "显示敌人";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold);
			temp.textAlign = "left";
			temp.width = 100;
			temp.x = 17;
			temp.y = 536;
			return temp;
		}

		private function gotoPosBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			gotoPosBtn = temp;
			temp.name = "gotoPosBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 24;
			temp.label = "移动";
			temp.letterSpacing = 3;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniu);
			temp.color = 0xDFC8AF;
			temp.width = 54;
			temp.x = 557;
			temp.y = 17;
			return temp;
		}

		private function monsterList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			monsterList = temp;
			temp.name = "monsterList";
			temp.height = 208;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin2);
			temp.width = 210;
			temp.x = 634;
			temp.y = 316;
			return temp;
		}

		private function npcList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			npcList = temp;
			temp.name = "npcList";
			temp.height = 208;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin2);
			temp.width = 212;
			temp.x = 634;
			temp.y = 76;
			return temp;
		}

		private function npcNameInputTxt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			npcNameInputTxt = temp;
			temp.name = "npcNameInputTxt";
			temp.height = 27;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputV3_2Skin);
			temp.textAlign = "center";
			temp.color = 0x76726D;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 625;
			temp.y = 16;
			return temp;
		}

		private function seachListGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			seachListGroup = temp;
			temp.name = "seachListGroup";
			temp.x = 628;
			temp.y = 41;
			temp.elementsContent = [__SmallMapPanelSkin_UIAsset8_i(),searchResultsList_i()];
			return temp;
		}

		private function searchResultsList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			searchResultsList = temp;
			temp.name = "searchResultsList";
			temp.height = 208;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin2);
			temp.width = 212;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function searchXInputTxt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			searchXInputTxt = temp;
			temp.name = "searchXInputTxt";
			temp.height = 27;
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputV3_2Skin);
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 433;
			temp.y = 16;
			return temp;
		}

		private function searchYInputTxt_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			searchYInputTxt = temp;
			temp.name = "searchYInputTxt";
			temp.height = 27;
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputV3_2Skin);
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 501;
			temp.y = 16;
			return temp;
		}

	}
}