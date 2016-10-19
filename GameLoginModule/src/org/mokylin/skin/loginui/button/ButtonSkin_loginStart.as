package org.mokylin.skin.loginui.button
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_loginStart extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_loginStart()
		{
			super();
			
			this.currentState = "up";
			
			states = {
			};
			skinNames={"down":"ui/loginui/loginAll/button/skin_loginStart/down.png", "hover":"ui/loginui/loginAll/button/skin_loginStart/over.png", "up":"ui/loginui/loginAll/button/skin_loginStart/up.png"};
		}


	}
}