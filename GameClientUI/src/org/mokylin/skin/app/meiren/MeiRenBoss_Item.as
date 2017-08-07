package org.mokylin.skin.app.meiren
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRenBoss_Item extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRenBoss_Item()
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
			temp.htmlText = "击杀：<font color='#00ff33'><u>秦国士兵</u></font>(0/30)";
			temp.left = 0;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.top = 0;
			return temp;
		}

	}
}