package org.mokylin.skin.app.trade
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
	public class TradeListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemName:feathers.controls.Label;

		public var normal:feathers.controls.UIAsset;

		public var select:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TradeListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 63;
			this.width = 206;
			this.elementsContent = [normal_i(),select_i(),itemName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function itemName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			itemName = temp;
			temp.name = "itemName";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 129;
			temp.x = 71;
			temp.y = 19;
			return temp;
		}

		private function normal_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			normal = temp;
			temp.name = "normal";
			temp.styleName = "ui/app/trade/up.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function select_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			select = temp;
			temp.name = "select";
			temp.styleName = "ui/app/trade/selected.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}