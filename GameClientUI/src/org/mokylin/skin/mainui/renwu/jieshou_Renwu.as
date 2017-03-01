package org.mokylin.skin.mainui.renwu
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class jieshou_Renwu extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function jieshou_Renwu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 89;
			this.width = 150;
			this.elementsContent = [__jieshou_Renwu_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __jieshou_Renwu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/renwu/jsrw.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}