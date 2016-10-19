package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.CommonInputTextSkin;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RenMingAlertPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var btn0:feathers.controls.Button;

		public var btn1:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var playerName:feathers.controls.TextInput;

		public var renMingZhiWei:feathers.controls.Label;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RenMingAlertPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__RenMingAlertPanelSkin_UIAsset1_i(),btn0_i(),__RenMingAlertPanelSkin_UIAsset2_i(),btn_i(),btn1_i(),closeBtn_i(),title_i(),__RenMingAlertPanelSkin_UIAsset3_i(),__RenMingAlertPanelSkin_UIAsset4_i(),__RenMingAlertPanelSkin_Label1_i(),__RenMingAlertPanelSkin_Label2_i(),renMingZhiWei_i(),playerName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RenMingAlertPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "任命官员：";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 22;
			temp.y = 50;
			return temp;
		}

		private function __RenMingAlertPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称：";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 22;
			temp.y = 90;
			return temp;
		}

		private function __RenMingAlertPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 250;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 350;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __RenMingAlertPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 330;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function __RenMingAlertPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.width = 189;
			temp.x = 97;
			temp.y = 52;
			return temp;
		}

		private function __RenMingAlertPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.width = 189;
			temp.x = 97;
			temp.y = 92;
			return temp;
		}

		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 31;
			temp.label = "取  消";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 217;
			temp.y = 209;
			return temp;
		}

		private function btn1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn1 = temp;
			temp.name = "btn1";
			temp.height = 31;
			temp.label = "选择好友";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 217;
			temp.y = 126;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 31;
			temp.label = "确  认";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 77;
			temp.y = 209;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 312;
			temp.y = 4;
			return temp;
		}

		private function playerName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			playerName = temp;
			temp.name = "playerName";
			temp.height = 22;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.CommonInputTextSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 189;
			temp.x = 98;
			temp.y = 92;
			return temp;
		}

		private function renMingZhiWei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			renMingZhiWei = temp;
			temp.name = "renMingZhiWei";
			temp.height = 24;
			temp.text = "益州";
			temp.color = 0xCAAF94;
			temp.width = 179;
			temp.x = 118;
			temp.y = 50;
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 24;
			temp.fontSize = 18;
			temp.text = "任  命";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 87;
			temp.y = 4;
			return temp;
		}

	}
}