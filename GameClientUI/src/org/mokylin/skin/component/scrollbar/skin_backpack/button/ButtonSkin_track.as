package org.mokylin.skin.component.scrollbar.skin_backpack.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_track extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_track()
		{
			super();
			
			this.currentState = "down";
			this.height = 10;
			this.width = 13;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_backpack/button/skin_track/up.png", "hover":"ui/component/scrollbar/skin_backpack/button/skin_track/up.png", "up":"ui/component/scrollbar/skin_backpack/button/skin_track/up.png"};
		}


	}
}