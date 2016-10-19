package org.mokylin.skin.app.roulette
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.roulette.button.ButtonSkin_linjiang;
	import org.mokylin.skin.app.roulette.button.ButtonSkin_start;
	import org.mokylin.skin.component.button.ButtonSkin_close_big;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RoulettePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnAward:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnStart:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RoulettePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 651;
			this.width = 688;
			this.elementsContent = [bg_i(),btnClose_i(),btnStart_i(),btnAward_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 651;
			temp.styleName = "ui/app/roulette/pan.png";
			temp.width = 688;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAward_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAward = temp;
			temp.name = "btnAward";
			temp.height = 79;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.roulette.button.ButtonSkin_linjiang);
			temp.width = 79;
			temp.x = 422;
			temp.y = 334;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.height = 37;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_big);
			temp.width = 41;
			temp.x = 554;
			temp.y = 162;
			return temp;
		}

		private function btnStart_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnStart = temp;
			temp.name = "btnStart";
			temp.height = 79;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.roulette.button.ButtonSkin_start);
			temp.width = 79;
			temp.x = 422;
			temp.y = 334;
			return temp;
		}

	}
}