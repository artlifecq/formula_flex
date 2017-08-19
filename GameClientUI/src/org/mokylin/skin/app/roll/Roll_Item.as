package org.mokylin.skin.app.roll
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
	public class Roll_Item extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Roll_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 22;
			this.width = 265;
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
			temp.text = "玩家名字小A：98点";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 244;
			temp.x = 12;
			temp.y = 2;
			return temp;
		}

	}
}