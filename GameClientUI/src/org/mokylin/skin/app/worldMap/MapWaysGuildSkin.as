package org.mokylin.skin.app.worldMap
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_close;
	import org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MapWaysGuildSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var passTransCheckbox:feathers.controls.Check;

		public var scroller:feathers.controls.ScrollContainer;

		public var textInfo:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MapWaysGuildSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 474;
			this.elementsContent = [__MapWaysGuildSkin_UIAsset1_i(),__MapWaysGuildSkin_UIAsset2_i(),btnClose_i(),__MapWaysGuildSkin_Label1_i(),textInfo_i(),passTransCheckbox_i(),scroller_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MapWaysGuildSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 26;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.leading = 2;
			temp.letterSpacing = 0;
			temp.fontSize = 16;
			temp.text = "寻路指引";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 110;
			temp.x = 182;
			temp.y = 6;
			return temp;
		}

		private function __MapWaysGuildSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 250;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 474;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MapWaysGuildSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 450;
			temp.x = 13;
			temp.y = 4;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_close);
			temp.x = 432;
			temp.y = 4;
			return temp;
		}

		private function passTransCheckbox_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			passTransCheckbox = temp;
			temp.name = "passTransCheckbox";
			temp.label = "通过车夫传送";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.version_3.check.CheckBoxSkin_gold);
			temp.textAlign = "left";
			temp.width = 130;
			temp.x = 32;
			temp.y = 208;
			return temp;
		}

		private function scroller_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scroller = temp;
			temp.name = "scroller";
			temp.height = 164;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 438;
			temp.x = 18;
			temp.y = 37;
			return temp;
		}

		private function textInfo_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			textInfo = temp;
			temp.name = "textInfo";
			temp.height = 170;
			temp.styleName = "ui/common/version_3/S_shurukuang/shu_ru_kuang_1.png";
			temp.width = 444;
			temp.x = 15;
			temp.y = 34;
			return temp;
		}

	}
}