package org.mokylin.skin.component.text
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.skin_equip.VScrolEquipSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TextAreaSkin_2Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var textDisplay:feathers.controls.text.TextFieldTextEditor;

		public var vBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextAreaSkin_2Skin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 151;
			this.width = 262;
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
			temp.bottom = 10;
			temp.left = 10;
			temp.right = 22;
			temp.text = "xvzxc";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.top = 10;
			return temp;
		}

		private function vBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vBar = temp;
			temp.name = "vBar";
			temp.bottom = 3;
			temp.right = 3;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_equip.VScrolEquipSkin);
			temp.top = 3;
			temp.width = 18;
			return temp;
		}

	}
}