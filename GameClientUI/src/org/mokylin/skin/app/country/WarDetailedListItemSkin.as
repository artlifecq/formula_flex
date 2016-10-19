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
	public class WarDetailedListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var declareCountry:feathers.controls.Label;

		public var defenseCountry:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var result:feathers.controls.Label;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WarDetailedListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 570;
			this.elementsContent = [itemBg_i(),itemSelected_i(),declareCountry_i(),defenseCountry_i(),time_i(),result_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function declareCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			declareCountry = temp;
			temp.name = "declareCountry";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "益州";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 120;
			temp.x = 164;
			temp.y = 5;
			return temp;
		}

		private function defenseCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			defenseCountry = temp;
			temp.name = "defenseCountry";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "扬州";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 120;
			temp.x = 318;
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

		private function result_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			result = temp;
			temp.name = "result";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "扬州胜";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 100;
			temp.x = 458;
			temp.y = 5;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "2015-12-18";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 120;
			temp.x = 15;
			temp.y = 5;
			return temp;
		}

	}
}