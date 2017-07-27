package org.mokylin.skin.app.beibao.Xinfa
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Xinfamiaoshu extends feathers.controls.StateSkin
	{
		public var lbDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfamiaoshu()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [lbDisplay_i()];
			
			states = {
			};
			skinNames={};
		}


		private function lbDisplay_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDisplay = temp;
			temp.name = "lbDisplay";
			temp.height = 61;
			temp.htmlText = "攻击敌方单位时，造成伤害提升<font color='#00ff33'>6%</font>且伤害的<font color='#00ff33'>3%</font>转化为生命值";
			temp.leading = 4;
			temp.letterSpacing = -1;
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 178;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}