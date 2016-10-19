package org.mokylin.skin.app.stall
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.ToggleButton;
	import org.mokylin.skin.component.button.ButtonBtn_jiajian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallBuyGoodsSelectTreeItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn0:feathers.controls.ToggleButton;

		public var name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallBuyGoodsSelectTreeItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 250;
			this.elementsContent = [btn0_i(),name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn0_i():feathers.controls.ToggleButton
		{
			var temp:feathers.controls.ToggleButton = new feathers.controls.ToggleButton();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 14;
			temp.styleClass = org.mokylin.skin.component.button.ButtonBtn_jiajian;
			temp.width = 15;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.text = "材料";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 196;
			temp.x = 23;
			temp.y = 1;
			return temp;
		}

	}
}