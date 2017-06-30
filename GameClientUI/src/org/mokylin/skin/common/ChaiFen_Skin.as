package org.mokylin.skin.common
{
	import feathers.controls.Button;
	import feathers.controls.Slider;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.slider.skin_Slider;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ChaiFen_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var slider:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ChaiFen_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 187;
			this.elementsContent = [slider_i(),btn_min_i(),btn_max_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.y = 3;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.left = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.y = 3;
			return temp;
		}

		private function slider_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			slider = temp;
			temp.name = "slider";
			temp.height = 6;
			temp.left = 26;
			temp.right = 26;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 2;
			temp.y = 0;
			return temp;
		}

	}
}