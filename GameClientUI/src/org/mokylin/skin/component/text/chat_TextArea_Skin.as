package org.mokylin.skin.component.text
{
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class chat_TextArea_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var scrChat:feathers.controls.ScrollContainer;

		public var txtChat:feathers.controls.text.TextFieldTextEditor;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function chat_TextArea_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 255;
			this.width = 350;
			this.elementsContent = [scrChat_i(),txtChat_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function scrChat_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrChat = temp;
			temp.name = "scrChat";
			temp.height = 230;
			temp.styleClass = org.mokylin.skin.component.scrollbar.ScrollBarSkin_chat;
			temp.width = 14;
			temp.x = 0;
			temp.y = 11;
			return temp;
		}

		private function txtChat_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			txtChat = temp;
			temp.name = "txtChat";
			temp.height = 224;
			temp.width = 324;
			temp.x = 16;
			temp.y = 14;
			return temp;
		}

	}
}