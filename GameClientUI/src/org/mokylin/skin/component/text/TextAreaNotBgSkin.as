package org.mokylin.skin.component.text
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.mainui.chat.VScrollBarChatSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TextAreaNotBgSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var textDisplay:feathers.controls.text.TextFieldTextEditor;

		public var vBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextAreaNotBgSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [vBar_i(),textDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.height = 136;
			temp.color = 0xFFFFFF;
			temp.width = 160;
			temp.x = 0;
			temp.y = 6;
			return temp;
		}

		private function vBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vBar = temp;
			temp.name = "vBar";
			temp.height = 150;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.VScrollBarChatSkin);
			temp.width = 24;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}