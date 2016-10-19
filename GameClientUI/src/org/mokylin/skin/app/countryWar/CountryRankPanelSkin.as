package org.mokylin.skin.app.countryWar
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryRankPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnClose2:feathers.controls.Button;

		public var labExp:feathers.controls.Label;

		public var labKillCount:feathers.controls.Label;

		public var labTitle:feathers.controls.Label;

		public var scrollContainer:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryRankPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 528;
			this.width = 537;
			this.elementsContent = [__CountryRankPanelSkin_UIAsset1_i(),labTitle_i(),labKillCount_i(),btnClose2_i(),labExp_i(),__CountryRankPanelSkin_Label1_i(),scrollContainer_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryRankPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 23;
			temp.fontSize = 16;
			temp.text = "击杀排行";
			temp.color = 0xDED8C7;
			temp.width = 179;
			temp.x = 34;
			temp.y = 56;
			return temp;
		}

		private function __CountryRankPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 530;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 537;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose2 = temp;
			temp.name = "btnClose2";
			temp.label = "确 定";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 161;
			temp.x = 188;
			temp.y = 480;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 500;
			temp.y = 5;
			return temp;
		}

		private function labExp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labExp = temp;
			temp.name = "labExp";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "经验奖励：546546";
			temp.color = 0xDED8C7;
			temp.width = 214;
			temp.x = 161.5;
			temp.y = 429;
			return temp;
		}

		private function labKillCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labKillCount = temp;
			temp.name = "labKillCount";
			temp.bold = true;
			temp.fontSize = 16;
			temp.text = "本次击杀人数：111";
			temp.color = 0xFF0000;
			temp.width = 208;
			temp.x = 164.5;
			temp.y = 399;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.bold = true;
			temp.height = 17;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "国战奖励";
			temp.color = 0xDED8C7;
			temp.width = 66;
			temp.x = 235.5;
			temp.y = 11;
			return temp;
		}

		private function scrollContainer_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollContainer = temp;
			temp.name = "scrollContainer";
			temp.height = 298;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin);
			temp.width = 426;
			temp.x = 38;
			temp.y = 83;
			return temp;
		}

	}
}