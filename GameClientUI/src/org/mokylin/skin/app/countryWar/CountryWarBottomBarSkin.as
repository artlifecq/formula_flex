package org.mokylin.skin.app.countryWar
{
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.countryWar.CountryWarBottomBarHeadRenderSkin;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarBottomBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnFold:feathers.controls.Button;

		public var head1:feathers.controls.SkinnableContainer;

		public var head2:feathers.controls.SkinnableContainer;

		public var head3:feathers.controls.SkinnableContainer;

		public var head4:feathers.controls.SkinnableContainer;

		public var imageBar:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarBottomBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [imageBar_i(),btnFold_i(),head1_i(),head2_i(),head3_i(),head4_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnFold_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFold = temp;
			temp.name = "btnFold";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_mount_btn_left;
			temp.x = 154;
			temp.y = 63;
			return temp;
		}

		private function head1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head1 = temp;
			temp.name = "head1";
			var skin:StateSkin = new org.mokylin.skin.app.countryWar.CountryWarBottomBarHeadRenderSkin()
			temp.skin = skin
			temp.x = -180;
			temp.y = -3;
			return temp;
		}

		private function head2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head2 = temp;
			temp.name = "head2";
			var skin:StateSkin = new org.mokylin.skin.app.countryWar.CountryWarBottomBarHeadRenderSkin()
			temp.skin = skin
			temp.x = -92;
			temp.y = -3;
			return temp;
		}

		private function head3_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head3 = temp;
			temp.name = "head3";
			var skin:StateSkin = new org.mokylin.skin.app.countryWar.CountryWarBottomBarHeadRenderSkin()
			temp.skin = skin
			temp.x = -4;
			temp.y = -3;
			return temp;
		}

		private function head4_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			head4 = temp;
			temp.name = "head4";
			var skin:StateSkin = new org.mokylin.skin.app.countryWar.CountryWarBottomBarHeadRenderSkin()
			temp.skin = skin
			temp.x = 84;
			temp.y = -3;
			return temp;
		}

		private function imageBar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageBar = temp;
			temp.name = "imageBar";
			temp.styleName = "ui/app/countryWar/jin_du_di.png";
			temp.width = 335;
			temp.x = -166;
			temp.y = 67;
			return temp;
		}

	}
}