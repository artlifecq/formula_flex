package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyBeastFightInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var exitBtn:feathers.controls.Button;

		public var grid1:feathers.controls.UIAsset;

		public var grid2:feathers.controls.UIAsset;

		public var grid3:feathers.controls.UIAsset;

		public var grid4:feathers.controls.UIAsset;

		public var grid5:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var levelTxt:feathers.controls.Label;

		public var nameTxt:feathers.controls.Label;

		public var timeTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyBeastFightInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__SocietyBeastFightInfoPanelSkin_UIAsset1_i(),__SocietyBeastFightInfoPanelSkin_UIAsset2_i(),__SocietyBeastFightInfoPanelSkin_Label1_i(),__SocietyBeastFightInfoPanelSkin_UIAsset3_i(),__SocietyBeastFightInfoPanelSkin_UIAsset4_i(),__SocietyBeastFightInfoPanelSkin_UIAsset5_i(),__SocietyBeastFightInfoPanelSkin_UIAsset6_i(),exitBtn_i(),__SocietyBeastFightInfoPanelSkin_Label2_i(),__SocietyBeastFightInfoPanelSkin_Label3_i(),timeTxt_i(),nameTxt_i(),levelTxt_i(),icon_i(),__SocietyBeastFightInfoPanelSkin_UIAsset7_i(),__SocietyBeastFightInfoPanelSkin_UIAsset8_i(),__SocietyBeastFightInfoPanelSkin_UIAsset9_i(),__SocietyBeastFightInfoPanelSkin_UIAsset10_i(),__SocietyBeastFightInfoPanelSkin_UIAsset11_i(),grid1_i(),grid2_i(),grid3_i(),grid4_i(),grid5_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyBeastFightInfoPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "挑战家族神兽";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 200;
			temp.x = 62;
			temp.y = 2;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "剩余挑战时间：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 110;
			temp.x = 16;
			temp.y = 28;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "击杀可能掉落：";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 110;
			temp.x = 16;
			temp.y = 163;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 192;
			temp.y = 199;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 250;
			temp.y = 199;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 340;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 320;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/kang/xiaotaitou.png";
			temp.width = 300;
			temp.x = 10;
			temp.y = 2;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 126;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 300;
			temp.x = 10;
			temp.y = 26;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 300;
			temp.x = 10;
			temp.y = 26;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 120;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 300;
			temp.x = 10;
			temp.y = 161;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 24;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 300;
			temp.x = 10;
			temp.y = 161;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 18;
			temp.y = 199;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 76;
			temp.y = 199;
			return temp;
		}

		private function __SocietyBeastFightInfoPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 134;
			temp.y = 199;
			return temp;
		}

		private function exitBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			exitBtn = temp;
			temp.name = "exitBtn";
			temp.height = 31;
			temp.label = "退出副本";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 124;
			temp.y = 295;
			return temp;
		}

		private function grid1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid1 = temp;
			temp.name = "grid1";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 18;
			temp.y = 199;
			return temp;
		}

		private function grid2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid2 = temp;
			temp.name = "grid2";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 76;
			temp.y = 199;
			return temp;
		}

		private function grid3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid3 = temp;
			temp.name = "grid3";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 134;
			temp.y = 199;
			return temp;
		}

		private function grid4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid4 = temp;
			temp.name = "grid4";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 192;
			temp.y = 199;
			return temp;
		}

		private function grid5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid5 = temp;
			temp.name = "grid5";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 250;
			temp.y = 199;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.height = 71;
			temp.styleName = "ui/mainui/head/small/head_icon.png";
			temp.width = 64;
			temp.x = 30;
			temp.y = 59;
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

		private function levelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelTxt = temp;
			temp.name = "levelTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "100级";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 120;
			temp.y = 105;
			return temp;
		}

		private function nameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nameTxt = temp;
			temp.name = "nameTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "神兽名字";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 120;
			temp.y = 65;
			return temp;
		}

		private function timeTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			timeTxt = temp;
			temp.name = "timeTxt";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "59分59秒";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 120;
			temp.y = 28;
			return temp;
		}

	}
}