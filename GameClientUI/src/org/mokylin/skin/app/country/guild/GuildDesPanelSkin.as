package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
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
	public class GuildDesPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gotoApplyBtn:feathers.controls.Button;

		public var gotoCreate:feathers.controls.Button;

		public var infoTxt1:feathers.controls.Label;

		public var infoTxt2:feathers.controls.Label;

		public var infoTxt3:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildDesPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__GuildDesPanelSkin_UIAsset1_i(),__GuildDesPanelSkin_UIAsset2_i(),gotoApplyBtn_i(),gotoCreate_i(),__GuildDesPanelSkin_Label1_i(),__GuildDesPanelSkin_UIAsset3_i(),__GuildDesPanelSkin_UIAsset4_i(),infoTxt1_i(),__GuildDesPanelSkin_Label2_i(),__GuildDesPanelSkin_UIAsset5_i(),__GuildDesPanelSkin_UIAsset6_i(),infoTxt2_i(),__GuildDesPanelSkin_Label3_i(),__GuildDesPanelSkin_UIAsset7_i(),__GuildDesPanelSkin_UIAsset8_i(),infoTxt3_i(),__GuildDesPanelSkin_UIAsset9_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildDesPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 26;
			temp.htmlText = "";
			temp.fontSize = 16;
			temp.text = "帮主的权利";
			temp.textAlign = "center";
			temp.color = 0xEAA849;
			temp.width = 220;
			temp.x = 540;
			temp.y = 79;
			return temp;
		}

		private function __GuildDesPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 26;
			temp.htmlText = "";
			temp.fontSize = 16;
			temp.text = "帮主的义务";
			temp.textAlign = "center";
			temp.color = 0xEAA849;
			temp.width = 220;
			temp.x = 540;
			temp.y = 212;
			return temp;
		}

		private function __GuildDesPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 26;
			temp.htmlText = "";
			temp.fontSize = 16;
			temp.text = "创建条件";
			temp.textAlign = "center";
			temp.color = 0xEAA849;
			temp.width = 220;
			temp.x = 540;
			temp.y = 309;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/jinweijun.jpg";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 370;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 460;
			temp.x = 404;
			temp.y = 61;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/jinweijun/fenge1.png";
			temp.x = 499;
			temp.y = 88;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/jinweijun/fenge2.png";
			temp.x = 705;
			temp.y = 88;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/jinweijun/fenge1.png";
			temp.x = 499;
			temp.y = 222;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/jinweijun/fenge2.png";
			temp.x = 705;
			temp.y = 222;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/jinweijun/fenge1.png";
			temp.x = 499;
			temp.y = 318;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/jinweijun/fenge2.png";
			temp.x = 705;
			temp.y = 318;
			return temp;
		}

		private function __GuildDesPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/chuang_jian_bang_pai.png";
			temp.x = 405;
			temp.y = 15;
			return temp;
		}

		private function gotoApplyBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			gotoApplyBtn = temp;
			temp.name = "gotoApplyBtn";
			temp.height = 35;
			temp.label = "前去申请";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 622;
			temp.y = 444;
			return temp;
		}

		private function gotoCreate_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			gotoCreate = temp;
			temp.name = "gotoCreate";
			temp.height = 35;
			temp.label = "前去创建";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 750;
			temp.y = 444;
			return temp;
		}

		private function infoTxt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt1 = temp;
			temp.name = "infoTxt1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 102;
			temp.htmlText = "XXXXXXXXXX<br>XXXXXXXXXX<br>XXXXXXXXXX<br>XXXXXXXXXX";
			temp.leading = 2;
			temp.fontSize = 14;
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.width = 380;
			temp.x = 446;
			temp.y = 110;
			return temp;
		}

		private function infoTxt2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt2 = temp;
			temp.name = "infoTxt2";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 61;
			temp.htmlText = "XXXXXXXXXX<br>XXXXXXXXXX";
			temp.leading = 2;
			temp.fontSize = 14;
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.width = 380;
			temp.x = 446;
			temp.y = 247;
			return temp;
		}

		private function infoTxt3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt3 = temp;
			temp.name = "infoTxt3";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 61;
			temp.htmlText = "XXXXXXXXXX<br>XXXXXXXXXX";
			temp.leading = 2;
			temp.fontSize = 14;
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.width = 380;
			temp.x = 446;
			temp.y = 343;
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

	}
}