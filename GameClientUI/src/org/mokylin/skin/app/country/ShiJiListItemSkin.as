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
	public class ShiJiListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var itemBg:feathers.controls.UIAsset;

		public var things:feathers.controls.Label;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShiJiListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 65;
			this.width = 668;
			this.elementsContent = [itemBg_i(),__ShiJiListItemSkin_UIAsset1_i(),time_i(),things_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShiJiListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/shijian_di.png";
			temp.x = 10;
			temp.y = 9;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 65;
			temp.styleName = "ui/app/country/niupizhi/lieditiao_da.png";
			temp.width = 668;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function things_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			things = temp;
			temp.name = "things";
			temp.bold = false;
			temp.height = 44;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "发生了一些事情";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.verticalAlign = "middle";
			temp.width = 436;
			temp.x = 204;
			temp.y = 12;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.height = 20;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.text = "2015-12-10";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 120;
			temp.x = 26;
			temp.y = 22;
			return temp;
		}

	}
}