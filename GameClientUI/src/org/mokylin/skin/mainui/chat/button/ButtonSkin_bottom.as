package org.mokylin.skin.mainui.chat.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_bottom extends feathers.controls.StateSkin
	{
		public var iconDisplay:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_bottom()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"disabled":"ui/mainui/chat/button/skin_bottom/disabled.png",
			"down":"ui/mainui/chat/button/skin_bottom/down.png",
			"hover":"ui/mainui/chat/button/skin_bottom/over.png",
			"up":"ui/mainui/chat/button/skin_bottom/up.png"};
		}


		private function iconDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconDisplay = temp;
			temp.name = "iconDisplay";
			return temp;
		}

	}
}