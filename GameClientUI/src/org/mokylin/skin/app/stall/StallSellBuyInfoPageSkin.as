package org.mokylin.skin.app.stall
{
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.list.ListSkin4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallSellBuyInfoPageSkin extends feathers.controls.StateSkin
	{
		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallSellBuyInfoPageSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [list_i()];
			
			states = {
			};
			skinNames={};
		}


		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 300;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin4;
			temp.width = 730;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}