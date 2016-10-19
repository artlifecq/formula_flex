package org.mokylin.skin.component.scrollbar.skin_gj
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScorollBarIncreBtnSkin;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarDecreBtnSkin;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarThumbBtnSkin;
	import org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarTrackSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrollBarSkin extends feathers.controls.StateSkin
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
		public function VScrollBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 150;
			this.width = 12;
			this.elementsContent = [track_i(),increment_i(),thumb_i(),decrement_i()];
			
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
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarDecreBtnSkin);
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function increment_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			increment = temp;
			temp.name = "increment";
			temp.bottom = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScorollBarIncreBtnSkin);
			temp.x = 0;
			return temp;
		}

		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.bottom = 12;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarThumbBtnSkin);
			temp.top = 12;
			temp.x = 1;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.bottom = 0;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_gj.VScrollBarTrackSkin);
			temp.top = 0;
			temp.width = 12;
			temp.x = 0;
			return temp;
		}

	}
}