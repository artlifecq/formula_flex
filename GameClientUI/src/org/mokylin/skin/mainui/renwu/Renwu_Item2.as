package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Renwu_Item2 extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Renwu_Item2()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [labelDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		private function labelDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.htmlText = "击杀：<u><font color='#ff0d0d'>秦国士兵(0/30)</font></u>";
			temp.left = 0;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 0;
			return temp;
		}

	}
}