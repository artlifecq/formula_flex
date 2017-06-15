package org.mokylin.skin.loading
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LoadingUpSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LoadingUpSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__LoadingUpSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __LoadingUpSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 162;
			temp.styleName = "ui/big_bg/bg_1.png";
			temp.width = 1920;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}