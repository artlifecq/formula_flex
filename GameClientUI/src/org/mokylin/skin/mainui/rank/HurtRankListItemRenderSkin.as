package org.mokylin.skin.mainui.rank
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
	public class HurtRankListItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imageNumber:feathers.controls.UIAsset;

		public var itemBg:feathers.controls.UIAsset;

		public var lbHurting:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var lbNumber:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HurtRankListItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 250;
			this.elementsContent = [itemBg_i(),lbNumber_i(),lbName_i(),lbHurting_i(),imageNumber_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imageNumber_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageNumber = temp;
			temp.name = "imageNumber";
			temp.height = 24;
			temp.styleName = "ui/app/daTi/rank_1.png";
			temp.width = 19;
			temp.x = 15;
			temp.y = 0;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 25;
			temp.styleName = "ui/common/bar/fengedi.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbHurting_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHurting = temp;
			temp.name = "lbHurting";
			temp.fontSize = 14;
			temp.text = "22222.3万";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 170;
			temp.y = 4;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 14;
			temp.text = "玩家角色七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 125;
			temp.x = 45;
			temp.y = 4;
			return temp;
		}

		private function lbNumber_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNumber = temp;
			temp.name = "lbNumber";
			temp.fontSize = 18;
			temp.text = "10";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 25;
			temp.x = 12;
			temp.y = 2;
			return temp;
		}

	}
}