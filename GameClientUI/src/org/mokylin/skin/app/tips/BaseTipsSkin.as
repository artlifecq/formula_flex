package org.mokylin.skin.app.tips
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BaseTipsSkin extends feathers.controls.StateSkin
	{
		public var imgBG:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BaseTipsSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 47;
			this.width = 44;
			this.elementsContent = [imgBG_i()];
			
			states = {
			};
			skinNames={};
		}


		private function imgBG_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBG = temp;
			temp.name = "imgBG";
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.top = 0;
			return temp;
		}

	}
}