package org.mokylin.skin.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class YuanDian_Skin extends feathers.controls.StateSkin
	{
		public var bg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function YuanDian_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i()];
			
			states = {
			};
			skinNames={};
		}


		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/tubiao/yuandian.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}