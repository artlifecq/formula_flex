package org.mokylin.skin.app.page
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_dingye;
	import org.mokylin.skin.component.button.ButtonSkin_weiye;
	import org.mokylin.skin.component.button.ButtonSkin_yellow;
	import org.mokylin.skin.component.button.ButtonSkin_youfan;
	import org.mokylin.skin.component.button.ButtonSkin_zuofan;
	import org.mokylin.skin.component.text.TextInput2Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PageNormalSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnChangePage:feathers.controls.Button;

		public var btnDown:feathers.controls.Button;

		public var btnFirstPage:feathers.controls.Button;

		public var btnLastPage:feathers.controls.Button;

		public var btnUp:feathers.controls.Button;

		public var labCurPage:feathers.controls.TextInput;

		public var labPageInfo:feathers.controls.Label;

		public var labPageTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PageNormalSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 344;
			this.elementsContent = [__PageNormalSkin_UIAsset1_i(),labCurPage_i(),btnUp_i(),btnDown_i(),labPageInfo_i(),btnChangePage_i(),labPageTitle_i(),btnLastPage_i(),btnFirstPage_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PageNormalSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 19;
			temp.styleName = "ui/common/kang/shuru_di.png";
			temp.width = 125;
			temp.x = 49;
			temp.y = 2;
			return temp;
		}

		private function btnChangePage_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChangePage = temp;
			temp.name = "btnChangePage";
			temp.height = 20;
			temp.label = "跳转至";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_yellow);
			temp.width = 41;
			temp.x = 234;
			temp.y = 3;
			return temp;
		}

		private function btnDown_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDown = temp;
			temp.name = "btnDown";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_youfan);
			temp.width = 24;
			temp.x = 173;
			temp.y = 0;
			return temp;
		}

		private function btnFirstPage_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFirstPage = temp;
			temp.name = "btnFirstPage";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_dingye);
			temp.width = 27;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnLastPage_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLastPage = temp;
			temp.name = "btnLastPage";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_weiye);
			temp.width = 27;
			temp.x = 197;
			temp.y = 0;
			return temp;
		}

		private function btnUp_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnUp = temp;
			temp.name = "btnUp";
			temp.height = 23;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_zuofan);
			temp.width = 24;
			temp.x = 28;
			temp.y = 0;
			return temp;
		}

		private function labCurPage_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			labCurPage = temp;
			temp.name = "labCurPage";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput2Skin);
			temp.text = "1";
			temp.width = 36;
			temp.x = 282;
			temp.y = 1;
			return temp;
		}

		private function labPageInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPageInfo = temp;
			temp.name = "labPageInfo";
			temp.height = 16;
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.color = 0x9C8049;
			temp.width = 65;
			temp.x = 78;
			temp.y = 3;
			return temp;
		}

		private function labPageTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPageTitle = temp;
			temp.name = "labPageTitle";
			temp.height = 16;
			temp.text = "页";
			temp.color = 0x9C8049;
			temp.width = 17;
			temp.x = 322;
			temp.y = 3;
			return temp;
		}

	}
}