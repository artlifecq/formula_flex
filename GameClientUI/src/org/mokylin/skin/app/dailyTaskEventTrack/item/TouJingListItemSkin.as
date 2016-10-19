package org.mokylin.skin.app.dailyTaskEventTrack.item
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
	public class TouJingListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var countryJingShu:feathers.controls.Label;

		public var countryLevel:feathers.controls.Label;

		public var countryName:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TouJingListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 222;
			this.elementsContent = [itemBg_i(),countryLevel_i(),countryJingShu_i(),countryName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function countryJingShu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryJingShu = temp;
			temp.name = "countryJingShu";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1500";
			temp.textAlign = "left";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 73;
			temp.x = 150;
			temp.y = 0;
			return temp;
		}

		private function countryLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryLevel = temp;
			temp.name = "countryLevel";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "（强国）";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 70;
			temp.x = 80;
			temp.y = 0;
			return temp;
		}

		private function countryName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryName = temp;
			temp.name = "countryName";
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "荆州：";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.underline = false;
			temp.width = 80;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 24;
			temp.styleName = "ui/app/crown/lieditiao_xiao.png";
			temp.width = 220;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}