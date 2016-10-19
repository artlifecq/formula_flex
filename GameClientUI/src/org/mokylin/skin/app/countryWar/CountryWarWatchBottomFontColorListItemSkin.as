package org.mokylin.skin.app.countryWar
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarWatchBottomFontColorListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var imageColor:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarWatchBottomFontColorListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),imageColor_i()];
			
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
			temp.height = 31;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-bg.png";
			temp.width = 33;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imageColor_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageColor = temp;
			temp.name = "imageColor";
			temp.styleName = "ui/app/countryWar/text_color_1.png";
			temp.x = 9;
			temp.y = 3;
			return temp;
		}

	}
}