package org.mokylin.skin.app.dailyTask
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.StateSkin;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DailyTaskInfoSkin extends feathers.controls.StateSkin
	{
		public var scrollBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DailyTaskInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 407;
			this.width = 722;
			this.elementsContent = [scrollBar_i()];
			
			states = {
			};
			skinNames={};
		}


		private function scrollBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollBar = temp;
			temp.name = "scrollBar";
			temp.height = 198;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarSkin);
			temp.width = 393;
			temp.x = 7;
			temp.y = 13;
			return temp;
		}

	}
}