package org.mokylin.skin.app.shop
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopSystemPriceSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labPrice:feathers.controls.Label;

		public var labTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopSystemPriceSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 100;
			this.elementsContent = [labTitle_i(),labPrice_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function labPrice_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPrice = temp;
			temp.name = "labPrice";
			temp.text = "标签";
			temp.textAlign = "right";
			temp.width = 100;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.text = "原价：";
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

	}
}