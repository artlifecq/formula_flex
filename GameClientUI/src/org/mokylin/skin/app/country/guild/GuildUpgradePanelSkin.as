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
	public class GuildUpgradePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var dailyPrize:feathers.controls.Button;

		public var family_isup:feathers.controls.UIAsset;

		public var fanrongdu_isup:feathers.controls.UIAsset;

		public var fubangzhu_isup:feathers.controls.UIAsset;

		public var nextLv:feathers.controls.Label;

		public var next_family_num:feathers.controls.Label;

		public var next_fubangzhu:feathers.controls.Label;

		public var next_weihu_fanrong:feathers.controls.Label;

		public var next_weihu_silver:feathers.controls.Label;

		public var nowLv:feathers.controls.Label;

		public var now_family_num:feathers.controls.Label;

		public var now_fubangzhu:feathers.controls.Label;

		public var now_weihu_fanrong:feathers.controls.Label;

		public var now_weihu_silver:feathers.controls.Label;

		public var silver_isup:feathers.controls.UIAsset;

		public var upgrade_fanrongdu:feathers.controls.Label;

		public var upgrade_silver:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildUpgradePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildUpgradePanelSkin_UIAsset1_i(),__GuildUpgradePanelSkin_UIAsset2_i(),__GuildUpgradePanelSkin_UIAsset3_i(),__GuildUpgradePanelSkin_UIAsset4_i(),dailyPrize_i(),__GuildUpgradePanelSkin_Label1_i(),closeBtn_i(),__GuildUpgradePanelSkin_UIAsset5_i(),__GuildUpgradePanelSkin_UIAsset6_i(),__GuildUpgradePanelSkin_UIAsset7_i(),__GuildUpgradePanelSkin_UIAsset8_i(),__GuildUpgradePanelSkin_UIAsset9_i(),__GuildUpgradePanelSkin_UIAsset10_i(),__GuildUpgradePanelSkin_UIAsset11_i(),__GuildUpgradePanelSkin_UIAsset12_i(),__GuildUpgradePanelSkin_UIAsset13_i(),nowLv_i(),__GuildUpgradePanelSkin_Label2_i(),__GuildUpgradePanelSkin_Label3_i(),now_weihu_silver_i(),__GuildUpgradePanelSkin_Label4_i(),upgrade_silver_i(),now_weihu_fanrong_i(),now_family_num_i(),now_fubangzhu_i(),next_family_num_i(),next_fubangzhu_i(),next_weihu_fanrong_i(),next_weihu_silver_i(),__GuildUpgradePanelSkin_Label5_i(),upgrade_fanrongdu_i(),__GuildUpgradePanelSkin_Label6_i(),__GuildUpgradePanelSkin_Label7_i(),__GuildUpgradePanelSkin_Label8_i(),__GuildUpgradePanelSkin_Label9_i(),__GuildUpgradePanelSkin_Label10_i(),__GuildUpgradePanelSkin_Label11_i(),__GuildUpgradePanelSkin_Label12_i(),__GuildUpgradePanelSkin_Label13_i(),nextLv_i(),__GuildUpgradePanelSkin_UIAsset14_i(),fubangzhu_isup_i(),family_isup_i(),fanrongdu_isup_i(),silver_isup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildUpgradePanelSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "副帮主个数:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 38;
			temp.y = 205;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "维护费用:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 251;
			temp.y = 93;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "容纳家族数:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 251;
			temp.y = 180;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "副帮主个数:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 251;
			temp.y = 205;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "帮派升级";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 200;
			temp.y = 12;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "维护费用:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 38;
			temp.y = 93;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派资金";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 66;
			temp.y = 122;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派资金";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 113;
			temp.y = 272;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派繁荣度";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 66;
			temp.y = 147;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派繁荣度";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 238;
			temp.y = 272;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派资金";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 279;
			temp.y = 122;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "帮派繁荣度";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 279;
			temp.y = 147;
			return temp;
		}

		private function __GuildUpgradePanelSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "容纳家族数:";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 38;
			temp.y = 180;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 185;
			temp.x = 239;
			temp.y = 144;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 185;
			temp.x = 34;
			temp.y = 199;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 185;
			temp.x = 239;
			temp.y = 199;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset13_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/sheng_ji_fei_yong.png";
			temp.x = 67;
			temp.y = 237;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset14_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_xiao.png";
			temp.x = 195;
			temp.y = 121;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 380;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 456;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 275;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 422;
			temp.x = 17;
			temp.y = 39;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 266;
			temp.styleName = "ui/big_bg/bang_pai_xie_yi_bei_jing_tu.png";
			temp.width = 409;
			temp.x = 21;
			temp.y = 43;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/guild/b%e5%b8%ae%e4%bc%9a%e5%8d%87%e7%ba%a7.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 178;
			temp.styleName = "ui/common/version_3/D_di/di_3.png";
			temp.width = 192;
			temp.x = 235;
			temp.y = 54;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 178;
			temp.styleName = "ui/common/version_3/D_di/di_3.png";
			temp.width = 192;
			temp.x = 30;
			temp.y = 54;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 185;
			temp.x = 34;
			temp.y = 88;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 185;
			temp.x = 239;
			temp.y = 88;
			return temp;
		}

		private function __GuildUpgradePanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 185;
			temp.x = 34;
			temp.y = 144;
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

		private function dailyPrize_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			dailyPrize = temp;
			temp.name = "dailyPrize";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "升 级";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 175;
			temp.y = 323;
			return temp;
		}

		private function family_isup_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			family_isup = temp;
			temp.name = "family_isup";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_shang2.png";
			temp.x = 407;
			temp.y = 177;
			return temp;
		}

		private function fanrongdu_isup_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fanrongdu_isup = temp;
			temp.name = "fanrongdu_isup";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_shang2.png";
			temp.x = 407;
			temp.y = 151;
			return temp;
		}

		private function fubangzhu_isup_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fubangzhu_isup = temp;
			temp.name = "fubangzhu_isup";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_shang2.png";
			temp.x = 407;
			temp.y = 207;
			return temp;
		}

		private function nextLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nextLv = temp;
			temp.name = "nextLv";
			temp.fontSize = 14;
			temp.text = "下一等级 Lv2";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 126;
			temp.x = 279;
			temp.y = 60;
			return temp;
		}

		private function next_family_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			next_family_num = temp;
			temp.name = "next_family_num";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 77;
			temp.x = 338;
			temp.y = 178;
			return temp;
		}

		private function next_fubangzhu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			next_fubangzhu = temp;
			temp.name = "next_fubangzhu";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 87;
			temp.x = 338;
			temp.y = 204;
			return temp;
		}

		private function next_weihu_fanrong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			next_weihu_fanrong = temp;
			temp.name = "next_weihu_fanrong";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 63;
			temp.x = 357;
			temp.y = 148;
			return temp;
		}

		private function next_weihu_silver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			next_weihu_silver = temp;
			temp.name = "next_weihu_silver";
			temp.fontSize = 14;
			temp.text = "10锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 341;
			temp.y = 122;
			return temp;
		}

		private function nowLv_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nowLv = temp;
			temp.name = "nowLv";
			temp.fontSize = 14;
			temp.text = "当前等级 Lv1";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 132;
			temp.x = 79;
			temp.y = 61;
			return temp;
		}

		private function now_family_num_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			now_family_num = temp;
			temp.name = "now_family_num";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 71;
			temp.x = 123;
			temp.y = 178;
			return temp;
		}

		private function now_fubangzhu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			now_fubangzhu = temp;
			temp.name = "now_fubangzhu";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 123;
			temp.y = 204;
			return temp;
		}

		private function now_weihu_fanrong_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			now_weihu_fanrong = temp;
			temp.name = "now_weihu_fanrong";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 145;
			temp.y = 147;
			return temp;
		}

		private function now_weihu_silver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			now_weihu_silver = temp;
			temp.name = "now_weihu_silver";
			temp.fontSize = 14;
			temp.text = "10锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 83;
			temp.x = 131;
			temp.y = 122;
			return temp;
		}

		private function silver_isup_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			silver_isup = temp;
			temp.name = "silver_isup";
			temp.styleName = "ui/common/version_3/B_bujian/jian_tou_shang2.png";
			temp.x = 407;
			temp.y = 121;
			return temp;
		}

		private function upgrade_fanrongdu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			upgrade_fanrongdu = temp;
			temp.name = "upgrade_fanrongdu";
			temp.fontSize = 14;
			temp.text = "100";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 101;
			temp.x = 317;
			temp.y = 272;
			return temp;
		}

		private function upgrade_silver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			upgrade_silver = temp;
			temp.name = "upgrade_silver";
			temp.fontSize = 14;
			temp.text = "10锭";
			temp.color = 0xC21515;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 62;
			temp.x = 178;
			temp.y = 272;
			return temp;
		}

	}
}