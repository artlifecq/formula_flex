package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyBeastPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bossLevel:feathers.controls.Label;

		public var btnGoto:feathers.controls.Button;

		public var descText:feathers.controls.Label;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var grid5:feathers.controls.UIAsset;

		public var killedTips:feathers.controls.UIAsset;

		public var openTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyBeastPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [__SocietyBeastPanelSkin_UIAsset1_i(),__SocietyBeastPanelSkin_UIAsset2_i(),killedTips_i(),openTime_i(),bossLevel_i(),__SocietyBeastPanelSkin_Label1_i(),descText_i(),__SocietyBeastPanelSkin_UIAsset3_i(),__SocietyBeastPanelSkin_UIAsset4_i(),__SocietyBeastPanelSkin_UIAsset5_i(),__SocietyBeastPanelSkin_UIAsset6_i(),__SocietyBeastPanelSkin_UIAsset7_i(),grid1_i(),grid2_i(),grid3_i(),grid4_i(),grid5_i(),__SocietyBeastPanelSkin_UIAsset8_i(),btnGoto_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyBeastPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀掉落：";
			temp.textAlign = "left";
			temp.color = 0xFFE258;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 40;
			temp.y = 439;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/societyBeast_bg.jpg";
			temp.x = 5;
			temp.y = 7;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/biaoti.png";
			temp.x = 166;
			temp.y = 0;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 124;
			temp.y = 424;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 190;
			temp.y = 424;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 257;
			temp.y = 424;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 323;
			temp.y = 424;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 390;
			temp.y = 424;
			return temp;
		}

		private function __SocietyBeastPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 81;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 500;
			temp.y = 408;
			return temp;
		}

		private function bossLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			bossLevel = temp;
			temp.name = "bossLevel";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "神兽等级：33级";
			temp.textAlign = "left";
			temp.color = 0xFFE258;
			temp.width = 180;
			temp.x = 38;
			temp.y = 56;
			return temp;
		}

		private function btnGoto_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGoto = temp;
			temp.name = "btnGoto";
			temp.height = 35;
			temp.label = "开    启";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 742;
			temp.y = 28;
			return temp;
		}

		private function descText_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			descText = temp;
			temp.name = "descText";
			temp.bold = false;
			temp.height = 56;
			temp.fontSize = 14;
			temp.text = "1.家族神兽";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 350;
			temp.x = 516;
			temp.y = 422;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 124;
			temp.y = 424;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 190;
			temp.y = 424;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 257;
			temp.y = 424;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 323;
			temp.y = 424;
			return temp;
		}

		private function grid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid5 = temp;
			temp.name = "grid5";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 390;
			temp.y = 424;
			return temp;
		}

		private function killedTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			killedTips = temp;
			temp.name = "killedTips";
			temp.styleName = "ui/app/country/bangpai/jinriyisha.png";
			temp.x = 472;
			temp.y = 242;
			return temp;
		}

		private function openTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			openTime = temp;
			temp.name = "openTime";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "每日20:00-21:00开放";
			temp.textAlign = "left";
			temp.color = 0xFFE258;
			temp.width = 180;
			temp.x = 38;
			temp.y = 30;
			return temp;
		}

	}
}