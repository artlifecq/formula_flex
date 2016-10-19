package org.mokylin.skin.component.scrollbar.skin_gj
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VScrollBarDecreBtnSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VScrollBarDecreBtnSkin()
		{
			super();
			
			this.currentState = "down";
			this.height = 11;
			this.width = 12;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_gj/decre_down.png", "hover":"ui/component/scrollbar/skin_gj/decre_over.png", "up":"ui/component/scrollbar/skin_gj/decre_up.png"};
		}


	}
}