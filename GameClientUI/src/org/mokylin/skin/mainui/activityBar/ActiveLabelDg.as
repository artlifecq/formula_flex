package org.mokylin.skin.mainui.activityBar
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ActiveLabelDg extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ActiveLabelDg()
		{
			super();
			
			this.currentState = "normal";
			this.height = 16;
			this.width = 73;
			this.elementsContent = [__ActiveLabelDg_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __ActiveLabelDg_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/activetydi.png";
			temp.top = 0;
			return temp;
		}

	}
}