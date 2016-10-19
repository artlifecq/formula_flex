package org.mokylin.skin.mainui.map
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_thumb;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScaleSliderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var thumb:feathers.controls.Button;

		public var track:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScaleSliderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 45;
			this.width = 6;
			this.elementsContent = [track_i(),thumb_i()];
			
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
			temp.height = 20;
			temp.left = -7;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_thumb);
			temp.width = 20;
			temp.y = 13;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.height = 45;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_track);
			temp.top = 0;
			temp.width = 6;
			temp.x = 0;
			return temp;
		}

	}
}