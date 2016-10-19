package org.mokylin.skin.app.heroSearch
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.text.TextAreaLvSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroSearchSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroSearchSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 200;
			this.width = 280;
			this.elementsContent = [list_i()];
			
			states = {
			};
			skinNames={};
		}


		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 200;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaLvSkin);
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}