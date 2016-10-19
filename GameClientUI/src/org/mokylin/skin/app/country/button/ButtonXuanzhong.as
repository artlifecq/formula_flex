package org.mokylin.skin.app.country.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonXuanzhong extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonXuanzhong()
		{
			super();
			
			this.currentState = "downAndSelected";
			this.height = 126;
			this.width = 122;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"downAndSelected":"ui/app/country/button/xuanzhong/select.png", "overAndSelected":"ui/app/country/button/xuanzhong/select.png", "upAndSelected":"ui/app/country/button/xuanzhong/select.png"};
		}


	}
}