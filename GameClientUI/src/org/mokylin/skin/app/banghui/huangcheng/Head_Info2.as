package org.mokylin.skin.app.banghui.huangcheng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Head_Info2 extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Head_Info2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 30;
			this.width = 162;
			this.elementsContent = [__Head_Info2_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __Head_Info2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/banghui/huangcheng/bgdi.png";
			temp.width = 162;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}