package org.mokylin.skin.app.wuxue.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonJuexue extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonJuexue()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/component/button/btn_yeqian/down.png,ui/app/wuxue/button/juexue/down.png",
			"downAndSelected":"ui/component/button/btn_yeqian/selected.png,ui/app/wuxue/button/juexue/over.png",
			"hover":"ui/component/button/btn_yeqian/over.png,ui/app/wuxue/button/juexue/over.png",
			"hoverAndSelected":"ui/component/button/btn_yeqian/selected.png,ui/app/wuxue/button/juexue/over.png",
			"up":"ui/component/button/btn_yeqian/up.png,ui/app/wuxue/button/juexue/up.png",
			"upAndSelected":"ui/component/button/btn_yeqian/selected.png,ui/app/wuxue/button/juexue/over.png"};
		}


	}
}