package org.mokylin.skin.common.gezi_grid
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class grid_42_Skin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function grid_42_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 54;
			this.width = 55;
			this.elementsContent = [__grid_42_Skin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __grid_42_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/42.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}