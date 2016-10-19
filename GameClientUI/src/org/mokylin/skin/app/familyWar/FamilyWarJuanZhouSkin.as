package org.mokylin.skin.app.familyWar
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.familyWar.button.ButtonFamilyWarZhanBao;
	import org.mokylin.skin.component.button.ButtonSkin_close_4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyWarJuanZhouSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var closeBtn:feathers.controls.Button;

		public var failyName:feathers.controls.Label;

		public var kingName:feathers.controls.Label;

		public var zhanbaoBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyWarJuanZhouSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [failyName_i(),kingName_i(),zhanbaoBtn_i(),closeBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_4);
			temp.x = 705;
			temp.y = 111;
			return temp;
		}

		private function failyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			failyName = temp;
			temp.name = "failyName";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "名字最多七个字";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 135;
			temp.x = 342;
			temp.y = 160;
			return temp;
		}

		private function kingName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kingName = temp;
			temp.name = "kingName";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "名字最多七个字";
			temp.textAlign = "center";
			temp.color = 0xCC99BB;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 135;
			temp.x = 512;
			temp.y = 162;
			return temp;
		}

		private function zhanbaoBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			zhanbaoBtn = temp;
			temp.name = "zhanbaoBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.familyWar.button.ButtonFamilyWarZhanBao);
			temp.x = 316;
			temp.y = 309;
			return temp;
		}

	}
}