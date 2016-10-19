package org.mokylin.skin.app.crown
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.common.CommonInputTextSkin;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownSetDontTalkPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var playerName:feathers.controls.TextInput;

		public var timeGroup:feathers.controls.Group;

		public var title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownSetDontTalkPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CrownSetDontTalkPanelSkin_UIAsset1_i(),btn_i(),__CrownSetDontTalkPanelSkin_UIAsset2_i(),closeBtn_i(),title_i(),__CrownSetDontTalkPanelSkin_UIAsset3_i(),__CrownSetDontTalkPanelSkin_UIAsset4_i(),__CrownSetDontTalkPanelSkin_Label1_i(),playerName_i(),timeGroup_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownSetDontTalkPanelSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 10;
			temp.horizontalAlign = "center";
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __CrownSetDontTalkPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称：";
			temp.color = 0xCAAF94;
			temp.width = 85;
			temp.x = 42;
			temp.y = 70;
			return temp;
		}

		private function __CrownSetDontTalkPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 250;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 371;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownSetDontTalkPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 346;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function __CrownSetDontTalkPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 142;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 327;
			temp.x = 23;
			temp.y = 55;
			return temp;
		}

		private function __CrownSetDontTalkPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.width = 189;
			temp.x = 117;
			temp.y = 72;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 31;
			temp.label = "禁 言";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 150;
			temp.y = 210;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.x = 332;
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
			temp.x = 118;
			temp.y = 72;
			return temp;
		}

		private function timeGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			timeGroup = temp;
			temp.name = "timeGroup";
			temp.height = 33;
			temp.width = 294;
			temp.x = 40;
			temp.y = 110;
			temp.layout = __CrownSetDontTalkPanelSkin_HorizontalLayout1_i();
			return temp;
		}

		private function title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			title = temp;
			temp.name = "title";
			temp.height = 24;
			temp.fontSize = 18;
			temp.text = "禁  言";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 175;
			temp.x = 104;
			temp.y = 4;
			return temp;
		}

	}
}