package org.mokylin.skin.component.page
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_right;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_bottom;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PageNavigatorExtSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var firstPageButton:feathers.controls.Button;

		public var labelDisplay:feathers.controls.Label;

		public var lastPageButton:feathers.controls.Button;

		public var nextPageButton:feathers.controls.Button;

		public var prevPageButton:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PageNavigatorExtSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 175;
			this.elementsContent = [prevPageButton_i(),nextPageButton_i(),labelDisplay_i(),lastPageButton_i(),firstPageButton_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function firstPageButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			firstPageButton = temp;
			temp.name = "firstPageButton";
			temp.height = 25;
			temp.left = 23;
			temp.rotation = 1.5707963267948966;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonSkin_bottom
			temp.top = -1;
			temp.width = 25;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.height = 24;
			temp.left = 50;
			temp.right = 50;
			temp.text = "1/1";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			return temp;
		}

		private function lastPageButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			lastPageButton = temp;
			temp.name = "lastPageButton";
			temp.right = 0;
			temp.rotation = 4.71238898038469;
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonSkin_bottom
			temp.y = 23;
			return temp;
		}

		private function nextPageButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			nextPageButton = temp;
			temp.name = "nextPageButton";
			temp.right = 25;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_right
			temp.y = 0;
			return temp;
		}

		private function prevPageButton_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			prevPageButton = temp;
			temp.name = "prevPageButton";
			temp.left = 25;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_left
			temp.y = 0;
			return temp;
		}

	}
}