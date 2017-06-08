package org.mokylin.skin.app.zhanchang.paihangbang
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
	public class Tps_MagPaiHang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lbT1:feathers.controls.Label;

		public var lbT2:feathers.controls.Label;

		public var lbT3:feathers.controls.Label;

		public var lbT4:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tps_MagPaiHang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 95;
			this.width = 389;
			this.elementsContent = [bg_i(),lbT1_i(),lbT2_i(),lbT3_i(),lbT4_i()];
			
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
			temp.height = 95;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 389;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbT1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT1 = temp;
			temp.name = "lbT1";
			temp.text = "说明：1.段位越高，领取的竞技声望越多";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 8;
			temp.y = 7;
			return temp;
		}

		private function lbT2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT2 = temp;
			temp.name = "lbT2";
			temp.text = "2.今日可领取昨日的段位奖励";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 321;
			temp.x = 49;
			temp.y = 28;
			return temp;
		}

		private function lbT3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT3 = temp;
			temp.name = "lbT3";
			temp.htmlText = "3.每日<font color='#5DBD37'>24点刷新奖励</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 296;
			temp.x = 49;
			temp.y = 48;
			return temp;
		}

		private function lbT4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT4 = temp;
			temp.name = "lbT4";
			temp.text = "4.每周一结算上周奖励，并重置排名";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 296;
			temp.x = 49;
			temp.y = 69;
			return temp;
		}

	}
}