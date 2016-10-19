package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
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
	public class GuildSalarySkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var countryGuild:feathers.controls.UIAsset;

		public var countryGuildPrize:feathers.controls.Button;

		public var daily:feathers.controls.UIAsset;

		public var dailyPrize:feathers.controls.Button;

		public var notCountryGuild:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildSalarySkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildSalarySkin_UIAsset1_i(),__GuildSalarySkin_UIAsset2_i(),__GuildSalarySkin_UIAsset3_i(),__GuildSalarySkin_UIAsset4_i(),__GuildSalarySkin_Label1_i(),closeBtn_i(),__GuildSalarySkin_UIAsset5_i(),__GuildSalarySkin_UIAsset6_i(),__GuildSalarySkin_UIAsset7_i(),__GuildSalarySkin_UIAsset8_i(),daily_i(),__GuildSalarySkin_UIAsset9_i(),__GuildSalarySkin_UIAsset10_i(),countryGuild_i(),__GuildSalarySkin_UIAsset11_i(),__GuildSalarySkin_UIAsset12_i(),dailyPrize_i(),countryGuildPrize_i(),notCountryGuild_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildSalarySkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 16;
			temp.text = "帮派俸禄";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 195;
			temp.y = 12;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 307;
			temp.y = 135;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/mei_ri_feng_lu.png";
			temp.x = 45;
			temp.y = 61;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/wang_bang_feng_lu.png";
			temp.x = 247;
			temp.y = 62;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 330;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 456;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 275;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 422;
			temp.x = 17;
			temp.y = 39;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 266;
			temp.styleName = "ui/big_bg/bang_pai_xie_yi_bei_jing_tu.png";
			temp.width = 409;
			temp.x = 21;
			temp.y = 43;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/b%e5%b8%ae%e4%bc%9a%e4%bf%b8%e7%a6%84.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/D_di/di_6.png";
			temp.x = 28;
			temp.y = 51;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/D_di/di_6.png";
			temp.x = 228;
			temp.y = 51;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_5.png";
			temp.x = 75;
			temp.y = 125;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 99;
			temp.y = 135;
			return temp;
		}

		private function __GuildSalarySkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang_5.png";
			temp.x = 283;
			temp.y = 125;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 419;
			temp.y = 6;
			return temp;
		}

		private function countryGuildPrize_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			countryGuildPrize = temp;
			temp.name = "countryGuildPrize";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "领 取";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 283;
			temp.y = 269;
			return temp;
		}

		private function countryGuild_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			countryGuild = temp;
			temp.name = "countryGuild";
			temp.styleName = "ui/common/tubiao/bangpaizijin48.png";
			temp.x = 308;
			temp.y = 138;
			return temp;
		}

		private function dailyPrize_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			dailyPrize = temp;
			temp.name = "dailyPrize";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "领 取";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 74;
			temp.y = 268;
			return temp;
		}

		private function daily_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			daily = temp;
			temp.name = "daily";
			temp.styleName = "ui/common/tubiao/bangpaizijin48.png";
			temp.x = 100;
			temp.y = 138;
			return temp;
		}

		private function notCountryGuild_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			notCountryGuild = temp;
			temp.name = "notCountryGuild";
			temp.styleName = "ui/app/country/guild/wang_bang_zhuan_shu.png";
			temp.x = 257;
			temp.y = 273;
			return temp;
		}

	}
}