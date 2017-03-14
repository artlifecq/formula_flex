package org.mokylin.skin.component.scrollbar.skin_pack.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarPackSkin_thumb extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarPackSkin_thumb()
		{
			super();
			
			this.currentState = "up";
			this.height = 17;
			this.width = 17;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_pack/button/skin_thumb/down.png", "hover":"ui/component/scrollbar/skin_pack/button/skin_thumb/over.png", "up":"ui/component/scrollbar/skin_pack/button/skin_thumb/up.png"};
		}


	}
}