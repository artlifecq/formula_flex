package org.mokylin.skin.app.relive
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.relive.button.ButtonRelive;
	import org.mokylin.skin.app.relive.button.ButtonXinchunge;
	import org.mokylin.skin.app.relive.button.ButtonZhe_kou;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RelivePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var anquanRelive:feathers.controls.Button;

		public var bg:feathers.controls.UIAsset;

		public var closeBtn:feathers.controls.Button;

		public var guajiReliveLbl:feathers.controls.Label;

		public var labInSituInfo:feathers.controls.Label;

		public var labPerfectInfo:feathers.controls.Label;

		public var labReliveTime:feathers.controls.Label;

		public var originDiscount:feathers.controls.Button;

		public var paodekuai:feathers.controls.Button;

		public var prefectDiscount:feathers.controls.Button;

		public var reliveCountLbl:feathers.controls.Label;

		public var reliveCountLbl0:feathers.controls.Label;

		public var reliveDiscountCounty:feathers.controls.Label;

		public var reliveTo:feathers.controls.Label;

		public var shangbuqi:feathers.controls.Button;

		public var wanmeiRelive:feathers.controls.Button;

		public var wanmeiSilver:feathers.controls.Label;

		public var xinchungeRelive:feathers.controls.Button;

		public var yuandiRelive:feathers.controls.Button;

		public var yuandiSilver:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RelivePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),__RelivePanelSkin_UIAsset1_i(),__RelivePanelSkin_UIAsset2_i(),__RelivePanelSkin_UIAsset3_i(),__RelivePanelSkin_UIAsset4_i(),__RelivePanelSkin_Label1_i(),labInSituInfo_i(),labPerfectInfo_i(),labReliveTime_i(),anquanRelive_i(),yuandiRelive_i(),wanmeiRelive_i(),yuandiSilver_i(),wanmeiSilver_i(),reliveTo_i(),guajiReliveLbl_i(),closeBtn_i(),reliveDiscountCounty_i(),xinchungeRelive_i(),shangbuqi_i(),paodekuai_i(),reliveCountLbl_i(),reliveCountLbl0_i(),originDiscount_i(),prefectDiscount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RelivePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "选择复活模式";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 232;
			temp.x = 171;
			temp.y = 10;
			return temp;
		}

		private function __RelivePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 166;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 535;
			temp.x = 20;
			temp.y = 66;
			return temp;
		}

		private function __RelivePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/relive/di_tu.png";
			temp.x = 25;
			temp.y = 66;
			return temp;
		}

		private function __RelivePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/relive/di.png";
			temp.x = 211;
			temp.y = 84;
			return temp;
		}

		private function __RelivePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/relive/di.png";
			temp.x = 385;
			temp.y = 84;
			return temp;
		}

		private function anquanRelive_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			anquanRelive = temp;
			temp.name = "anquanRelive";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 42;
			temp.label = "安 全 复 活";
			temp.fontSize = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniuhuang);
			temp.color = 0xF9F0CC;
			temp.width = 148;
			temp.x = 37;
			temp.y = 114;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 308;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 574;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 539;
			temp.y = 8;
			return temp;
		}

		private function guajiReliveLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guajiReliveLbl = temp;
			temp.name = "guajiReliveLbl";
			temp.fontSize = 14;
			temp.text = "挂机自动复活： 30秒";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 162;
			temp.x = 206;
			temp.y = 189;
			return temp;
		}

		private function labInSituInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labInSituInfo = temp;
			temp.name = "labInSituInfo";
			temp.fontSize = 14;
			temp.text = "已结连续使用99次";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 168;
			temp.x = 204;
			temp.y = 162;
			return temp;
		}

		private function labPerfectInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPerfectInfo = temp;
			temp.name = "labPerfectInfo";
			temp.fontSize = 14;
			temp.text = "已结连续使用99次";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 157;
			temp.x = 382;
			temp.y = 162;
			return temp;
		}

		private function labReliveTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labReliveTime = temp;
			temp.name = "labReliveTime";
			temp.fontSize = 14;
			temp.text = "$秒后自动安全复活";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 166;
			temp.x = 25;
			temp.y = 162;
			return temp;
		}

		private function originDiscount_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			originDiscount = temp;
			temp.name = "originDiscount";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.relive.button.ButtonZhe_kou);
			temp.x = 340;
			temp.y = 69;
			return temp;
		}

		private function paodekuai_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			paodekuai = temp;
			temp.name = "paodekuai";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "跑 得 快";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.relive.button.ButtonRelive);
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.x = 115;
			temp.y = 234;
			return temp;
		}

		private function prefectDiscount_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			prefectDiscount = temp;
			temp.name = "prefectDiscount";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.relive.button.ButtonZhe_kou);
			temp.x = 513;
			temp.y = 69;
			return temp;
		}

		private function reliveCountLbl0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reliveCountLbl0 = temp;
			temp.name = "reliveCountLbl0";
			temp.fontSize = 14;
			temp.text = "您每日可以获得免费的原地复活和完美复活各$次";
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 329;
			temp.x = 21;
			temp.y = 40;
			return temp;
		}

		private function reliveCountLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reliveCountLbl = temp;
			temp.name = "reliveCountLbl";
			temp.fontSize = 14;
			temp.text = "安全复活可重置复活次数为0";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 461;
			temp.x = 55;
			temp.y = 271;
			return temp;
		}

		private function reliveDiscountCounty_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reliveDiscountCounty = temp;
			temp.name = "reliveDiscountCounty";
			temp.fontSize = 14;
			temp.text = "国王已开启军费折扣，复活费用↓20%";
			temp.textAlign = "right";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.visible = false;
			temp.width = 249;
			temp.x = 28;
			temp.y = 73;
			return temp;
		}

		private function reliveTo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reliveTo = temp;
			temp.name = "reliveTo";
			temp.fontSize = 14;
			temp.text = "至  王城";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 30;
			temp.y = 87;
			return temp;
		}

		private function shangbuqi_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			shangbuqi = temp;
			temp.name = "shangbuqi";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "伤 不 起";
			temp.fontSize = 16;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.relive.button.ButtonRelive);
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.x = 320;
			temp.y = 234;
			return temp;
		}

		private function wanmeiRelive_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			wanmeiRelive = temp;
			temp.name = "wanmeiRelive";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 42;
			temp.label = "完 美 复 活";
			temp.fontSize = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu);
			temp.color = 0xF9F0CC;
			temp.width = 148;
			temp.x = 388;
			temp.y = 114;
			return temp;
		}

		private function wanmeiSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			wanmeiSilver = temp;
			temp.name = "wanmeiSilver";
			temp.fontSize = 14;
			temp.text = "免费";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 381;
			temp.y = 87;
			return temp;
		}

		private function xinchungeRelive_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			xinchungeRelive = temp;
			temp.name = "xinchungeRelive";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.relive.button.ButtonXinchunge);
			temp.x = 214;
			temp.y = 234;
			return temp;
		}

		private function yuandiRelive_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			yuandiRelive = temp;
			temp.name = "yuandiRelive";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 42;
			temp.label = "原 地 复 活";
			temp.fontSize = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu);
			temp.color = 0xF9F0CC;
			temp.width = 148;
			temp.x = 213;
			temp.y = 114;
			return temp;
		}

		private function yuandiSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			yuandiSilver = temp;
			temp.name = "yuandiSilver";
			temp.fontSize = 14;
			temp.text = "免费";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 160;
			temp.x = 204;
			temp.y = 87;
			return temp;
		}

	}
}