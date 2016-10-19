package org.mokylin.skin.app.society_build_upgrade
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.society_build_upgrade.mc.UIMovieClipHall;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyBuildUpgradePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bangLingGrid:feathers.controls.UIAsset;

		public var closeBtn:feathers.controls.Button;

		public var currLevelDescTxt:feathers.controls.Label;

		public var hallMc:feathers.controls.UIMovieClip;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var lingPaiCount:feathers.controls.Label;

		public var moneyCount:feathers.controls.Label;

		public var moneyGrid:feathers.controls.UIAsset;

		public var nameLevelTxt:feathers.controls.Label;

		public var nextLevelDescTxt:feathers.controls.Label;

		public var nextLevelTips:feathers.controls.Group;

		public var titleTxt:feathers.controls.Label;

		public var upgradeBtn:feathers.controls.Button;

		public var upgradeTips:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyBuildUpgradePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__SocietyBuildUpgradePanelSkin_UIAsset1_i(),__SocietyBuildUpgradePanelSkin_UIAsset2_i(),__SocietyBuildUpgradePanelSkin_UIAsset3_i(),__SocietyBuildUpgradePanelSkin_UIAsset4_i(),upgradeBtn_i(),closeBtn_i(),titleTxt_i(),__SocietyBuildUpgradePanelSkin_Label1_i(),upgradeTips_i(),currLevelDescTxt_i(),hallMc_i(),nextLevelTips_i(),nameLevelTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyBuildUpgradePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前等级";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 30;
			temp.y = 250;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "下一等级";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "升级消耗";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 0;
			temp.y = 60;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 507;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 422;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 468;
			temp.styleName = "ui/app/society_build_upgrade/beijingtu.jpg";
			temp.width = 404;
			temp.x = 9;
			temp.y = 33;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/society_build_upgrade/xiaoneikuang.png";
			temp.width = 390;
			temp.x = 16;
			temp.y = 400;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 395;
			temp.x = 12;
			temp.y = 4;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 70;
			temp.y = 64;
			return temp;
		}

		private function __SocietyBuildUpgradePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 210;
			temp.y = 64;
			return temp;
		}

		private function bangLingGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bangLingGrid = temp;
			temp.name = "bangLingGrid";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 70;
			temp.y = 64;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 388;
			temp.y = 4;
			return temp;
		}

		private function currLevelDescTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			currLevelDescTxt = temp;
			temp.name = "currLevelDescTxt";
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "家族等级9级";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 280;
			temp.x = 100;
			temp.y = 250;
			return temp;
		}

		private function hallMc_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			hallMc = temp;
			temp.name = "hallMc";
			temp.height = 191;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.society_build_upgrade.mc.UIMovieClipHall);
			temp.width = 393;
			temp.x = 15;
			temp.y = 42;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function lingPaiCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lingPaiCount = temp;
			temp.name = "lingPaiCount";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1个";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 60;
			temp.x = 130;
			temp.y = 80;
			return temp;
		}

		private function moneyCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			moneyCount = temp;
			temp.name = "moneyCount";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "100锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 90;
			temp.x = 270;
			temp.y = 80;
			return temp;
		}

		private function moneyGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			moneyGrid = temp;
			temp.name = "moneyGrid";
			temp.styleName = "ui/common/tubiao/yinzi_46.png";
			temp.x = 213;
			temp.y = 68;
			return temp;
		}

		private function nameLevelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameLevelTxt = temp;
			temp.name = "nameLevelTxt";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "大厅 1级";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 24;
			temp.y = 208;
			return temp;
		}

		private function nextLevelDescTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nextLevelDescTxt = temp;
			temp.name = "nextLevelDescTxt";
			temp.height = 50;
			temp.fontSize = 14;
			temp.text = "家族等级10级";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 280;
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function nextLevelTips_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			nextLevelTips = temp;
			temp.name = "nextLevelTips";
			temp.x = 30;
			temp.y = 310;
			temp.elementsContent = [__SocietyBuildUpgradePanelSkin_Label2_i(),__SocietyBuildUpgradePanelSkin_Label3_i(),lingPaiCount_i(),nextLevelDescTxt_i(),__SocietyBuildUpgradePanelSkin_UIAsset5_i(),bangLingGrid_i(),moneyCount_i(),__SocietyBuildUpgradePanelSkin_UIAsset6_i(),moneyGrid_i()];
			return temp;
		}

		private function titleTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			titleTxt = temp;
			temp.name = "titleTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "大厅";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.width = 100;
			temp.x = 160;
			temp.y = 6;
			return temp;
		}

		private function upgradeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			upgradeBtn = temp;
			temp.name = "upgradeBtn";
			temp.height = 31;
			temp.label = "升  级";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 156;
			temp.y = 456;
			return temp;
		}

		private function upgradeTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			upgradeTips = temp;
			temp.name = "upgradeTips";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "建筑已满级";
			temp.textAlign = "center";
			temp.color = 0xEAA849;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 220;
			temp.x = 103;
			temp.y = 464;
			return temp;
		}

	}
}