package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiNeng_FenYeXian extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiNeng_FenYeXian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 2;
			this.width = 466;
			this.elementsContent = [__JiNeng_FenYeXian_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __JiNeng_FenYeXian_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/zaitiao.png";
			temp.width = 466;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}