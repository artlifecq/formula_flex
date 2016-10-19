package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_e_erjianniu;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildAgreementPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var infoTxt1:feathers.controls.Label;

		public var infoTxt2:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var sure:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildAgreementPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__GuildAgreementPanelSkin_UIAsset1_i(),__GuildAgreementPanelSkin_UIAsset2_i(),closeBtn_i(),__GuildAgreementPanelSkin_UIAsset3_i(),__GuildAgreementPanelSkin_UIAsset4_i(),__GuildAgreementPanelSkin_UIAsset5_i(),__GuildAgreementPanelSkin_Label1_i(),__GuildAgreementPanelSkin_Label2_i(),__GuildAgreementPanelSkin_Label3_i(),__GuildAgreementPanelSkin_Label4_i(),__GuildAgreementPanelSkin_Label5_i(),infoTxt1_i(),sure_i(),infoTxt2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildAgreementPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "帮派协议";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 216;
			temp.y = 12;
			return temp;
		}

		private function __GuildAgreementPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "您即将要履行帮派帮主的权利和义务，创建和管理一个帮派";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 46;
			temp.y = 58;
			return temp;
		}

		private function __GuildAgreementPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "帮派的壮大，需要您和帮派成员不懈的努力！";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 46;
			temp.y = 344;
			return temp;
		}

		private function __GuildAgreementPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "一.帮主的权利";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 40;
			temp.y = 84;
			return temp;
		}

		private function __GuildAgreementPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "二.帮主的义务";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 40;
			temp.y = 224;
			return temp;
		}

		private function __GuildAgreementPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 440;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 485;
			return temp;
		}

		private function __GuildAgreementPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 344;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 456;
			temp.x = 14;
			temp.y = 42;
			return temp;
		}

		private function __GuildAgreementPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/bang_pai_xie_yi_bei_jing_tu.png";
			temp.width = 444;
			temp.x = 20;
			temp.y = 47;
			return temp;
		}

		private function __GuildAgreementPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/biao_ti_di%20(2).png";
			temp.x = 19;
			temp.y = 81;
			return temp;
		}

		private function __GuildAgreementPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/biao_ti_di%20(2).png";
			temp.x = 19;
			temp.y = 221;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 450;
			temp.y = 3;
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
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 380;
			temp.x = 47;
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
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 380;
			temp.x = 51;
			temp.y = 259;
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

		private function sure_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sure = temp;
			temp.name = "sure";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "同 意";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 192;
			temp.y = 386;
			return temp;
		}

	}
}