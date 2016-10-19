package org.mokylin.skin.component.scrollbar.skin_lv
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_decre;
	import org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_incre;
	import org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_thumb;
	import org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrolBarLvSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var decrement:feathers.controls.Button;

		public var increment:feathers.controls.Button;

		public var thumb:feathers.controls.Button;

		public var track:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VScrolBarLvSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 150;
			this.width = 18;
			this.elementsContent = [track_i(),thumb_i(),increment_i(),decrement_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function decrement_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			decrement = temp;
			temp.name = "decrement";
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_decre);
			temp.top = 0;
			temp.width = 18;
			temp.x = 0;
			return temp;
		}

		private function increment_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			increment = temp;
			temp.name = "increment";
			temp.bottom = 0;
			temp.height = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_incre);
			temp.width = 18;
			temp.x = 0;
			return temp;
		}

		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.bottom = 18;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_thumb);
			temp.top = 18;
			temp.width = 16;
			temp.x = 0;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_lv.button.ScrollBarSkin_track);
			temp.top = 0;
			return temp;
		}

	}
}