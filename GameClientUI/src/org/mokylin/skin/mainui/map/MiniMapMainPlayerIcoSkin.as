package org.mokylin.skin.mainui.map
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MiniMapMainPlayerIcoSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MiniMapMainPlayerIcoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 32;
			this.elementsContent = [__MiniMapMainPlayerIcoSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __MiniMapMainPlayerIcoSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 32;
			temp.styleName = "ui/mainui/map/zj.png";
			temp.width = 30;
			temp.x = -16;
			temp.y = -14;
			return temp;
		}

	}
}