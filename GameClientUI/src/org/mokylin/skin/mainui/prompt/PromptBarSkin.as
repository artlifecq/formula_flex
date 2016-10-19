package org.mokylin.skin.mainui.prompt
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_green2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PromptBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnCountryWarProgress:feathers.controls.Button;

		public var btnJoinCountryWar:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PromptBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 109;
			this.width = 129;
			this.elementsContent = [btnJoinCountryWar_i(),btnCountryWarProgress_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnCountryWarProgress_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCountryWarProgress = temp;
			temp.name = "btnCountryWarProgress";
			temp.label = "国战进度";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 101;
			temp.x = 13;
			temp.y = 64;
			return temp;
		}

		private function btnJoinCountryWar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnJoinCountryWar = temp;
			temp.name = "btnJoinCountryWar";
			temp.label = "国 战（参战）";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 101;
			temp.x = 14;
			temp.y = 15;
			return temp;
		}

	}
}