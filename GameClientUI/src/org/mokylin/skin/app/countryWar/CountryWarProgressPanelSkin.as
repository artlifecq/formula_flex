package org.mokylin.skin.app.countryWar
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarProgressPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnRankPanel:feathers.controls.Button;

		public var labCountryInfo:feathers.controls.Label;

		public var labKillCount:feathers.controls.Label;

		public var labLastTime:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarProgressPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 214;
			this.width = 740;
			this.elementsContent = [__CountryWarProgressPanelSkin_UIAsset1_i(),btnClose_i(),__CountryWarProgressPanelSkin_Label1_i(),labLastTime_i(),labKillCount_i(),btnRankPanel_i(),labCountryInfo_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryWarProgressPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "国战最新情况";
			temp.color = 0xDED8C7;
			temp.width = 91;
			temp.x = 324.5;
			temp.y = 11;
			return temp;
		}

		private function __CountryWarProgressPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 214;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 740;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 704;
			temp.y = 5;
			return temp;
		}

		private function btnRankPanel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRankPanel = temp;
			temp.name = "btnRankPanel";
			temp.label = "击杀排行榜";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 87;
			temp.x = 636;
			temp.y = 62;
			return temp;
		}

		private function labCountryInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCountryInfo = temp;
			temp.name = "labCountryInfo";
			temp.text = "标签";
			temp.color = 0xDED8C7;
			temp.width = 182;
			temp.x = 31;
			temp.y = 39;
			return temp;
		}

		private function labKillCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labKillCount = temp;
			temp.name = "labKillCount";
			temp.text = "杀敌统计：$人";
			temp.color = 0xDED8C7;
			temp.width = 147;
			temp.x = 30;
			temp.y = 88;
			return temp;
		}

		private function labLastTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLastTime = temp;
			temp.name = "labLastTime";
			temp.height = 21;
			temp.text = "国战剩余时间：$分钟";
			temp.color = 0xDED8C7;
			temp.width = 191;
			temp.x = 31;
			temp.y = 63;
			return temp;
		}

	}
}