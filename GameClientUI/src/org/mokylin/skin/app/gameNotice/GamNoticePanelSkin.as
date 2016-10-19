package org.mokylin.skin.app.gameNotice
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GamNoticePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var labAllMsg:feathers.controls.Label;

		public var labInfo:feathers.controls.TextArea;

		public var labTitle:feathers.controls.Label;

		public var labelFilter:flash.filters.GlowFilter;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GamNoticePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 480;
			this.width = 656;
			labelFilter_i();
			this.elementsContent = [__GamNoticePanelSkin_UIAsset1_i(),btnClose_i(),__GamNoticePanelSkin_UIAsset2_i(),__GamNoticePanelSkin_UIAsset3_i(),labInfo_i(),labTitle_i(),labAllMsg_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GamNoticePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 480;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 656;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __GamNoticePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 22;
			temp.styleName = "ui/app/game_notice/gx_gg.png";
			temp.width = 75;
			temp.x = 290;
			temp.y = 8;
			return temp;
		}

		private function __GamNoticePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 427;
			temp.styleName = "ui/app/game_notice/gonggao_ditu.jpg";
			temp.width = 632;
			temp.x = 12;
			temp.y = 39;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 29;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.width = 30;
			temp.x = 621;
			temp.y = 3;
			return temp;
		}

		private function labAllMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labAllMsg = temp;
			temp.name = "labAllMsg";
			temp.bold = true;
			temp.nativeFilters = Fontter.filterObj[[labelFilter]];
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "点击查看完整更新";
			temp.color = 0x4AA9E0;
			temp.width = 125;
			temp.x = 483;
			temp.y = 426;
			return temp;
		}

		private function labInfo_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 294;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "亲爱的玩家";
			temp.color = 0x2F1B0B;
			temp.width = 577;
			temp.x = 40;
			temp.y = 113;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.height = 18;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.width = 251;
			temp.x = 201;
			temp.y = 63;
			return temp;
		}

		private function labelFilter_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilter = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

	}
}