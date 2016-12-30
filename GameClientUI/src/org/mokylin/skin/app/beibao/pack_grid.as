package org.mokylin.skin.app.beibao
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class pack_grid extends feathers.controls.StateSkin
	{
		public var grid:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function pack_grid()
		{
			super();
			
			this.currentState = "normal";
			this.height = 44;
			this.width = 44;
			this.elementsContent = [grid_i()];
			
			states = {
			};
			skinNames={};
		}


		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/app/beibao/daojukuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}