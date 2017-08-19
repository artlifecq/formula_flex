package org.mokylin.skin.app.zhuangbei.jicheng
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiCheng_Item extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiCheng_Item()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__JiCheng_Item_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __JiCheng_Item_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "属性：<font color='#cfc6ae'>1</font><font color='#5DBD37'>(+3)</font>";
			temp.color = 0xBBBDAA;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}