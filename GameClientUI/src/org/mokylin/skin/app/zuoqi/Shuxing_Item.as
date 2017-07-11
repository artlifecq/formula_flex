package org.mokylin.skin.app.zuoqi
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
	public class Shuxing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ico_up:feathers.controls.UIAsset;

		public var lbCurrent:feathers.controls.Label;

		public var lbTemp:feathers.controls.Label;

		public var lbUp:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [lbCurrent_i(),lbTemp_i(),lbUp_i(),ico_up_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ico_up_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico_up = temp;
			temp.name = "ico_up";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 120;
			temp.y = 3;
			return temp;
		}

		private function lbCurrent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCurrent = temp;
			temp.name = "lbCurrent";
			temp.htmlText = " color='#00ff33'>(+36)</font>";
			temp.text = "32157";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 108;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function lbTemp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTemp = temp;
			temp.name = "lbTemp";
			temp.text = "+28730(临时)";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 100;
			temp.x = 41;
			temp.y = 1;
			return temp;
		}

		private function lbUp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbUp = temp;
			temp.name = "lbUp";
			temp.text = "20";
			temp.textAlign = "left";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 130;
			temp.y = 2;
			return temp;
		}

	}
}