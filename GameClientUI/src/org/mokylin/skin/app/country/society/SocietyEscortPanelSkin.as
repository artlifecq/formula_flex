package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.button.ButtonQianwangbiaoju_anniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyEscortPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnGoto:feathers.controls.Button;

		public var explainBtn:feathers.controls.Label;

		public var hu_song_desc:feathers.controls.Label;

		public var jiao_biao_desc:feathers.controls.Label;

		public var kai_qi_desc:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyEscortPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__SocietyEscortPanelSkin_UIAsset1_i(),btnGoto_i(),__SocietyEscortPanelSkin_Label1_i(),kai_qi_desc_i(),hu_song_desc_i(),jiao_biao_desc_i(),__SocietyEscortPanelSkin_UIAsset2_i(),explainBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyEscortPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "每日20:00-21:00开放";
			temp.textAlign = "left";
			temp.color = 0x239D02;
			temp.width = 160;
			temp.x = 712;
			temp.y = 458;
			return temp;
		}

		private function __SocietyEscortPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/societyEscort_bg.jpg";
			temp.x = 5;
			temp.y = 7;
			return temp;
		}

		private function __SocietyEscortPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/bangzhu.png";
			temp.x = 15;
			temp.y = 456;
			return temp;
		}

		private function btnGoto_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnGoto = temp;
			temp.name = "btnGoto";
			temp.height = 53;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonQianwangbiaoju_anniu);
			temp.width = 157;
			temp.x = 362;
			temp.y = 430;
			return temp;
		}

		private function explainBtn_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			explainBtn = temp;
			temp.name = "explainBtn";
			temp.bold = false;
			temp.height = 22;
			temp.fontSize = 12;
			temp.text = "规则说明";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.underline = true;
			temp.width = 70;
			temp.x = 41;
			temp.y = 459;
			return temp;
		}

		private function hu_song_desc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			hu_song_desc = temp;
			temp.name = "hu_song_desc";
			temp.bold = false;
			temp.height = 70;
			temp.leading = 10;
			temp.fontSize = 14;
			temp.text = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述";
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 338;
			temp.y = 338;
			return temp;
		}

		private function jiao_biao_desc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			jiao_biao_desc = temp;
			temp.name = "jiao_biao_desc";
			temp.bold = false;
			temp.height = 70;
			temp.leading = 10;
			temp.fontSize = 14;
			temp.text = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述";
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 636;
			temp.y = 338;
			return temp;
		}

		private function kai_qi_desc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kai_qi_desc = temp;
			temp.name = "kai_qi_desc";
			temp.bold = false;
			temp.height = 70;
			temp.leading = 10;
			temp.fontSize = 14;
			temp.text = "描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述描述";
			temp.textAlign = "left";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 210;
			temp.x = 36;
			temp.y = 338;
			return temp;
		}

	}
}