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

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Xinfamiaoshu()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__Xinfamiaoshu_Label1_i(),__Xinfamiaoshu_Label2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Xinfamiaoshu_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = -1;
			temp.text = "攻击敌方单位时，";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function __Xinfamiaoshu_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.letterSpacing = -1;
			temp.text = "造成伤害提升6%且伤害的3%转化为生命值";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 103;
			temp.y = 1;
			return temp;
		}

	}
}