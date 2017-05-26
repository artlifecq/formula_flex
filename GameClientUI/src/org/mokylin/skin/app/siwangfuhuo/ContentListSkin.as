package org.mokylin.skin.app.siwangfuhuo
{
	import feathers.controls.Button;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.button.ButtonSkin_jiantou;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ContentListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ContList:feathers.controls.List;

		public var btn_next:feathers.controls.Button;

		public var btn_prev:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ContentListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 205;
			this.width = 643;
			this.elementsContent = [ContList_i(),btn_prev_i(),btn_next_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ContList_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ContList = temp;
			temp.name = "ContList";
			temp.bottom = 0;
			temp.left = 10;
			temp.right = 30;
			temp.top = 0;
			return temp;
		}

		private function btn_next_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_next = temp;
			temp.name = "btn_next";
			temp.right = 0;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.y = 76;
			return temp;
		}

		private function btn_prev_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_prev = temp;
			temp.name = "btn_prev";
			temp.left = 0;
			temp.scaleX = -1;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jiantou;
			temp.y = 76;
			return temp;
		}

	}
}