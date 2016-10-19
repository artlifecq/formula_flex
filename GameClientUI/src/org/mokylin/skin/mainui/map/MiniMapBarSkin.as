package org.mokylin.skin.mainui.map
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.Slider;
	import org.mokylin.skin.mainui.map.ScaleSliderSkin;
	import org.mokylin.skin.mainui.map.button.ButtonBang;
	import org.mokylin.skin.mainui.map.button.ButtonDaditu;
	import org.mokylin.skin.mainui.map.button.ButtonDitu_close;
	import org.mokylin.skin.mainui.map.button.ButtonDitu_open;
	import org.mokylin.skin.mainui.map.button.ButtonGuaji;
	import org.mokylin.skin.mainui.map.button.ButtonShengyin;
	import org.mokylin.skin.mainui.map.button.ButtonShezhi;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_decre;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_incre;
	import org.mokylin.skin.mainui.map.button.ButtonYanjing;
	import org.mokylin.skin.mainui.map.button.ButtonYoujian;
	import org.mokylin.skin.mainui.map.button.ButtonZhi_nan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MiniMapBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btnGuaji:feathers.controls.Button;

		public var btnMail:feathers.controls.Button;

		public var btnRank:feathers.controls.Button;

		public var btnShengYin:feathers.controls.Button;

		public var btnShengYin0:feathers.controls.Button;

		public var btnWorldMap:feathers.controls.Button;

		public var btnYanJing:feathers.controls.Button;

		public var btnZhiNan:feathers.controls.Button;

		public var btnopen:feathers.controls.Button;

		public var decrement:feathers.controls.Button;

		public var grpMap:feathers.controls.Group;

		public var grpScroller:feathers.controls.Group;

		public var imgNet:feathers.controls.UIAsset;

		public var increment:feathers.controls.Button;

		public var labCityName:feathers.controls.Label;

		public var labTime:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var scaleSlider:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MiniMapBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 257;
			this.width = 250;
			labelFilterBlack_i();
			this.elementsContent = [__MiniMapBarSkin_UIAsset1_i(),labTime_i(),btnMail_i(),btnWorldMap_i(),btnRank_i(),btnGuaji_i(),btnopen_i(),btnClose_i(),grpMap_i(),imgNet_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MiniMapBarSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 41;
			temp.styleName = "ui/mainui/map/di_kuang_shang.png";
			temp.width = 265;
			temp.x = -15;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 230;
			temp.styleName = "ui/mainui/map/lei_da_di.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 17;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonDitu_close);
			temp.width = 18;
			temp.x = 225;
			temp.y = 4;
			return temp;
		}

		private function btnGuaji_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGuaji = temp;
			temp.name = "btnGuaji";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonGuaji);
			temp.x = 98;
			temp.y = 0;
			return temp;
		}

		private function btnMail_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMail = temp;
			temp.name = "btnMail";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonYoujian);
			temp.x = 44;
			temp.y = 0;
			return temp;
		}

		private function btnRank_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRank = temp;
			temp.name = "btnRank";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonBang);
			temp.x = 70;
			temp.y = 0;
			return temp;
		}

		private function btnShengYin0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShengYin0 = temp;
			temp.name = "btnShengYin0";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonShezhi);
			temp.x = 225;
			temp.y = 132;
			return temp;
		}

		private function btnShengYin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShengYin = temp;
			temp.name = "btnShengYin";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonShengyin);
			temp.x = 225;
			temp.y = 52;
			return temp;
		}

		private function btnWorldMap_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnWorldMap = temp;
			temp.name = "btnWorldMap";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonDaditu);
			temp.x = 124;
			temp.y = 0;
			return temp;
		}

		private function btnYanJing_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnYanJing = temp;
			temp.name = "btnYanJing";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonYanjing);
			temp.x = 225;
			temp.y = 27;
			return temp;
		}

		private function btnZhiNan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnZhiNan = temp;
			temp.name = "btnZhiNan";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonZhi_nan);
			temp.x = 225;
			temp.y = 2;
			return temp;
		}

		private function btnopen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnopen = temp;
			temp.name = "btnopen";
			temp.height = 17;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonDitu_open);
			temp.width = 18;
			temp.x = 224;
			temp.y = 4;
			return temp;
		}

		private function decrement_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			decrement = temp;
			temp.name = "decrement";
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_decre);
			temp.width = 18;
			temp.x = 1;
			temp.y = 57;
			return temp;
		}

		private function grpMap_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpMap = temp;
			temp.name = "grpMap";
			temp.height = 230;
			temp.width = 250;
			temp.x = 0;
			temp.y = 24;
			temp.elementsContent = [bg_i(),labCityName_i(),btnShengYin_i(),btnShengYin0_i(),btnYanJing_i(),btnZhiNan_i(),grpScroller_i()];
			return temp;
		}

		private function grpScroller_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpScroller = temp;
			temp.name = "grpScroller";
			temp.x = 228;
			temp.y = 156;
			temp.elementsContent = [scaleSlider_i(),decrement_i(),increment_i()];
			return temp;
		}

		private function imgNet_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgNet = temp;
			temp.name = "imgNet";
			temp.styleName = "ui/mainui/map/lv.png";
			temp.x = 152;
			temp.y = 2;
			return temp;
		}

		private function increment_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			increment = temp;
			temp.name = "increment";
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_incre);
			temp.width = 18;
			temp.x = 1;
			temp.y = 0;
			return temp;
		}

		private function labCityName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCityName = temp;
			temp.name = "labCityName";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "卧龙城";
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 8;
			temp.y = 4;
			return temp;
		}

		private function labTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTime = temp;
			temp.name = "labTime";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "15:32";
			temp.textAlign = "center";
			temp.color = 0xD0CFCE;
			temp.width = 44;
			temp.x = 180;
			temp.y = 4;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 4;
			return temp;
		}

		private function scaleSlider_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			scaleSlider = temp;
			temp.name = "scaleSlider";
			temp.height = 45;
			temp.direction = Slider.DIRECTION_VERTICAL
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.ScaleSliderSkin);
			temp.width = 6;
			temp.x = 7;
			temp.y = 16;
			return temp;
		}

	}
}