package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListRedSkin;
	import org.mokylin.skin.component.radio.RadioSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyTrendsPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var allTrends:feathers.controls.Radio;

		public var bangPaiHuoDong:feathers.controls.Radio;

		public var bangPaiTrends:feathers.controls.Radio;

		public var juanXianJiLu:feathers.controls.Radio;

		public var list:feathers.controls.List;

		public var renShiTrends:feathers.controls.Radio;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyTrendsPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__SocietyTrendsPanelSkin_UIAsset1_i(),__SocietyTrendsPanelSkin_UIAsset2_i(),__SocietyTrendsPanelSkin_UIAsset3_i(),list_i(),__SocietyTrendsPanelSkin_Label1_i(),__SocietyTrendsPanelSkin_Label2_i(),__SocietyTrendsPanelSkin_UIAsset4_i(),allTrends_i(),renShiTrends_i(),bangPaiTrends_i(),juanXianJiLu_i(),bangPaiHuoDong_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyTrendsPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "时间";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 720;
			temp.y = 21;
			return temp;
		}

		private function __SocietyTrendsPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "动态事件";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 280;
			temp.y = 21;
			return temp;
		}

		private function __SocietyTrendsPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 410;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 870;
			temp.x = 7;
			temp.y = 5;
			return temp;
		}

		private function __SocietyTrendsPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 51;
			temp.styleName = "ui/app/country/niupizhi/liebiaodi_da.png";
			temp.width = 867;
			temp.x = 8;
			temp.y = 6;
			return temp;
		}

		private function __SocietyTrendsPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 514;
			temp.y = 19;
			return temp;
		}

		private function __SocietyTrendsPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 873;
			temp.x = 5;
			temp.y = 413;
			return temp;
		}

		private function allTrends_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			allTrends = temp;
			temp.name = "allTrends";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "SocietyTrendsRadioSilver";
			temp.height = 27;
			temp.label = "全部动态";
			temp.isSelected = true;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xF4BD63;
			temp.width = 100;
			temp.x = 185;
			temp.y = 440;
			return temp;
		}

		private function bangPaiHuoDong_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			bangPaiHuoDong = temp;
			temp.name = "bangPaiHuoDong";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "SocietyTrendsRadioSilver";
			temp.height = 27;
			temp.label = "家族活动";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xF4BD63;
			temp.width = 100;
			temp.x = 601;
			temp.y = 440;
			return temp;
		}

		private function bangPaiTrends_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			bangPaiTrends = temp;
			temp.name = "bangPaiTrends";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "SocietyTrendsRadioSilver";
			temp.height = 27;
			temp.label = "家族建筑";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xF4BD63;
			temp.width = 100;
			temp.x = 393;
			temp.y = 440;
			return temp;
		}

		private function juanXianJiLu_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			juanXianJiLu = temp;
			temp.name = "juanXianJiLu";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "SocietyTrendsRadioSilver";
			temp.height = 27;
			temp.label = "捐献记录";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xF4BD63;
			temp.width = 100;
			temp.x = 497;
			temp.y = 440;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 360;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 862;
			temp.x = 10;
			temp.y = 44;
			return temp;
		}

		private function renShiTrends_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			renShiTrends = temp;
			temp.name = "renShiTrends";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "SocietyTrendsRadioSilver";
			temp.height = 27;
			temp.label = "人事变动";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.radio.RadioSkin_3);
			temp.color = 0xF4BD63;
			temp.width = 100;
			temp.x = 289;
			temp.y = 440;
			return temp;
		}

	}
}