package org.mokylin.skin.component.slider
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_bar;
	import org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_thumb2;
	import org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_track;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class skin_Slider2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bar:feathers.controls.Button;

		public var thumb:feathers.controls.Button;

		public var track:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function skin_Slider2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 156;
			this.elementsContent = [track_i(),bar_i(),thumb_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			bar = temp;
			temp.name = "bar";
			temp.height = 5;
			temp.left = 2;
			temp.right = 2;
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_bar;
			temp.y = 13;
			return temp;
		}

		private function thumb_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			thumb = temp;
			temp.name = "thumb";
			temp.height = 16;
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_thumb2;
			temp.x = 147;
			temp.y = 7;
			return temp;
		}

		private function track_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			track = temp;
			temp.name = "track";
			temp.height = 11;
			temp.left = 0;
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_track;
			temp.y = 10;
			return temp;
		}

	}
}