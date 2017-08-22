package org.mokylin.skin.app.beibao
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WaiKuang_Skin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WaiKuang_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 100;
			this.width = 100;
			this.elementsContent = [__WaiKuang_Skin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __WaiKuang_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/hover/xuanzhong_pack.png";
			temp.top = 0;
			return temp;
		}

	}
}