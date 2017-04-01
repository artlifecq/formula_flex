package org.mokylin.skin.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Line1Skin extends feathers.controls.StateSkin
	{
		public var line3:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Line1Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 2;
			this.elementsContent = [line3_i()];
			
			states = {
			};
			skinNames={};
		}


		private function line3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line3 = temp;
			temp.name = "line3";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 257;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}