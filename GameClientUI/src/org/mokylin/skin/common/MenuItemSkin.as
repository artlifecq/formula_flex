package org.mokylin.skin.common
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.common.erjiItem2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MenuItemSkin extends feathers.controls.StateSkin
	{
		public var btn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MenuItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 18;
			this.elementsContent = [btn_i()];
			
			states = {
			};
			skinNames={};
		}


		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.label = "文本";
			temp.styleClass = org.mokylin.skin.common.erjiItem2_Skin;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}