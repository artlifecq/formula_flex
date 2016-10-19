package org.mokylin.skin.component.text
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.text.TextFieldTextEditor;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.scrollbar.skin_lv.VScrolBarLvSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TextAreaLvSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var textDisplay:feathers.controls.text.TextFieldTextEditor;

		public var vBar:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TextAreaLvSkin()
		{
			super();
			
			this.currentState = "focused";
			this.height = 156;
			this.width = 183;
			this.elementsContent = [vBar_i(),textDisplay_i()];
			bg_i();
			
			
			states = {
			};
			skinNames={"disabled":"ui/common/kang/yjnk.png", "enabled":"ui/common/kang/yjnk.png", "focused":"ui/common/kang/yjnk.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/kang/yjnk.png";
			temp.top = 0;
			return temp;
		}

		private function textDisplay_i():feathers.controls.text.TextFieldTextEditor
		{
			var temp:feathers.controls.text.TextFieldTextEditor = new feathers.controls.text.TextFieldTextEditor();
			textDisplay = temp;
			temp.name = "textDisplay";
			temp.bottom = 8;
			temp.height = 44;
			temp.left = 10;
			temp.right = 25;
			temp.color = 0xFFFFFF;
			temp.top = 10;
			temp.width = 147;
			return temp;
		}

		private function vBar_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			vBar = temp;
			temp.name = "vBar";
			temp.bottom = 3;
			temp.right = 3;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.VScrolBarLvSkin);
			temp.top = 3;
			temp.width = 18;
			return temp;
		}

	}
}