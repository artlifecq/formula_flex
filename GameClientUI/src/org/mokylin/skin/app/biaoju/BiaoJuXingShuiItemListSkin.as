package org.mokylin.skin.app.biaoju
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
	public class BiaoJuXingShuiItemListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var level:feathers.controls.Label;

		public var level0:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var pos:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuXingShuiItemListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 550;
			this.elementsContent = [__BiaoJuXingShuiItemListSkin_UIAsset1_i(),name_i(),pos_i(),level_i(),level0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __BiaoJuXingShuiItemListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/biaoju/lie_biao_di.png";
			temp.width = 550;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function level0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level0 = temp;
			temp.name = "level0";
			temp.height = 20;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 95;
			temp.x = 397;
			temp.y = 4;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.height = 20;
			temp.text = "99";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 95;
			temp.x = 287;
			temp.y = 4;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.height = 20;
			temp.text = "问问吾问无为谓";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 156;
			temp.x = 7;
			temp.y = 4;
			return temp;
		}

		private function pos_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			pos = temp;
			temp.name = "pos";
			temp.height = 20;
			temp.text = "御史大夫";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 122;
			temp.x = 167;
			temp.y = 4;
			return temp;
		}

	}
}