package org.mokylin.skin.app.relive
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.app.relive.ReliveBarSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DungeonRelivePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bar:feathers.controls.ProgressBar;

		public var reliveLabel:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DungeonRelivePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 60;
			this.elementsContent = [bar_i(),reliveLabel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bar_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			bar = temp;
			temp.name = "bar";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.relive.ReliveBarSkin);
			temp.value = 10;
			temp.width = 272;
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function reliveLabel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			reliveLabel = temp;
			temp.name = "reliveLabel";
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "10秒后复活";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 272;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}