package org.mokylin.skin.common.gezi_grid
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class grid48_text extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grid:feathers.controls.UIAsset;

		public var lblDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function grid48_text()
		{
			super();
			
			this.currentState = "normal";
			this.height = 60;
			this.width = 60;
			this.elementsContent = [grid_i(),lblDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lblDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lblDisplay = temp;
			temp.name = "lblDisplay";
			temp.fontSize = 12;
			temp.text = "100";
			temp.color = 0xf1efc7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 28;
			temp.y = 35;
			return temp;
		}

	}
}