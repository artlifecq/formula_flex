package org.mokylin.skin.component.page
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PageNavigatorSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labelDisplay:feathers.controls.Label;

		public var nextPageButton:feathers.controls.Button;

		public var prevPageButton:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PageNavigatorSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 74;
			this.elementsContent = [prevPageButton_i(),nextPageButton_i(),labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.left = 23;
			temp.right = 25;
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.y = 1;
			return temp;
		}

		private function nextPageButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			nextPageButton = temp;
			temp.name = "nextPageButton";
			temp.right = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_right);
			temp.y = 0;
			return temp;
		}

		private function prevPageButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			prevPageButton = temp;
			temp.name = "prevPageButton";
			temp.left = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_left);
			temp.y = 0;
			return temp;
		}

	}
}