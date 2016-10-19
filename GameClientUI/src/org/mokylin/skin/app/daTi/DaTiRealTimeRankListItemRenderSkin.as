package org.mokylin.skin.app.daTi
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
	public class DaTiRealTimeRankListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var imageNumber:feathers.controls.UIAsset;

		public var lbCountry:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNumber:feathers.controls.Label;

		public var lbScore:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DaTiRealTimeRankListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.elementsContent = [bg_i(),lbNumber_i(),lbName_i(),lbCountry_i(),lbScore_i(),imageNumber_i()];
			
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
			temp.height = 28;
			temp.styleName = "ui/common/bar/fengedi.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imageNumber_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageNumber = temp;
			temp.name = "imageNumber";
			temp.styleName = "ui/common/number/skin_rank/rank_1.png";
			temp.x = 8;
			temp.y = 0;
			return temp;
		}

		private function lbCountry_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCountry = temp;
			temp.name = "lbCountry";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "国家";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 41;
			temp.x = 150;
			temp.y = 5;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "角色名角色名角色";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 129;
			temp.x = 27;
			temp.y = 5;
			return temp;
		}

		private function lbNumber_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNumber = temp;
			temp.name = "lbNumber";
			temp.bold = true;
			temp.fontSize = 18;
			temp.text = "10";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 25;
			temp.x = 6;
			temp.y = 4;
			return temp;
		}

		private function lbScore_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbScore = temp;
			temp.name = "lbScore";
			temp.bold = true;
			temp.fontSize = 14;
			temp.text = "5648";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 54;
			temp.x = 191;
			temp.y = 5;
			return temp;
		}

	}
}