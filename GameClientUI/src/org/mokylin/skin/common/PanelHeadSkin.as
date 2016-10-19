package org.mokylin.skin.common
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class PanelHeadSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function PanelHeadSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 56;
			this.width = 410;
			this.elementsContent = [__PanelHeadSkin_UIAsset1_i(),__PanelHeadSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __PanelHeadSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/image/biaotihuawenda.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __PanelHeadSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/common/image/biaotihuawenda.png";
			temp.x = 412;
			temp.y = 0;
			return temp;
		}

	}
}