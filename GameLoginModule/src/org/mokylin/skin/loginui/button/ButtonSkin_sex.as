package org.mokylin.skin.loginui.button
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ButtonSkin_sex extends feathers.controls.StateSkin
	{
		public var iconDisplay:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ButtonSkin_sex()
		{
			super();
			
			this.currentState = "upAndSelected";
			this.height = 66;
			this.width = 66;
			this.elementsContent = [];
			
			states = {
			};
			skinNames={"down":"ui/loginui/button/skin_sex/down.png",
			"downAndSelected":"ui/loginui/button/skin_sex/select.png",
			"hover":"ui/loginui/button/skin_sex/over.png",
			"overAndSelected":"ui/loginui/button/skin_sex/select.png",
			"up":"ui/loginui/button/skin_sex/up.png",
			"upAndSelected":"ui/loginui/button/skin_sex/select.png"};
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