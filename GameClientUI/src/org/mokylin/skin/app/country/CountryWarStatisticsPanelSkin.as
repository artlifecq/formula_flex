package org.mokylin.skin.app.country
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarStatisticsPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var aggregateList:feathers.controls.List;

		public var closeBtn:feathers.controls.Button;

		public var detailedList:feathers.controls.List;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarStatisticsPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 495;
			labelFilterBlack_i();
			this.elementsContent = [__CountryWarStatisticsPanelSkin_UIAsset1_i(),__CountryWarStatisticsPanelSkin_UIAsset2_i(),closeBtn_i(),__CountryWarStatisticsPanelSkin_Label1_i(),__CountryWarStatisticsPanelSkin_UIAsset3_i(),__CountryWarStatisticsPanelSkin_UIAsset4_i(),__CountryWarStatisticsPanelSkin_UIAsset5_i(),__CountryWarStatisticsPanelSkin_Label2_i(),__CountryWarStatisticsPanelSkin_Label3_i(),__CountryWarStatisticsPanelSkin_Label4_i(),__CountryWarStatisticsPanelSkin_Label5_i(),__CountryWarStatisticsPanelSkin_Label6_i(),__CountryWarStatisticsPanelSkin_Label7_i(),__CountryWarStatisticsPanelSkin_Label8_i(),aggregateList_i(),detailedList_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryWarStatisticsPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "国战统计";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.width = 100;
			temp.x = 248;
			temp.y = 3;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国家";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 57;
			temp.x = 84;
			temp.y = 44;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国战累计胜利";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 253;
			temp.y = 44;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国战累计失败";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 455;
			temp.y = 44;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "时间";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 57;
			temp.x = 65;
			temp.y = 220;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "宣战国";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 185;
			temp.y = 220;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "防御国";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 340;
			temp.y = 220;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "结果";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 470;
			temp.y = 220;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 495;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 600;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 590;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 445;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 570;
			temp.x = 15;
			temp.y = 38;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiao.png";
			temp.width = 568;
			temp.x = 17;
			temp.y = 45;
			return temp;
		}

		private function __CountryWarStatisticsPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiao.png";
			temp.width = 568;
			temp.x = 17;
			temp.y = 221;
			return temp;
		}

		private function aggregateList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			aggregateList = temp;
			temp.name = "aggregateList";
			temp.height = 150;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 570;
			temp.x = 16;
			temp.y = 68;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.height = 24;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.width = 24;
			temp.x = 566;
			temp.y = 6;
			return temp;
		}

		private function detailedList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			detailedList = temp;
			temp.name = "detailedList";
			temp.height = 230;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 570;
			temp.x = 16;
			temp.y = 245;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

	}
}