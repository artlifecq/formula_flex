package org.mokylin.skin.app.roulette.button
{
	import feathers.controls.StateSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_start extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_start()
		{
			super();
			
			this.currentState = "down";
			this.height = 79;
			this.width = 79;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"disabled":"ui/app/roulette/button/skin_start/disabled.png",
			"down":"ui/app/roulette/button/skin_start/down.png",
			"hover":"ui/app/roulette/button/skin_start/over.png",
			"up":"ui/app/roulette/button/skin_start/up.png"};
		}


	}
}