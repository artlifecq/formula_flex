package org.mokylin.skin.mainui.top
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class topBG_Skin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function topBG_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 8;
			this.width = 7;
			this.elementsContent = [__topBG_Skin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __topBG_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/mainui/top/tongyongdi.png";
			temp.top = 0;
			return temp;
		}

	}
}