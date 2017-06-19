package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Stone_Line extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Stone_Line()
		{
			super();
			
			this.currentState = "normal";
			this.height = 2;
			this.width = 274;
			this.elementsContent = [__Stone_Line_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __Stone_Line_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.y = 0;
			return temp;
		}

	}
}