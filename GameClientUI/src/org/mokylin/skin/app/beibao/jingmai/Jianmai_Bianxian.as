package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Jianmai_Bianxian extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Jianmai_Bianxian()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__Jianmai_Bianxian_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		private function __Jianmai_Bianxian_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/beibao/jingmai/anbian.png";
			temp.top = 0;
			temp.x = 0;
			return temp;
		}

	}
}