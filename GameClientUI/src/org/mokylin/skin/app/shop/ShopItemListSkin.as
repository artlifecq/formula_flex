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
	public class ShopItemListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgEff:feathers.controls.UIAsset;

		public var labMoney:feathers.controls.Label;

		public var labMoneyType:feathers.controls.Label;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopItemListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 70;
			this.width = 160;
			this.elementsContent = [__ShopItemListSkin_UIAsset1_i(),imgEff_i(),labName_i(),labMoneyType_i(),labMoney_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopItemListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 70;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 160;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgEff_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgEff = temp;
			temp.name = "imgEff";
			temp.height = 56;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 148;
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function labMoneyType_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoneyType = temp;
			temp.name = "labMoneyType";
			temp.text = "银子";
			temp.width = 77;
			temp.x = 72;
			temp.y = 26;
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.text = "75两";
			temp.width = 78;
			temp.x = 73;
			temp.y = 46;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.text = "金刚钻";
			temp.width = 132;
			temp.x = 10;
			temp.y = 6;
			return temp;
		}

	}
}