package org.mokylin.skin.mainui.top
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class jinyan_bar_green extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jinyan_bar_green()
		{
			super();
			
			this.currentState = "normal";
			this.height = 5;
			this.width = 100;
			this.elementsContent = [__jinyan_bar_green_UIAsset1_i(),__jinyan_bar_green_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __jinyan_bar_green_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/top/jinyantiao_green.png";
			temp.y = 0;
			return temp;
		}

		private function __jinyan_bar_green_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.right = 0;
			temp.styleName = "ui/mainui/top/dian_green.png";
			temp.width = 39;
			temp.y = 0;
			return temp;
		}

	}
}