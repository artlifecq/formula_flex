package org.mokylin.skin.app.fuben
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ListItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbName:feathers.controls.Label;

		public var lbOk:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ListItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 20;
			this.width = 263;
			this.elementsContent = [lbName_i(),lbOk_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.height = 21;
			temp.fontSize = 14;
			temp.text = "三百只猴子";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 138;
			temp.text = " [1000区]一二三四五六";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 165;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbOk_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbOk = temp;
			temp.name = "lbOk";
			temp.fontSize = 14;
			temp.text = "已同意";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 91;
			temp.x = 172;
			temp.y = 0;
			return temp;
		}

	}
}