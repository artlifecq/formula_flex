package org.mokylin.skin.app.shop
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopSilverTitleSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var labBindGold:feathers.controls.Label;

		public var labBindGoldTitle:feathers.controls.Label;

		public var labBindSilver:feathers.controls.Label;

		public var labBindSilverTitle:feathers.controls.Label;

		public var labSilver:feathers.controls.Label;

		public var labSilverTitle:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopSilverTitleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 44;
			this.width = 500;
			this.elementsContent = [__ShopSilverTitleSkin_UIAsset1_i(),labBindGoldTitle_i(),labBindGold_i(),labSilverTitle_i(),labSilver_i(),labBindSilverTitle_i(),labBindSilver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopSilverTitleSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 500;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labBindGoldTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBindGoldTitle = temp;
			temp.name = "labBindGoldTitle";
			temp.text = "绑金：";
			temp.x = 14;
			temp.y = 15;
			return temp;
		}

		private function labBindGold_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBindGold = temp;
			temp.name = "labBindGold";
			temp.text = "11111111111";
			temp.width = 71;
			temp.x = 52;
			temp.y = 15;
			return temp;
		}

		private function labBindSilverTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBindSilverTitle = temp;
			temp.name = "labBindSilverTitle";
			temp.text = "绑银：";
			temp.x = 311;
			temp.y = 15;
			return temp;
		}

		private function labBindSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labBindSilver = temp;
			temp.name = "labBindSilver";
			temp.text = "1111111111111111111";
			temp.x = 351;
			temp.y = 15;
			return temp;
		}

		private function labSilverTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSilverTitle = temp;
			temp.name = "labSilverTitle";
			temp.text = "银子：";
			temp.x = 161;
			temp.y = 15;
			return temp;
		}

		private function labSilver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labSilver = temp;
			temp.name = "labSilver";
			temp.text = "胗1111111111";
			temp.x = 204;
			temp.y = 15;
			return temp;
		}

	}
}