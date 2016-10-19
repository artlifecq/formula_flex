package org.mokylin.skin.component.slider
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.scrollbar.skin_spell.button.ButtonSkin_thumb;
	import org.mokylin.skin.component.scrollbar.skin_spell.button.ButtonSkin_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HSliderChatSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var thumb:feathers.controls.Button;

		public var track:feathers.controls.Button;

		public var trackMax:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HSliderChatSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 195;
			this.elementsContent = [track_i(),trackMax_i(),thumb_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.bottom = 0;
			temp.right = 50;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_spell.button.ButtonSkin_thumb);
			temp.top = 0;
			temp.width = 22;
			return temp;
		}

		private function trackMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			trackMax = temp;
			temp.name = "trackMax";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 50;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_spell.button.ButtonSkin_thumb);
			temp.top = 0;
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
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_spell.button.ButtonSkin_track);
			temp.top = 0;
			return temp;
		}

	}
}