package org.mokylin.skin.loading
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class loadBarSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function loadBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 16;
			this.elementsContent = [__loadBarSkin_UIAsset1_i(),__loadBarSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __loadBarSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/loading/jindutiao_bar.png";
			temp.top = 0;
			return temp;
		}

		private function __loadBarSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.right = 1;
			temp.styleName = "ui/loading/guangbiao.png";
			temp.top = 0;
			return temp;
		}

	}
}