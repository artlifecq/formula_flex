package org.mokylin.skin.app.shop
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShopItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var border:feathers.controls.UIAsset;

		public var borderTop:feathers.controls.UIAsset;

		public var grid:feathers.controls.UIAsset;

		public var iconMoney:feathers.controls.UIAsset;

		public var itemUi:feathers.controls.Group;

		public var labMoney:feathers.controls.Label;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShopItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 66;
			this.width = 174;
			this.elementsContent = [__ShopItemRenderSkin_UIAsset1_i(),__ShopItemRenderSkin_UIAsset2_i(),border_i(),borderTop_i(),itemUi_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShopItemRenderSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 63;
			temp.styleName = "ui/app/shop/itemBg.png";
			temp.width = 170;
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function __ShopItemRenderSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/shop/bg_tu_teng.png";
			temp.x = 126;
			temp.y = 2;
			return temp;
		}

		private function borderTop_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			borderTop = temp;
			temp.name = "borderTop";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/shop/itemFg.png";
			temp.width = 170;
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function border_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			border = temp;
			temp.name = "border";
			temp.height = 66;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/x_xuanzhongkuang/xuan_zhong.png";
			temp.width = 174;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/version_3/T_tubiaodikuang/tu_biao_kuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function iconMoney_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconMoney = temp;
			temp.name = "iconMoney";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tubiao/T_tongyongxiaotubiao/bang_yin.png";
			temp.width = 20;
			temp.x = 54;
			temp.y = 28;
			return temp;
		}

		private function itemUi_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			itemUi = temp;
			temp.name = "itemUi";
			temp.x = 6;
			temp.y = 7;
			temp.elementsContent = [labName_i(),labMoney_i(),grid_i(),iconMoney_i()];
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "75两";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 90;
			temp.x = 74;
			temp.y = 30;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 18;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "金刚钻";
			temp.textAlign = "left";
			temp.color = 0xE9C099;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 109;
			temp.x = 56;
			temp.y = 6;
			return temp;
		}

	}
}