package org.mokylin.skin.app.countryWar
{
	import feathers.controls.Button;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_bottom_left;
	import org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_top_left;
	import org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_top_right;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarWatchBottomDanMuPositionSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnPosition1:feathers.controls.Button;

		public var btnPosition2:feathers.controls.Button;

		public var btnPosition3:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarWatchBottomDanMuPositionSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),btnPosition1_i(),btnPosition2_i(),btnPosition3_i()];
			
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
			temp.height = 114;
			temp.styleName = "ui/common/version_3/D_di/di_7.png";
			temp.width = 48;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnPosition1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPosition1 = temp;
			temp.name = "btnPosition1";
			temp.styleClass = org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_top_left;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnPosition2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPosition2 = temp;
			temp.name = "btnPosition2";
			temp.styleClass = org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_top_right;
			temp.x = 0;
			temp.y = 37;
			return temp;
		}

		private function btnPosition3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnPosition3 = temp;
			temp.name = "btnPosition3";
			temp.styleClass = org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_bottom_left;
			temp.x = 0;
			temp.y = 74;
			return temp;
		}

	}
}