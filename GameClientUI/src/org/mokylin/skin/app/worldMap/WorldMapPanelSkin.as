package org.mokylin.skin.app.worldMap
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.GradientLabel;
	import org.mokylin.skin.app.worldMap.SmallMapPanelSkin;
	import org.mokylin.skin.app.worldMap.WorldPanelSkin;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WorldMapPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var backBtn:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var pageBtn:feathers.controls.Button;

		public var smallMapSkin:feathers.controls.SkinnableContainer;

		public var titleTxt:feathers.controls.GradientLabel;

		public var worldMapSkin:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WorldMapPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 627;
			this.width = 958;
			labelFilterBlack_i();
			this.elementsContent = [__WorldMapPanelSkin_UIAsset1_i(),btnClose_i(),smallMapSkin_i(),worldMapSkin_i(),pageBtn_i(),backBtn_i(),titleTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __WorldMapPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 627;
			temp.styleName = "ui/app/worldmap/bg.png";
			temp.width = 958;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function backBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			backBtn = temp;
			temp.name = "backBtn";
			temp.bold = false;
			temp.height = 36;
			temp.label = "返回当前地图";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu);
			temp.width = 130;
			temp.x = 162;
			temp.y = 57;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 28;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.width = 28;
			temp.x = 918;
			temp.y = 18;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function pageBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			pageBtn = temp;
			temp.name = "pageBtn";
			temp.bold = false;
			temp.height = 36;
			temp.label = "全国地图";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu);
			temp.width = 100;
			temp.x = 60;
			temp.y = 57;
			return temp;
		}

		private function smallMapSkin_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			smallMapSkin = temp;
			temp.name = "smallMapSkin";
			temp.height = 564;
			var skin:StateSkin = new org.mokylin.skin.app.worldMap.SmallMapPanelSkin()
			temp.skin = skin
			temp.width = 857;
			temp.x = 51;
			temp.y = 48;
			return temp;
		}

		private function titleTxt_i():feathers.controls.GradientLabel
		{
			var temp:feathers.controls.GradientLabel = new feathers.controls.GradientLabel();
			titleTxt = temp;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.gradientColor_a = 0xfff2b7;
			temp.gradientColor_b = 0xBE8C2D;
			temp.height = 24;
			temp.fontSize = 18;
			temp.text = "地图";
			temp.textAlign = "center";
			temp.width = 200;
			temp.x = 376;
			temp.y = 26;
			return temp;
		}

		private function worldMapSkin_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			worldMapSkin = temp;
			temp.name = "worldMapSkin";
			temp.height = 517;
			var skin:StateSkin = new org.mokylin.skin.app.worldMap.WorldPanelSkin()
			temp.skin = skin
			temp.visible = false;
			temp.width = 857;
			temp.x = 51;
			temp.y = 91;
			return temp;
		}

	}
}