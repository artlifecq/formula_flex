package org.mokylin.skin.app.beibao.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonJuese extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonJuese()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/component/button/btn_yeqian/down.png,ui/app/beibao/button/juese/down.png",
			"downAndSelected":"ui/component/button/btn_yeqian/selected.png,ui/app/beibao/button/juese/over.png",
			"hover":"ui/component/button/btn_yeqian/over.png,ui/app/beibao/button/juese/over.png",
			"hoverAndSelected":"ui/component/button/btn_yeqian/selected.png,ui/app/beibao/button/juese/over.png",
			"up":"ui/component/button/btn_yeqian/up.png,ui/app/beibao/button/juese/up.png",
			"upAndSelected":"ui/component/button/btn_yeqian/selected.png,ui/app/beibao/button/juese/over.png"};
		}


	}
}