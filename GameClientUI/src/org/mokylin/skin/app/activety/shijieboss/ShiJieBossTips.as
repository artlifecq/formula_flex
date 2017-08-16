package org.mokylin.skin.app.activety.shijieboss
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
	public class ShiJieBossTips extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbXiaJie:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var uiHead:feathers.controls.UIAsset;

		public var uiLiBao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShiJieBossTips()
		{
			super();
			
			this.currentState = "normal";
			this.height = 173;
			this.width = 298;
			this.elementsContent = [bg_i(),lbXiaJie_i(),line1_i(),uiLiBao_i(),uiHead_i()];
			
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
			temp.height = 173;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbXiaJie_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaJie = temp;
			temp.name = "lbXiaJie";
			temp.text = "【奖励】";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 103;
			temp.x = 59;
			temp.y = 69;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 42;
			return temp;
		}

		private function uiHead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiHead = temp;
			temp.name = "uiHead";
			temp.styleName = "ui/app/activety/shijieboss/1.png";
			temp.x = 105;
			temp.y = 10;
			return temp;
		}

		private function uiLiBao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLiBao = temp;
			temp.name = "uiLiBao";
			temp.styleName = "ui/app/activety/shijieboss/icon/da.png";
			temp.x = 12;
			temp.y = 54;
			return temp;
		}

	}
}