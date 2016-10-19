package org.mokylin.skin.app.biaoju
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
	public class BiaoJuTouBaoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var infoTxt1:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var silver:feathers.controls.Label;

		public var sure:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuTouBaoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 315;
			this.width = 330;
			labelFilterBlack_i();
			this.elementsContent = [__BiaoJuTouBaoPanelSkin_UIAsset1_i(),closeBtn_i(),__BiaoJuTouBaoPanelSkin_UIAsset2_i(),__BiaoJuTouBaoPanelSkin_Label1_i(),infoTxt1_i(),sure_i(),__BiaoJuTouBaoPanelSkin_Label2_i(),silver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuTouBaoPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "投保确认";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 142;
			temp.y = 14;
			return temp;
		}

		private function __BiaoJuTouBaoPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 20;
			temp.text = "投保费用为：";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 25;
			temp.y = 45;
			return temp;
		}

		private function __BiaoJuTouBaoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 315;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 330;
			return temp;
		}

		private function __BiaoJuTouBaoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 180;
			temp.styleName = "ui/common/kang/sanjimianban.png";
			temp.width = 293;
			temp.x = 17;
			temp.y = 73;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 293;
			temp.y = 5;
			return temp;
		}

		private function infoTxt1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt1 = temp;
			temp.name = "infoTxt1";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 164;
			temp.htmlText = "XXXXXXXXXX<br>XXXXXXXXXX<br>XXXXXXXXXX<br>XXXXXXXXXX";
			temp.leading = 10;
			temp.fontSize = 14;
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 268;
			temp.x = 28;
			temp.y = 83;
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

		private function silver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			silver = temp;
			temp.name = "silver";
			temp.fontSize = 20;
			temp.text = "10两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 145;
			temp.y = 45;
			return temp;
		}

		private function sure_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sure = temp;
			temp.name = "sure";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "确认投保";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_e_erjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 108;
			temp.x = 102;
			temp.y = 260;
			return temp;
		}

	}
}