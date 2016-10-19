package org.mokylin.skin.app.countryWar
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
	public class CountryWarWatchBottomOfficerListRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbCountry1:feathers.controls.Label;

		public var lbCountry2:feathers.controls.Label;

		public var lbPosition:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarWatchBottomOfficerListRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),lbPosition_i(),lbCountry1_i(),lbCountry2_i()];
			
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
			temp.height = 30;
			temp.name = "角色名角色名角色";
			temp.styleName = "ui/common/bar/fengedi.png";
			temp.width = 302;
			temp.x = 0;
			temp.y = 0;
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
			temp.x = 73;
			temp.y = 6;
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
			temp.x = 186;
			temp.y = 6;
			return temp;
		}

		private function lbPosition_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPosition = temp;
			temp.name = "lbPosition";
			temp.text = "职位";
			temp.textAlign = "left";
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 75;
			temp.x = 1;
			temp.y = 6;
			return temp;
		}

	}
}