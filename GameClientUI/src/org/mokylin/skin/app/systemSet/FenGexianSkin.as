package org.mokylin.skin.app.systemSet
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FenGexianSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FenGexianSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 2;
			this.width = 90;
			this.elementsContent = [__FenGexianSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __FenGexianSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/systemSet/fen2.png";
			temp.y = 0;
			return temp;
		}

	}
}