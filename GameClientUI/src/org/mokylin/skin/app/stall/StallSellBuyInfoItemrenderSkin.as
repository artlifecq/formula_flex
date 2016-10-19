package org.mokylin.skin.app.stall
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StallSellBuyInfoItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var info:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallSellBuyInfoItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 730;
			this.elementsContent = [bg_i(),info_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/version_3/D_di/di_5.png";
			temp.width = 730;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function info_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			info = temp;
			temp.name = "info";
			temp.height = 24;
			temp.fontSize = 16;
			temp.text = "标签";
			temp.width = 730;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

	}
}