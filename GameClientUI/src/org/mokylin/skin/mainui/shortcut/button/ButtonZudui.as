package org.mokylin.skin.mainui.shortcut.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonZudui extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonZudui()
		{
			super();
			
			this.currentState = "down";
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"disabled":"ui/mainui/shortcut/button/zudui/disabled-png",
			"down":"ui/mainui/shortcut/button/zudui/down.png",
			"hover":"ui/mainui/shortcut/button/zudui/over.png",
			"up":"ui/mainui/shortcut/button/zudui/up.png"};
		}


	}
}