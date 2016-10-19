package org.mokylin.skin.app.country
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
	public class WarAggregateListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var countryName:feathers.controls.Label;

		public var failCount:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var winCount:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WarAggregateListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 570;
			this.elementsContent = [itemBg_i(),itemSelected_i(),countryName_i(),winCount_i(),failCount_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function countryName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryName = temp;
			temp.name = "countryName";
			temp.bold = false;
			temp.height = 24;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "益州";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 120;
			temp.x = 36;
			temp.y = 5;
			return temp;
		}

		private function failCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			failCount = temp;
			temp.name = "failCount";
			temp.bold = false;
			temp.height = 24;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 443;
			temp.y = 5;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 570;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 28;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 570;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function winCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			winCount = temp;
			temp.name = "winCount";
			temp.bold = false;
			temp.height = 24;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 240;
			temp.y = 5;
			return temp;
		}

	}
}