package org.mokylin.skin.component.list
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.StateSkin;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ListRedSkin4 extends feathers.controls.StateSkin
	{
		public var vBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ListRedSkin4()
		{
			super();
			
			this.currentState = "normal";
			this.height = 151;
			this.width = 262;
			this.elementsContent = [vBar_i()];
			
			states = {
			};
			skinNames={};
		}


		private function vBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vBar = temp;
			temp.name = "vBar";
			temp.height = 151;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.top = 0;
			temp.width = 18;
			return temp;
		}

	}
}