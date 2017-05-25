package org.mokylin.skin.app.fuben
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_TiaoZhanKaiShi extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_TiaoZhanKaiShi()
		{
			super();
			
			this.currentState = "normal";
			this.height = 129;
			this.width = 386;
			this.elementsContent = [__FuBen_TiaoZhanKaiShi_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __FuBen_TiaoZhanKaiShi_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/fubenjiesuan/tiaozhankaishi.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}