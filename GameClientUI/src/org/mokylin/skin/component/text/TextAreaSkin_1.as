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
	public class TextAreaSkin_1 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var textDisplay:feathers.controls.text.TextFieldTextEditor;

		public var vBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextAreaSkin_1()
		{
			super();
			
			this.currentState = "normal";
			this.height = 156;
			this.width = 183;
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
			temp.bottom = 15;
			temp.left = 20;
			temp.right = 20;
			temp.fontSize = 14;
			temp.text = "输入文本";
			temp.color = 0xC4A689;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.top = 15;
			return temp;
		}

		private function vBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vBar = temp;
			temp.name = "vBar";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_equip.VScrolEquipSkin);
			temp.top = 3;
			temp.width = 18;
			return temp;
		}

	}
}