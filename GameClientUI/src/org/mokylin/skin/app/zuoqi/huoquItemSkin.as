package org.mokylin.skin.app.zuoqi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_putong3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class huoquItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var benfuqianwang:feathers.controls.Button;

		public var benfuzudui:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function huoquItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 23;
			this.elementsContent = [benfuzudui_i(),benfuqianwang_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function benfuqianwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			benfuqianwang = temp;
			temp.name = "benfuqianwang";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "前往";
			temp.leading = 1;
			temp.fontSize = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong3;
			temp.color = 0xCFC6AE;
			temp.width = 61;
			temp.x = 175;
			temp.y = 0;
			return temp;
		}

		private function benfuzudui_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			benfuzudui = temp;
			temp.name = "benfuzudui";
			temp.text = "本服组队副本";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.underline = true;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

	}
}