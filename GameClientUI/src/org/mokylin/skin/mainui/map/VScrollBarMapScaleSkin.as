package org.mokylin.skin.mainui.map
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_decre;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_incre;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_thumb;
	import org.mokylin.skin.mainui.map.button.ButtonSkin_map_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrollBarMapScaleSkin extends feathers.controls.StateSkin
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
		public function VScrollBarMapScaleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 60;
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
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_decre);
			return temp;
		}

		private function increment_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			increment = temp;
			temp.name = "increment";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_incre);
			temp.x = 0;
			temp.y = 42;
			return temp;
		}

		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_thumb);
			temp.width = 20;
			temp.y = 20;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.height = 60;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.map.button.ButtonSkin_map_track);
			temp.width = 14;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

	}
}