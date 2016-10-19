package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarWatchBottomOfficerListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var headingBg:feathers.controls.UIAsset;

		public var headingLine1:feathers.controls.UIAsset;

		public var headingLine2:feathers.controls.UIAsset;

		public var lbCountry1:feathers.controls.Label;

		public var lbCountry2:feathers.controls.Label;

		public var lbPosition:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var titleDecorate:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarWatchBottomOfficerListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),headingBg_i(),lbPosition_i(),lbCountry1_i(),lbCountry2_i(),headingLine1_i(),headingLine2_i(),titleDecorate_i(),list_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 330;
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/di_kuang.png";
			temp.width = 305;
			temp.x = 0;
			temp.y = 5;
			return temp;
		}

		private function headingBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingBg = temp;
			temp.name = "headingBg";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-bg.png";
			temp.width = 302;
			temp.x = 1;
			temp.y = 10;
			return temp;
		}

		private function headingLine1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine1 = temp;
			temp.name = "headingLine1";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 76;
			temp.y = 10;
			return temp;
		}

		private function headingLine2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			headingLine2 = temp;
			temp.name = "headingLine2";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/title-fenge.png";
			temp.x = 181;
			temp.y = 10;
			return temp;
		}

		private function lbCountry1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountry1 = temp;
			temp.name = "lbCountry1";
			temp.text = "名称";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 113;
			temp.x = 74;
			temp.y = 12;
			return temp;
		}

		private function lbCountry2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountry2 = temp;
			temp.name = "lbCountry2";
			temp.text = "国家";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 113;
			temp.x = 187;
			temp.y = 12;
			return temp;
		}

		private function lbPosition_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPosition = temp;
			temp.name = "lbPosition";
			temp.text = "职位";
			temp.textAlign = "center";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 75;
			temp.x = 2;
			temp.y = 12;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 300;
			temp.width = 302;
			temp.x = 1;
			temp.y = 33;
			return temp;
		}

		private function titleDecorate_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			titleDecorate = temp;
			temp.name = "titleDecorate";
			temp.styleName = "ui/common/version_3/T_tongyongxiaomianban/hua_wen.png";
			temp.x = 87;
			temp.y = 0;
			return temp;
		}

	}
}