package org.mokylin.skin.app.dropGoods
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DropGoodsListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var goodsName:feathers.controls.Label;

		public var grid:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DropGoodsListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 73;
			this.width = 199;
			this.elementsContent = [__DropGoodsListItemSkin_UIAsset1_i(),grid_i(),goodsName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DropGoodsListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 73;
			temp.styleName = "ui/common/kang/tubiaodikuang_3.png";
			temp.width = 199;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function goodsName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			goodsName = temp;
			temp.name = "goodsName";
			temp.bold = false;
			temp.height = 48;
			temp.fontSize = 14;
			temp.text = "物品名称";
			temp.textAlign = "left";
			temp.color = 0xDB9736;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 110;
			temp.x = 74;
			temp.y = 12;
			return temp;
		}

		private function grid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grid = temp;
			temp.name = "grid";
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 12;
			temp.y = 10;
			return temp;
		}

	}
}