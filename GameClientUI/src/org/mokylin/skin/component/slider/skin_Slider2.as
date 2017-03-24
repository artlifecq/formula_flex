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
		public var thumb:feathers.controls.Button;

		public var trackMax:feathers.controls.Button;

		public var trackMin:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function skin_Slider2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 15;
			this.width = 105;
			this.elementsContent = [trackMax_i(),trackMin_i(),thumb_i()];
			
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
			temp.height = 15;
			temp.right = 1;
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_thumb2;
			temp.y = 0;
			return temp;
		}

		private function trackMax_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			trackMax = temp;
			temp.name = "trackMax";
			temp.height = 7;
			temp.left = 0;
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_track;
			temp.y = 4;
			return temp;
		}

		private function trackMin_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			trackMin = temp;
			temp.name = "trackMin";
			temp.height = 5;
			temp.left = 2;
			temp.right = 1;
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider.button.ButtonSkin_bar;
			temp.y = 5;
			return temp;
		}

	}
}