package org.mokylin.skin.component.scrollbar.skin_pack.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ScrollBarPackSkin_track extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ScrollBarPackSkin_track()
		{
			super();
			
			this.currentState = "down";
			this.width = 20;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/component/scrollbar/skin_pack/button/skin_track/track.png", "hover":"ui/component/scrollbar/skin_pack/button/skin_track/track.png", "up":"ui/component/scrollbar/skin_pack/button/skin_track/track.png"};
		}


	}
}