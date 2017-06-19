package org.mokylin.skin.loading
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LoadingDownSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LoadingDownSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 120;
			this.width = 1920;
			this.elementsContent = [__LoadingDownSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __LoadingDownSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 187;
			temp.styleName = "ui/big_bg/bg_2.png";
			temp.width = 1920;
			temp.x = 0;
			temp.y = -67;
			return temp;
		}

	}
}