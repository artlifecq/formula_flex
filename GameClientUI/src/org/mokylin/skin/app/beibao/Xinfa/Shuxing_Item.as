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
	public class Shuxing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lab_shuxing:feathers.controls.Label;

		public var num_shuxing:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [lab_shuxing_i(),num_shuxing_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lab_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab_shuxing = temp;
			temp.name = "lab_shuxing";
			temp.letterSpacing = -1;
			temp.text = "攻击：";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function num_shuxing_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			num_shuxing = temp;
			temp.name = "num_shuxing";
			temp.text = "0123456789";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 38;
			temp.y = 0;
			return temp;
		}

	}
}