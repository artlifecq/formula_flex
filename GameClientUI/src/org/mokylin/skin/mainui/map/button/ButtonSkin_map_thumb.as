package org.mokylin.skin.mainui.map.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_map_thumb extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_map_thumb()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"disabled":"ui/mainui/map/button/skin_map_thumb/disabled.png",
			"down":"ui/mainui/map/button/skin_map_thumb/down.png",
			"hover":"ui/mainui/map/button/skin_map_thumb/over.png",
			"up":"ui/mainui/map/button/skin_map_thumb/up.png"};
		}


	}
}